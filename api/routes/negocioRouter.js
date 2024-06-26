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
router.post('/ofertasPorProductosFiltroVenta', productosController.obtenerOfertasPorFiltro);
router.post('/ofertasPorProductos', productosController.ofertaMtto);
router.delete('/ofertasPorProductos/:id', productosController.eliminarOfertaPorProducto);

// Ruta de mantenimiento de inventarios
router.get('/inventarioPorProductos/:idProducto', productosController.inventarioPorProductos);
router.get('/inventarioPorProductoSeleccionado/:idProducto', productosController.inventarioPorProductoSeleccionado);
router.get('/inventarioPorProductoNoSeleccionado/:idProducto', productosController.inventarioPorProductoNoSeleccionado);
router.post('/inventarioPorProductos', productosController.inventarioPorProductoMtto);
router.delete('/inventarioPorProductos/:id', productosController.eliminarInventarioPorProducto);


// Ruta de mantenimiento de clientes
router.get('/clientes/', productosController.obtenerClientes);
router.get('/sociospornegocio/:idnegocio', productosController.obtenerSociosPorNegocio);
router.get('/clientes/:filtro', productosController.obtenerClientesPorFiltro);
router.post('/clientes', productosController.clientesMtto);
router.post('/sociospornegocio', productosController.socioPorNegocioMtto);
router.delete('/clientes/:id', productosController.eliminarCliente);

// Ruta de mantenimiento de facturas
router.get('/tiposfactura/', productosController.obtenerTiposDeFactura);


// Ruta de mantenimiento de perido fiscal
router.get('/peridotributarios/', productosController.obtenerPeriodoTributarios);

// Ruta de mantenimiento de facturas
router.post('/facturacion', productosController.facturasMtto);


module.exports = router;
