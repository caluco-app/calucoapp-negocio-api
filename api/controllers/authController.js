// controllers/authController.js
const db = require('../models/db');


exports.login = (req, res) => {
    const { usuario, contrasenia } = req.body;
    if (!usuario || !contrasenia) {
        return res.status(200).json({ state: 'fail', data: null, message: 'Usuario y contraseña son requeridos' });
    }
    const query = 'SELECT * FROM negociosusuarios WHERE usuario = ? AND contrasenia = ?';
    db.query(query, [usuario, contrasenia], (err, results) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(200).json({ state: 'fail', data: null, message: 'Error en la autenticación' });
        }
        if (results.length > 0) {
            const userData = results;
            const usuario = userData.map(usuario => ({ id: (usuario.id), usuario: usuario.usuario }));

            // Consulta para obtener las empresas asignadas al usuario
            const empresasQuery = `SELECT DISTINCT n.*
            FROM negocios n
            JOIN sucursales s ON n.id = s.idnegocio
            JOIN asignegociousuario a ON s.id = a.idsucursal
            JOIN negociosusuarios u ON a.idusuario = u.id
            WHERE u.id = ?`;

            db.query(empresasQuery, [results[0].id], (errEmpresas, empresas) => {
                if (errEmpresas) {
                    console.error('Error al obtener empresas asignadas:', errEmpresas);
                    return res.status(200).json({ state: 'fail', data: null, message: 'Error al obtener empresas asignadas' });
                }

                if (empresas.length > 0) {
                    // Usuario tiene empresas asignadas

                    const negociosAsignados = empresas.map(empresa => ({ id: (empresa.id), nombre: empresa.nombre }));
                    return res.json({ state: 'success', data: { usuario: usuario, negocios: negociosAsignados }, message: 'Acceso permitido' });
                } else {
                    // Usuario no tiene empresas asignadas
                    return res.status(200).json({ state: 'fail', data: null, message: 'Usuario no tiene empresas asignadas' });
                }
            });
        } else {
            // Usuario o contraseña incorrectos
            return res.status(200).json({ state: 'fail', data: null, message: 'Usuario o contraseña incorrectos' });
        }
    });
};

exports.validarUsuarioNegocio = (req, res) => {
    const { idusuario, idnegocio } = req.body;
    if (!idusuario || !idnegocio) {
        return res.status(200).json({ state: 'fail', data: null, message: 'ID de usuario y ID de negocio son requeridos' });
    }

    // Consulta para obtener todos los datos del negocio según el ID de usuario y el ID de negocio
    const query = `
    SELECT DISTINCT n.*
    FROM negocios n
    JOIN sucursales s ON n.id = s.idnegocio
    JOIN asignegociousuario a ON s.id = a.idsucursal
    JOIN negociosusuarios u ON a.idusuario = u.id
    WHERE u.id = ? and n.id = ?;
    `;

    db.query(query, [idusuario, idnegocio], (err, results) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(500).json({ state: 'fail', data: null, message: 'Error en la autenticación' });
        }

        if (results.length > 0) {
            // Datos del negocio obtenidos correctamente
            const negocioData = results[0];

            // Consulta para obtener las empresas asignadas al usuario
            const sucursalesQuery = `SELECT  s.*
            FROM  sucursales s
            JOIN asignegociousuario a ON s.id = a.idsucursal
            WHERE a.idusuario=? and s.idnegocio =?`;

            db.query(sucursalesQuery, [idusuario, idnegocio], (errSucursales, sucursales) => {
                if (errSucursales) {
                    console.error('Error al obtener sucursales asignadas:', errSucursales);
                    return res.status(200).json({ state: 'fail', data: null, message: 'Error al obtener sucursales asignadas' });
                }

                if (sucursales.length > 0) {
                    // Usuario tiene empresas asignadas
                    return res.json({ state: 'success', data: { negocio: negocioData, sucursales: sucursales }, message: 'Acceso permitido' });
                } else {
                    // Usuario no tiene empresas asignadas
                    return res.status(200).json({ state: 'fail', data: null, message: 'Usuario no tiene sucursales asignadas' });
                }
            });


        } else {
            // No se encontraron datos del negocio para el usuario dado
            return res.status(404).json({ state: 'fail', data: null, message: 'No se encontraron datos del negocio para el usuario dado' });
        }
    });
};


