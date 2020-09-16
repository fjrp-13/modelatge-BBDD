-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: itacademy-practica-model-bd
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `autors`
--

DROP TABLE IF EXISTS `autors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `cognoms` varchar(100) DEFAULT NULL,
  `direccio_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_AUTORS_DIRECCIO1_idx` (`direccio_id`),
  CONSTRAINT `fk_AUTORS_DIRECCIO1` FOREIGN KEY (`direccio_id`) REFERENCES `direccio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autors`
--

LOCK TABLES `autors` WRITE;
/*!40000 ALTER TABLE `autors` DISABLE KEYS */;
INSERT INTO `autors` VALUES (1,'Autor 1','Cognom 1',1),(2,'Autor 2','Cognom 2',2),(3,'Autor 3','Cognom 3',3),(4,'Autor 4','Cognom 4',4),(5,'Autor 5','Cognom 5',5),(6,'Autor 6','Cognom 6',6),(7,'Autor 7','Cognom 7',1),(8,'Autor 8','Cognom 8',2),(9,'Autor 9','Cognom 9',3);
/*!40000 ALTER TABLE `autors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autors_has_llibres`
--

DROP TABLE IF EXISTS `autors_has_llibres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autors_has_llibres` (
  `autor_id` int NOT NULL,
  `llibre_id` int NOT NULL,
  PRIMARY KEY (`autor_id`,`llibre_id`),
  KEY `fk_AUTORS_has_LLIBRES_LLIBRES1_idx` (`llibre_id`),
  KEY `fk_AUTORS_has_LLIBRES_AUTORS1_idx` (`autor_id`),
  CONSTRAINT `fk_AUTORS_has_LLIBRES_AUTORS1` FOREIGN KEY (`autor_id`) REFERENCES `autors` (`id`),
  CONSTRAINT `fk_AUTORS_has_LLIBRES_LLIBRES1` FOREIGN KEY (`llibre_id`) REFERENCES `llibres` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autors_has_llibres`
--

LOCK TABLES `autors_has_llibres` WRITE;
/*!40000 ALTER TABLE `autors_has_llibres` DISABLE KEYS */;
INSERT INTO `autors_has_llibres` VALUES (1,4),(1,5),(2,6),(3,7),(9,8);
/*!40000 ALTER TABLE `autors_has_llibres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avions`
--

DROP TABLE IF EXISTS `avions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avions` (
  `id_avio` int NOT NULL AUTO_INCREMENT,
  `model_id` int NOT NULL,
  PRIMARY KEY (`id_avio`),
  UNIQUE KEY `id_avio_UNIQUE` (`id_avio`),
  KEY `fk_AVIONS_MODELS1_idx` (`model_id`),
  CONSTRAINT `fk_AVIONS_MODELS1` FOREIGN KEY (`model_id`) REFERENCES `models` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avions`
--

LOCK TABLES `avions` WRITE;
/*!40000 ALTER TABLE `avions` DISABLE KEYS */;
INSERT INTO `avions` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,3);
/*!40000 ALTER TABLE `avions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `cognoms` varchar(75) NOT NULL,
  `carrer` varchar(150) DEFAULT NULL,
  `num` varchar(10) DEFAULT NULL,
  `pis` varchar(5) DEFAULT NULL,
  `porta` varchar(5) DEFAULT NULL,
  `cp` varchar(5) DEFAULT NULL,
  `ciutat` varchar(45) DEFAULT NULL,
  `pais` varchar(25) DEFAULT NULL,
  `telef` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `data_registre` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `referenciat_per_client_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_CLIENTS_CLIENTS1_idx` (`referenciat_per_client_id`),
  CONSTRAINT `fk_CLIENTS_CLIENTS1` FOREIGN KEY (`referenciat_per_client_id`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Cli1','Cognom1','carrer_cli_1','num_1','1','1','00001','ciutat_1','pais_1','111111111','cli1@test.com','2020-09-16 16:08:41',NULL),(2,'Cli2','Cognom2','carrer_cli_2','num_2','2','2','00002','ciutat_2','pais_2','222222222','cli2@test.com','2020-09-16 16:08:41',1),(3,'Cli3','Cognom3','carrer_cli_3','num_3','3','3','00003','ciutat_3','pais_1','333333333','cli3@test.com','2020-09-16 16:08:41',NULL),(4,'Cli4','Cognom4','carrer_cli_4','num_4','4','4','00004','ciutat_4','pais_1','444444444','cli4@test.com','2020-09-16 16:08:41',1),(5,'Cli5','Cognom5','carrer_cli_5','num_5','5','5','00005','ciutat_5','pais_1','555555555','cli5@test.com','2020-09-16 16:08:41',NULL),(6,'Cli6','Cognom6','carrer_cli_6','num_6','6','6','00006','ciutat_6','pais_1','666666666','cli6@test.com','2020-09-16 16:08:41',NULL),(7,'Cli7','Cognom7','carrer_cli_7','num_7','7','7','00007','ciutat_7','pais_1','777777777','cli7@test.com','2020-09-16 16:08:41',2);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compradors`
--

DROP TABLE IF EXISTS `compradors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compradors` (
  `id_comprador` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(12) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `cognoms` varchar(75) NOT NULL,
  PRIMARY KEY (`id_comprador`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compradors`
--

LOCK TABLES `compradors` WRITE;
/*!40000 ALTER TABLE `compradors` DISABLE KEYS */;
INSERT INTO `compradors` VALUES (1,'11111111A','Comprador1','Cognom1'),(2,'22222222B','Comprador2','Cognom2'),(3,'33333333C','Comprador3','Cognom3');
/*!40000 ALTER TABLE `compradors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccio`
--

DROP TABLE IF EXISTS `direccio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `direccio` varchar(150) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `poblacio` varchar(45) NOT NULL,
  `provincia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccio`
--

LOCK TABLES `direccio` WRITE;
/*!40000 ALTER TABLE `direccio` DISABLE KEYS */;
INSERT INTO `direccio` VALUES (1,'carrer 1_1','00011','poblacio 1','prov 1'),(2,'carrer 1_2','00012','poblacio 1','prov 1'),(3,'carrer 2_1','00021','poblacio 2','prov 2'),(4,'carrer 2_2','00022','poblacio 2','prov 2'),(5,'carrer 3_1','00031','poblacio 3','prov 3'),(6,'carrer 3_2','00032','poblacio 3','prov 3');
/*!40000 ALTER TABLE `direccio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleat`
--

DROP TABLE IF EXISTS `empleat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `cognoms` varchar(75) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleat`
--

LOCK TABLES `empleat` WRITE;
/*!40000 ALTER TABLE `empleat` DISABLE KEYS */;
INSERT INTO `empleat` VALUES (1,'Empleat 1','Cognom 1'),(2,'Empleat 2','Cognom 2'),(3,'Empleat 3','Cognom 3');
/*!40000 ALTER TABLE `empleat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_llibres`
--

DROP TABLE IF EXISTS `factura_llibres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_llibres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuari_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_FACTURA_USUARIS_AMAZON1_idx` (`usuari_id`),
  CONSTRAINT `fk_FACTURA_USUARIS_AMAZON1` FOREIGN KEY (`usuari_id`) REFERENCES `usuaris_amazon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_llibres`
--

LOCK TABLES `factura_llibres` WRITE;
/*!40000 ALTER TABLE `factura_llibres` DISABLE KEYS */;
INSERT INTO `factura_llibres` VALUES (1,'2020-09-16 11:30:04',1),(2,'2020-09-16 10:30:04',2),(3,'2020-09-16 12:30:04',3);
/*!40000 ALTER TABLE `factura_llibres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_ulleres`
--

DROP TABLE IF EXISTS `factura_ulleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_ulleres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import` float DEFAULT NULL,
  `empleat_id` int NOT NULL,
  `client_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_FACTURA_EMPLEAT1_idx` (`empleat_id`),
  KEY `fk_FACTURA_CLIENTS1_idx` (`client_id`),
  CONSTRAINT `fk_FACTURA_CLIENTS1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `fk_FACTURA_EMPLEAT1` FOREIGN KEY (`empleat_id`) REFERENCES `empleat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_ulleres`
--

LOCK TABLES `factura_ulleres` WRITE;
/*!40000 ALTER TABLE `factura_ulleres` DISABLE KEYS */;
INSERT INTO `factura_ulleres` VALUES (13,'2020-09-13 13:00:00',150.5,1,1),(14,'2020-09-14 14:00:00',250.5,1,2),(15,'2020-09-15 15:00:00',350.5,2,1),(16,'2020-09-16 16:00:00',450.5,2,3),(17,'2020-09-17 17:00:00',550.5,3,1),(18,'2020-09-18 18:00:00',650.5,1,4);
/*!40000 ALTER TABLE `factura_ulleres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotos`
--

DROP TABLE IF EXISTS `fotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lloc` varchar(75) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `usuari_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_FOTOS_USUARIS_XARXES1_idx` (`usuari_id`),
  CONSTRAINT `fk_FOTOS_USUARIS_XARXES1` FOREIGN KEY (`usuari_id`) REFERENCES `usuaris_xarxes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos`
--

LOCK TABLES `fotos` WRITE;
/*!40000 ALTER TABLE `fotos` DISABLE KEYS */;
INSERT INTO `fotos` VALUES (1,'lloc1','url1',1),(14,'lloc2','url2',1),(15,'lloc3','url3',1),(16,'lloc4','url4',2),(17,'lloc1','url5',2),(18,'lloc6','url6',3),(19,'lloc7','url7',4);
/*!40000 ALTER TABLE `fotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linies_factura`
--

DROP TABLE IF EXISTS `linies_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `linies_factura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `factura_id` int NOT NULL,
  `ullera_id` int NOT NULL,
  `quantitat` int NOT NULL,
  `preu` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_LINIES_FACTURA_FACTURA1_idx` (`factura_id`),
  KEY `fk_LINIES_FACTURA_ULLERES1_idx` (`ullera_id`),
  CONSTRAINT `fk_LINIES_FACTURA_FACTURA1` FOREIGN KEY (`factura_id`) REFERENCES `factura_ulleres` (`id`),
  CONSTRAINT `fk_LINIES_FACTURA_ULLERES1` FOREIGN KEY (`ullera_id`) REFERENCES `ulleres` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linies_factura`
--

LOCK TABLES `linies_factura` WRITE;
/*!40000 ALTER TABLE `linies_factura` DISABLE KEYS */;
INSERT INTO `linies_factura` VALUES (1,13,1,1,150.5),(2,14,1,1,150.5),(3,14,2,1,100),(4,15,3,2,350.5),(5,16,4,1,450.5),(6,17,2,3,550.5),(7,18,2,1,650.5);
/*!40000 ALTER TABLE `linies_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llibres`
--

DROP TABLE IF EXISTS `llibres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `llibres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titol` varchar(45) NOT NULL,
  `isbn` varchar(15) NOT NULL,
  `preu` float NOT NULL,
  `unitats_disponibles` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llibres`
--

LOCK TABLES `llibres` WRITE;
/*!40000 ALTER TABLE `llibres` DISABLE KEYS */;
INSERT INTO `llibres` VALUES (4,'Llibre 1','11111111',11.99,11),(5,'Llibre 2','22222222',22.99,22),(6,'Llibre 3','33333333',33.99,33),(7,'Llibre 4','44444444',44.99,44),(8,'Llibre 5','55555555',55.99,55);
/*!40000 ALTER TABLE `llibres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llibres_has_factura`
--

DROP TABLE IF EXISTS `llibres_has_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `llibres_has_factura` (
  `llibre_id` int NOT NULL,
  `factura_id` int NOT NULL,
  `unitats` int NOT NULL,
  `preu` float NOT NULL,
  PRIMARY KEY (`llibre_id`,`factura_id`),
  KEY `fk_LLIBRES_has_FACTURA_FACTURA1_idx` (`factura_id`),
  KEY `fk_LLIBRES_has_FACTURA_LLIBRES1_idx` (`llibre_id`),
  CONSTRAINT `fk_LLIBRES_has_FACTURA_FACTURA1` FOREIGN KEY (`factura_id`) REFERENCES `factura_llibres` (`id`),
  CONSTRAINT `fk_LLIBRES_has_FACTURA_LLIBRES1` FOREIGN KEY (`llibre_id`) REFERENCES `llibres` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llibres_has_factura`
--

LOCK TABLES `llibres_has_factura` WRITE;
/*!40000 ALTER TABLE `llibres_has_factura` DISABLE KEYS */;
INSERT INTO `llibres_has_factura` VALUES (4,2,3,11.99),(5,1,5,22),(6,1,3,33.99),(8,3,1,55.99);
/*!40000 ALTER TABLE `llibres_has_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marques_ulleres`
--

DROP TABLE IF EXISTS `marques_ulleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marques_ulleres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(75) NOT NULL,
  `proveidor_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_MARQUES_ULLERES_PROVEIDORS1_idx` (`proveidor_id`),
  CONSTRAINT `fk_MARQUES_ULLERES_PROVEIDORS1` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marques_ulleres`
--

LOCK TABLES `marques_ulleres` WRITE;
/*!40000 ALTER TABLE `marques_ulleres` DISABLE KEYS */;
INSERT INTO `marques_ulleres` VALUES (1,'Marca_1',1),(2,'Marca_2',1),(3,'Marca_3',1),(4,'Marca_4',2),(5,'Marca_5',3),(6,'Marca_6',5);
/*!40000 ALTER TABLE `marques_ulleres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `models` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `capacitat` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models`
--

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` VALUES (1,'AV850',150),(2,'AV900',500),(3,'AV777',250);
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pintors`
--

DROP TABLE IF EXISTS `pintors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pintors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `cognoms` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pintors`
--

LOCK TABLES `pintors` WRITE;
/*!40000 ALTER TABLE `pintors` DISABLE KEYS */;
INSERT INTO `pintors` VALUES (1,'Anònim',NULL),(2,'Pintor2','Apell2'),(3,'Pintor3','Apell3'),(4,'Pintor4','Apell4');
/*!40000 ALTER TABLE `pintors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveidors`
--

DROP TABLE IF EXISTS `proveidors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveidors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `carrer` varchar(150) DEFAULT NULL,
  `num` varchar(10) DEFAULT NULL,
  `pis` varchar(5) DEFAULT NULL,
  `porta` varchar(5) DEFAULT NULL,
  `cp` varchar(5) DEFAULT NULL,
  `ciutat` varchar(45) DEFAULT NULL,
  `pais` varchar(25) DEFAULT NULL,
  `telef` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `nif` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveidors`
--

LOCK TABLES `proveidors` WRITE;
/*!40000 ALTER TABLE `proveidors` DISABLE KEYS */;
INSERT INTO `proveidors` VALUES (1,'Proveidor 1','Carrer_1','1','1','1','00001','ciutat_1','pais_1','111111111',NULL,'11111111A'),(2,'Proveidor 2','Carrer_2','2','2','2','00002','ciutat_2','pais_2','222222222',NULL,'22222222B'),(3,'Proveidor 3','Carrer_3','3','3','3','00003','ciutat_3','pais_1','333333333',NULL,'33333333C'),(4,'Proveidor 4','Carrer_4','4','4','4','00004','ciutat_4','pais_1','444444444',NULL,'44444444D'),(5,'Proveidor 5','Carrer_5','5','5','5','00005','ciutat_5','pais_1','555555555',NULL,'55555555E'),(6,'Proveidor 6','Carrer_6','6','6','6','00006','ciutat_6','pais_1','666666666',NULL,'66666666F'),(7,'Proveidor 7','Carrer_7','7','7','7','00007','ciutat_7','pais_1','777777777',NULL,'77777777G');
/*!40000 ALTER TABLE `proveidors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quadres`
--

DROP TABLE IF EXISTS `quadres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quadres` (
  `id_quadre` int NOT NULL AUTO_INCREMENT,
  `titol` varchar(45) NOT NULL,
  `preu` float NOT NULL,
  `pintor_id` int NOT NULL,
  PRIMARY KEY (`id_quadre`),
  UNIQUE KEY `id_quadre_UNIQUE` (`id_quadre`),
  KEY `fk_QUADRES_PINTORS1_idx` (`pintor_id`),
  CONSTRAINT `fk_QUADRES_PINTORS1` FOREIGN KEY (`pintor_id`) REFERENCES `pintors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quadres`
--

LOCK TABLES `quadres` WRITE;
/*!40000 ALTER TABLE `quadres` DISABLE KEYS */;
INSERT INTO `quadres` VALUES (9,'Cuadre 1',15.75,1),(10,'Cuadre 2',18,2),(11,'Cuadre 3',25.75,1),(12,'Cuadre 4',13.99,3),(13,'Cuadre 5',11.99,2);
/*!40000 ALTER TABLE `quadres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seients`
--

DROP TABLE IF EXISTS `seients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seients` (
  `id_seient` int NOT NULL AUTO_INCREMENT,
  `avio_id` int NOT NULL,
  `tipus` varchar(1) NOT NULL COMMENT 'P = Passadís\nF = Finestra\nC = Central',
  PRIMARY KEY (`id_seient`),
  UNIQUE KEY `id_seient_UNIQUE` (`id_seient`),
  KEY `fk_SEIENTS_AVIONS1_idx` (`avio_id`),
  CONSTRAINT `fk_SEIENTS_AVIONS1` FOREIGN KEY (`avio_id`) REFERENCES `avions` (`id_avio`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seients`
--

LOCK TABLES `seients` WRITE;
/*!40000 ALTER TABLE `seients` DISABLE KEYS */;
INSERT INTO `seients` VALUES (1,1,'F'),(2,1,'C'),(3,1,'P'),(4,1,'F'),(5,1,'C'),(6,1,'P'),(7,1,'F'),(8,1,'C'),(9,1,'P'),(10,2,'F'),(11,2,'C'),(12,2,'C'),(13,2,'P'),(14,2,'F'),(15,2,'P'),(16,3,'F'),(17,3,'P');
/*!40000 ALTER TABLE `seients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipus_muntura`
--

DROP TABLE IF EXISTS `tipus_muntura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipus_muntura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(75) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipus_muntura`
--

LOCK TABLES `tipus_muntura` WRITE;
/*!40000 ALTER TABLE `tipus_muntura` DISABLE KEYS */;
INSERT INTO `tipus_muntura` VALUES (1,'Pasta'),(2,'Flotant'),(3,'Metàl·lica');
/*!40000 ALTER TABLE `tipus_muntura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ulleres`
--

DROP TABLE IF EXISTS `ulleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ulleres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `graduacio_left` varchar(15) NOT NULL,
  `graduacio_right` varchar(15) NOT NULL,
  `color_vidre_left` varchar(15) NOT NULL,
  `color_vidre_right` varchar(15) NOT NULL,
  `color_muntura` varchar(15) NOT NULL,
  `preu` float NOT NULL,
  `tipus_muntura_id` int NOT NULL,
  `marca_ulleres_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_ULLERES_TIPUS_MUNTURA1_idx` (`tipus_muntura_id`),
  KEY `fk_ULLERES_MARQUES_ULLERES1_idx` (`marca_ulleres_id`),
  CONSTRAINT `fk_ULLERES_MARQUES_ULLERES1` FOREIGN KEY (`marca_ulleres_id`) REFERENCES `marques_ulleres` (`id`),
  CONSTRAINT `fk_ULLERES_TIPUS_MUNTURA1` FOREIGN KEY (`tipus_muntura_id`) REFERENCES `tipus_muntura` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ulleres`
--

LOCK TABLES `ulleres` WRITE;
/*!40000 ALTER TABLE `ulleres` DISABLE KEYS */;
INSERT INTO `ulleres` VALUES (1,'1.0','1.0','vermell','vermell','vermell',150.5,1,1),(2,'2.5','2.5','vermell','vermell','blau',150,2,1),(3,'3.5','3.5','blau','blau','negre',200,3,1),(4,'1.0','1.0','vermell','vermell','vermell',150.5,1,2),(5,'2.5','2.5','vermell','vermell','blau',150,2,2),(6,'3.5','3.5','blau','blau','negre',200,3,3),(7,'1.0','1.0','vermell','vermell','vermell',150.5,1,3),(8,'2.5','2.5','vermell','vermell','blau',150,2,3),(9,'3.5','3.5','blau','blau','negre',200,3,3);
/*!40000 ALTER TABLE `ulleres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuaris`
--

DROP TABLE IF EXISTS `usuaris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuaris` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `contrasenya` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuaris`
--

LOCK TABLES `usuaris` WRITE;
/*!40000 ALTER TABLE `usuaris` DISABLE KEYS */;
INSERT INTO `usuaris` VALUES (1,'usu1@test.com','1111'),(2,'usu2@test.com','2222'),(3,'usu3@test.com','3333'),(4,'usu4@test.com','4444');
/*!40000 ALTER TABLE `usuaris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuaris_amazon`
--

DROP TABLE IF EXISTS `usuaris_amazon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuaris_amazon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `contrasenya` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuaris_amazon`
--

LOCK TABLES `usuaris_amazon` WRITE;
/*!40000 ALTER TABLE `usuaris_amazon` DISABLE KEYS */;
INSERT INTO `usuaris_amazon` VALUES (1,'usuari1@test-amazon.es','1111'),(2,'usuari2@test-amazon.es','2222'),(3,'usuari3@test-amazon.es','3333'),(4,'usuari4@test-amazon.es','4444'),(5,'usuari5@test-amazon.es','5555');
/*!40000 ALTER TABLE `usuaris_amazon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuaris_xarxes`
--

DROP TABLE IF EXISTS `usuaris_xarxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuaris_xarxes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contrasenya` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuaris_xarxes`
--

LOCK TABLES `usuaris_xarxes` WRITE;
/*!40000 ALTER TABLE `usuaris_xarxes` DISABLE KEYS */;
INSERT INTO `usuaris_xarxes` VALUES (1,'usu1','email1@email.com','1111'),(2,'usu2','email2@email.com','2222'),(3,'usu3','email3@email.com','3333'),(4,'usu4','email4@email.com','4444'),(5,'usu5','email5@email.com','5555'),(6,'usu6','email6@email.com','6666');
/*!40000 ALTER TABLE `usuaris_xarxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuaris_xarxes_has_usuaris_xarxes`
--

DROP TABLE IF EXISTS `usuaris_xarxes_has_usuaris_xarxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuaris_xarxes_has_usuaris_xarxes` (
  `usuari_1_id` int NOT NULL,
  `usuari_2_id` int NOT NULL,
  `amistat` varchar(45) NOT NULL,
  PRIMARY KEY (`usuari_1_id`,`usuari_2_id`),
  KEY `fk_USUARIS_XARXES_has_USUARIS_XARXES_USUARIS_XARXES2_idx` (`usuari_2_id`),
  KEY `fk_USUARIS_XARXES_has_USUARIS_XARXES_USUARIS_XARXES1_idx` (`usuari_1_id`),
  CONSTRAINT `fk_USUARIS_XARXES_has_USUARIS_XARXES_USUARIS_XARXES1` FOREIGN KEY (`usuari_1_id`) REFERENCES `usuaris_xarxes` (`id`),
  CONSTRAINT `fk_USUARIS_XARXES_has_USUARIS_XARXES_USUARIS_XARXES2` FOREIGN KEY (`usuari_2_id`) REFERENCES `usuaris_xarxes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuaris_xarxes_has_usuaris_xarxes`
--

LOCK TABLES `usuaris_xarxes_has_usuaris_xarxes` WRITE;
/*!40000 ALTER TABLE `usuaris_xarxes_has_usuaris_xarxes` DISABLE KEYS */;
INSERT INTO `usuaris_xarxes_has_usuaris_xarxes` VALUES (1,2,'amistat1'),(1,5,'amistat3'),(2,3,'amistat2'),(5,6,'amistat1');
/*!40000 ALTER TABLE `usuaris_xarxes_has_usuaris_xarxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventes`
--

DROP TABLE IF EXISTS `ventes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventes` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `quadre_id` int NOT NULL,
  `comprador_id` int NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_VENTES_QUADRES1_idx` (`quadre_id`),
  KEY `fk_VENTES_COMPRADORS1_idx` (`comprador_id`),
  CONSTRAINT `fk_VENTES_COMPRADORS1` FOREIGN KEY (`comprador_id`) REFERENCES `compradors` (`id_comprador`),
  CONSTRAINT `fk_VENTES_QUADRES1` FOREIGN KEY (`quadre_id`) REFERENCES `quadres` (`id_quadre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventes`
--

LOCK TABLES `ventes` WRITE;
/*!40000 ALTER TABLE `ventes` DISABLE KEYS */;
INSERT INTO `ventes` VALUES (1,'2020-09-01 11:04:27',9,1),(2,'2020-09-02 11:04:27',10,1),(3,'2020-09-01 12:04:27',12,2),(4,'2020-09-03 11:04:27',13,3);
/*!40000 ALTER TABLE `ventes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `id` varchar(15) NOT NULL,
  `titol` varchar(15) NOT NULL,
  `descripcio` varchar(90) DEFAULT NULL,
  `url` varchar(100) NOT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuari_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_VIDEOS_USUARIS1_idx` (`usuari_id`),
  CONSTRAINT `fk_VIDEOS_USUARIS1` FOREIGN KEY (`usuari_id`) REFERENCES `usuaris` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES ('mfKr-1I4q3Aw-11','VID_1_1','Vídeo 1 del usu 1','www.myvid.com','2020-09-16 11:04:27',1),('mfKr-1I4q3Aw-12','VID_1_2','Vídeo 2 del usu 1','www.myvideos.com','2020-09-16 12:04:27',1),('mfKr-1I4q3Aw-13','VID_1_3','Vídeo 3 del usu 1','www.myvideos.com','2020-09-15 12:04:27',1),('mfKr-1I4q3Aw-21','VID_2_1','Vídeo 1 del usu 2','www.myvideos.com','2020-09-15 11:04:27',2),('mfKr-1I4q3Aw-22','VID_2_2','Vídeo 2 del usu 2','www.myvideos.com','2020-09-16 12:01:27',2),('mfKr-1I4q3Aw-23','VID_2_3','Vídeo 3 del usu 2','www.myvideos.com','2020-09-16 12:04:27',2);
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-16 16:51:43
