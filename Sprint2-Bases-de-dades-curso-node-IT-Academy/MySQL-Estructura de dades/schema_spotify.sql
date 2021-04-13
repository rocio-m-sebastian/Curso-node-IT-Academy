-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: spotify
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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `album_titulo` varchar(45) NOT NULL,
  `artista_id` int NOT NULL,
  `album_publicacion` year DEFAULT NULL,
  `album_portada` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `fk_albums_artistas1_idx` (`artista_id`),
  CONSTRAINT `fk_albums_artistas1` FOREIGN KEY (`artista_id`) REFERENCES `artistas` (`artista_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `artistas`
--

DROP TABLE IF EXISTS `artistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artistas` (
  `artista_id` int NOT NULL AUTO_INCREMENT,
  `artista_nombre` varchar(45) NOT NULL,
  `artista_img` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`artista_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `artistas_relacionados`
--

DROP TABLE IF EXISTS `artistas_relacionados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artistas_relacionados` (
  `artista_id` int NOT NULL,
  `artista_relacionado_id` int NOT NULL,
  PRIMARY KEY (`artista_id`,`artista_relacionado_id`),
  KEY `fk_artistas_has_artistas_artistas2_idx` (`artista_relacionado_id`),
  KEY `fk_artistas_has_artistas_artistas1_idx` (`artista_id`),
  CONSTRAINT `fk_artistas_has_artistas_artistas1` FOREIGN KEY (`artista_id`) REFERENCES `artistas` (`artista_id`),
  CONSTRAINT `fk_artistas_has_artistas_artistas2` FOREIGN KEY (`artista_relacionado_id`) REFERENCES `artistas` (`artista_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `canciones`
--

DROP TABLE IF EXISTS `canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canciones` (
  `cancion_id` int NOT NULL AUTO_INCREMENT,
  `cancion_title` varchar(45) NOT NULL,
  `album_id` int NOT NULL,
  `cancion_duracion` time NOT NULL,
  `cancion_reproducciones` int NOT NULL,
  PRIMARY KEY (`cancion_id`),
  KEY `fk_canciones_albums1_idx` (`album_id`),
  CONSTRAINT `fk_canciones_albums1` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `pago_id` int NOT NULL AUTO_INCREMENT,
  `pago_fecha` date NOT NULL,
  `pago_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`pago_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paypals`
--

DROP TABLE IF EXISTS `paypals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paypals` (
  `suscripcion_id` int NOT NULL,
  `paypal_nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`suscripcion_id`),
  KEY `fk_paypals_suscripciones1_idx` (`suscripcion_id`),
  CONSTRAINT `fk_paypals_suscripciones1` FOREIGN KEY (`suscripcion_id`) REFERENCES `suscripciones` (`suscripcion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `playlist_id` int NOT NULL,
  `playlist_titulo` varchar(45) NOT NULL,
  `playlist_creacion` date NOT NULL,
  `usuario_id` int NOT NULL,
  `playlist_state` enum('activa','borrada') NOT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `fk_playlists_usuarios1_idx` (`usuario_id`),
  CONSTRAINT `fk_playlists_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playlists_activas`
--

DROP TABLE IF EXISTS `playlists_activas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists_activas` (
  `playlist_id` int NOT NULL,
  `playlists_activa_estado` enum('comaprtida','no compartida') DEFAULT NULL,
  PRIMARY KEY (`playlist_id`),
  CONSTRAINT `fk_playlists_activas_playlists1` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`playlist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playlists_borradas`
--

DROP TABLE IF EXISTS `playlists_borradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists_borradas` (
  `playlist_id` int NOT NULL,
  `fecha_borrado` date DEFAULT NULL,
  PRIMARY KEY (`playlist_id`),
  CONSTRAINT `fk_playlists_borradas_playlists1` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`playlist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playlists_compartidas`
--

DROP TABLE IF EXISTS `playlists_compartidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists_compartidas` (
  `playlist_id` int NOT NULL,
  PRIMARY KEY (`playlist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playlists_compartidas_has_canciones`
--

DROP TABLE IF EXISTS `playlists_compartidas_has_canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists_compartidas_has_canciones` (
  `playlist_id` int NOT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `fk_playlists_compartidas_has_canciones_playlists_compartida_idx` (`playlist_id`),
  CONSTRAINT `fk_playlists_compartidas_has_canciones_playlists_compartidas1` FOREIGN KEY (`playlist_id`) REFERENCES `playlists_compartidas` (`playlist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playlists_has_canciones`
--

DROP TABLE IF EXISTS `playlists_has_canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists_has_canciones` (
  `playlist_id` int NOT NULL,
  `cancion_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `cancion_fecha` date DEFAULT NULL,
  PRIMARY KEY (`playlist_id`,`cancion_id`),
  KEY `fk_playlists_has_canciones_canciones1_idx` (`cancion_id`),
  KEY `fk_playlists_has_canciones_playlists1_idx` (`playlist_id`),
  KEY `fk_playlists_has_canciones_usuarios1_idx` (`usuario_id`),
  CONSTRAINT `fk_playlists_has_canciones_canciones1` FOREIGN KEY (`cancion_id`) REFERENCES `canciones` (`cancion_id`),
  CONSTRAINT `fk_playlists_has_canciones_playlists1` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`playlist_id`),
  CONSTRAINT `fk_playlists_has_canciones_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `suscripciones`
--

DROP TABLE IF EXISTS `suscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscripciones` (
  `suscripcion_id` int NOT NULL AUTO_INCREMENT,
  `pago_id` int NOT NULL,
  `suscripcion_inicio` date NOT NULL,
  `suscripcion_renovacion` date NOT NULL,
  `forma_de_pago` enum('tarjeta','paypal') NOT NULL,
  PRIMARY KEY (`suscripcion_id`,`pago_id`),
  KEY `fk_suscripciones_pagos1_idx` (`pago_id`),
  CONSTRAINT `fk_suscripciones_pagos1` FOREIGN KEY (`pago_id`) REFERENCES `pagos` (`pago_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tarjetas`
--

DROP TABLE IF EXISTS `tarjetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjetas` (
  `suscripcion_id` int NOT NULL,
  `tarjeta_numero` varchar(45) NOT NULL,
  `tarjeta_caducidad` varchar(45) NOT NULL,
  `tarjeta_cvv` varchar(3) NOT NULL,
  PRIMARY KEY (`suscripcion_id`),
  KEY `fk_tarjetas_suscripciones1_idx` (`suscripcion_id`),
  CONSTRAINT `fk_tarjetas_suscripciones1` FOREIGN KEY (`suscripcion_id`) REFERENCES `suscripciones` (`suscripcion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usarios_free`
--

DROP TABLE IF EXISTS `usarios_free`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usarios_free` (
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`usuario_id`),
  CONSTRAINT `fk_usarios_free_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `usuario_email` varchar(255) NOT NULL,
  `usuario_password` varchar(10) NOT NULL,
  `usuario_nombre` varchar(45) DEFAULT NULL,
  `usuario_sexo` enum('femenino','masculino','otro') DEFAULT NULL,
  `usuario_pais` tinytext,
  `usuario_cp` varchar(10) DEFAULT NULL,
  `usuario_tipo` enum('premium','free') NOT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `usuario_email_UNIQUE` (`usuario_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios_albumes_favoritos`
--

DROP TABLE IF EXISTS `usuarios_albumes_favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_albumes_favoritos` (
  `usuarios_usuario_id` int NOT NULL,
  `albums_album_id` int NOT NULL,
  PRIMARY KEY (`usuarios_usuario_id`,`albums_album_id`),
  KEY `fk_usuarios_has_albums_albums1_idx` (`albums_album_id`),
  KEY `fk_usuarios_has_albums_usuarios1_idx` (`usuarios_usuario_id`),
  CONSTRAINT `fk_usuarios_has_albums_albums1` FOREIGN KEY (`albums_album_id`) REFERENCES `albums` (`album_id`),
  CONSTRAINT `fk_usuarios_has_albums_usuarios1` FOREIGN KEY (`usuarios_usuario_id`) REFERENCES `usuarios` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios_canciones_favoritas`
--

DROP TABLE IF EXISTS `usuarios_canciones_favoritas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_canciones_favoritas` (
  `usuario_id` int NOT NULL,
  `cancion_id` int NOT NULL,
  PRIMARY KEY (`usuario_id`,`cancion_id`),
  KEY `fk_usuarios_has_canciones_canciones1_idx` (`cancion_id`),
  KEY `fk_usuarios_has_canciones_usuarios1_idx` (`usuario_id`),
  CONSTRAINT `fk_usuarios_has_canciones_canciones1` FOREIGN KEY (`cancion_id`) REFERENCES `canciones` (`cancion_id`),
  CONSTRAINT `fk_usuarios_has_canciones_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios_premium`
--

DROP TABLE IF EXISTS `usuarios_premium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_premium` (
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`usuario_id`),
  CONSTRAINT `fk_usuarios_premium_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios_premium_has_suscripciones`
--

DROP TABLE IF EXISTS `usuarios_premium_has_suscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_premium_has_suscripciones` (
  `usuario_id` int NOT NULL,
  `suscripcion_id` int NOT NULL,
  PRIMARY KEY (`usuario_id`,`suscripcion_id`),
  KEY `fk_usuarios_premium_has_suscripciones_suscripciones1_idx` (`suscripcion_id`),
  KEY `fk_usuarios_premium_has_suscripciones_usuarios_premium1_idx` (`usuario_id`),
  CONSTRAINT `fk_usuarios_premium_has_suscripciones_suscripciones1` FOREIGN KEY (`suscripcion_id`) REFERENCES `suscripciones` (`suscripcion_id`),
  CONSTRAINT `fk_usuarios_premium_has_suscripciones_usuarios_premium1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios_premium` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios_sigue_artistas`
--

DROP TABLE IF EXISTS `usuarios_sigue_artistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_sigue_artistas` (
  `usuarios_usuario_id` int NOT NULL,
  `artistas_artista_id` int NOT NULL,
  PRIMARY KEY (`usuarios_usuario_id`,`artistas_artista_id`),
  KEY `fk_usuarios_has_artistas_artistas1_idx` (`artistas_artista_id`),
  KEY `fk_usuarios_has_artistas_usuarios1_idx` (`usuarios_usuario_id`),
  CONSTRAINT `fk_usuarios_has_artistas_artistas1` FOREIGN KEY (`artistas_artista_id`) REFERENCES `artistas` (`artista_id`),
  CONSTRAINT `fk_usuarios_has_artistas_usuarios1` FOREIGN KEY (`usuarios_usuario_id`) REFERENCES `usuarios` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'spotify'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-13 13:02:43
