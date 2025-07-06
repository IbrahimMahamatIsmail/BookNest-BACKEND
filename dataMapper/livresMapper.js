const db = require('../data/db');

const livresDataMapper = {
  // Récupération de toutes les catégories
  async getCategories() {
    try {
      const result = await db.query('SELECT DISTINCT categorie FROM livres WHERE categorie IS NOT NULL ORDER BY categorie');
      // console.log('[DEBUG] Résultat catégories:', result.rows);
      return result.rows.map(row => row.categorie);
    } catch (err) {
      console.error('[ERREUR] getCategories :', err);
      throw err;
    }
  },
  // Récupérer tous les livres
  async getAll() {
    const values = [];
    let query = `SELECT id, titre, auteur, description, categorie, disponible, image_url, stock, extrait FROM livres `;
    
    const result = await db.query(query, values);
    // console.log('[DEBUG] Requête SQL exécutée :', query);
    // console.log('[DEBUG] Valeurs utilisées :', values);
    return result.rows;
  },
  // Récupérer tous les livres d’une catégorie
  async getAllByCategorie(categorie) {
    try {
      const result = await db.query('SELECT id, titre, auteur, description, categorie, disponible, image_url, stock, extrait FROM livres WHERE categorie = $1', [categorie]);
      return result.rows;
    } catch (err) {
      console.error('erreur categories mapper livres', err);
      throw err;
    }
  },
  // Récupérer un livre par ID
  async getById(id) {
    try {
      const result = await db.query('SELECT id, titre, auteur, description, categorie, disponible, image_url, stock, extrait, contenu, date_ajout, date_modification FROM livres WHERE id = $1', [id]);
      // console.log('[DEBUG] getById result:', result.rows);
      return result.rows[0];
    } catch (err) {
      console.error('[ERREUR] getById Mapper :', err);
      throw err;
    }
  },
  // Récupérer le contenu d’un livre par ID
  async getContenuById(id) {
    try {
      const result = await db.query('SELECT contenu FROM livres WHERE id = $1', [id]);
      return result.rows[0]?.contenu || null;
    } catch (err) {
      console.error('[ERREUR] getContenuById :', err);
      throw err;
    }
  },
  async incrementStock(livreId) {
    // console.log("Incrémentation du stock pour livre ID:", livreId);
    const result = await db.query(`
      UPDATE livres SET stock = stock + 1
      WHERE id = $1
      RETURNING *
    `, [livreId]);
    // console.log("Nouveau stock :", result.rows[0]);
    return result.rows[0];
  },
  async insert(livre) {
    const {
      titre,
      auteur,
      description,
      categorie,
      disponible = true,
      image_url,
      stock,
      extrait,
      contenu,
    } = livre;
    const result = await db.query(
      `INSERT INTO livres (titre, auteur, description, categorie, disponible, image_url, stock, extrait, contenu, date_ajout)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, NOW())
       RETURNING *`,
      [titre, auteur, description, categorie, disponible, image_url, stock, extrait, contenu]
    );
    return result.rows[0];
  },
  async update(id, livre) {
    const {
      titre,
      auteur,
      description,
      categorie,
      disponible,
      image_url,
      stock,
      extrait,
      contenu,
    } = livre;
    const result = await db.query(
      `UPDATE livres
       SET titre = $1, auteur = $2, description = $3, categorie = $4, disponible = $5, image_url = $6, stock = $7, extrait = $8, contenu = $9, date_modification = NOW()
       WHERE id = $10
       RETURNING *`,
      [titre, auteur, description, categorie, disponible, image_url, stock, extrait, contenu, id]
    );
    return result.rows[0];
  },
  async delete(id) {
    const result = await db.query('DELETE FROM livres WHERE id = $1 RETURNING *', [id]);
    return result.rows[0];
  },
  async findByTitre(titre) {
    const result = await db.query(`
      SELECT id, titre, auteur, description, categorie, disponible, image_url, extrait 
      FROM livres 
      WHERE LOWER(titre) LIKE LOWER($1)
    `, [`%${titre}%`]);
    return result.rows;
  }  
};

module.exports = livresDataMapper;
