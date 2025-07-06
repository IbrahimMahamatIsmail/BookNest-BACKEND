const express = require('express');
const router = express.Router();
const controller = require('../controllers/empruntsController');
const verifierToken = require('../middlewares/authMiddlewares');
const rateLimiter = require('../middlewares/rateLimiter');

// Ajout d'un emprunt 
router.post('/:livreId', verifierToken(), rateLimiter, controller.emprunterLivre); 
// Retour d'un emprunt 
router.put('/:empruntId/retour', verifierToken(), controller.retournerLivre);
// Afficher ses emprunts
router.get('/mes-emprunts', verifierToken(), controller.mesEmprunts);

module.exports = router;

