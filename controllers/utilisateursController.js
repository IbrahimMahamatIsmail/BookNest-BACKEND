const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const nodemailer = require('nodemailer');
const utilisateurMapper = require('../dataMapper/utilisateursMapper');

// Gestion de la route de création du compte
exports.register = async (req, res) => {
  const { nom, email, mot_de_passe } = req.body;
  // Vérification des champs obligatoires
  if (!nom || !email || !mot_de_passe) {
    return res.status(400).json({ message: 'Tous les champs sont obligatoires'});
  }
  // Vérification de la forme de l'adresse email
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) {
    return res.status(400).json({ error: 'Le format de l\'email renseigné est invalide veuilez le corriger' });
  }
  const nomMinuscule = nom.toLowerCase();
  const motDePasseMinuscule = mot_de_passe.toLowerCase();
  let motDePasseInvalide = false;
  for (let i = 0; i <= nomMinuscule.length - 4; i++) {
    const sousChaine = nomMinuscule.substring(i, i + 4);
    if (motDePasseMinuscule.includes(sousChaine)) {
      motDePasseInvalide = true;
      break;
    }
  }
  if (motDePasseInvalide) {
    return res.status(400).json({ error: 
      `Pour votre sécurité, votre mot de passe ne doit pas contenir votre 
      nom d'utilisateur ou une partie de 4 lettres consécutives de celui-ci.`})
  }
  // Vérification de la force du mot de passe
  const mdpRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&.#_-])[A-Za-z\d@$!%*?&.#_-]{12,}$/;
  if (!mdpRegex.test(mot_de_passe)) {
    return res.status(400).json({ error: 
      `Le mot de passe doit contenir au moins 
      12 caractères, une majuscule, une minuscule, un chiffre et un caractère spécial(@,#,&, etc)`});
  }
  try {
    const existingName = await utilisateurMapper.getByName(nom.toLowerCase());
    // console.log("Nom reçu pour vérification :", nom);
    if (existingName) {
      return res.status(400).json({ error: 'Nom d\'utilisateur déjà utilisé. Veuillez en choisir un autre !' });
    }
    const existingUser = await utilisateurMapper.getByEmail(email);
    if (existingUser) {
      return res.status(400).json({ error: 'Email déjà utilisé' });
    }
    // Déterminer le rôle
    let role_id = 1; // utilisateur par défaut
    if (email === 'booknestapi@gmail.com') {
      const dejaUnAdmin = await utilisateurMapper.getAdmin();
      if (dejaUnAdmin) {
        return res.status(403).json({ message: 'Un seul administrateur autorisé' });
      }
      role_id = 2; // admin
    }
    const hashedPassword = await bcrypt.hash(mot_de_passe, 10);
    await utilisateurMapper.create({ nom, email, mot_de_passe: hashedPassword, role_id });
    const nouvelUtilisateur = await utilisateurMapper.getByEmail(email);
    const token = jwt.sign({ id: nouvelUtilisateur.id, role: nouvelUtilisateur.role }, process.env.JWT_SECRET, { 
      expiresIn: '2h'
    });
    // Envoi de l'email de bienvenue
    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASS,
      }
    });
    //const { FRONT_URL } = require('../config');
    const lien = `https://booknest-front.vercel.app/login`;
    const htmlMessage = `
      <div style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f4f4; padding: 30px;">
        <div style="max-width: 600px; margin: auto; background: #ffffff; border-radius: 10px; overflow: hidden; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
          <div style="background-color: #4b0082; color: white; text-align: center; padding: 20px 0;">
          <img src="https://i.imgur.com/QGoA4wc.png" alt="Logo BookNest" style="width: 120px; margin-bottom: 20px;" />
            <h1 style="margin: 0;">📚 Booknest</h1>
            <p style="margin: 0;">Votre bibliothèque numérique préférée</p>
          </div>
          <div style="padding: 30px;">
            <h2 style="color: #333;">Bienvenue ${nom} ! 🎉</h2>
            <p>Nous sommes ravis de vous accueillir sur <strong>Booknest</strong>, l’endroit où chaque livre trouve son lecteur.</p>
            <p>Votre compte a été <strong>créé avec succès</strong>. Vous pouvez maintenant vous connecter et explorer notre bibliothèque.</p>
            <p style="margin-top: 30px;">
              <a href="${lien}" style="background-color: #4b0082; color: white; text-decoration: none; padding: 12px 25px; border-radius: 5px; font-weight: bold;">
                Se connecter maintenant
              </a>
            </p>
            <p style="margin-top: 40px; font-size: 0.9em; color: #777;">
              Si vous n’êtes pas à l’origine de cette inscription, veuillez ignorer cet email.
            </p>
          </div>
          <div style="background-color: #eee; text-align: center; padding: 15px; font-size: 0.85em; color: #555;">
            &copy; ${new Date().getFullYear()} Booknest | Tous droits réservés
          </div>
        </div>
      </div>
    `;
    await transporter.sendMail({
      to: email,
      subject: '📬 Bienvenue sur Booknest !',
      html: htmlMessage
    });
    res.status(201).json({
      message: `Bienvenue ${nom}, votre compte a été créé avec succès ! Un email de confirmation vous a été envoyé.`,
      token,
      utilisateur: nouvelUtilisateur
    });
  } catch (err) {
    res.status(500).json({ error: "Erreur lors de l'inscription" });
  }
};

// Gestion de la route de connexion
exports.login = async (req, res) => {
  const { email, mot_de_passe } = req.body;

  // Vérification des champs obligatoires
  if (!email || !mot_de_passe) {
    return res.status(400).json({ error: 'Tous les champs sont obligatoires pour se connecter' });
  }

  try {
    let utilisateur = await utilisateurMapper.getByEmail(email);
    // console.log('UTILISATEUR reçu pour connexion depuis controller:', utilisateur);
    if (!utilisateur) { 
      console.warn('Aucun utilisateur trouvé pour cet email'); 
      return res.status(400).json({ error: 'Email ou mot de passe non trouvé' })};
      // console.log("mot de passe fourni par l'utilisateur controller:", mot_de_passe);
      // console.log("mot de passe de la DB:", utilisateur.mot_de_passe);
    const match = await bcrypt.compare(mot_de_passe, utilisateur.mot_de_passe);
    // console.log('COMPARAISON MOT DE PASSE DEPUIS LE CONTROLLER OK ?', match);
    if (!match) return res.status(400).json({ error: 'Email ou mot de passe incorrect' });

    // console.log("Utilisateur trouvé :", utilisateur);
    // On sauvegarde avant de modifier la date !
    const ancienneDerniereConnexion = utilisateur.last_login;

    // Puis on met à jour pour la prochaine fois
    await utilisateurMapper.updateLastLogin(utilisateur.id);
    // On met à jour l'utilisateur avec la nouvelle date de dernière connexion
    utilisateur = await utilisateurMapper.getByEmail(email);

    const token = jwt.sign({ id: utilisateur.id, role: utilisateur.role }, process.env.JWT_SECRET, {
      expiresIn: '2h'
    });

    // J'évite de ne pas renvoyer le mot de passe dans la réponse même si il est hashé
    const { mot_de_passe : mdpHashe, ...utilisateurSansMDP } = utilisateur;
    res.json({ 
      message: `Bienvenue ${utilisateur.nom} sur votre compte Booknest 🚀📚`,
      ancienneDerniereConnexion,
      token,
      utilisateur: utilisateurSansMDP });
  } catch (err) {
    console.error('Erreur pendant la connexion :', err);
    res.status(500).json({ error: 'Erreur lors de la connexion' });
  }
};

// Gestion de la route de demande de réinitialisation du mot de passe
exports.demandeReinitialisation = async (req, res) => {
  const { email } = req.body;
  try {
    const utilisateur = await utilisateurMapper.getByEmail(email);
    if (!utilisateur) return res.status(404).json({ message: "Utilisateur non trouvé" });

    const token = jwt.sign({ id: utilisateur.id }, process.env.JWT_SECRET, { expiresIn: '15m' });
    await utilisateurMapper.updateResetToken(utilisateur.id, token);
    // Envoie d'email avec un lien de réinitialisation avec nodemailer
    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASS,
      }
    });

    transporter.verify((err, success) => {
      if (err) {
        console.error('[ERREUR] Vérification transporteur :', err);
      } else {
        // console.log('[INFO] Transporteur prêt à envoyer des emails');
      }
    });
    
    //const { FRONT_URL } = require('../config');
    const lien = `https://booknest-front.vercel.app/reinitialiser-mot-de-passe/${token}`;
    await transporter.sendMail({
      to: email,
      subject: '📬 Réinitialisation de votre mot de passe Booknest',
      html: `
      <div style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f9f9f9; padding: 30px;">
        <div style="max-width: 600px; margin: auto; background: #ffffff; border-radius: 10px; overflow: hidden; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
          <div style="background-color: #4b0082; color: white; text-align: center; padding: 20px 0;">
          <img src="https://i.imgur.com/QGoA4wc.png" alt="Logo BookNest" style="width: 120px; margin-bottom: 20px;" />
            <h1 style="margin: 0;">🔐 Réinitialisation Booknest</h1>
            <p style="margin: 0;">Votre sécurité, notre priorité</p>
          </div>
          <div style="padding: 30px;">
            <h2 style="color: #333;">Demande de réinitialisation</h2>
            <p>Bonjour,</p>
            <p>Vous avez récemment demandé à <strong>réinitialiser votre mot de passe</strong> pour votre compte Booknest. Si vous êtes bien à l’origine de cette demande, cliquez sur le bouton ci-dessous :</p>
            <p style="margin-top: 30px; text-align: center;">
              <a href="${lien}" style="background-color: #4b0082; color: white; text-decoration: none; padding: 12px 25px; border-radius: 5px; font-weight: bold;">
                Réinitialiser mon mot de passe
              </a>
            </p>
            <p style="margin-top: 20px;">Ce lien est valable pendant 15 minutes.</p>
            <p style="margin-top: 30px; font-size: 0.9em; color: #777;">
              Si vous n’avez pas demandé cette réinitialisation, vous pouvez ignorer cet email en toute sécurité.
            </p>
            <p style="font-size: 13px; color: #555;">L’équipe BookNest 📚</p>
          </div>
          <div style="background-color: #eee; text-align: center; padding: 15px; font-size: 0.85em; color: #555;">
            &copy; ${new Date().getFullYear()} Booknest | Tous droits réservés
          </div>
        </div>
      </div>`
    });
    res.status(200).json({ message: 'Un lien de réinitialisation a été envoyé à votre adresse email 📧' });
  } catch (error) {
    console.error('[ERREUR] demandeReinitialisation :', error);
    res.status(500).json({ message: 'Erreur serveur lors de la demande de réinitialisation' });
  }
};

// Gestion de la route de réinitialisation du mot de passe
exports.reinitialiserMotDePasse = async (req, res) => {
  const { token } = req.params;
  const { nouveauMotDePasse } = req.body;

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    // 1. On récupère l’utilisateur et son mot de passe actuel
    const utilisateur = await utilisateurMapper.getById(decoded.id);
    if (!utilisateur) {
      return res.status(404).json({ message: 'Utilisateur non trouvé' });
    }
    // console.log("DEBUG: nouveauMotDePasse =", nouveauMotDePasse);
    // console.log("DEBUG: utilisateur.mot_de_passe =", utilisateur.mot_de_passe);
    if (utilisateur.reset_token !== token) { // Vérification de l'unicité du token
      return res.status(400).json({ message: "Lien déjà utilisé ou invalide. Refaite une nouvelle demande." });
    }
    // 2. On vérifie si le nouveau mot de passe est identique à l’ancien
    const estIdentique = await bcrypt.compare(nouveauMotDePasse, utilisateur.mot_de_passe);
    if (estIdentique) {
      return res.status(400).json({
        message: "Pour votre sécurité le nouveau mot de passe doit être différent de l'ancien.",
      });
    }
    // 3. Vérification de la force du mot de passe
    const mdpRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&.#_-])[A-Za-z\d@$!%*?&.#_-]{12,}$/;
    if (!mdpRegex.test(nouveauMotDePasse)) {
      return res.status(400).json({ 
        message: 'Le mot de passe doit contenir au moins 12 caractères, une majuscule, une minuscule, un chiffre et un caractère spécial(@,#,&, etc)',
      });
    }
    const nomMinuscule = utilisateur.nom.toLowerCase();
    const motDePasseMinuscule = nouveauMotDePasse.toLowerCase();
    for (let i = 0; i <= nomMinuscule.length - 4; i++) {
      const sousChaine = nomMinuscule.substring(i, i + 4);
      if (motDePasseMinuscule.includes(sousChaine)) {
        return res.status(400).json({ 
          message: "Pour votre sécurité, votre mot de passe ne doit pas contenir votre nom d'utilisateur ou une partie de 4 lettres consécutives de celui-ci.",
        });
      }
    }
    // 4. Sinon, on hashe et on met à jour
    const hash = await bcrypt.hash(nouveauMotDePasse, 10);
    await utilisateurMapper.updateMotDePasse(decoded.id, hash);
    // 5. On supprime le token de réinitialisation
    await utilisateurMapper.updateResetToken(utilisateur.id, null);
    res.status(200).json({
      message: '🎉 Votre mot de passe a bien été mis à jour. Vous pouvez maintenant vous reconnecter.',
    });
    } catch (error) {
    console.error('[ERREUR] reinitialiserMotDePasse :', error);
    res.status(400).json({ message: 'Lien expiré ou invalide. Veuillez refaire la demande.' });
  }
};

// Gestion de la route de récupération d'un utilisateur par ID uniquement pour les admins
exports.getUserById = async (req, res) => {
  const { id } = req.params;

  try{
    const utilisateur = await utilisateurMapper.getById(id);
    if (!utilisateur) return res.status(404).json({ error: 'Utilisateur non trouvé'});
    res.json(utilisateur);
  } catch ( err ) {
    res.status(500).json({ error: 'Erreur lors de la récupération de l\'utilisateur' });
  }
};

// Gestion de la route de suppression d'un utilisateur uniquement par les admins
exports.deleteUser = async (req, res) => {
  const { id } = req.params;

  try {
    const utilisateur = await utilisateurMapper.delete(id);
    if (!utilisateur) return res.status(400).json({ error: 'Utilisateur non trouvé'});
    res.json({ message : 'Utilisateur supprimé avec succès !'});
  } catch ( err ) {
    res.status(500).json({error: 'Erreur lors de la suppression de l\'utilisateur'});
  }
};

// Gestion de la route de récupération de tous les utilisateurs uniquement par les admins
exports.getAllUsers = async (req, res) => {
  try {
    const utilisateurs = await utilisateurMapper.getAll();
    res.json(utilisateurs);
  } catch (err) {
    res.status(500).json({ error: 'Erreur de récupération de tout les utilisateurs' });
  }
};
