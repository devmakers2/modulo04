CREATE DATABASE  IF NOT EXISTS `carloca_individual` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `carloca_individual`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: carloca_individual
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street_name` varchar(45) NOT NULL,
  `number` varchar(45) NOT NULL,
  `address_complement` varchar(45) DEFAULT NULL,
  `neighborhood` varchar(45) NOT NULL,
  `cep` char(8) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` char(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Avenida Paulista','35','fundos','Jardim das Flores','22010000','Curitiba','PR'),(2,'Rua da Carioca','120','Apt. 21','Jardim das Palmeiras','90035171','Belo Horizonte','MG'),(3,'Avenida Atlântica','230',NULL,'Bela Vista','51011000','Recife','PE'),(4,'rua Gonçalo de Carvalho','45',NULL,'Centro','01310200','Goiânia','GO'),(5,'avenida Boa Viagem','75','suite 3','Copacabana','20050008','Porto Alegre','RS'),(6,'rua Padre João Manuel','100',NULL,'Centro','04578000','São Paulo','SP'),(7,'avenida Brigadeiro Faria Lima','500','ap 5','Praia do Forte','60160240','Cabo Frio','RJ'),(8,'Praça da República','200',NULL,'Jardim Botânico','89210410','Brasília','DF');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `available_cars`
--

DROP TABLE IF EXISTS `available_cars`;
/*!50001 DROP VIEW IF EXISTS `available_cars`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `available_cars` AS SELECT 
 1 AS `id`,
 1 AS `make`,
 1 AS `model`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_model` int NOT NULL,
  `id_color` int NOT NULL,
  `id_category` int NOT NULL,
  `version` varchar(45) DEFAULT NULL,
  `manufacture_year` year NOT NULL,
  `license_plate` char(7) NOT NULL,
  `fuel` varchar(45) NOT NULL,
  `number_of_doors` int NOT NULL,
  `price_per_day` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `car_has_model_idx` (`id_model`),
  KEY `car_has_category_idx` (`id_category`),
  KEY `car_has_color_idx` (`id_color`),
  CONSTRAINT `car_has_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`),
  CONSTRAINT `car_has_color` FOREIGN KEY (`id_color`) REFERENCES `color` (`id`),
  CONSTRAINT `car_has_model` FOREIGN KEY (`id_model`) REFERENCES `model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,1,2,1,'Ecoboost',2015,'ABC1234','gasolina/etanol',4,35.00),(2,2,1,2,'GLi',2020,'XYZ5678','híbrido',4,40.00),(3,3,1,2,'LX',2017,'MNO9012','gasolina/etanol',4,45.00),(4,4,2,1,'GTI',2016,'DEF4567','gasolina/etanol',2,50.00),(5,5,1,2,'SL',2016,'GHI8901','gasolina/etanol',4,35.00);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carloca_location`
--

DROP TABLE IF EXISTS `carloca_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carloca_location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_address` int NOT NULL,
  `id_telephone` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_has_address_idx` (`id_address`),
  KEY `location_has_telephone_idx` (`id_telephone`),
  CONSTRAINT `location_has_address` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`),
  CONSTRAINT `location_has_telephone` FOREIGN KEY (`id_telephone`) REFERENCES `telephone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carloca_location`
--

LOCK TABLES `carloca_location` WRITE;
/*!40000 ALTER TABLE `carloca_location` DISABLE KEYS */;
INSERT INTO `carloca_location` VALUES (1,6,6,'unidade Centro'),(2,7,7,'unidade Brigadeiro Faria Lima'),(3,8,8,'unidade Jardim Botânico');
/*!40000 ALTER TABLE `carloca_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (5,'coupé'),(1,'hatchback'),(2,'sedan compacto'),(3,'sedan médio'),(4,'SUV');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_address` int NOT NULL,
  `id_name` int NOT NULL,
  `cpf` char(11) NOT NULL,
  `driver_license` varchar(45) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('feminino','masculino','outro') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `driver_license_UNIQUE` (`driver_license`),
  KEY `client_has_address_idx` (`id_address`),
  KEY `client_has_name_idx` (`id_name`),
  CONSTRAINT `client_has_address` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`),
  CONSTRAINT `client_has_name` FOREIGN KEY (`id_name`) REFERENCES `name` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,1,1,'12345678901','1111','1987-09-15','masculino'),(2,2,2,'98765432109','2222','1955-05-23','feminino'),(3,3,3,'01234567890','1234','1968-12-07','outro'),(4,4,4,'44444444444','4321','1977-08-31','feminino'),(5,5,5,'55555555555','5678','1983-07-12','masculino');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client-telephone`
--

DROP TABLE IF EXISTS `client-telephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client-telephone` (
  `id_client` int NOT NULL,
  `id_telephone` int NOT NULL,
  PRIMARY KEY (`id_client`,`id_telephone`),
  KEY `client_has_many_phone_numbers_idx` (`id_client`),
  KEY `telephnoe_may_have_multiple_users_idx` (`id_telephone`),
  CONSTRAINT `client_has_many_phone_numbers` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`),
  CONSTRAINT `telephnoe_may_have_multiple_users` FOREIGN KEY (`id_telephone`) REFERENCES `telephone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client-telephone`
--

LOCK TABLES `client-telephone` WRITE;
/*!40000 ALTER TABLE `client-telephone` DISABLE KEYS */;
INSERT INTO `client-telephone` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `client-telephone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `clients_that_rented_a_specific_car`
--

DROP TABLE IF EXISTS `clients_that_rented_a_specific_car`;
/*!50001 DROP VIEW IF EXISTS `clients_that_rented_a_specific_car`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clients_that_rented_a_specific_car` AS SELECT 
 1 AS `id_client`,
 1 AS `id_car`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'branco'),(3,'prata'),(2,'preto');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `make`
--

DROP TABLE IF EXISTS `make`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `make` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `make`
--

LOCK TABLES `make` WRITE;
/*!40000 ALTER TABLE `make` DISABLE KEYS */;
INSERT INTO `make` VALUES (1,'Ford'),(3,'Honda'),(5,'Nissan'),(2,'Toyota'),(4,'Volkswagen');
/*!40000 ALTER TABLE `make` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_make` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model has make_idx` (`id_make`),
  CONSTRAINT `model_has_make` FOREIGN KEY (`id_make`) REFERENCES `make` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,1,'Fiesta'),(2,2,'Corolla'),(3,3,'Civic'),(4,4,'Golf'),(5,5,'Sentra');
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `name`
--

DROP TABLE IF EXISTS `name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `name` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `suffix` varchar(45) DEFAULT NULL,
  `full_name` varchar(45) GENERATED ALWAYS AS (concat_ws(_utf8mb4' ',`first_name`,`middle_name`,`last_name`,`suffix`)) VIRTUAL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `name`
--

LOCK TABLES `name` WRITE;
/*!40000 ALTER TABLE `name` DISABLE KEYS */;
INSERT INTO `name` (`id`, `first_name`, `middle_name`, `last_name`, `suffix`) VALUES (1,'Lucas','João','Pedro','Júnior'),(2,'Isabel','Ana','Luiza',NULL),(3,'Alex',NULL,'Marinho',NULL),(4,'Sofia',NULL,'Mendes',NULL),(5,'André',NULL,'Silva','Filho');
/*!40000 ALTER TABLE `name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_client` int NOT NULL,
  `id_car` int NOT NULL,
  `id_location_of_rental` int NOT NULL,
  `id_location_of_return` int DEFAULT NULL,
  `rental_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `car_km_at_start` int NOT NULL,
  `car_km_at_return` int DEFAULT NULL,
  `insurance` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rental_has_client_idx` (`id_client`),
  KEY `rental_has_car_idx` (`id_car`),
  KEY `rental_has_location_of_rental_idx` (`id_location_of_rental`),
  KEY `rental_has_loccation_of_return_idx` (`id_location_of_return`),
  CONSTRAINT `rental_has_car` FOREIGN KEY (`id_car`) REFERENCES `car` (`id`),
  CONSTRAINT `rental_has_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`),
  CONSTRAINT `rental_has_location_of_rental` FOREIGN KEY (`id_location_of_rental`) REFERENCES `carloca_location` (`id`),
  CONSTRAINT `rental_has_loccation_of_return` FOREIGN KEY (`id_location_of_return`) REFERENCES `carloca_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
INSERT INTO `rental` VALUES (1,1,1,1,1,'2022-01-01','2022-01-11',10000,10100,1),(2,2,2,2,2,'2022-02-02','2022-02-22',20000,20200,0),(3,3,3,3,3,'2022-03-03','2022-03-30',30000,30300,1),(4,4,4,1,2,'2022-04-04','2022-04-14',40000,40400,1),(5,5,5,2,1,'2022-05-05','2022-05-15',50000,50500,0),(6,1,1,1,1,'2022-11-01','2022-11-11',10100,10150,1),(7,1,2,3,2,'2022-11-11','2022-11-12',20250,20280,1),(8,2,2,1,3,'2022-12-02','2022-12-12',20300,20432,1),(9,3,4,2,1,'2023-01-03','2023-01-05',40500,40567,0),(10,4,5,3,2,'2023-02-02','2023-02-04',60000,61000,1),(11,1,3,2,NULL,'2023-02-10',NULL,30333,NULL,0),(15,5,4,3,NULL,'2023-02-10',NULL,40600,NULL,1);
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Rental_BEFORE_INSERT` BEFORE INSERT ON `rental` FOR EACH ROW BEGIN
	IF ((SELECT COUNT(*) FROM Rental WHERE NEW.id_client = id_client AND Rental.return_date IS NULL) != 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cliente já está com um carro locado atualmente.';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Rental_BEFORE_UPDATE` BEFORE UPDATE ON `rental` FOR EACH ROW BEGIN
    DECLARE rentalDate DATE;
    DECLARE carKmAtStart INT;

    SET rentalDate = (select rental_date from Rental where id = NEW.id);
	IF (NEW.return_date <= rentalDate) THEN
	    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data de devolução inválida. A data de devolução precisa ser posterior à data de locação.';
	END IF;
    
    SET carKmAtStart = (select car_km_at_start from Rental where id = NEW.id);
	IF (NEW.car_km_at_return < carKmAtStart) THEN
	    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quilometragem na devolução inválida. A quilometragem na devolução não pode ser menor que a quilometragem no início da locação.';
	END IF;

	IF (((SELECT COUNT(*) FROM Rental WHERE NEW.id_client = id_client AND Rental.return_date IS NULL) != 0) AND new.return_date IS NULL) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'cliente já está com um carro locado atualmente';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `telephone`
--

DROP TABLE IF EXISTS `telephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telephone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country_code` varchar(45) NOT NULL DEFAULT '+55',
  `area_code` varchar(45) DEFAULT NULL,
  `number` varchar(45) NOT NULL,
  `type` enum('fixo','celular') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telephone`
--

LOCK TABLES `telephone` WRITE;
/*!40000 ALTER TABLE `telephone` DISABLE KEYS */;
INSERT INTO `telephone` VALUES (1,'+55','11','12345678','fixo'),(2,'+55','21','23456789','fixo'),(3,'+55','47','34567890','celular'),(4,'+55','19','45678901','celular'),(5,'+55','81','56789012','fixo'),(6,'+55','11','999999999','celular'),(7,'+55','21','32145678','fixo'),(8,'+55','81','987654321','celular');
/*!40000 ALTER TABLE `telephone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `total_distance_travelled_by_clients_for_each_car`
--

DROP TABLE IF EXISTS `total_distance_travelled_by_clients_for_each_car`;
/*!50001 DROP VIEW IF EXISTS `total_distance_travelled_by_clients_for_each_car`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_distance_travelled_by_clients_for_each_car` AS SELECT 
 1 AS `id_car`,
 1 AS `total_travelled_distance`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `travelled_distance_by_client_and_car`
--

DROP TABLE IF EXISTS `travelled_distance_by_client_and_car`;
/*!50001 DROP VIEW IF EXISTS `travelled_distance_by_client_and_car`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `travelled_distance_by_client_and_car` AS SELECT 
 1 AS `id_client`,
 1 AS `id_car`,
 1 AS `total_travelled_distance`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `available_cars`
--

/*!50001 DROP VIEW IF EXISTS `available_cars`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `available_cars` AS select distinct `car`.`id` AS `id`,`make`.`name` AS `make`,`model`.`name` AS `model` from (((`car` join `rental` on((`car`.`id` = `rental`.`id_car`))) join `model` on((`car`.`id_model` = `model`.`id`))) join `make` on((`model`.`id_make` = `make`.`id`))) where `car`.`id` in (select `rental`.`id_car` from `rental` where (`rental`.`return_date` is null)) is false */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `clients_that_rented_a_specific_car`
--

/*!50001 DROP VIEW IF EXISTS `clients_that_rented_a_specific_car`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clients_that_rented_a_specific_car` AS select distinct `rental`.`id_client` AS `id_client`,`rental`.`id_car` AS `id_car` from `rental` order by `rental`.`id_car` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_distance_travelled_by_clients_for_each_car`
--

/*!50001 DROP VIEW IF EXISTS `total_distance_travelled_by_clients_for_each_car`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_distance_travelled_by_clients_for_each_car` AS select `rental`.`id_car` AS `id_car`,(sum(`rental`.`car_km_at_return`) - sum(`rental`.`car_km_at_start`)) AS `total_travelled_distance` from `rental` where (`rental`.`return_date` is not null) group by `rental`.`id_car` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `travelled_distance_by_client_and_car`
--

/*!50001 DROP VIEW IF EXISTS `travelled_distance_by_client_and_car`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `travelled_distance_by_client_and_car` AS select `rental`.`id_client` AS `id_client`,`rental`.`id_car` AS `id_car`,(sum(`rental`.`car_km_at_return`) - sum(`rental`.`car_km_at_start`)) AS `total_travelled_distance` from `rental` where (`rental`.`return_date` is not null) group by `rental`.`id_client`,`rental`.`id_car` */;
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

-- Dump completed on 2023-02-27  1:11:20
