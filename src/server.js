const express = require('express');
const routes = require('./routes/index');
const app = express();
const PORT = 3000;

// Middleware to parse JSON
app.use(express.json());

// Example route
app.use(routes);

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});