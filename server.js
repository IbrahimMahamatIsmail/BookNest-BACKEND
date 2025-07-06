require("dotenv").config();
const express = require('express');
const cors = require('cors');
const path = require('path');
const helmet = require('helmet');
const app = express();
const errorHandler = require('./middlewares/errorHandler');
const PORT = process.env.PORT || 4001;
const allowedOrigins = [
  'http://localhost:3000',
  'https://booknest-front.vercel.app'
];

app.use(helmet({
  crossOriginResourcePolicy: { policy: "same-site" }, // pour des images statiques
  contentSecurityPolicy: false, // sinon je bloque les styles/scripts locaux en dev
}));
app.use(cors({
  origin: function (origin, callback) {
    if (!origin || allowedOrigins.includes(origin)) {
      callback(null, true);
    } else {
      callback(new Error('CORS non autorisé pour cette origine : ' + origin));
    }
  },
  credentials: true,
}));
app.use(express.json());

// Routes
app.use('/admin', require('./routers/adminRoute'));
app.use('/upload', require('./routers/uploadRoute'));
app.use('/avis', require('./routers/avisRoute'));
app.use('/emprunts', require('./routers/empruntsRoute'));
app.use('/livres', require('./routers/livresRoute'));
app.use('/utilisateurs', require('./routers/utilisateursRoute'));

// Rendre le dossier public accessible publiquement
app.use(express.static(path.join(__dirname, 'public')));

// Test
app.get('/', (req, res) => {
  res.send('API BookNest opérationnelle !');
});

// Gestion des erreurs
app.use(errorHandler);

// Lancement
app.listen(PORT, () => {
  console.log(`Serveur lancée sur http://localhost:${PORT}`);
});
