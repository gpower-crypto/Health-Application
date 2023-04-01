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
-- Table structure for table `existing_users`
--

DROP TABLE IF EXISTS `existing_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `existing_users` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`patient_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `existing_users`
--

LOCK TABLES `existing_users` WRITE;
/*!40000 ALTER TABLE `existing_users` DISABLE KEYS */;
INSERT INTO `existing_users` VALUES (1,' ','',''),(2,'Mohan Krishna','stay@gmail.com','hie'),(3,'New User','sadfs@gmail.com','heist'),(5,'New User','sdfsd@gmail.com','heist'),(6,'New Lord','sds@gmail.com','hut'),(7,'James Brad','mktsl@gmail.com','huts'),(8,'Mk km','hosdl@gmail.com','huy'),(9,'John Mayor','slas@gmail.com','hut'),(11,'ksd sdjsla','sdal@gmail.com','sjal'),(12,'huyt sdlsa','sals@gmail.com','mesh'),(13,'Mohan Kris','abc@gmail.com','june'),(15,'Mkk Kkm','skladk@gmail.com','nun'),(16,'lldfsa jls','sjal@gmail.com','ksdla'),(20,'dasdsf sdf','sdsdfal@gmail.com','sda'),(21,'dfgd dfgd','dgfd@dgd','sdsfs'),(23,'sdf sdf','sdfsdsd@gmail.com','sdfsds'),(24,'Richard Benson','rich@gmail.com','rich123'),(25,'Markus Barson','mark@gmail.com','markus123'),(26,'Ben Harlow','ben@gmail.com','ben123'),(27,'ss ss','ss@gmail.com','ho'),(28,'Terry Louis','terry@gmail.com','terry123'),(29,'Sara Park','sara@gmail.com','sara123'),(30,'James Anderson','james@gmail.com','james123'),(31,'Peter Jones','peter@gmail.com','peter123');
/*!40000 ALTER TABLE `existing_users` ENABLE KEYS */;
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
