require("dotenv").config();
const db = require("../data/db");
const nodemailer = require("nodemailer");

const EMAIL_USER = process.env.EMAIL_USER;
const EMAIL_PASS = process.env.EMAIL_PASS;
const { FRONT_URL } = require("../config");

const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: EMAIL_USER,
    pass: EMAIL_PASS,
  },
});

async function envoyerAvertissement(utilisateur) {
  try {
    const lienConnexion = `${FRONT_URL}/login`;
    await transporter.sendMail({
      to: utilisateur.email,
      subject: "📢 Alerte : Votre compte Booknest sera supprimé",
      html: `
      <div style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f4f4; padding: 30px;">
        <div style="max-width: 600px; margin: auto; background: #ffffff; border-radius: 10px; overflow: hidden; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
          <div style="background-color: #4b0082; color: white; text-align: center; padding: 20px 0;">
          <img 
            src="https://i.imgur.com/QGoA4wc.png" 
            alt="Logo BookNest"
            style="width: 120px; margin-bottom: 20px;" 
          />
            <h1 style="margin: 0;">📚 Booknest</h1>
            <p style="margin: 0;">Votre bibliothèque numérique préférée</p>
          </div>
          <div style="padding: 30px;">
            <h2>Bonjour ${utilisateur.nom} !</h2>
            <p>Vous n'avez pas utilisé votre compte ni réalisé aucune action depuis plus d'un an.</p>
            <p>
              Conformément au RGPD(Réglement Général sur la Protection des Données), nous allons malheuresement supprimer votre compte dans 
              <strong>24 heures</strong> si vous ne vous réalissez aucune action ni si vous ne vous reconnectez pas. 
            </p>
            <p>Mais vous aurez la posibilité de vous récréer un compte si vous le souhaitez bien évidement à de fin d'utilisation du service </p>
            <p style="margin-top: 30px;">
              <a 
                href="${lienConnexion}" 
                style="background-color: #4b0082; color: white; text-decoration: none; padding: 12px 25px; border-radius: 5px; font-weight: bold;">
                Se connecter
              </a>
            </p>
            <p>Merci de votre compréhension.</p>
            <p style="font-size: 13px; color: #555;">
              L'équipe Booknest 📚
            </p>
          </div>
        </div>
      </div>
      `,
    });
    // console.log(`Mail envoyé avec succès à ${utilisateur.email}`);
  } catch (err) {
    console.error("Erreur d'envoi du mail", err);
  }
}

async function supprimerComptesInactifs() {
  const unAn = new Date();
  unAn.setFullYear(unAn.getFullYear() - 1);
  const { rows: utilisateurs } = await db.query(`
    SELECT * FROM utilisateurs 
    WHERE last_login < $1 
    AND alert_suppression_envoyee = false
    AND role_id != 2`,
    [unAn]);

  for (const utilisateur of utilisateurs) {
    // console.log("Envoi du mail d'avertissement à :", utilisateur.email);
    await envoyerAvertissement(utilisateur);
    await db.query(`
    UPDATE utilisateurs 
    SET alert_suppression_envoyee = true 
    WHERE id = $1`,
    [utilisateur.id]);
  }
}

async function supprimerDefinitivement() {
  const hier = new Date();
  hier.setDate(hier.getDate() - 1);
  const { rows: utilisateursASupprimer } = await db.query(`
    SELECT * FROM utilisateurs 
    WHERE last_login < $1 
    AND alert_suppression_envoyee = true
    AND role_id != 2`,
    [hier]);
  for (const utilisateur of utilisateursASupprimer) {
    await db.query(`
    INSERT INTO logs_rgpd_suppressions (utilisateur_id, email, nom, raison)
      VALUES ($1, $2, $3, $4)`, 
      [
        utilisateur.id, 
        utilisateur.email, 
        utilisateur.nom, 
        'Inactivité supérieure à 1 an, conformément au RGPD'
      ]);
    await db.query(`
      DELETE FROM utilisateurs
      WHERE alert_suppression_envoyee = true 
      AND last_login < $1
      AND role_id != 2`, 
      [hier]);
  }
}

(async () => {
  await supprimerComptesInactifs();
  await supprimerDefinitivement();
  // console.log("Comptes inactifs traités");
  process.exit();
})();


//const maintenant = new Date(); PGPASSWORD=HqY3nJrQkvBXB61RBz0zO0KiFf9rdrik psql -h dpg-d1l8677diees73fbgtj0-a.oregon-postgres.render.com -U booknest booknest_lkwg
//const ilYaUneMinute = new Date(maintenant.getTime() - 1 * 60 * 1000)
//hier.setMinutes(hier.getMinutes() - 1);
