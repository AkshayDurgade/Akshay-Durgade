const express = require('express');
const mysql = require('mysql');

// Create an Express app
const app = express();

// Create a MySQL connection
const connection = mysql.createConnection({
  host: 'mysql-service',
//   socketPath: 'mysql-socket-path',
  port: 3306,
  user: 'root',
  password: 'Akshay',
  database: 'office',
//   insecureAuth: true
});

// Connect to MySQL
connection.connect((error) => {
  if (error) {
    console.error('Error connecting to MySQL:', error);
  } else {
    console.log('Connected to MySQL database');
  }
});

// Define API routes and endpoints
// ...
// Example route: Get all users from a "users" table
app.get('/emp', (req, res) => {
  const query = 'SELECT * FROM emp';
  connection.query(query, (error, results) => {
    if (error) {
      console.error('Error executing MySQL query:', error);
      res.status(500).json({ error: 'Failed to fetch users' });
    } else {
      res.json(results);
    }
  });
});


// Start the server
const port = 3000;
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});