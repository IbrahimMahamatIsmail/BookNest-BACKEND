const rateLimit = require('express-rate-limit');

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 150, // Limite chaque IP à 150 requêtes par route
  message: 'Trop de tentatives, veuillez réessayer plus tard.'
});

module.exports = limiter;
