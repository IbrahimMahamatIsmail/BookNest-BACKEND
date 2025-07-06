const db = require('../data/db');

const avisMapper = {
  // Ajouter un avis
  async create({ utilisateurId, livreId, commentaire, note }) {
    const result = await db.query(
      `INSERT INTO avis (utilisateur_id, livre_id, commentaire, note)
       VALUES ($1, $2, $3, $4)
       RETURNING *`,
      [utilisateurId, livreId, commentaire, note]
    );
    return result.rows[0];
  },
  // Trouver tous les avis d’un livre
  async findByLivre(livreId) {
    const { rows } = await db.query(
      `SELECT a.*, u.nom AS nom_utilisateur
       FROM avis a
       JOIN utilisateurs u ON u.id = a.utilisateur_id
       WHERE a.livre_id = $1
       ORDER BY a.date_avis DESC`,
      [livreId]
    );
    return rows;
  },
  // Voir si un utilisateur a déjà laissé un avis sur un livre
  async dejaLaisseAvis(utilisateurId, livreId) {
    const result = await db.query(
      `SELECT 1 FROM avis 
       WHERE utilisateur_id = $1 AND livre_id = $2 
       LIMIT 1`,
      [utilisateurId, livreId]
    );
    return result.rowCount > 0;
  },
  // Supprimer un avis
  async delete(avisId) {
    const result = await db.query(
      'DELETE FROM avis WHERE id = $1 RETURNING *',
      [avisId]
    );
    return result.rows[0];
  }
};

module.exports = avisMapper;
