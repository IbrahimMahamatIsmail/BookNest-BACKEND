const express = require('express');
const router = express.Router();
const controller = require('../controllers/livresController');
const sanitizeHTML = require('../middlewares/sanitizeHTML');
const sanitizeQueryHtml = require('../middlewares/sanitizeQuery');
const adminLimiter = require('../middlewares/adminLimiter');
const verifierToken = require('../middlewares/authMiddlewares');
const isAdmin = require('../middlewares/isAdmin');

const champsAdmin = [
  'titre',
  'auteur',
  'description',
  'categorie',
  'image_url',
  'stock',
  'extrait',
  'contenu'
];

// Récupérer les livres par catégorie
router.get('/categories', controller.getCategories);
// Récupérer les livres d'une catégorie quelconque
router.get('/categories/:nom', sanitizeHTML([]), controller.getLivresByCategorie);
// Récupérer tous les livres avec seulement les extraits de chaque livre
router.get('/', controller.getAllLivres);
// Route pour rechercher dynamiquement un livre par son titre etc..
router.get('/search', sanitizeQueryHtml(['titre']), controller.searchLivreByTitre);
// Récupérer un livre par ID(sans le contenu complet)
router.get('/:id', controller.getLivreById);
// Récupérer un livre avec son contenu complet(authentification + emprunt)
router.get('/:id/contenu', verifierToken("Pour lire le contenu entier, connectez-vous et empruntez ce livre."), controller.getContenuCompletLivre);
// Ajouter un livre (admin uniquement)
router.post('/',  verifierToken(), isAdmin, adminLimiter, sanitizeHTML(champsAdmin), controller.addLivre);
// Mettre à jour un livre (admin uniquement)
router.put('/:id', verifierToken(), isAdmin, adminLimiter, sanitizeHTML(champsAdmin), controller.updateLivre);
// Supprimer un livre (admin uniquement)
router.delete('/:id', verifierToken(), isAdmin, adminLimiter, controller.deleteLivre);

module.exports = router;
