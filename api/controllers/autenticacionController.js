const db = require('../models/db');


exports.login = (req, res) => {
    const { usuario, contrasenia } = req.body;
    if (!usuario || !contrasenia) {
        return res.status(200).json({ state: 'fail', data: null, message: 'Usuario y contraseña son requeridos' });
    }
    const query = 'select u.id, u.usuario, e.nombrecompleto, e.cargo, r.id as rol, r.nombre as rol, n.id as idnegocio, n.nombre as nombrenegocio, e.whatsapp from usuariopornegocio u join empleadosnegocio e on e.id =u.idempleado join rolesusuarionegocio r on u.idroll = r.id join negocios n on n.id = idnegocio WHERE u.usuario = ? AND u.contrasenia = ?';
    db.query(query, [usuario, contrasenia], (err, results) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(200).json({ state: 'fail', data: null, message: 'Error en la autenticación' });
        }
        if (results.length > 0) {
            const querySucursales = 'select * from sucursales  WHERE idnegocio = ?';
            db.query(querySucursales, [results[0].idnegocio], (err, resultsSucursales) => {
                if (err) {
                    console.error('Error en la consulta de sucursales:', err);
                    return res.status(200).json({ state: 'fail', data: null, message: 'Error en la autenticación' });
                }
                return res.json({ state: 'success', data: { ...results[0], sucursales: resultsSucursales}, message: 'Acceso permitido' });
            });
        } else {
            // Usuario o contraseña incorrectos
            return res.status(200).json({ state: 'fail', data: null, message: 'Usuario o contraseña incorrectos' });
        }
    });
};
