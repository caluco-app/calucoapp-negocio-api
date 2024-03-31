// models/db.js
const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: 'calucoappmysql.mysql.database.azure.com',
  user: 'administrador',
  password: 'VTF7xby7Y7Rrv85',
  database: 'calucoappdb',
  port: 3306,
});

connection.connect((err) => {
  if (err) {
    console.error('Error connecting to database:', err);
  } else {
    console.log('Connected to database');
  }
});

module.exports = connection;
