const express = require('express');
const app = express();
const port = 3000;

// Serve static files from the "public" directory
app.use(express.static('public'));
const podName = process.env.HOSTNAME;
const podUID = process.env.POD_UID;
// Define a route to display some text
app.get('/', (req, res) => {
  res.send('Hello, World!');
  res.end(`Pod Name: ${podName}\nPod UID: ${podUID}\n`);
});

// Start the server
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});