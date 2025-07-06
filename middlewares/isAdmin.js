const isAdmin = (req, res, next) => {
  if (!req.utilisateur || req.utilisateur.role !== 'admin') {
    return res.status(403).json({ message: 'Accès refusé : administrateurs uniquement' });
  }
  next();
};

module.exports = isAdmin


