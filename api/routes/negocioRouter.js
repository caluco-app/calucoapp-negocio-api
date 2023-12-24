// productosRouter.js

const express = require('express');
const productosController = require('../controllers/negociosController'); // Asegúrate de que la ruta sea correcta

const router = express.Router();

// Ruta para obtener productos por negocio
router.get('/productosPorNegocios/:idNegocio', productosController.productosPorNegocios);
router.get('/inventarioPorNegocio/:idNegocio', productosController.inventarioPorNegocios);

module.exports = router;
