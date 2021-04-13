-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: optics
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `clientes_id` int NOT NULL AUTO_INCREMENT,
  `clientes_nombre` varchar(45) NOT NULL,
  `clientes_telf` varchar(45) DEFAULT NULL,
  `clientes_cp` varchar(10) DEFAULT NULL,
  `clientes_email` varchar(255) DEFAULT NULL,
  `clientes_registro` date DEFAULT NULL COMMENT 'Fecha de registro YYYY-MM-DD',
  `clientes_calle` varchar(255) DEFAULT NULL COMMENT 'Dirección',
  `clientes_num` int DEFAULT NULL COMMENT 'Dirección',
  `clientes_piso` int DEFAULT NULL COMMENT 'Dirección',
  `clientes_puerta` varchar(5) DEFAULT NULL COMMENT 'Dirección',
  `clientes_ciudad` char(50) DEFAULT NULL COMMENT 'Dirección',
  `clientes_pais` char(2) DEFAULT NULL COMMENT 'Dirección',
  `clientes_recomendador_id` int DEFAULT NULL,
  PRIMARY KEY (`clientes_id`),
  UNIQUE KEY `clientes_email_UNIQUE` (`clientes_email`),
  KEY `fk_clientes_clientes1_idx` (`clientes_recomendador_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Carlos',NULL,NULL,'carlos@gmail.com','2021-01-01',NULL,NULL,NULL,NULL,'barcelona','es',NULL),(2,'Carla','622222222',NULL,'carla@email.com','2021-02-02','',NULL,NULL,NULL,'barcelona','es',1),(3,'Cristina',NULL,NULL,'cristina@email.com','2021-03-03',NULL,NULL,NULL,NULL,'barcelona','es',2);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `empleados_id` int NOT NULL AUTO_INCREMENT,
  `empleados_nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`empleados_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Juan'),(2,'Angie');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas`
--

DROP TABLE IF EXISTS `gafas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas` (
  `gafas_id` int NOT NULL AUTO_INCREMENT,
  `gafas_grad-drcha` varchar(25) DEFAULT NULL COMMENT 'Graduación derecha',
  `gafas_grad-izq` varchar(45) DEFAULT NULL COMMENT 'Graduación izquierda',
  `gafas_montura` enum('flotante','pasta',' metálica') NOT NULL,
  `gafas_color` varchar(45) NOT NULL COMMENT 'Color de la montura',
  `gafas_color-drcha` varchar(45) DEFAULT NULL COMMENT 'Color del cristal derecho',
  `gafas_color-izq` varchar(45) DEFAULT NULL COMMENT 'Color del cristal izquierdo',
  `gafas_precio` decimal(10,2) NOT NULL,
  `proveedor_id` int NOT NULL,
  PRIMARY KEY (`gafas_id`,`proveedor_id`),
  KEY `fk_gafas_proveedores_idx` (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas`
--

LOCK TABLES `gafas` WRITE;
/*!40000 ALTER TABLE `gafas` DISABLE KEYS */;
INSERT INTO `gafas` VALUES (1,'1','1','flotante','Gris','gris','gris',100.00,0),(2,'2','2','pasta','negro','transparente','transparente',200.00,0),(3,'3','3',' metálica','azul',NULL,NULL,300.00,0);
/*!40000 ALTER TABLE `gafas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas_vendidas`
--

DROP TABLE IF EXISTS `gafas_vendidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas_vendidas` (
  `gafas_vendidas_id` int NOT NULL AUTO_INCREMENT,
  `clientes_clientes_id` int NOT NULL,
  `gafas_gafas_id` int NOT NULL,
  `gafas_proveedores_provedores_id` int NOT NULL,
  `empleados_empleados_id` int NOT NULL,
  `gafas_vendidas_fecha` date NOT NULL,
  PRIMARY KEY (`gafas_vendidas_id`),
  KEY `fk_clientes_has_gafas_gafas1_idx` (`gafas_gafas_id`,`gafas_proveedores_provedores_id`),
  KEY `fk_clientes_has_gafas_clientes1_idx` (`clientes_clientes_id`),
  KEY `fk_gafas_vendidas_empleados1_idx` (`empleados_empleados_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas_vendidas`
--

LOCK TABLES `gafas_vendidas` WRITE;
/*!40000 ALTER TABLE `gafas_vendidas` DISABLE KEYS */;
INSERT INTO `gafas_vendidas` VALUES (1,3,1,1,1,'2021-01-01'),(2,3,2,2,2,'2021-12-01');
/*!40000 ALTER TABLE `gafas_vendidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `provedor_id` int NOT NULL AUTO_INCREMENT,
  `proveedor_nombre` varchar(45) NOT NULL,
  `proveedor_telf` varchar(45) NOT NULL,
  `proveedor_calle` varchar(255) DEFAULT NULL COMMENT 'calle, numero, piso, puerta',
  `proveedor_cp` varchar(10) DEFAULT NULL,
  `proveedor_num` int DEFAULT NULL COMMENT 'número dirección postal',
  `proveedor_piso` int DEFAULT NULL COMMENT 'dirección postal',
  `proveedor_puerta` varchar(5) DEFAULT NULL COMMENT 'dirección postal',
  `proveedor_ciudad` char(50) DEFAULT NULL,
  `proveedor_pais` char(2) DEFAULT NULL,
  `proveedor_fax` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`provedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-12 12:09:55
