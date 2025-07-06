const db = require("../data/db");

const logsMapper = {
  async getAll() {
    const { rows } = await db.query(`
      SELECT * FROM logs_rgpd_suppressions 
      ORDER BY date_suppression DESC
    `);
    return rows;
  },
};

module.exports = logsMapper;
