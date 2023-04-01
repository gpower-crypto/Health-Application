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
-- Table structure for table `personal_data`
--

DROP TABLE IF EXISTS `personal_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_data` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `phone_number` char(8) NOT NULL,
  `address` varchar(500) NOT NULL,
  `emergency_contact` char(8) DEFAULT NULL,
  `nationality` varchar(45) NOT NULL,
  `age` int NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_data`
--

LOCK TABLES `personal_data` WRITE;
/*!40000 ALTER TABLE `personal_data` DISABLE KEYS */;
INSERT INTO `personal_data` VALUES (8,'qweqwe','12121212','qqweqweqwe','12121212','qw qwd ',121,'2022-08-12','Female'),(9,'New User','34323423','sdfsjaljsalfsa lksdfsajdld','23423','Indian',4,'2022-08-18','Male'),(10,'New Lord','92344302','slkdjfdsda lksjdfljsallsd','3032320','Indian',9,'2022-08-16','Male'),(11,'huyt sdlsa','349279','jdasdlslka lkasdjflasl','2384929','Indian',56,'2022-08-31','Male'),(12,'huyt sdlsa','349279','jdasdlslka lkasdjflasl','2384929','Indian',56,'2022-08-31','Male'),(13,'Mkk Kkm','234032','dflas lksafjla','94329','Indian',1,'2022-09-01','Male'),(14,'Markus Barson','9009340','Fourth Avenue, 476 Gorve Street','3402300','US citizen',20,'2002-12-08','Male'),(15,'Markus Barson','9009340','Fourth Avenue, 476 Gorve Street','3402300','US citizen',20,'2002-12-08','Male'),(16,'Ben Harlow','2131123','Fourth Avenue, 476 Gorve Street','1232121','US citizen',20,'2002-03-12','Male'),(17,'ss ss','234032','dsfa sdfa','94329','Indian',12,'2022-09-20','Male'),(18,'Terry Louis','123532','Fourth Avenue, 476 Gorve Street','127865','US citizen',20,'2002-09-02','Male'),(19,'Sara Park','125376','Fourth Avenue, 476 Gorve Street','238798','US citizen',20,'2002-09-05','Female'),(20,'James Anderson','165433','Fourth Avenue, 476 Gorve Street','298843','US citizen',20,'2002-09-05','Male'),(21,'Peter Jones','322937','Fourth Avenue, 476 Gorve Street','239002','US citizen',20,'2002-09-07','Male');
/*!40000 ALTER TABLE `personal_data` ENABLE KEYS */;
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
