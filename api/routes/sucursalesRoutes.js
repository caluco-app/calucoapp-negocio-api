const express = require('express');
const controllerSucursal = require('../controllers/sucursalesController');

const sucursalRouter = express.Router();

sucursalRouter.get('/permisosPorSucursal/:id', controllerSucursal.obtenerPermisos);
sucursalRouter.get('/obtnerComprobantesPorSucursal/:idsubopcion/:idsucursal', controllerSucursal.obtnerfacturasPorSucursal);

module.exports = sucursalRouter;