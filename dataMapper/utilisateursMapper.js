const db = require('../data/db');

const utilisateurMapper = {
  async getByName (nom) {
    const { rows } = await db.query(`
    SELECT u.id, u.nom, u.email, u.mot_de_passe, u.role_id, r.nom AS role
    FROM utilisateurs u
    JOIN roles r ON u.role_id = r.id
    WHERE LOWER(u.nom) = LOWER($1)
    `, [nom]);
    return rows[0];
  },
  async getByEmail(email) {
    const { rows } = await db.query(`
      SELECT u.id, u.nom, u.email, u.mot_de_passe, u.role_id, u.last_login, r.nom AS role
      FROM utilisateurs u
      JOIN roles r ON u.role_id = r.id
      WHERE u.email = $1
    `, [email]);
    return rows[0];
  },
  async getAdmin() {
    const { rows } = await db.query(`
      SELECT u.id, u.nom, u.email, r.nom AS role
      FROM utilisateurs u
      JOIN roles r ON u.role_id = r.id
      WHERE r.nom = 'admin'
      LIMIT 1
    `);
    return rows[0];
  },
  async create({ nom, email, mot_de_passe, role_id}) { 
    const { rows } = await db.query(
      `INSERT INTO utilisateurs (nom, email, mot_de_passe, role_id)
      VALUES ($1, $2, $3, $4) RETURNING id, nom, email`,
      [nom, email, mot_de_passe, role_id]
    );
    return rows[0];
  },
  async updateLastLogin(id) {
    const { rows } = await db.query(
      'UPDATE utilisateurs SET last_login = NOW() WHERE id = $1 RETURNING last_login',
      [id]
    );
    return rows[0];
  },
  async updateMotDePasse(id, nouveauMotDePasseHashe) {
    const { rows } = await db.query(
      'UPDATE utilisateurs SET mot_de_passe = $1 WHERE id = $2 RETURNING id, email',
      [nouveauMotDePasseHashe, id]
    );
    return rows[0];
  },
  async updateResetToken(id, token) {
    const { rows } = await db.query(
      'UPDATE utilisateurs SET reset_token = $1 WHERE id = $2',
      [token, id]
    );
    return rows[0];
  },  
  async getById(id) {
    const { rows } = await db.query('SELECT id, nom, email, mot_de_passe, reset_token FROM utilisateurs WHERE id = $1', [id]);
    return rows[0];
  },
  async getAll() {
    const { rows } = await db.query(`
    SELECT u.id, u.nom, u.email, r.nom AS role
    FROM utilisateurs u
    JOIN roles r ON u.role_id = r.id
    ORDER BY u.id`);
    return rows;
  },
  async delete(id) {
    const { rows } = await db.query('DELETE FROM utilisateurs WHERE id = $1 RETURNING id', [id]);
    return rows[0];
  },

};

module.exports = utilisateurMapper;