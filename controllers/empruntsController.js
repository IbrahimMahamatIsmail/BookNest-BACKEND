const empruntMapper = require('../dataMapper/empruntsMapper');
const livresMapper = require('../dataMapper/livresMapper');

exports.emprunterLivre = async (req, res) => {
  //console.log("Dans le controller emprunterLivre");
  const utilisateurId = req.utilisateur.id;
  const livreId = parseInt(req.params.livreId);

  try {
    const livre = await livresMapper.getById(livreId);
    if (!livre || !livre.disponible || livre.stock < 1) {
      return res.status(400).json({ message: 'Livre non disponible pour emprunt revenez  ultérieurement !' });
    }
    // Vérifie s'il a déjà un emprunt actif non rendu
    const dejaEmprunteSansRetour = await empruntMapper.utilisateurAEmprunterSansRetour(utilisateurId, livreId);
    if (dejaEmprunteSansRetour) {
      return res.status(400).json({ message: 'Vous avez déjà emprunté ce livre. Veuillez le retourner avant de l\'emprunter à nouveau.' });
    }
    const emprunt = await empruntMapper.create(utilisateurId, livreId);
    res.status(201).json({ message: 'Livre emprunté avec succès', emprunt });
  } catch (error) {
    res.status(500).json({ message: 'Erreur lors de l\'emprunt' });
  }
};

exports.retournerLivre = async (req, res) => {
  const empruntId = parseInt(req.params.empruntId);
  // console.log("Demande de retour pour emprunt ID :", empruntId);

  try {
    const emprunt = await empruntMapper.getById(empruntId);
    // console.log("Emprunt trouvé :", emprunt);
    if (!emprunt || emprunt.rendu) {
      console.warn("Emprunt non valide ou déjà rendu.");
      return res.status(400).json({ message: 'Emprunt invalide ou déjà retourné' });
    }
    await livresMapper.incrementStock(emprunt.livre_id);
    // console.log("Stock du livre incrémenté");
    const retour = await empruntMapper.retourner(empruntId);
    // console.log("Livre retourné avec succès :", retour);
    res.status(200).json({ 
      message: 'Livre retourné avec succès',
      retour,
      suggestion: `Merci pour votre lecture ! N’hésitez pas à partager votre avis ici http://localhost:3001/avis/${emprunt.livre_id}` });
  } catch (error) {
    console.error("Erreur lors du retour :", error);
    res.status(500).json({ message: 'Erreur lors du retour' });
  }
};

exports.mesEmprunts = async (req, res) => {
  const utilisateurId = req.utilisateur.id;
  // console.log("Requête pour voir les emprunts de l'utilisateur ID:", utilisateurId);
  try {
    const emprunts = await empruntMapper.getAllByUser(utilisateurId);
    // console.log("Emprunts trouvés :", emprunts);
    res.json(emprunts);
  } catch (error) {
    console.error('Erreur lors de la récupération des emprunts:', error);
    res.status(500).json({ message: 'Erreur lors de la récupération des emprunts' });
  }
};