const express = require('express');
const ticketsController = require('../controllers/tiketsController');

const ticketRouter = express.Router();

ticketRouter.get('/obtnerTicketsPorSucursal/:idsucursal', ticketsController.obtnerTicketsPorSucursal);
ticketRouter.get('/obtnerTicketsPorID/:id', ticketsController.obtnerTicketsPorID);
ticketRouter.post('/obtnerProductosPorSucursal', ticketsController.obtnerProductosPorNegocio);
ticketRouter.post('/insertarTicketItem', ticketsController.insertarTicketItem);
ticketRouter.post('/obtnerDetalleTickets', ticketsController.obtnerDetalleTickets);
ticketRouter.post('/nuevoTicket', ticketsController.nuevoTicket);

module.exports = ticketRouter;