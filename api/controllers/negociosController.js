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


exports.ofertasPorProductos = (req, res) => {
    const idProducto = req.params.idProducto; 

    // Consulta para obtener productos por negocio
    const query = 'SELECT * FROM ofertasporproducto WHERE idproducto = ?';

    db.query(query, [idProducto], (err, resultados) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(200).json({ state: 'fail', data: [], message: 'Error en la consulta a la base de datos' });
        }

        // Verificar si se encontraron productos
        if (resultados.length > 0) {
            return res.json({ state: 'success', data: resultados, message: 'Registros obtenidos correctamente' });
        } else {
            return res.status(200).json({ state: 'fail', data: [], message: 'No se encontraron Registros' });
        }
    });
};

exports.stockPorInventario = (req, res) => {
    const idNegocio = req.params.idNegocio; 
    const idInventario = req.params.idInventario;

    // Consulta para obtener productos por negocio
    const query = `
    select
    i.id,
    i.codigo ,
    i.nombre ,
    i.idnegocio,
    i.descripcion,
    COALESCE(SUM(s.entrada - s.salida), 0) AS existencias,
    CASE
        WHEN SUM(s.entrada - s.salida) > 0
            THEN ROUND(SUM(s.costo * s.entrada) / SUM(s.entrada ), 2)
        ELSE 0.00
    END AS costo,
    COALESCE(SUM(s.entrada - s.salida) * COALESCE(ROUND(SUM(s.costo * s.entrada) / SUM(s.entrada), 2), 0), 0) AS total
    FROM
        inventarios i
    LEFT JOIN
        stocks s ON i.id = s.idinventario
    WHERE
        i.idnegocio = ?
    AND 
        i.id = ?
    GROUP BY
        i.id, i.codigo, i.nombre
    `;

    db.query(query, [idNegocio, idInventario], (err, resultados) => {
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

exports.stockPorIdInventario = (req, res) => {
    const idInventario = req.params.idInventario;

    // Consulta para obtener productos por negocio
    const query = `
        select
            *
        FROM
            stocks
        WHERE
            idinventario = ?
    `;

    db.query(query, [idInventario], (err, resultados) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(200).json({ state: 'fail', data: [], message: 'Error en la consulta a la base de datos' });
        }

        // Verificar si se encontraron productos
        if (resultados.length > 0) {
            return res.json({ state: 'success', data: resultados, message: 'Registos obtenidos correctamente' });
        } else {
            return res.status(200).json({ state: 'fail', data: [], message: 'No se encontraron productos para el negocio dado' });
        }
    });
};

exports.inventarioPorNegocios = (req, res) => {
    const idNegocio = req.params.idNegocio; // Suponiendo que el ID del negocio se pasa como parámetro en la URL

    // Consulta para obtener productos por negocio
    const query = `
    select
    i.id,
    i.codigo ,
    i.nombre ,
    i.idnegocio,
    i.descripcion,
    COALESCE(SUM(s.entrada - s.salida), 0) AS existencias,
    CASE
        WHEN SUM(s.entrada - s.salida) > 0
            THEN ROUND(SUM(s.costo * s.entrada) / SUM(s.entrada ), 2)
        ELSE 0.00
    END AS costo,
    COALESCE(SUM(s.entrada - s.salida) * COALESCE(ROUND(SUM(s.costo * s.entrada) / SUM(s.entrada), 2), 0), 0) AS total
    FROM
        inventarios i
    LEFT JOIN
        stocks s ON i.id = s.idinventario
    WHERE
        i.idnegocio = ?
    GROUP BY
        i.id, i.codigo, i.nombre
    `;

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

exports.productosPorNegocios = (req, res) => {
    const idNegocio = req.params.idNegocio; // Suponiendo que el ID del negocio se pasa como parámetro en la URL

    // Consulta para obtener productos por negocio
    const query = `
    select
    *
    FROM
        productos
    WHERE
        idnegocio = ?
    `;

    db.query(query, [idNegocio], (err, resultados) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(200).json({ state: 'fail', data: [], message: 'Error en la consulta a la base de datos' });
        }

        // Verificar si se encontraron productos
        if (resultados.length > 0) {
            return res.json({ state: 'success', data: resultados, message: 'Registros obtenidos correctamente' });
        } else {
            return res.status(200).json({ state: 'fail', data: [], message: 'No se encontraron registros para el negocio dado' });
        }
    });
};

// Crear un nuevo inventario
exports.inventarioMtto = (req, res) => {
    const id = req.body.id;
    const { codigo, nombre, descripcion, idnegocio } = req.body;

    if (!id) {

        const query = 'INSERT INTO inventarios (codigo, nombre, descripcion, idnegocio) VALUES (?, ?, ?, ?)';

        db.query(query, [codigo, nombre, descripcion, idnegocio], (err, resultado) => {
            if (err) {
                console.error('Error en la consulta:', err);
                return res.status(200).json({ state: 'fail', data: null, message: 'Error al crear el inventario' });
            }

            return res.json({ state: 'success', data: { id: resultado.insertId }, message: 'Inventario creado correctamente' });
        });
    }
    else {
        const query = 'UPDATE inventarios SET codigo = ?, nombre = ?, descripcion = ?, idnegocio = ? WHERE id = ?';

        db.query(query, [codigo, nombre, descripcion, idnegocio, id], (err) => {
            if (err) {
                console.error('Error en la consulta:', err);
                return res.status(200).json({ state: 'fail', data: null, message: 'Error al actualizar el inventario' });
            }

            return res.json({ state: 'success', data: null, message: 'Inventario actualizado correctamente' });
        });
    }

};

// mantenimiento de productos
exports.productoMtto = (req, res) => {
    const id = req.body.id;
    const { codigo, nombre, descripcion, idnegocio } = req.body;

    if (!id) {

        const query = 'INSERT INTO productos (codigo, nombre, descripcion, idnegocio) VALUES (?, ?, ?, ?)';

        db.query(query, [codigo, nombre, descripcion, idnegocio], (err, resultado) => {
            if (err) {
                console.error('Error en la consulta:', err);
                return res.status(200).json({ state: 'fail', data: null, message: 'Error al crear el Registro' });
            }

            return res.json({ state: 'success', data: { id: resultado.insertId }, message: 'Registro creado correctamente' });
        });
    }
    else {
        const query = 'UPDATE productos SET codigo = ?, nombre = ?, descripcion = ?, idnegocio = ? WHERE id = ?';

        db.query(query, [codigo, nombre, descripcion, idnegocio, id], (err) => {
            if (err) {
                console.error('Error en la consulta:', err);
                return res.status(200).json({ state: 'fail', data: null, message: 'Error al actualizar el registro' });
            }

            return res.json({ state: 'success', data: null, message: 'Registro actualizado correctamente' });
        });
    }

};

exports.ofertaMtto = (req, res) => {
    const id = req.body.id;
    const { cantidad, precio, descripcion, idproducto } = req.body;

    if (id==0) {

        const query = 'INSERT INTO ofertasporproducto (cantidad, precio, descripcion, idproducto) VALUES (?,?, ?, ?)';

        db.query(query, [ cantidad, precio, descripcion, idproducto], (err, resultado) => {
            if (err) {
                console.error('Error en la consulta:', err);
                return res.status(200).json({ state: 'fail', data: null, message: 'Error al crear el Registro' });
            }

            return res.json({ state: 'success', data: { id: resultado.insertId }, message: 'Registro creado correctamente' });
        });
    }
    else {
        const query = 'UPDATE ofertasporproducto SET cantidad = ?, precio = ?, descripcion = ?, idproducto = ? WHERE id = ?';

        db.query(query, [cantidad, precio, descripcion, idproducto, id], (err) => {
            if (err) {
                console.error('Error en la consulta:', err);
                return res.status(200).json({ state: 'fail', data: null, message: 'Error al actualizar el registro' });
            }

            return res.json({ state: 'success', data: null, message: 'Registro actualizado correctamente' });
        });
    }

};


// Mantenimiento de stock
exports.stockMtto = (req, res) => {
    const id = req.body.id;
    let { idinventario, entrada, salida, costo, descripcion } = req.body;
    if (entrada == '') {
        entrada = 0;
    }
    if (salida == '') {
        salida = 0;
    }

    if (!id) {

        const query = 'INSERT INTO stocks (idinventario, entrada, salida, costo, descripcion) VALUES (?, ?, ?, ?, ?)';

        db.query(query, [idinventario, entrada, salida, costo, descripcion], (err, resultado) => {
            if (err) {
                console.error('Error en la consulta:', err);
                return res.status(200).json({ state: 'fail', data: null, message: 'Error al crear el Registro' });
            }

            return res.json({ state: 'success', data: { id: resultado.insertId }, message: 'Registro creado correctamente' });
        });
    }
    else {
        const query = 'UPDATE stocks SET idinventario = ?, entrada = ?, salida = ?, costo = ?, descripcion= ? WHERE id = ?';

        db.query(query, [idinventario, entrada, salida, costo, descripcion, id], (err) => {
            if (err) {
                console.error('Error en la consulta:', err);
                return res.status(200).json({ state: 'fail', data: null, message: 'Error al actualizar el Registro' });
            }

            return res.json({ state: 'success', data: null, message: 'Registro actualizado correctamente' });
        });
    }

};


// Eliminar un inventario por ID
exports.eliminarInventario = (req, res) => {
    const idInventario = req.params.id;

    const query = 'DELETE FROM inventarios WHERE id = ?';

    db.query(query, [idInventario], (err) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(200).json({ state: 'fail', data: null, message: 'Error al eliminar el inventario' });
        }

        return res.json({ state: 'success', data: null, message: 'Inventario eliminado correctamente' });
    });
};

exports.eliminarProducto = (req, res) => {
    const idInventario = req.params.id;

    const query = 'DELETE FROM productos WHERE id = ?';

    db.query(query, [idInventario], (err) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(200).json({ state: 'fail', data: null, message: 'Error al eliminar el registro' });
        }

        return res.json({ state: 'success', data: null, message: 'Registro eliminado correctamente' });
    });
};

exports.eliminarOfertaPorProducto = (req, res) => {
    const idInventario = req.params.id;

    const query = 'DELETE FROM ofertasporproducto WHERE id = ?';

    db.query(query, [idInventario], (err) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(200).json({ state: 'fail', data: null, message: 'Error al eliminar el registro' });
        }

        return res.json({ state: 'success', data: null, message: 'Registro eliminado correctamente' });
    });
};