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

// Ruta de mantenimiento de productos
router.get('/productosPorNegocio/:idNegocio', productosController.productosPorNegocios);
router.post('/productosPorNegocio', productosController.productoMtto);
router.delete('/productos/:id', productosController.eliminarProducto);

// Ruta de mantenimiento de ofertas
router.get('/ofertasPorProductos/:idProducto', productosController.ofertasPorProductos);
router.post('/ofertasPorProductos', productosController.ofertaMtto);
router.delete('/ofertasPorProductos/:id', productosController.eliminarProducto);


module.exports = router;
