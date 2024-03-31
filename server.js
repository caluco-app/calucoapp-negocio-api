// server.js
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors'); // Importa el módulo cors

const authRoutes = require('./api/routes/authRoutes'); 
const autenticacionRoutes = require('./api/routes/autenticacionRoutes'); 
const negocioRouter = require('./api/routes/negocioRouter'); 
const sucursalRouter = require('./api/routes/sucursalesRoutes'); 
const ticketRouter = require('./api/routes/ticketsRoutes'); 

const app = express();
const PORT = 4201;
const IP = '10.0.0.4';

// Middleware
app.use(bodyParser.json());


// Habilita CORS para todas las rutas
app.use(cors());

// Rutas
app.use('/api', authRoutes);
app.use('/api', autenticacionRoutes);
app.use('/api', negocioRouter);
app.use('/api/sucursal', sucursalRouter);
app.use('/api/tickets', ticketRouter);

// Iniciar el servidor
app.listen(PORT, IP, () => {
  console.log(`Servidor corriendo en http://${IP}:${PORT}`);
});