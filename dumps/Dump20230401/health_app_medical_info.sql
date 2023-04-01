-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: health_app
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `medical_info`
--

DROP TABLE IF EXISTS `medical_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_info` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `family_conditions` enum('Asthma','Diabetes','Cancer','Hypertension') DEFAULT NULL,
  `medication` varchar(10) DEFAULT NULL,
  `medical_allergies` enum('Yes','NO') NOT NULL,
  `covid_vaccinedoses` varchar(250) NOT NULL,
  `pastmedical_healthconditions` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_info`
--

LOCK TABLES `medical_info` WRITE;
/*!40000 ALTER TABLE `medical_info` DISABLE KEYS */;
INSERT INTO `medical_info` VALUES (2,'qweqwe','Asthma','Yes','Yes','1 dose','qweqwee'),(3,'New User','Asthma','No','NO','2 doses','sdflsjflfaslfslfl'),(4,'New User','Asthma','No','NO','2 doses','sdflsjflfaslfslfl'),(5,'New Lord','Diabetes','No','NO','3 doses','alslsalfa lsjldflas'),(6,'huyt sdlsa',NULL,'No','Yes','Pfzier, Booster Dose (Covid)','ksalddfjal lksajdflajsl'),(7,'Mkk Kkm',NULL,'Yes','NO','Pfzier, Booster Dose (Covid)','sfaslkl ksajfsal'),(8,'Markus Barson',NULL,'No','Yes','DTap Vaccine','I have mild allergies.'),(9,'Markus Barson',NULL,'No','Yes','DTap Vaccine','I have mild allergies.'),(10,'Ben Harlow',NULL,'No','NO','Pfzier, 2 doses (Covid)','I have mild allergies.'),(11,'ss ss',NULL,'Yes','NO','Pfzier, 2 doses (Covid)','jjaksdl alsdl'),(12,'Terry Louis',NULL,'Yes','Yes','DTap Vaccine','I have mild allergies.'),(13,'Sara Park',NULL,'No','Yes','Pfzier, 2 doses (Covid)','I have mild allergies.'),(14,'James Anderson',NULL,'No','Yes','Pfzier, 2 doses (Covid)','I have mild allergies.'),(15,'Peter Jones',NULL,'No','Yes','Pfzier, 2 doses (Covid)','I have mild allergies.');
/*!40000 ALTER TABLE `medical_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-01 15:57:28
