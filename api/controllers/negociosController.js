// controllers/authController.js
const db = require('../models/db');


exports.productosPorNegocios = (req, res) => {
    const idNegocio = req.params.idNegocio; // Suponiendo que el ID del negocio se pasa como parámetro en la URL

    // Consulta para obtener productos por negocio
    const query = 'SELECT * FROM productos WHERE idnegocio = ?';

    db.query(query, [idNegocio], (err, resultados) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(200).json({ state: 'fail', data: [], message: 'Error en la consulta a la base de datos' });
        }

        // Verificar si se encontraron productos
        if (resultados.length > 0) {
            return res.json({ state: 'success', data: resultados, message: 'Productos obtenidos correctamente' });
        } else {
            return res.status(200).json({ state: 'fail', data: [], message: 'No se encontraron productos para el negocio dado' });
        }
    });
};


exports.inventarioPorNegocios = (req, res) => {
    const idNegocio = req.params.idNegocio; // Suponiendo que el ID del negocio se pasa como parámetro en la URL

    // Consulta para obtener productos por negocio
    const query = 'SELECT * FROM inventarios WHERE idnegocio = ?';

    db.query(query, [idNegocio], (err, resultados) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(200).json({ state: 'fail', data: [], message: 'Error en la consulta a la base de datos' });
        }

        // Verificar si se encontraron productos
        if (resultados.length > 0) {
            return res.json({ state: 'success', data: resultados, message: 'Inventario obtenido correctamente' });
        } else {
            return res.status(200).json({ state: 'fail', data: [], message: 'No se encontraron productos para el negocio dado' });
        }
    });
};