const db = require('../models/db');

exports.obtenerPermisos = (req, res) => {
    const id = req.params.id;

    // Sentencia SQL
    const query = `
        SELECT  
            o.id as idopcion ,  o.nombre as opcion, s.id as idsubopcion, s.nombre as subopcion 
        FROM 
            permisosporsucursal p 
        JOIN 
            opcionessucursal o ON o.id = p.idopcionsucursal 
        join 
            subopcionessucursal s on s.id =p.idsubopcionsucursal 
        WHERE 
            p.idsucursal = ?`;

    db.query(query, [id], (err, resultados) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(500).json({ state: 'fail', data: [], message: 'Error en la consulta a la base de datos' });
        }
        // Verificacion de sentencia SQL
        if (resultados.length > 0) {
            // Crear un objeto para almacenar las opciones y sus subopciones
            const opcionesConSubopciones = {};

            // Iterar sobre los resultados y organizarlos por opciones y subopciones
            resultados.forEach(resultado => {
                const { idopcion, opcion, idsubopcion, subopcion } = resultado;
                if (!opcionesConSubopciones[opcion]) {
                    opcionesConSubopciones[opcion] = {
                        idopcion: idopcion,
                        opcion: opcion,
                        subopciones: []
                    };
                }
                opcionesConSubopciones[opcion].subopciones.push({
                    idsubopcion: idsubopcion,
                    subopcion: subopcion
                });
            });

            // Convertir el objeto de opciones y subopciones a un array
            const data = Object.values(opcionesConSubopciones);
            return res.json({ state: 'success', data: data, message: 'Registros obtenidos correctamente' });
        } else {
            return res.status(404).json({ state: 'fail', data: [], message: 'No se encontraron registros' });
        }
    });
};
