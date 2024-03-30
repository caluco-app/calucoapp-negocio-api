const db = require('../models/db');



exports.obtnerTicketsPorSucursal = (req, res) => {
    const idsucursal = req.params.idsucursal; // Suponiendo que el ID del negocio se pasa como parámetro en la URL

    // Consulta para obtener productos por negocio
    const query = `
    SELECT 
    t.*,
    s.nombre as sucursal,
    n.nombre as negocio,
    COUNT(ti.id) AS cantidaditems,
    SUM(IFNULL(ti.cantidad, 0) * IFNULL(ti.preciounitario, 0)) AS total
FROM 
    tickets t
LEFT JOIN 
    ticketitems ti ON t.id = ti.idticket
JOIN 
    sucursales s ON s.id = t.idsucursal
JOIN 
    negocios n ON n.id = s.idnegocio
WHERE 
    t.idsucursal = ?
GROUP BY 
    t.id
   
    `;

    db.query(query, [idsucursal], (err, resultados) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(200).json({ state: 'fail', data: [], message: 'A ocurrido un error' });
        }
        // Verificar si se encontraron productos
        if (resultados.length > 0) {
            return res.json({ state: 'success', data: resultados, message: 'Registros obtenido correctamente' });
        } else {
            return res.status(200).json({ state: 'fail', data: [], message: 'No se encontraron registros' });
        }
    });
};

exports.obtnerTicketsPorID = (req, res) => {
    const id = req.params.id; // Suponiendo que el ID del negocio se pasa como parámetro en la URL

    // Consulta para obtener productos por negocio
    const query = `
    SELECT 
    t.*,
    s.nombre AS sucursal,
    n.nombre AS negocio,
    IFNULL(COUNT(ti.id), 0) AS cantidaditems,
    IFNULL(SUM(ti.cantidad * ti.preciounitario), 0) AS total
FROM 
    tickets t
LEFT JOIN 
    ticketitems ti ON t.id = ti.idticket 
JOIN 
    sucursales s ON s.id = t.idsucursal 
JOIN 
    negocios n ON n.id = s.idnegocio
WHERE 
    t.id = ?
GROUP BY 
    t.id
   
    `;

    db.query(query, [id], (err, resultados) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(200).json({ state: 'fail', data: [], message: 'A ocurrido un error' });
        }
        // Verificar si se encontraron productos
        if (resultados.length > 0) {
            return res.json({ state: 'success', data: resultados[0], message: 'Registros obtenido correctamente' });
        } else {
            return res.status(200).json({ state: 'fail', data: [], message: 'No se encontraron registros' });
        }
    });
};

exports.obtnerProductosPorNegocio = (req, res) => {
    const idsucursal = req.body.idsucursal; // Suponiendo que el ID del negocio se pasa como parámetro en la URL
    const filtro = req.body.filtro; // Suponiendo que el ID del negocio se pasa como parámetro en la URL

    // Consulta para obtener productos por negocio
    const query = `
    SELECT 
    * 
    FROM 
        productos p
    WHERE 
        (p.nombre LIKE ? OR codigo LIKE ?) AND 
        p.idnegocio = (SELECT s.idnegocio FROM sucursales s WHERE s.id = ?)
    `;

    db.query(query, [`%${filtro}%`, `%${filtro}%`, idsucursal], (err, resultados) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(200).json({ state: 'fail', data: [], message: 'A ocurrido un error' });
        }
        // Verificar si se encontraron productos
        if (resultados.length > 0) {
            return res.json({ state: 'success', data: resultados, message: 'Registros obtenido correctamente' });
        } else {
            return res.status(200).json({ state: 'fail', data: [], message: 'No se encontraron registros' });
        }
    });
};


exports.insertarTicketItem = (req, res) => {
    const { idticket, idproducto, cantidad, preciounitario, preciounitarioorg } = req.body;

    const query = `
    INSERT INTO ticketitems (idticket, idproducto, cantidad, preciounitario, preciounitarioorg) 
    VALUES (?, ?, ?, ?, ?);
    `;

    db.query(query, [idticket, idproducto, cantidad, preciounitario, preciounitario], (err, resultado) => {
        if (err) {
            console.error('Error al insertar en la tabla ticketitems:', err);
            return res.status(500).json({ state: 'fail', message: 'Error al registrar' });
        }
        return res.status(200).json({ state: 'success', message: 'Registro guardado correctamente' });
    });
};


exports.obtnerDetalleTickets = (req, res) => {
    const id = req.body.id; // Suponiendo que el ID del negocio se pasa como parámetro en la URL

    // Consulta para obtener productos por negocio
    const query = `
    select 
        t.*, p.codigo, p.nombre  
    from 
        ticketitems t join productos p on p.id = t.idproducto  and t.idticket =?
    `;

    db.query(query, [id], (err, resultados) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(200).json({ state: 'fail', data: [], message: 'A ocurrido un error' });
        }
        // Verificar si se encontraron productos
        if (resultados.length > 0) {
            return res.json({ state: 'success', data: resultados, message: 'Registros obtenido correctamente' });
        } else {
            return res.status(200).json({ state: 'fail', data: [], message: 'No se encontraron registros' });
        }
    });
};


exports.nuevoTicket = (req, res) => {
    const { idsucursal, idusuario, codigo } = req.body;

    // Consulta para insertar un nuevo ticket
    const insertarTicketQuery = `
    INSERT INTO tickets (idsucursal, idusuario, codigo, fecha, estado) 
    VALUES (?, ?, ?, CURRENT_TIMESTAMP, 'PD')
    `;

    db.query(insertarTicketQuery, [idsucursal, idusuario, codigo], (err, resultado) => {
        if (err) {
            console.error('Error al insertar en la tabla tickets:', err);
            return res.status(500).json({ state: 'fail', message: 'Error al registrar el ticket' });
        }

        const idTicketInsertado = resultado.insertId;

        // Consulta para obtener el ticket recién insertado
        const obtenerTicketQuery = `
        SELECT 
            t.*,
            s.nombre as sucursal,
            n.nombre as negocio,
            COUNT(ti.id) AS cantidaditems,
            SUM(IFNULL(ti.cantidad, 0) * IFNULL(ti.preciounitario, 0)) AS total
        FROM 
            tickets t
        LEFT JOIN 
            ticketitems ti ON t.id = ti.idticket
        JOIN 
            sucursales s ON s.id = t.idsucursal
        JOIN 
            negocios n ON n.id = s.idnegocio
        WHERE 
            t.id = ?
        GROUP BY 
            t.id
        `;

        db.query(obtenerTicketQuery, [idTicketInsertado], (err, resultadoTicket) => {
            if (err) {
                console.error('Error al obtener el ticket:', err);
                return res.status(500).json({ state: 'fail', message: 'Error al obtener el ticket' });
            }

            if (resultadoTicket.length > 0) {
                return res.status(200).json({ state: 'success', message: 'Ticket creado y obtenido correctamente', data: resultadoTicket[0] });
            } else {
                return res.status(404).json({ state: 'fail', message: 'No se pudo encontrar el ticket recién creado' });
            }
        });
    });
};