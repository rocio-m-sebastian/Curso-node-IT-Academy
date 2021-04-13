-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: pizza-shop
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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `categoria_id` int NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`categoria_id`),
  UNIQUE KEY `categorias_nombre_UNIQUE` (`categoria_nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (2,'no vegana'),(1,'vegana');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `cliente_nombre` varchar(45) DEFAULT NULL,
  `cliente_apellidos` varchar(255) DEFAULT NULL,
  `clientes_direccion` varchar(45) DEFAULT NULL,
  `cliente_cp` varchar(10) DEFAULT NULL,
  `cliente_telf` varchar(10) DEFAULT NULL,
  `localidad_id` int NOT NULL,
  `provincia_id` int NOT NULL,
  PRIMARY KEY (`cliente_id`),
  KEY `fk_clientes_localidades1_idx` (`localidad_id`),
  KEY `fk_clientes_provincias1_idx` (`provincia_id`),
  CONSTRAINT `fk_clientes_localidades1` FOREIGN KEY (`localidad_id`) REFERENCES `localidades` (`localidad_id`),
  CONSTRAINT `fk_clientes_provincias1` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`provincia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'carol','martín','carrer rossend arùs','0111','6111111',1,1),(2,'carla','smith','carrer aragó','0222','6222222',1,1),(3,'john','auster','carrer menorca','0333','6333333',3,1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `empleado_id` int NOT NULL AUTO_INCREMENT,
  `empleado_nif` varchar(8) NOT NULL,
  `empleado_nombre` varchar(45) NOT NULL,
  `empleado_apellidos` varchar(100) NOT NULL,
  `empleado_telf` varchar(10) DEFAULT NULL,
  `empleado_tipo` enum('cocinero','repartidor') NOT NULL,
  `tienda_id` int NOT NULL,
  PRIMARY KEY (`empleado_id`),
  UNIQUE KEY `empleados_nif_UNIQUE` (`empleado_nif`),
  KEY `fk_empleados_tiendas1_idx` (`tienda_id`),
  CONSTRAINT `fk_empleados_tiendas1` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`tienda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'011111','Juan','m',NULL,'cocinero',1),(2,'022222','Gemma','s',NULL,'repartidor',1),(3,'033333','sandra','g',NULL,'repartidor',2),(4,'044444','julia','h',NULL,'repartidor',3);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidades` (
  `localidad_id` int NOT NULL AUTO_INCREMENT,
  `localidad_nombre` varchar(45) NOT NULL,
  `provincia_id` int NOT NULL,
  PRIMARY KEY (`localidad_id`),
  UNIQUE KEY `localidades_nombre_UNIQUE` (`localidad_nombre`),
  KEY `fk_localidades_provincias_idx` (`provincia_id`),
  CONSTRAINT `fk_localidades_provincias` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`provincia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,'Barcelona',1),(2,'L\'Hospitalet de Llobregat',1),(3,'Casteldefels',1);
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `pedido_id` int NOT NULL AUTO_INCREMENT,
  `pedido_datetime` datetime NOT NULL COMMENT 'YYYY-MM-DD hh: mm: ss',
  `pedido_tipo` enum('domicilio','tienda') DEFAULT NULL,
  `pedido_precio` decimal(10,2) DEFAULT NULL COMMENT 'Precio total',
  `cliente_id` int NOT NULL,
  `tienda_id` int NOT NULL,
  `empleado_id` int DEFAULT NULL,
  `pedido_entrega` datetime DEFAULT NULL COMMENT 'YYYY-MM-DD hh: mm: ss\n\nFecha y hora a la que se entrega el pedido a domicilio',
  PRIMARY KEY (`pedido_id`),
  KEY `fk_pedidos_clientes1_idx` (`cliente_id`),
  KEY `fk_pedidos_tiendas1_idx` (`tienda_id`),
  KEY `fk_pedidos_empleados1_idx` (`empleado_id`),
  CONSTRAINT `fk_pedidos_clientes1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  CONSTRAINT `fk_pedidos_empleados1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`),
  CONSTRAINT `fk_pedidos_tiendas1` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`tienda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'2021-01-01 00:00:00',NULL,50.00,1,1,2,'2021-01-02 00:01:00'),(2,'2021-01-02 15:00:00',NULL,20.00,2,2,2,'2021-01-02 15:15:00');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `producto_id` int NOT NULL AUTO_INCREMENT,
  `producto_nombre` varchar(45) NOT NULL,
  `producto_precio` decimal(10,2) DEFAULT NULL,
  `producto_tipo` enum('pizza','hamburguesa','bebida') DEFAULT NULL,
  `producto_descripcion` varchar(255) DEFAULT NULL,
  `producto_img` varchar(255) DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  PRIMARY KEY (`producto_id`),
  UNIQUE KEY `productos_nombre_UNIQUE` (`producto_nombre`),
  KEY `fk_productos_categorias1_idx` (`categoria_id`),
  CONSTRAINT `fk_productos_categorias1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'romana',10.00,'pizza',NULL,NULL,2),(2,'siciliana',12.00,'pizza',NULL,NULL,1),(3,'new york',15.00,'hamburguesa',NULL,NULL,NULL),(4,'cola',2.00,'bebida',NULL,NULL,NULL),(5,'agua',1.00,'bebida',NULL,NULL,NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_vendidos`
--

DROP TABLE IF EXISTS `productos_vendidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_vendidos` (
  `pedido_id` int NOT NULL,
  `producto_vendido_id` int NOT NULL,
  `producto_vendido_cantidad` int NOT NULL,
  PRIMARY KEY (`pedido_id`,`producto_vendido_id`),
  KEY `fk_pedidos_has_productos_productos1_idx` (`producto_vendido_id`),
  KEY `fk_pedidos_has_productos_pedidos1_idx` (`pedido_id`),
  CONSTRAINT `fk_pedidos_has_productos_pedidos1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`),
  CONSTRAINT `fk_pedidos_has_productos_productos1` FOREIGN KEY (`producto_vendido_id`) REFERENCES `productos` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_vendidos`
--

LOCK TABLES `productos_vendidos` WRITE;
/*!40000 ALTER TABLE `productos_vendidos` DISABLE KEYS */;
INSERT INTO `productos_vendidos` VALUES (1,1,5),(2,2,1),(2,4,3);
/*!40000 ALTER TABLE `productos_vendidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `provincia_id` int NOT NULL AUTO_INCREMENT,
  `provincia_nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`provincia_id`),
  UNIQUE KEY `provincias_nombre_UNIQUE` (`provincia_nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Barcelona');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiendas`
--

DROP TABLE IF EXISTS `tiendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiendas` (
  `tienda_id` int NOT NULL AUTO_INCREMENT,
  `tienda_dirrecion` varchar(255) DEFAULT NULL,
  `tienda_cp` varchar(10) NOT NULL,
  `localidad_id` int NOT NULL,
  `provincia_id` int NOT NULL,
  PRIMARY KEY (`tienda_id`),
  KEY `fk_tiendas_localidades1_idx` (`localidad_id`),
  KEY `fk_tiendas_provincias1_idx` (`provincia_id`),
  CONSTRAINT `fk_tiendas_localidades1` FOREIGN KEY (`localidad_id`) REFERENCES `localidades` (`localidad_id`),
  CONSTRAINT `fk_tiendas_provincias1` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`provincia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiendas`
--

LOCK TABLES `tiendas` WRITE;
/*!40000 ALTER TABLE `tiendas` DISABLE KEYS */;
INSERT INTO `tiendas` VALUES (1,NULL,'00000',1,1),(2,NULL,'00001',2,1),(3,NULL,'00002',3,1);
/*!40000 ALTER TABLE `tiendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-12 11:57:37
