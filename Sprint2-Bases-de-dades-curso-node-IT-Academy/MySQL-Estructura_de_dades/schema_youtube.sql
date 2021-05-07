-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: youtube
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

DROP DATABASE IF EXISTS youtube;

CREATE DATABASE youtube;
USE youtube;
--
-- Table structure for table `acciones_comentarios`
--

DROP TABLE IF EXISTS `acciones_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acciones_comentarios` (
  `accion_id` int NOT NULL AUTO_INCREMENT,
  `accion_tipo` enum('like','dislike') NOT NULL,
  `accion_datetime` datetime NOT NULL,
  `comentario_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`accion_id`),
  KEY `fk_acciones_comentarios_comentarios1_idx` (`comentario_id`),
  KEY `fk_acciones_comentarios_usuarios1_idx` (`usuario_id`),
  CONSTRAINT `fk_acciones_comentarios_comentarios1` FOREIGN KEY (`comentario_id`) REFERENCES `comentarios` (`comentario_id`),
  CONSTRAINT `fk_acciones_comentarios_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acciones_videos`
--

DROP TABLE IF EXISTS `acciones_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acciones_videos` (
  `accion_id` int NOT NULL AUTO_INCREMENT,
  `accion_tipo` enum('like','dislike') DEFAULT NULL,
  `accion_datetime` datetime NOT NULL,
  `usuario_id` int NOT NULL,
  `video_id` int NOT NULL,
  PRIMARY KEY (`accion_id`),
  KEY `fk_acciones_usuarios1_idx` (`usuario_id`),
  KEY `fk_acciones_videos1_idx` (`video_id`),
  CONSTRAINT `fk_acciones_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`),
  CONSTRAINT `fk_acciones_videos1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `canales`
--

DROP TABLE IF EXISTS `canales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canales` (
  `canal_id` int NOT NULL AUTO_INCREMENT,
  `canal_nombre` varchar(45) NOT NULL,
  `canal_descripción` varchar(255) DEFAULT NULL,
  `canal_creacion` date DEFAULT NULL,
  PRIMARY KEY (`canal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `comentario_id` int NOT NULL AUTO_INCREMENT,
  `comentario_texto` varchar(255) NOT NULL,
  `usuario_id` int NOT NULL,
  `comentario_fecha` date DEFAULT NULL,
  `video_id` int NOT NULL,
  PRIMARY KEY (`comentario_id`,`video_id`),
  KEY `fk_comentarios_usuarios1_idx` (`usuario_id`),
  KEY `fk_comentarios_videos1_idx` (`video_id`),
  CONSTRAINT `fk_comentarios_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`),
  CONSTRAINT `fk_comentarios_videos1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `etiquetas`
--

DROP TABLE IF EXISTS `etiquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiquetas` (
  `etiqueta_id` int NOT NULL AUTO_INCREMENT,
  `etiqueta_nombre` varchar(45) DEFAULT NULL,
  `video_id` int NOT NULL,
  PRIMARY KEY (`etiqueta_id`),
  KEY `fk_etiquetas_videos1_idx` (`video_id`),
  CONSTRAINT `fk_etiquetas_videos1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `playlist_id` int NOT NULL AUTO_INCREMENT,
  `playlist_nombre` varchar(45) NOT NULL,
  `playlist_creacion` date DEFAULT NULL,
  `playlist_tipo` enum('publica','privada') NOT NULL DEFAULT 'publica',
  `usuarios_usuario_id` int NOT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `fk_playlists_usuarios1_idx` (`usuarios_usuario_id`),
  CONSTRAINT `fk_playlists_usuarios1` FOREIGN KEY (`usuarios_usuario_id`) REFERENCES `usuarios` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playlists_has_videos`
--

DROP TABLE IF EXISTS `playlists_has_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists_has_videos` (
  `playlist_id` int NOT NULL,
  `video_id` int NOT NULL,
  PRIMARY KEY (`playlist_id`,`video_id`),
  KEY `fk_playlists_has_videos_videos1_idx` (`video_id`),
  KEY `fk_playlists_has_videos_playlists1_idx` (`playlist_id`),
  CONSTRAINT `fk_playlists_has_videos_playlists1` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`playlist_id`),
  CONSTRAINT `fk_playlists_has_videos_videos1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`video_id`)
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
  `usuario_id` int NOT NULL,
  `canal_id` int NOT NULL,
  PRIMARY KEY (`suscripcion_id`),
  KEY `fk_suscripciones_usuarios1_idx` (`usuario_id`),
  KEY `fk_suscripciones_canales1_idx` (`canal_id`),
  CONSTRAINT `fk_suscripciones_canales1` FOREIGN KEY (`canal_id`) REFERENCES `canales` (`canal_id`),
  CONSTRAINT `fk_suscripciones_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`)
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
  `usuario_nombre` varchar(45) NOT NULL,
  `usuario_nacimiento` date DEFAULT NULL,
  `usuario_sexo` enum('femenino','masculino','otro') DEFAULT NULL,
  `usuario_cp` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `usuario_email_UNIQUE` (`usuario_email`),
  UNIQUE KEY `usuario_nombre_UNIQUE` (`usuario_nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `video_id` int NOT NULL AUTO_INCREMENT,
  `video_titulo` varchar(45) NOT NULL,
  `video_descripcion` varchar(255) DEFAULT NULL,
  `video_tamaño` varchar(5) DEFAULT NULL,
  `video_archivo` varchar(45) NOT NULL,
  `video_duracion` time DEFAULT NULL,
  `video_thumbnail` varchar(50) DEFAULT NULL,
  `video_reproducciones` int NOT NULL,
  `video_estado` enum('publico','oculto','privado') NOT NULL DEFAULT 'publico',
  `video_publicacion` datetime NOT NULL,
  `usuario_id` int NOT NULL COMMENT 'usuario ue publica',
  `canal_id` int NOT NULL,
  PRIMARY KEY (`video_id`),
  KEY `fk_videos_usuarios_idx` (`usuario_id`),
  KEY `fk_videos_canales1_idx` (`canal_id`),
  CONSTRAINT `fk_videos_canales1` FOREIGN KEY (`canal_id`) REFERENCES `canales` (`canal_id`),
  CONSTRAINT `fk_videos_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `videos_has_comentarios`
--

DROP TABLE IF EXISTS `videos_has_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos_has_comentarios` (
  `videos_video_id` int NOT NULL,
  `comentarios_comentario_id` int NOT NULL,
  PRIMARY KEY (`videos_video_id`,`comentarios_comentario_id`),
  KEY `fk_videos_has_comentarios_comentarios1_idx` (`comentarios_comentario_id`),
  KEY `fk_videos_has_comentarios_videos1_idx` (`videos_video_id`),
  CONSTRAINT `fk_videos_has_comentarios_comentarios1` FOREIGN KEY (`comentarios_comentario_id`) REFERENCES `comentarios` (`comentario_id`),
  CONSTRAINT `fk_videos_has_comentarios_videos1` FOREIGN KEY (`videos_video_id`) REFERENCES `videos` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-13 10:08:09
