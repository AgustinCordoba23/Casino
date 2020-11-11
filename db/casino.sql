-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: casino_asam
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `historial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `ganancia` int(11) NOT NULL,
  `id_juego` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario_idx` (`id_usuario`),
  KEY `id_juego_idx` (`id_juego`),
  CONSTRAINT `id_juego` FOREIGN KEY (`id_juego`) REFERENCES `juegos` (`id`),
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
INSERT INTO `historial` VALUES (3,1,-100,1),(4,1,-30,1),(5,1,-123,1),(6,1,-123,1),(7,1,-123,1),(8,1,-123,1),(9,1,-1,3),(10,1,-1,3),(11,1,10,3),(12,1,-9000,3),(13,1,-122,1),(14,1,123,3),(15,1,-123,1),(16,1,-123,3),(17,1,-10,2),(18,1,18,2),(19,1,-123,2),(20,1,-17,2),(21,1,1,2),(22,1,-1,2),(23,1,1,2),(24,1,-1,2),(25,1,1,2),(26,1,-1,2),(27,1,62,1),(28,1,50,1),(29,1,50,1),(30,1,-100,1),(31,1,100,1),(32,1,-2,3),(33,1,-123,2),(34,1,-10,3),(35,1,-100,1),(36,1,-123,3),(37,1,-123,2),(38,1,-123,2),(39,1,-100,2),(40,1,-100,2),(41,1,-100,2),(42,1,-100,2),(43,1,-100,2),(44,1,-100,2),(45,1,-100,2),(46,1,-100,2),(47,1,-100,2),(48,1,-100,2),(49,1,-100,2),(50,1,-100,2),(51,1,-100,2),(52,1,-100,2),(53,1,-100,2),(54,1,-100,2),(55,1,-100,2),(56,1,100,2),(57,1,100,2),(64,2,500,1),(65,2,1000,2),(66,2,3000,3),(70,29,-1,2),(71,29,-999,2),(72,29,-1000,3),(73,29,1000000,3),(74,30,-30,3),(75,30,7,3),(76,30,10,1),(77,30,100,2),(78,30,200,2),(79,31,-20,2),(80,31,-20,1),(81,1,100000,3),(82,1,20,3),(83,1,15,2);
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juegos`
--

DROP TABLE IF EXISTS `juegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `juegos` (
  `id` int(11) NOT NULL,
  `juego` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juegos`
--

LOCK TABLES `juegos` WRITE;
/*!40000 ALTER TABLE `juegos` DISABLE KEYS */;
INSERT INTO `juegos` VALUES (1,'loteria'),(2,'blackjack'),(3,'ruleta');
/*!40000 ALTER TABLE `juegos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  `fecha_hora` datetime(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario_idx` (`id_usuario`),
  KEY `id_usuario_movDinero_idx` (`id_usuario`),
  CONSTRAINT `id_usuario_movDinero` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` VALUES (1,1,123,'2020-07-28 00:00:00.0000'),(2,1,123,'2020-07-28 00:00:00.0000'),(3,1,123,'2020-07-28 14:01:21.0000'),(4,1,-100,'2020-07-28 14:02:29.0000'),(5,1,100,'2020-07-28 14:02:34.0000'),(6,1,-123,'2020-07-28 14:02:54.0000'),(7,1,-123,'2020-07-28 14:03:46.0000'),(8,1,-123,'2020-07-28 14:04:17.0000'),(9,1,-123,'2020-07-28 14:04:54.0000'),(10,1,-123,'2020-07-28 14:05:02.0000'),(11,29,1000,'2020-08-08 20:46:54.0000'),(12,29,1000000,'2020-08-08 20:48:10.0000'),(13,30,100000,'2020-09-26 21:14:00.0000'),(14,31,100,'2020-10-16 17:25:46.0000'),(15,1,100,'2020-10-16 18:04:24.0000'),(16,1,355555,'2020-11-04 15:27:47.0000'),(17,1,1000,'2020-11-04 15:29:54.0000'),(18,1,1000,'2020-11-04 15:30:58.0000'),(19,1,1000,'2020-11-04 15:34:04.0000'),(20,1,100,'2020-11-04 15:34:55.0000'),(21,1,-10000,'2020-11-04 16:06:10.0000'),(22,1,-10,'2020-11-04 16:06:24.0000'),(23,1,-15,'2020-11-04 16:06:26.0000'),(24,1,-12,'2020-11-04 16:06:30.0000'),(25,1,-2,'2020-11-04 16:06:32.0000'),(26,1,-1,'2020-11-04 16:06:35.0000'),(27,1,-2,'2020-11-04 16:06:43.0000'),(28,1,15,'2020-11-04 16:09:03.0000'),(29,1,-15,'2020-11-04 16:09:11.0000'),(30,1,-30,'2020-11-04 16:10:45.0000'),(31,1,100,'2020-11-11 18:11:59.0000'),(32,1,123,'2020-11-11 18:12:05.0000');
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipo_usuario` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(45) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'admin'),(2,'jugador');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `contraseña` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `genero` varchar(45) NOT NULL,
  `dinero` int(11) NOT NULL,
  `rol` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'agus2311','asd','Agustin','Cordoba','a@gmail.com','2020-01-01','masculino',2723,2),(2,'wallywalle','asd','Lope','Lope','asd@gmail.com','2020-01-01','masculino',0,2),(26,'asd','asd','asd','asd','asd','1990-01-07','masculino',0,2),(27,'123','123','123','123','123','2020-08-07','masculino',9999999,1),(28,'admin','admin','admin','admin','admin','2020-08-07','masculino',9999999,1),(29,'asd123','asd123','asdasd','asdads','asdasd','2000-10-10','masculino',1999000,2),(30,'maiame','asd','ricardo ','ford','chocolatitos','1990-12-31','masculino',100287,2),(31,'test','t','test','test','test','1990-01-01','masculino',60,2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-11 18:15:38
