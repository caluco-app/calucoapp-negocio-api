// routes/authRoutes.js
const express = require('express');
const router = express.Router();
const authController = require('../controllers/autenticacionController');

router.post('/autenticacion', authController.login);

module.exports = router;
