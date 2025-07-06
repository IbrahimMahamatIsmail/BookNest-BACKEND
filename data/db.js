const { Pool } = require('pg');
require('dotenv').config();

const pool = new Pool({
  user: process.env.PGUSER,
  password: process.env.PGPASSWORD,
  host: process.env.PGHOST,
  port: process.env.PGPORT,
  database: process.env.PGDATABASE,
  ssl: process.env.PG_SSL === "true" ? { rejectUnauthorized: false } : false
});
console.log('Connexion à la DB PostgreSQL établie');

module.exports = pool;
