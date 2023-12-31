create database calucoapp;
use calucoapp;

create table negocios(
	id int not null primary key auto_increment,
	nombre varchar(250) not null
);

create table negociosusuarios(
	id int not null primary key auto_increment,
	usuario varchar(250) not null,
	contrasenia varchar(250) not null
);


create table sucursales(
	id int not null primary key auto_increment,
	nombre varchar(250) not null,
	idnegocio int references negocios(id)
);

create table asignegociousuario(
	id int not null primary key auto_increment,
	idsucursal int references sucursales(id),
	idusuario int references negociosusuarios(id)
);

create TABLE inventarios (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    codigo varchar(50),
    nombre VARCHAR(250) NOT NULL,
    descripcion VARCHAR(250) NOT NULL,
    idnegocio INT,
    FOREIGN KEY (idnegocio) REFERENCES negocios(id)
);

create TABLE stocks (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    idinventario int not null references inventarios(id),
    descripcion VARCHAR(250) NOT NULL,
    entrada DECIMAL(10, 2) DEFAULT 0.00,
    salida  DECIMAL(10, 2) DEFAULT 0.00,
    costo DECIMAL(10, 2) DEFAULT 0.00 ,
    fechahora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


SELECT
    i.id,
    i.codigo,
    i.nombre,
    i.idnegocio,
    COALESCE(SUM(s.entrada - s.salida), 0) AS existencias,
    CASE
        WHEN SUM(s.entrada - s.salida) > 0
            THEN ROUND(SUM(s.costo * s.entrada) / SUM(s.entrada), 2)
        ELSE 0.00
    END AS costo_promedio,
    ROUND(SUM(s.costo * (s.entrada - s.salida)), 2) AS costo_inversion_actual
FROM
    inventarios i
LEFT JOIN
    stocks s ON i.id = s.idinventario
WHERE
    i.idnegocio = 2  -- Aquí debes reemplazar ? con el ID del negocio deseado
GROUP BY
    i.id, i.codigo, i.nombre, i.idnegocio;


CREATE TABLE productos (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(250) NOT NULL,
    nombre VARCHAR(250) NOT NULL,
    descripcion VARCHAR(250) NOT NULL,
    idnegocio INT,
    FOREIGN KEY (idnegocio) REFERENCES negocios(id)
);

CREATE TABLE ofertasporproducto (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cantidad DECIMAL(10, 2) DEFAULT 0.00 not null,
    precio DECIMAL(10, 2) DEFAULT 0.00 not null,
    descripcion VARCHAR(250) NOT NULL,
    idproducto INT,
    FOREIGN KEY (idproducto) REFERENCES productos(id)
);




SELECT DISTINCT n.*
FROM negocios n
JOIN sucursales s ON n.id = s.idnegocio
JOIN asignegociousuario a ON s.id = a.idsucursal
JOIN negociosusuarios u ON a.idusuario = u.id
WHERE u.id = 1 and n.id = 1;

SELECT n.*, s.*
FROM negocios n
JOIN sucursales s ON n.id = s.idnegocio
JOIN asignegociousuario a ON s.id = a.idsucursal
JOIN negociosusuarios u ON a.idusuario = u.id
WHERE u.id = 1 AND n.id = 1;

SELECT  s.*
            FROM  sucursales s
            JOIN asignegociousuario a ON s.id = a.idsucursal
            WHERE a.idusuario=1 and s.idnegocio  =1; 
            
select *
from asignegociousuario a 
join sucursales s on a.idsucursal =s.id 
where  a.idusuario=1 and ;