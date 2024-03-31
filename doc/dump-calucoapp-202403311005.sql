-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: calucoapp
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

DROP TABLE IF EXISTS `consultadecostodeventa`;
/*!50001 DROP VIEW IF EXISTS `consultadecostodeventa`*/;
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

DROP TABLE IF EXISTS `empleadosnegocio`;
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
-- Dumping data for table `empleadosnegocio`
--

LOCK TABLES `empleadosnegocio` WRITE;
/*!40000 ALTER TABLE `empleadosnegocio` DISABLE KEYS */;
INSERT INTO `empleadosnegocio` VALUES (1,'Luis Guzman',0.00,'Ingeniero de Sistemas',NULL,NULL,NULL,'05564172-0','',NULL,NULL,1),(2,'Luis Guzman',0.00,'Ingeniero de Sistemas',NULL,NULL,NULL,'05564172-0','',NULL,NULL,2),(3,'Luis Guzman',0.00,'Ingeniero de Sistemas',NULL,NULL,NULL,'05564172-0','',NULL,NULL,3),(4,'Luis Guzman',0.00,'Ingeniero de Sistemas',NULL,NULL,NULL,'05564172-0','',NULL,NULL,21),(5,'Luis Guzman',0.00,'Ingeniero de Sistemas',NULL,NULL,NULL,'05564172-0','',NULL,NULL,22),(6,'KEYLA CLIMACO',0.00,'PROPIETARIA',NULL,NULL,NULL,'0000000-0',NULL,NULL,NULL,26);
/*!40000 ALTER TABLE `empleadosnegocio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
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
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,4,1,3,'2024-03-11 06:07:03','2024-03-11 06:00:00','0',14,5,'PD'),(2,4,1,3,'2024-03-11 06:07:03','2024-03-11 06:00:00','0',14,5,'PD');
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impuestosporitem`
--

DROP TABLE IF EXISTS `impuestosporitem`;
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
-- Dumping data for table `impuestosporitem`
--

LOCK TABLES `impuestosporitem` WRITE;
/*!40000 ALTER TABLE `impuestosporitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `impuestosporitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventarioporproducto`
--

DROP TABLE IF EXISTS `inventarioporproducto`;
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
-- Dumping data for table `inventarioporproducto`
--

LOCK TABLES `inventarioporproducto` WRITE;
/*!40000 ALTER TABLE `inventarioporproducto` DISABLE KEYS */;
INSERT INTO `inventarioporproducto` VALUES (16,2.00,13,4),(17,2.00,14,4),(18,1.00,17,4),(19,0.50,18,4),(20,1.00,20,4),(21,1.00,22,10),(24,1.00,19,13),(25,1.00,15,14),(26,1.00,21,14),(27,0.25,16,14),(28,1.00,29,15),(29,1.00,30,17),(31,2.00,22,19);
/*!40000 ALTER TABLE `inventarioporproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventarios`
--

DROP TABLE IF EXISTS `inventarios`;
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
-- Dumping data for table `inventarios`
--

LOCK TABLES `inventarios` WRITE;
/*!40000 ALTER TABLE `inventarios` DISABLE KEYS */;
INSERT INTO `inventarios` VALUES (1,'455211100','FOCO 5 AMP, TOYOTA COROLLA','FOCO CHINO (ESTE ES EL MAS BARATO)',1),(2,'000000000','ACEITE 10W30 CASTROL 1GAL','GALON DE ACEITE',1),(3,'','GRASA','GRASA PARA USO COMUN',1),(10,'','ACEITE 10W30 CASTROL 1L','10W30 CASTROL LITRO',1),(11,'000000152','ACEITE PARA MOTOR DE BOING A320','',2),(13,'0000024','ENTRE PIERNAS','ENTRE PIERNAS DE GALLINA',3),(14,'0000025','ALA + PECHUGA','ALA + PECHUGA  DE GALLINA',3),(15,'0000001','GALLINA INDIA','GALLINA INDIA',3),(16,'','Caja de tomate','',3),(17,'','Cebollas','',3),(18,'','Pepinos','',3),(19,'','Repollo','',3),(20,'','CocaCola Lit Retornable','',3),(21,'','Pilsener 335ml','',3),(22,'','Corona 335ml','',3),(23,'','Jugo del valle 16oz','',3),(24,'','Consome de Res','',3),(25,'','Producto I','',22),(26,'','mayonesa','una libra de mayonesa',21),(27,'','NEUV','',1),(28,'00000','MARTILLO','',26),(29,'','LIMA','',26),(30,'','TORNILLOS','',26);
/*!40000 ALTER TABLE `inventarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemsfactura`
--

DROP TABLE IF EXISTS `itemsfactura`;
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
-- Dumping data for table `itemsfactura`
--

LOCK TABLES `itemsfactura` WRITE;
/*!40000 ALTER TABLE `itemsfactura` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemsfactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `detalle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `negocios`
--

DROP TABLE IF EXISTS `negocios`;
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
-- Dumping data for table `negocios`
--

LOCK TABLES `negocios` WRITE;
/*!40000 ALTER TABLE `negocios` DISABLE KEYS */;
INSERT INTO `negocios` VALUES (1,'Lubricentro A&S','VENTA DE LUBRICANTES','GERSON STANLEY AGUILAR','AVENIDA SAN PABLO SUR','CALUCO','SONSONATE','0000-000000-000-0','100000','50377581736','50377581736'),(2,'Taller Aguilar','VENTA DE LUBRICANTES	','GERSON STANLEY AGUILAR',NULL,NULL,NULL,'0000-000000-000-1','100000',NULL,NULL),(3,'Rancho Don Eduardo','VENTA DE COMIDA','EDUARDO ESPINOZA','FRENTE A VISION MUNDIAL','CALUCO','SONSONATE',NULL,NULL,NULL,NULL),(4,'yen','','JENY POLANCO','CASERIO LA ESTACION','CALUCO','SONSONATE','','','',''),(5,'LUIS GUZMAN','N/A','LUIS GUZMAN','COLONIA EL PALMAR','CALUCO','SONSONATE','06141607971182 / 055641720','00003','+5037758175',''),(6,'CONSUMIDOR FINAL','','CONSUMIDOR FINAL','','','','','','+000 0000 000',''),(8,'WILMER MIRANDA','','WILMER MIRANDA','COL EL PALMAR','CALUCO','SONSONATE','','','',''),(9,'MARVIN SANTOS','','MARVIN SANTOS','','','','','','',''),(10,'JUBAL RIVERA','','JUBAL RIVERA','','','','','','',''),(11,'VICTOR AREVALO','','VICTOR AREVALO','','','','','','',''),(12,'WILLIAM AGUILAR','','WILLIAM AGUILAR','','','','','','',''),(13,'Juana Perez','','Juana Perez','','','','','','',''),(14,'Nancy Carias','','Nancy Carias','','','','','','',''),(15,'Yanira Perez','','Yanira Perez','','','','','','',''),(16,'Celina Pashaca','','Celina Pashaca','','','','','','',''),(17,'Brenda Pashaca','','Brenda Pashaca','','','','','','',''),(18,'Adiel Pashaca','','Adiel Pashaca','','','','','','',''),(19,'ju','','ju','','','','','','',''),(20,'Jorge Juarez','','Jorge Juarez','','','','','','',''),(21,'NEGOCIO PRUEBA I','NEGOCIO PRUEBA I','CINTHYA DIAS','CALUCO SONSONATE',NULL,NULL,NULL,NULL,NULL,NULL),(22,'NEGOCIO PRUEBA II','NEGOCIO PRUEBA II','KEVIN MARTINEZ','LOS GRAMALES CALUCO SONSONATE',NULL,NULL,NULL,NULL,NULL,NULL),(23,'KEVIN MARTINEZ','OTROS PRODUCTOS PREVIAMENTE CLASIFICADOS','KEVIN MARTINEZ','CANTON LOS GRAMALES','CALUCO','SONSONATE','0303-260497-101-2','001','7629-0803',''),(26,'Ferreteria Keyla','COMERCIO','KEYLA CLIMACO','LOURDES COLON','COLON','LA LIBERTAD',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `negocios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcionessucursal`
--

DROP TABLE IF EXISTS `opcionessucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opcionessucursal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcionessucursal`
--

LOCK TABLES `opcionessucursal` WRITE;
/*!40000 ALTER TABLE `opcionessucursal` DISABLE KEYS */;
INSERT INTO `opcionessucursal` VALUES (1,'Ventas'),(2,'Compras');
/*!40000 ALTER TABLE `opcionessucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peridostributarios`
--

DROP TABLE IF EXISTS `peridostributarios`;
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
-- Dumping data for table `peridostributarios`
--

LOCK TABLES `peridostributarios` WRITE;
/*!40000 ALTER TABLE `peridostributarios` DISABLE KEYS */;
INSERT INTO `peridostributarios` VALUES (1,'2023-11','P'),(2,'2023-12','P'),(3,'2024-01','P'),(4,'2024-02','P'),(5,'2024-03','A');
/*!40000 ALTER TABLE `peridostributarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisosporsucursal`
--

DROP TABLE IF EXISTS `permisosporsucursal`;
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
-- Dumping data for table `permisosporsucursal`
--

LOCK TABLES `permisosporsucursal` WRITE;
/*!40000 ALTER TABLE `permisosporsucursal` DISABLE KEYS */;
INSERT INTO `permisosporsucursal` VALUES (1,4,1,1),(2,4,1,2),(3,5,1,1),(4,5,1,2),(5,6,1,1);
/*!40000 ALTER TABLE `permisosporsucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `porcentajespornegocio`
--

DROP TABLE IF EXISTS `porcentajespornegocio`;
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
-- Dumping data for table `porcentajespornegocio`
--

LOCK TABLES `porcentajespornegocio` WRITE;
/*!40000 ALTER TABLE `porcentajespornegocio` DISABLE KEYS */;
INSERT INTO `porcentajespornegocio` VALUES (1,3,'IVA',0.13,'+',0),(2,3,'DESCUENTO',0.20,'-',1);
/*!40000 ALTER TABLE `porcentajespornegocio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `porcentajesubopcion`
--

DROP TABLE IF EXISTS `porcentajesubopcion`;
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
-- Dumping data for table `porcentajesubopcion`
--

LOCK TABLES `porcentajesubopcion` WRITE;
/*!40000 ALTER TABLE `porcentajesubopcion` DISABLE KEYS */;
INSERT INTO `porcentajesubopcion` VALUES (1,2,1),(2,2,2);
/*!40000 ALTER TABLE `porcentajesubopcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
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
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (4,3,'','COMBO FAMILIAR #10','',25.000),(5,3,'','COMBO FAMILIAR #1  (5S, 4P, 1G2.5)','',25.000),(6,3,'','COMBO FAMILIAR #2 (5S, 4P, 1G2.5)','5 Sopas\n4 Platos fuertes\n1 CocaCola 3 lts',25.500),(7,3,'','COCA-COLA 1.25L RETORNABLE','',1.300),(8,3,'','PEPSI LATA 335ML','',0.650),(9,3,'','COCA NORMAL','',0.650),(10,3,'','Corona 335ml','',1.250),(11,1,'','FOCO 5 AMP, TOYOTA COROLLA','',1.250),(12,26,'','PEGATINA DE NUMERO','',0.500),(13,3,'','Orden de cebolla','',0.250),(14,3,'','PRODUCTO PRUEBA 20240316','',50.000),(15,26,'0122511244','LIMA','',1.250),(16,26,'','MARTILLO','',5.000),(17,26,'56565656','TORNILLOS','',0.030),(18,26,'123456','Tuve pvc #3','Tuvo de pvc ',1.750),(19,3,'','Corona 335ml PROMO 2PACK','',2.350),(20,3,'','ALQUILER DE LOCAL POR HORA','',10.000);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolesusuarionegocio`
--

DROP TABLE IF EXISTS `rolesusuarionegocio`;
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
-- Dumping data for table `rolesusuarionegocio`
--

LOCK TABLES `rolesusuarionegocio` WRITE;
/*!40000 ALTER TABLE `rolesusuarionegocio` DISABLE KEYS */;
INSERT INTO `rolesusuarionegocio` VALUES (1,'Root','A'),(2,'Propietario','A');
/*!40000 ALTER TABLE `rolesusuarionegocio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socios`
--

DROP TABLE IF EXISTS `socios`;
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
-- Dumping data for table `socios`
--

LOCK TABLES `socios` WRITE;
/*!40000 ALTER TABLE `socios` DISABLE KEYS */;
INSERT INTO `socios` VALUES (1,3,'Alberto Moran',NULL,'Alberto Moran',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,3,'Grupo ADOMAX',NULL,'Alberto Moran',NULL,NULL,NULL,NULL,'12504',NULL,NULL),(3,3,'Melvin Perez','','','','','','','','',''),(4,3,'Sivar Corp','VENTA DE SOFTWARE','KEVIN MARTINEZ','','','','','120115','',''),(5,3,'Tipicos KALI','','','','','','','','',''),(6,3,'Jose Cardona','','','','','','','','',''),(7,3,'Pedro Fuentes','','','','','','','','',''),(8,1,'Grupo CC','','','','','','','10223','',''),(9,1,'Jorge Mendez','','','','','','','','',''),(10,1,'Sergio Ramones Quiñones','','','','','','','','',''),(11,26,'Kevin Francisco','Venta de productos de ferretería ','Kevin Francisco Martínez Vásquez ','Canton los gramales, ','Caluco ','Sonsonate ','05520740-3 ','216508','76290803','76290803'),(12,26,'Luis Guzmán','','','','','','','','',''),(13,26,'José Ernesto musun. ','Venta de panadería ','Ernesto musun ','San salvador ','Ss','San salvador ','03265703-7','23456','76903811','76903811'),(14,3,'CONSUMIDOR FINAL','','','','','','','','',''),(15,3,'JORGE TRUJILLO','','','','','','','','',''),(16,3,'Ticket','','','','','','','','',''),(17,3,'Juaquin','','','','','','','','',''),(18,3,'Leo Messi','','','','','','','','',''),(19,3,'Alberto Masferrer','','','','','','','','',''),(20,3,'Luis Guzmán','','','','','','','','',''),(21,3,'JOSUE RIVERA','','','','','','','','',''),(22,3,'KEVIN MARTINEZ','','','','','','','','',''),(23,3,'CELINA DE GUZMAN','','','','','','','','',''),(24,3,'Jorge Mendez','','','','','','','','','');
/*!40000 ALTER TABLE `socios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
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
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (1,15,'Entrada',50.00,0.00,500.000,'2024-03-16 04:04:23'),(2,28,'Entrada',50.00,0.00,3.000,'2024-03-18 03:10:43'),(3,29,'Entrada',10.00,0.00,1.000,'2024-03-18 03:11:13'),(4,30,'Entrada',1000.00,0.00,0.010,'2024-03-18 03:11:36'),(5,29,'Salida',0.00,1.00,1.000,'2024-03-18 03:13:09'),(6,13,'Entrada',10.00,0.00,0.350,'2024-03-29 08:15:06'),(7,22,'Entrada',24.00,0.00,1.000,'2024-03-29 08:24:09'),(8,22,'Salida para idticket 80',0.00,1.00,1.000,'2024-03-30 05:09:28'),(9,22,'Salida para idticket 81',0.00,2.00,1.000,'2024-03-30 05:36:24'),(10,22,'Salida para idticket 82',0.00,1.00,1.000,'2024-03-30 05:36:51'),(11,22,'Salida para idticket 82',0.00,2.00,1.000,'2024-03-30 05:36:58'),(12,22,'Venta por ticket 84',0.00,1.00,1.000,'2024-03-30 05:51:21'),(13,22,'Devolución por ticket 84',1.00,0.00,1.000,'2024-03-30 05:51:28'),(14,22,'Venta por ticket 93',0.00,19.00,1.000,'2024-03-30 07:34:34'),(15,22,'Entrada',1.00,0.00,0.000,'2024-03-30 07:35:16');
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `stocksporinventario`
--

DROP TABLE IF EXISTS `stocksporinventario`;
/*!50001 DROP VIEW IF EXISTS `stocksporinventario`*/;
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

DROP TABLE IF EXISTS `subopcionessucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subopcionessucursal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subopcionessucursal`
--

LOCK TABLES `subopcionessucursal` WRITE;
/*!40000 ALTER TABLE `subopcionessucursal` DISABLE KEYS */;
INSERT INTO `subopcionessucursal` VALUES (1,'Ticket\'s'),(2,'Factura Comercial');
/*!40000 ALTER TABLE `subopcionessucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
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
-- Dumping data for table `sucursales`
--

LOCK TABLES `sucursales` WRITE;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
INSERT INTO `sucursales` VALUES (1,'Lubricentro',1),(2,'Casa Matriz',2),(3,'Taller',1),(4,'Rancho #1',3),(5,'Rancho #2',3),(6,'CASA MATRIZ',26),(7,'CASA MATRIZ',22);
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticketitems`
--

DROP TABLE IF EXISTS `ticketitems`;
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

--
-- Dumping data for table `ticketitems`
--

LOCK TABLES `ticketitems` WRITE;
/*!40000 ALTER TABLE `ticketitems` DISABLE KEYS */;
INSERT INTO `ticketitems` VALUES (80,80,10,1.00,1.25,1.25),(81,81,19,1.00,2.35,2.35),(82,82,10,1.00,1.25,1.25),(83,82,19,1.00,2.35,2.35),(84,84,10,1.00,1.25,1.25),(85,84,10,-1.00,1.25,1.25),(88,87,20,4.00,10.00,10.00),(89,93,10,19.00,1.25,1.25);
/*!40000 ALTER TABLE `ticketitems` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_ticketitems` AFTER INSERT ON `ticketitems` FOR EACH ROW BEGIN
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

DROP TABLE IF EXISTS `tickets`;
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
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (80,4,3,'2024-03-30 05:09:14','2024-03-30 05:09:14',NULL,'PD'),(81,4,3,'2024-03-30 05:36:13','2024-03-30 05:36:13',NULL,'PD'),(82,4,3,'2024-03-30 05:36:44','2024-03-30 05:36:44',NULL,'PD'),(83,4,3,'2024-03-30 05:45:47','2024-03-30 05:45:47',NULL,'PD'),(84,4,3,'2024-03-30 05:51:15','2024-03-30 05:51:15',NULL,'PD'),(85,4,3,'2024-03-30 05:55:27','2024-03-30 05:55:27',NULL,'PD'),(86,4,3,'2024-03-30 06:09:55','2024-03-30 06:09:55',NULL,'PD'),(87,5,3,'2024-03-30 06:14:06','2024-03-30 06:14:06',NULL,'PD'),(88,4,3,'2024-03-30 06:37:40','2024-03-30 06:37:40',NULL,'PD'),(89,4,3,'2024-03-30 07:21:52','2024-03-30 07:21:52',NULL,'PD'),(90,4,3,'2024-03-30 07:21:54','2024-03-30 07:21:54',NULL,'PD'),(91,4,3,'2024-03-30 07:22:04','2024-03-30 07:22:04',NULL,'PD'),(92,4,3,'2024-03-30 07:22:08','2024-03-30 07:22:08',NULL,'PD'),(93,4,3,'2024-03-30 07:34:24','2024-03-30 07:34:24',NULL,'PD');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariopornegocio`
--

DROP TABLE IF EXISTS `usuariopornegocio`;
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
-- Dumping data for table `usuariopornegocio`
--

LOCK TABLES `usuariopornegocio` WRITE;
/*!40000 ALTER TABLE `usuariopornegocio` DISABLE KEYS */;
INSERT INTO `usuariopornegocio` VALUES (1,1,1,'USR1','123456'),(2,2,1,'USR2','123456'),(3,3,1,'USR3','123456'),(6,6,2,'USR26','123456');
/*!40000 ALTER TABLE `usuariopornegocio` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
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
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
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

-- Dump completed on 2024-03-31 10:05:14
