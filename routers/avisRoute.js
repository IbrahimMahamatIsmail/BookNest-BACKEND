const express = require('express');
const router = express.Router();
const controller = require('../controllers/avisController');
const sanitizeHTML = require('../middlewares/sanitizeHTML');
const rateLimiter = require('../middlewares/rateLimiter');
const verifierToken = require('../middlewares/authMiddlewares');
const isAdmin = require('../middlewares/isAdmin');

// Ajouter ou laiser un avis sur un livre
router.post('/:livreId', verifierToken(), rateLimiter, sanitizeHTML(['commentaire']),  controller.ajouterAvis);
// Afficher les avis d'un livre
router.get('/livre/:livreId', controller.getAvisParLivre);
// Supprimer un avis (admin uniquement)
router.delete('/:avisId', verifierToken(), isAdmin, controller.supprimerAvis);

module.exports = router;
