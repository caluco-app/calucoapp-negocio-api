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
router.delete('/ofertasPorProductos/:id', productosController.eliminarOfertaPorProducto);

// Ruta de mantenimiento de inventarios
router.get('/inventarioPorProductos/:idProducto', productosController.inventarioPorProductos);
router.post('/inventarioPorProductos', productosController.inventarioPorProductoMtto);
router.delete('/inventarioPorProductos/:id', productosController.eliminarInventarioPorProducto);


// Ruta de mantenimiento de clientes
router.get('/clientes/', productosController.obtenerClientes);
router.post('/clientes', productosController.clientesMtto);
router.delete('/clientes/:id', productosController.eliminarCliente);

module.exports = router;
