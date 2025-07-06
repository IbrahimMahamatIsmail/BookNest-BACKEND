const livresMapper = require('../dataMapper/livresMapper');
const empruntMapper = require('../dataMapper/empruntsMapper');

// Liste toutes les catégories de livres
exports.getCategories = async (req, res) => {
  try {
    const categories = await livresMapper.getCategories();
    // console.log('[DEBUG] Catégories renvoyées au client:', categories);
    res.json(categories);
  } catch (err) {
    console.error('[ERREUR] getCategories controller :', err);
    res.status(500).json({ error: 'Erreur serveur' });
  }
};

// Obtenir tous les livres
exports.getAllLivres = async (req, res) => {
  try {
    const livres = await livresMapper.getAll();
    res.json({livres});
  } catch (err) {
    console.error('[ERREUR] lors du getAllLivres:', err);
    res.status(500).json({ error: 'Erreur serveur lors de la récupération des livres controller' });
  }
};

// Affiche tous les livres d’une catégorie
exports.getLivresByCategorie = async (req, res) => {
  const categorie = req.params.nom;
  try {
    const livres = await livresMapper.getAllByCategorie(categorie);
    if (!livres || livres.length === 0) {
      return res.status(404).json({
        message: "Aucun livre trouvé dans cette catégorie. Revenez ultérieurement. Merci !",
      });
    }
    res.json(livres);
  } catch (err) {
    res.status(500).json({ error: 'Erreur lors de la récupération des livres par catégorie' });
  }
};

// Obtenir un livre par ID
exports.getLivreById = async (req, res) => {
  try {
    const livreById = await livresMapper.getById(req.params.id);
    if (!livreById) return res.status(404).json({ error: 'Livre non trouvé' });
    res.status(200).json(livreById);
  } catch (err) {
    res.status(500).json({ error: 'Erreur serveur controller' });
  }
};

// Récupérer un livre avec son contenu complet(authentification + emprunt)
exports.getContenuCompletLivre = async (req, res) => {
  const livreId = parseInt(req.params.id);
  const utilisateurId = req.utilisateur.id;

  try {
    const aEmprunte = await empruntMapper.utilisateurAEmprunterSansRetour(utilisateurId, livreId);
    if (!aEmprunte) {
      return res.status(403).json({ message: "Vous devez obligatoirement emprunter ce livre pour lire le contenu complet." });
    }
    const contenu = await livresMapper.getContenuById(livreId);
    // console.log("[DEBUG] Contenu récupéré :", contenu);
    if (!contenu) {
      return res.status(404).json({ message: "Contenu du Livre non trouvé" });
    }
    // Récupère la date de retour s’il y en a une
    const dernierEmprunt = await empruntMapper.getDernierEmprunt(utilisateurId, livreId);
    if (!aEmprunte && !dernierEmprunt?.rendu) {
      return res.status(403).json({ message: "Vous devez emprunter ce livre pour lire le contenu complet." });
    }
    res.json({ 
      contenu,
      date_retour: dernierEmprunt?.date_retour || null, });
  } catch (err) {
    // console.log('[ERREUR] getContenuLivre:', err);
    res.status(500).json({ message: "Erreur lors de la récupération du contenu du livre" });
  }
};


// Ajouter un nouveau livre ADMIN uniquement
exports.addLivre = async (req, res) => {
  try {    
    const nouveaulivre = await livresMapper.insert(req.body);
    res.status(201).json({ message: 'Livre ajouté', nouveaulivre });
  } catch (err) {
    res.status(500).json({ error: 'Erreur lors de l’ajout du livre' });
  }
};

// Mettre à jour un livre ADMIN uniquement
exports.updateLivre = async (req, res) => {
  try {    
    const livre = await livresMapper.getById(req.params.id);
    if (!livre) return res.status(404).json({ error: 'Livre non trouvé'});
    const updatedLivre = await livresMapper.update(req.params.id, req.body);
    res.status(200).json({ message: 'Livre mis à jour avec succès !', updatedLivre });
  } catch (err) {
    res.status(500).json({ error: 'Erreur lors de la mise à jour du livre' });
  }
};

// Supprimer un livre
exports.deleteLivre = async (req, res) => {
  try {    
    const livre = await livresMapper.getById(req.params.id);
    if (!livre) return res.status(404).json({ error: 'Livre non trouvé'});
    const deletedlivre = await livresMapper.delete(req.params.id);
    res.status(200).json({ message: 'Livre supprimé', deletedlivre});
  } catch (err) {
    res.status(500).json({ error: 'Erreur suppression livre' });
  }
};

// Rechercher un livre par titre
exports.searchLivreByTitre = async (req, res) => {
  const titre = req.query.titre;
  try {
    const result = await livresMapper.findByTitre(titre);
    if (result.length === 0) return res.status(404).json({ message: 'Aucun livre trouvé avec ce titre'});
    res.json({ livres: result});
  } catch (err) {
    console.error('[ERREUR] Recherche du livre par titre:', err);
    res.status(500).json({ message: 'Erreur erreur lors de la recherche du livre par titre'})
  }
};
