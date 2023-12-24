// server.js
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors'); // Importa el módulo cors
const authRoutes = require('./api/routes/authRoutes'); 
const negocioRouter = require('./api/routes/negocioRouter'); 

const app = express();
const PORT = 8080;

// Middleware
app.use(bodyParser.json());


// Habilita CORS para todas las rutas
app.use(cors());

// Rutas
app.use('/api', authRoutes);
app.use('/api', negocioRouter);

// Iniciar el servidor
app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
