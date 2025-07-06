const express = require('express');
const router = express.Router();
const controller = require('../controllers/utilisateursController');
const rateLimiter = require('../middlewares/rateLimiter');
const sanitizeHTML = require('../middlewares/sanitizeHTML');
const verifierToken = require('../middlewares/authMiddlewares');
const isAdmin = require('../middlewares/isAdmin');

// Inscription d'un utilisateur
router.post('/register', rateLimiter, sanitizeHTML(['nom', 'email']), controller.register);
// Connexion d'un utilisateur
router.post('/login', rateLimiter, controller.login);
// Oublie du mot de passe
router.post('/mot-de-passe-oublie', rateLimiter, sanitizeHTML(['email']), controller.demandeReinitialisation);
// Vérification du token de réinitialisation
router.post('/reinitialiser-mot-de-passe/:token', rateLimiter, sanitizeHTML(['nouveauMotDePasse']), controller.reinitialiserMotDePasse);
// Affichier tout les utilisateurs (admin uniquement)
router.get('/', verifierToken(), isAdmin, controller.getAllUsers);
// Récupérer un utilisateur par ID (admin uniquement)
router.get('/:id', verifierToken(), isAdmin, controller.getUserById);
// Supprimer un utilisateur (admin uniquement)
router.delete('/:id', verifierToken(), isAdmin, controller.deleteUser);

module.exports = router;

