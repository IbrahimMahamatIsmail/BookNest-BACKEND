const avisMapper = require('../dataMapper/avisMapper');
const empruntMapper = require('../dataMapper/empruntsMapper');

exports.ajouterAvis = async (req, res) => {
  const utilisateurId = req.utilisateur.id;
  const livreId = parseInt(req.params.livreId);
  const { commentaire, note } = req.body;

  try {
    const aEmprunteEtRendu = await empruntMapper.utilisateurAEmprunteEtRendu(utilisateurId, livreId);
    if (!aEmprunteEtRendu) {
      return res.status(403).json({ message: "Vous devez avoir emprunté et retourné ce livre pour laisser un avis." });
    }
    const dejaAvis = await avisMapper.dejaLaisseAvis(utilisateurId, livreId);
    if (dejaAvis) {
      return res.status(400).json({ message: "Vous avez déjà laissé un avis sur ce livre 📚💬" });
    }
    
    if (!commentaire || typeof commentaire !== 'string' || commentaire.length < 5) {
      return res.status(400).json({ message: 'commentaire de l\'avis invalide (minimum 5 caractères)' });
    }
    if (typeof note !== 'number' || note < 1 || note > 5) {
      return res.status(400).json({ message: 'La note doit être un nombre entre 1 et 5' });
    }
    const avisCree = await avisMapper.create({ utilisateurId, livreId, commentaire, note });
    res.status(201).json({ message: 'Avis ajouté avec succès. Merci pour votre avis 💬 !', avis: avisCree });
  } catch (error) {
    console.error('[ERREUR] avisController.ajouterAvis', error);
    res.status(500).json({ message: 'Erreur lors de l\'ajout de l\'avis' });
  }
};

exports.getAvisParLivre = async (req, res) => {
  const livreId = parseInt(req.params.livreId);
  try {
    const avis = await avisMapper.findByLivre(livreId);
    res.json(avis);
  } catch (error) {
    console.error('[ERREUR] getAvisParLivre :', error);
    res.status(500).json({ message: 'Erreur lors de la récupération des avis' });
  }
};

exports.supprimerAvis = async (req, res) => {
  const { id } = req.params;
  try {
    const avis = await avisMapper.delete(id);
    if (!avis) return res.status(404).json({ message: 'Avis non trouvé' });
    res.json({ message: 'Avis supprimé' });
  } catch (error) {
    res.status(500).json({ message: 'Erreur lors de la suppression de l\'avis' });
  }
};