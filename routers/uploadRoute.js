const express = require('express');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const router = express.Router();
const adminLimiter = require('../middlewares/adminLimiter');
const verifierToken = require('../middlewares/authMiddlewares');
const isAdmin = require('../middlewares/isAdmin');

// Configuration de multer
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'public/uploads');
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, uniqueSuffix + path.extname(file.originalname));
  }
});
const upload = multer({ storage });

// Route upload image
router.post('/', verifierToken(), isAdmin, adminLimiter, upload.single('image'), (req, res) => {
  if (!req.file) {
    return res.status(400).json({ message: 'Aucun fichier téléchargé' });
  }
  // const fileUrl = `/uploads/${req.file.filename}`;
  const fileUrl = `${process.env.BASE_URL}/uploads/${req.file.filename}`;
  res.json({
    message: 'Image téléchargée avec succès',
    url: fileUrl,
    filename: req.file.filename,
  });
});

// Nouvelle route pour supprimer une image
router.delete('/:filename', verifierToken(), isAdmin, adminLimiter, (req, res) => {
  const { filename } = req.params;
  // Validation du nom de fichier pour éviter les attaques de type path traversal
  if (!/^[a-zA-Z0-9_.-]+$/.test(filename)) {
    return res.status(400).json({ message: 'Nom de fichier invalide' });
  }
  const filePath = path.join(__dirname, '..', 'public', 'uploads', filename);
  fs.unlink(filePath, (err) => {
    if (err) {
      console.error('Erreur suppression fichier:', err);
      return res.status(500).json({ message: 'Erreur lors de la suppression du fichier' });
    }
    res.json({ message: 'Image supprimée avec succès' });
  });
});

module.exports = router;
