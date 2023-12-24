// productosRouter.js

const express = require('express');
const productosController = require('../controllers/negociosController'); // Asegúrate de que la ruta sea correcta

const router = express.Router();

// Ruta para obtener productos por negocio
router.get('/productosPorNegocios/:idNegocio', productosController.productosPorNegocios);

// Ruta de mantenimiento de inventario
router.get('/inventarioPorNegocio/:idNegocio', productosController.inventarioPorNegocios);
router.post('/inventariosPorNegocio', productosController.inventarioMtto);
router.delete('/inventarios/:id', productosController.eliminarInventario);

// Ruta de mantenimiento de stocks
router.post('/stocksPorNegocio', productosController.stockMtto);
router.get('/stockPorInventario/:idNegocio/:idInventario', productosController.stockPorInventario);
router.get('/stockPorIdInventario/:idInventario', productosController.stockPorIdInventario);


module.exports = router;
