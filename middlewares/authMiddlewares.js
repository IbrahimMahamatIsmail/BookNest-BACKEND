const jwt = require('jsonwebtoken');

const verifierToken = (messagePersonnalise = null) => {
  return (req, res, next) => {
    // console.log("Vérification du token d'authentification...");
    const authHeader = req.headers.authorization;
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      console.warn("Aucun token fourni")
      return res.status(401).json({
        message: messagePersonnalise || 'Accès refusé : vous devez être connecté.'
      });
    }
    const token = authHeader.split(' ')[1];
    try {
      const decoded = jwt.verify(token, process.env.JWT_SECRET);
      // console.log("Token décodé :", decoded);
      req.utilisateur = decoded;
      next();
    } catch (err) {
      console.error("Token invalide ou expiré");
      res.status(403).json({
        message: 'Session expirée ou invalide. Veuillez vous reconnecter.'
      });
    }
  };
};

module.exports = verifierToken;


