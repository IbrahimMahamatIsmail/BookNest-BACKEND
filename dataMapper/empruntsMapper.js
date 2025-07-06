const db = require('../data/db');

const empruntMapper = {
  async utilisateurAEmprunterSansRetour(utilisateurId, livreId) {
    const result = await db.query(`
      SELECT 1 FROM emprunts
      WHERE utilisateur_id = $1
        AND livre_id = $2
        AND rendu = false
      LIMIT 1
    `, [utilisateurId, livreId]);
  
    return result.rowCount > 0;
  },
  async getDernierEmprunt(utilisateurId, livreId) {
    const result = await db.query(`
    SELECT * FROM emprunts
    WHERE utilisateur_id = $1 AND livre_id = $2
    ORDER BY date_emprunt DESC
    LIMIT 1
    `, [utilisateurId, livreId]);
    
    return result.rows[0];
  },
  async create(utilisateurId, livreId) {
    const result = await db.query(`
      INSERT INTO emprunts (utilisateur_id, livre_id)
      VALUES ($1, $2)
      RETURNING *
    `, [utilisateurId, livreId]);
    return result.rows[0];
  },
  async getById(empruntId) {
    const result = await db.query(`SELECT * FROM emprunts WHERE id = $1`, [empruntId]);
    // console.log("Données emprunt récupérées :", result.rows[0]);
    return result.rows[0];
  },
  async retourner(empruntId) {
    const result = await db.query(`
      UPDATE emprunts
      SET rendu = true, date_retour = CURRENT_TIMESTAMP
      WHERE id = $1
      RETURNING *
    `, [empruntId]);
    return result.rows[0];
  },
  async getAllByUser(utilisateurId) {
    const result = await db.query(`
      SELECT e.*, l.titre, l.auteur FROM emprunts e
      JOIN livres l ON e.livre_id = l.id
      WHERE e.utilisateur_id = $1
      ORDER BY e.date_emprunt DESC
    `, [utilisateurId]);
    return result.rows;
  },
  async utilisateurAEmprunteEtRendu(utilisateurId, livreId) {
    const result = await db.query(`
      SELECT 1 FROM emprunts
      WHERE utilisateur_id = $1
        AND livre_id = $2
        AND rendu = true
      LIMIT 1
    `, [utilisateurId, livreId]);
    return result.rowCount > 0;
  }
};

module.exports = empruntMapper;