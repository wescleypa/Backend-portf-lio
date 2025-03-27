const express = require('express');
const cors = require('cors');
const routes = require('./routes/index');
const app = express();
const PORT = 3000;

// Middleware to parse JSON
app.use(express.json());

// Enable CORS for POST and GET requests
app.use(cors({
  methods: ['GET', 'POST']
}));

// Example route
app.use(routes);

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});