const mysql = require('mysql2/promise');
require('dotenv').config({ path: `.env.${process.env.NODE_ENV}` })

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
  waitForConnections: true,
  connectionLimit: 0,
  queueLimit: 0
});

pool.getConnection((err, connection) => {
  if (err) {
    console.error('Error connecting to the database:', err.message);
    return;
  }
  console.log('Connected to the MySQL database using a connection pool.');
  connection.release(); // Release the connection back to the pool
});

module.exports = pool;