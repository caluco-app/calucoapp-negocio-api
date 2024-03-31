-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: %    Database: calucoapp
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `consultadecostodeventa`
--

SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `consultadecostodeventa` AS SELECT 
 1 AS `idinventario`,
 1 AS `idproducto`,
 1 AS `cantidad`,
 1 AS `costo`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `empleadosnegocio`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleadosnegocio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombrecompleto` varchar(255) NOT NULL,
  `salario` decimal(10,2) DEFAULT '0.00',
  `cargo` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `municipio` varchar(255) DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `idnegocio` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_empleadosnegocio_negocio` (`idnegocio`),
  CONSTRAINT `fk_empleadosnegocio_negocio` FOREIGN KEY (`idnegocio`) REFERENCES `negocios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facturas`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idsucursal` int NOT NULL,
  `idsubopcion` int NOT NULL,
  `idusuario` int NOT NULL,
  `fechacreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha` timestamp NOT NULL,
  `codigofactura` varchar(50) NOT NULL,
  `idsocio` int NOT NULL,
  `idperiodotributario` int NOT NULL,
  `estadotributario` varchar(50) DEFAULT 'PD',
  PRIMARY KEY (`id`),
  KEY `idsucursal` (`idsucursal`),
  KEY `idsubopcion` (`idsubopcion`),
  KEY `idsocio` (`idsocio`),
  KEY `idusuario` (`idusuario`),
  KEY `idperiodotributario` (`idperiodotributario`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursales` (`id`),
  CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`idsubopcion`) REFERENCES `subopcionessucursal` (`id`),
  CONSTRAINT `facturas_ibfk_3` FOREIGN KEY (`idsocio`) REFERENCES `socios` (`id`),
  CONSTRAINT `facturas_ibfk_4` FOREIGN KEY (`idusuario`) REFERENCES `usuariopornegocio` (`id`),
  CONSTRAINT `facturas_ibfk_5` FOREIGN KEY (`idperiodotributario`) REFERENCES `peridostributarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `impuestosporitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `impuestosporitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `iditemfactura` int NOT NULL,
  `idporcentaje` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iditemfactura` (`iditemfactura`),
  KEY `idporcentaje` (`idporcentaje`),
  CONSTRAINT `impuestosporitem_ibfk_1` FOREIGN KEY (`iditemfactura`) REFERENCES `itemsfactura` (`id`),
  CONSTRAINT `impuestosporitem_ibfk_2` FOREIGN KEY (`idporcentaje`) REFERENCES `porcentajespornegocio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventarioporproducto`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventarioporproducto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(10,2) NOT NULL DEFAULT '0.00',
  `idinventario` int NOT NULL,
  `idproducto` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idproducto` (`idproducto`),
  KEY `idinventario` (`idinventario`),
  CONSTRAINT `inventarioporproducto_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`id`),
  CONSTRAINT `inventarioporproducto_ibfk_2` FOREIGN KEY (`idinventario`) REFERENCES `inventarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventarios`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(250) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `idnegocio` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idnegocio` (`idnegocio`),
  CONSTRAINT `inventarios_ibfk_1` FOREIGN KEY (`idnegocio`) REFERENCES `negocios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `itemsfactura`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemsfactura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idfactura` int NOT NULL,
  `idproducto` int NOT NULL,
  `cantidad` decimal(10,2) DEFAULT '0.00',
  `preciounitario` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `idfactura` (`idfactura`),
  KEY `idproducto` (`idproducto`),
  CONSTRAINT `itemsfactura_ibfk_1` FOREIGN KEY (`idfactura`) REFERENCES `facturas` (`id`),
  CONSTRAINT `itemsfactura_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `detalle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `negocios`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `negocios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `giro` varchar(255) DEFAULT NULL,
  `cliente` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `municipio` varchar(255) DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `nit` varchar(255) DEFAULT NULL,
  `registro` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `opcionessucursal`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opcionessucursal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `peridostributarios`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peridostributarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permisosporsucursal`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisosporsucursal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idsucursal` int NOT NULL,
  `idopcionsucursal` int NOT NULL,
  `idsubopcionsucursal` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_permisosporsucursal_sucursal` (`idsucursal`),
  KEY `fk_permisosporsucursal_opcionsucursal` (`idopcionsucursal`),
  KEY `fk_permisosporsucursal_subopcionsucursal` (`idsubopcionsucursal`),
  CONSTRAINT `fk_permisosporsucursal_opcionsucursal` FOREIGN KEY (`idopcionsucursal`) REFERENCES `opcionessucursal` (`id`),
  CONSTRAINT `fk_permisosporsucursal_subopcionsucursal` FOREIGN KEY (`idsubopcionsucursal`) REFERENCES `subopcionessucursal` (`id`),
  CONSTRAINT `fk_permisosporsucursal_sucursal` FOREIGN KEY (`idsucursal`) REFERENCES `sucursales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `porcentajespornegocio`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `porcentajespornegocio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idnegocio` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `porcentaje` decimal(5,2) NOT NULL,
  `operacion` varchar(1) DEFAULT NULL,
  `editable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idnegocio` (`idnegocio`),
  CONSTRAINT `porcentajespornegocio_ibfk_1` FOREIGN KEY (`idnegocio`) REFERENCES `negocios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `porcentajesubopcion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `porcentajesubopcion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idporcentaje` int NOT NULL,
  `idsubopcion` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idporcentaje` (`idporcentaje`),
  KEY `idsubopcion` (`idsubopcion`),
  CONSTRAINT `porcentajesubopcion_ibfk_1` FOREIGN KEY (`idporcentaje`) REFERENCES `porcentajespornegocio` (`id`),
  CONSTRAINT `porcentajesubopcion_ibfk_2` FOREIGN KEY (`idsubopcion`) REFERENCES `subopcionessucursal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productos`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idnegocio` int NOT NULL,
  `codigo` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nombre` varchar(250) NOT NULL,
  `descripcion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `precio` decimal(10,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`id`),
  KEY `idnegocio` (`idnegocio`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idnegocio`) REFERENCES `negocios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rolesusuarionegocio`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rolesusuarionegocio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `socios`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idnegocio` int NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `giro` varchar(255) DEFAULT NULL,
  `cliente` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `municipio` varchar(255) DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `registro` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_socios_negocio` (`idnegocio`),
  CONSTRAINT `fk_socios_negocio` FOREIGN KEY (`idnegocio`) REFERENCES `negocios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stocks`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idinventario` int NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `entrada` decimal(10,2) DEFAULT '0.00',
  `salida` decimal(10,2) DEFAULT '0.00',
  `costo` decimal(10,3) DEFAULT '0.000',
  `fechahora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idinventario` (`idinventario`),
  CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`idinventario`) REFERENCES `inventarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `stocksporinventario`
--

SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `stocksporinventario` AS SELECT 
 1 AS `id`,
 1 AS `codigo`,
 1 AS `nombre`,
 1 AS `idnegocio`,
 1 AS `descripcion`,
 1 AS `existencias`,
 1 AS `costo`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `subopcionessucursal`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subopcionessucursal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sucursales`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `idnegocio` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sucursales_negocio` (`idnegocio`),
  CONSTRAINT `fk_sucursales_negocio` FOREIGN KEY (`idnegocio`) REFERENCES `negocios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticketitems`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticketitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idticket` int NOT NULL,
  `idproducto` int NOT NULL,
  `cantidad` decimal(10,2) DEFAULT '0.00',
  `preciounitario` decimal(10,2) DEFAULT '0.00',
  `preciounitarioorg` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `idticket` (`idticket`),
  KEY `idproducto` (`idproducto`),
  CONSTRAINT `ticketitems_ibfk_1` FOREIGN KEY (`idticket`) REFERENCES `tickets` (`id`),
  CONSTRAINT `ticketitems_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`adminstrador`@`%`*/ /*!50003 TRIGGER `after_insert_ticketitems` AFTER INSERT ON `ticketitems` FOR EACH ROW BEGIN

    DECLARE idinventario_var INT;

    DECLARE cantidad_var DECIMAL(10, 2);

    DECLARE costo_var DECIMAL(10, 3);

    DECLARE rows_found INT;



    -- Obtiene los datos de la vista consultadecostodeventa para el nuevo idproducto

    SELECT ccv.idinventario, ccv.cantidad, ccv.costo

    INTO idinventario_var, cantidad_var, costo_var

    FROM consultadecostodeventa ccv

    WHERE ccv.idproducto = NEW.idproducto;



    -- Obtiene el número de filas afectadas por la consulta

    SELECT ROW_COUNT() INTO rows_found;



    -- Verifica si se encontraron filas

    IF rows_found > 0 THEN

        -- Verifica si la cantidad es negativa

        IF NEW.cantidad < 0 THEN

            -- Si la cantidad es negativa, realiza una entrada en stocks

            INSERT INTO stocks (idinventario, descripcion, entrada, costo)

            VALUES (idinventario_var, CONCAT('Devolución por ticket ', NEW.idticket), ABS(NEW.cantidad), costo_var);

        ELSE

            -- Si la cantidad es positiva, realiza una salida en stocks

            INSERT INTO stocks (idinventario, descripcion, salida, costo)

            VALUES (idinventario_var, CONCAT('Venta por ticket ', NEW.idticket), cantidad_var * NEW.cantidad, costo_var);

        END IF;

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tickets`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idsucursal` int NOT NULL,
  `idusuario` int NOT NULL,
  `fechacreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha` timestamp NOT NULL,
  `codigo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idsucursal` (`idsucursal`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursales` (`id`),
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuariopornegocio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuariopornegocio`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuariopornegocio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idempleado` int DEFAULT NULL,
  `idroll` int DEFAULT NULL,
  `usuario` varchar(255) NOT NULL,
  `contrasenia` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuariopornegocio_rol` (`idroll`),
  KEY `fk_usuariopornegocio_idempleado` (`idempleado`),
  CONSTRAINT `fk_usuariopornegocio_idempleado` FOREIGN KEY (`idempleado`) REFERENCES `empleadosnegocio` (`id`),
  CONSTRAINT `fk_usuariopornegocio_rol` FOREIGN KEY (`idroll`) REFERENCES `rolesusuarionegocio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'calucoapp'
--

--
-- Dumping routines for database 'calucoapp'
--

--
-- Final view structure for view `consultadecostodeventa`
--

/*!50001 DROP VIEW IF EXISTS `consultadecostodeventa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`adminstrador`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `consultadecostodeventa` AS select `ip`.`idinventario` AS `idinventario`,`ip`.`idproducto` AS `idproducto`,`ip`.`cantidad` AS `cantidad`,`s`.`costo` AS `costo`,(`ip`.`cantidad` * `s`.`costo`) AS `total` from (`inventarioporproducto` `ip` join `stocksporinventario` `s` on((`s`.`id` = `ip`.`idinventario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stocksporinventario`
--

/*!50001 DROP VIEW IF EXISTS `stocksporinventario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`adminstrador`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `stocksporinventario` AS select `i`.`id` AS `id`,`i`.`codigo` AS `codigo`,`i`.`nombre` AS `nombre`,`i`.`idnegocio` AS `idnegocio`,`i`.`descripcion` AS `descripcion`,coalesce(sum((`s`.`entrada` - `s`.`salida`)),0) AS `existencias`,(case when (sum((`s`.`entrada` - `s`.`salida`)) > 0) then round((sum((`s`.`costo` * `s`.`entrada`)) / sum(`s`.`entrada`)),2) else 0.00 end) AS `costo`,coalesce((sum((`s`.`entrada` - `s`.`salida`)) * coalesce(round((sum((`s`.`costo` * `s`.`entrada`)) / nullif(sum(`s`.`entrada`),0)),2),0)),0) AS `total` from (`inventarios` `i` left join `stocks` `s` on((`i`.`id` = `s`.`idinventario`))) group by `i`.`id`,`i`.`codigo`,`i`.`nombre`,`i`.`idnegocio`,`i`.`descripcion` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-31 12:01:02
