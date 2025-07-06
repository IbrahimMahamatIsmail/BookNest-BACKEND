const express = require('express');
const router = express.Router();
const controller = require('../controllers/adminController');
const sanitizeHTML = require('../middlewares/sanitizeHTML');
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

router.use(verifierToken(), isAdmin);

router.get('/utilisateurs', controller.getAllUsers);
router.get('/utilisateurs/:id', controller.getUserById);
router.delete('/utilisateurs/:id', controller.deleteUser);
router.get('/logs-suppressions', controller.getLogsSuppressions);
router.post('/add-livre', adminLimiter, sanitizeHTML(champsAdmin), controller.addLivre);
router.put('/update-livre/:id', adminLimiter, sanitizeHTML(champsAdmin), controller.updateLivre);
router.delete('/delete-livre/:id', adminLimiter, controller.deleteLivre);
router.delete('/delete-avis/:avisId', adminLimiter, controller.deleteAvis);

module.exports = router;