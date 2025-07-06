const livresMapper = require('../dataMapper/livresMapper');
const utilisateurMapper = require('../dataMapper/utilisateursMapper');
const logsMapper = require('../dataMapper/logsMapper');
const avisMapper = require('../dataMapper/avisMapper');

exports.getAllUsers = async (req, res) => {
  try {
    const users = await utilisateurMapper.getAll();
    res.json(users);
  } catch (error) {
    res.status(500).json({ message: 'Erreur de récupération des utilisateurs' });
  }
};

exports.getUserById = async (req, res) => {
  try {
    const user = await utilisateurMapper.getById(req.params.id);
    if (!user) return res.status(404).json({ message: 'Utilisateur non trouvé' });
    res.json(user);
  } catch (error) {
    res.status(500).json({ message: 'Erreur serveur' });
  }
};

exports.deleteUser = async (req, res) => {
  try {
    const deleted = await utilisateurMapper.delete(req.params.id);
    if (!deleted) return res.status(404).json({ message: 'Utilisateur non trouvé' });
    res.json({ message: 'Utilisateur supprimé' });
  } catch (error) {
    res.status(500).json({ message: 'Erreur serveur' });
  }
};

exports.getLogsSuppressions = async (req, res) => {
  try {
    const logs = await logsMapper.getAll();
    res.status(200).json(logs);
  } catch (err) {
    console.error("Récupération des logs RGPD :", err);
    res.status(500).json({ message: "Erreur lors de la récupération des logs RGPD" });
  }
};

exports.addLivre = async (req, res) => {
  try {
    const livre = await livresMapper.insert(req.body);
    res.status(201).json({ message: 'Livre ajouté', livre });
  } catch (error) {
    res.status(500).json({ message: 'Erreur lors de l\'ajout du livre' });
  }
};

exports.updateLivre = async (req, res) => {
  try {
    // console.log("[DEBUG] Données reçues pour update :", req.body);
    const updated = await livresMapper.update(req.params.id, req.body);
    res.json({ message: 'Livre mis à jour', updated });
  } catch (error) {
    console.error('adminController.updateLivre :', error);
    res.status(500).json({ message: 'Erreur serveur' });
  }
};

exports.deleteLivre = async (req, res) => {
  try {
    const deleted = await livresMapper.delete(req.params.id);
    res.json({ message: 'Livre supprimé', deleted });
  } catch (error) {
    res.status(500).json({ message: 'Erreur serveur' });
  }
};

exports.deleteAvis = async (req, res) => {
  try {
    const { avisId } = req.params;
    const avis = await avisMapper.delete(avisId);
    if (!avis) return res.status(404).json({ message: 'Avis non trouvé' });
    res.json({ message: 'Avis supprimé' });
  } catch (error) {
    console.error("Suppression de l'avis :", error);
    res.status(500).json({ message: 'Erreur lors de la suppression de l\'avis adminC' });
  }
};