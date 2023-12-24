// routes/authRoutes.js
const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');

router.post('/login', authController.login);
router.post('/validarUsuarioNegocio', authController.validarUsuarioNegocio);

module.exports = router;
