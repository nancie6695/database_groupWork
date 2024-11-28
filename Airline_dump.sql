-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: Airline
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking_history`
--

DROP TABLE IF EXISTS `booking_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_history` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `passenger_id` int DEFAULT NULL,
  `flight_id` int DEFAULT NULL,
  `booking_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `seat_number` varchar(5) DEFAULT NULL,
  `status` enum('Booked','Checked-in','Cancelled') DEFAULT 'Booked',
  PRIMARY KEY (`booking_id`),
  KEY `passenger_id` (`passenger_id`),
  KEY `flight_id` (`flight_id`),
  CONSTRAINT `booking_history_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger_records` (`passenger_id`),
  CONSTRAINT `booking_history_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight_details` (`flight_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_history`
--

LOCK TABLES `booking_history` WRITE;
/*!40000 ALTER TABLE `booking_history` DISABLE KEYS */;
INSERT INTO `booking_history` VALUES (1,1,1,'2024-11-18 07:00:00','14B','Booked'),(2,2,2,'2024-11-19 12:30:00','22A','Checked-in'),(3,3,3,'2024-11-20 05:15:00','3C','Booked'),(4,4,4,'2024-11-21 08:00:00','9D','Cancelled'),(5,5,5,'2024-11-22 17:45:00','15A','Booked'),(6,6,2,'2024-11-22 18:30:00','17C','Booked'),(7,7,1,'2024-11-23 04:45:00','11B','Checked-in'),(8,5,4,'2024-11-23 06:00:00','12C','Booked'),(9,7,2,'2024-11-18 07:00:00','34A','Booked'),(10,6,2,'2024-11-18 04:00:00','160A','Booked'),(11,5,2,'2024-11-23 06:00:00','12C','Booked'),(12,4,2,'2024-11-23 06:00:00','12C','Booked'),(13,5,2,'2024-11-28 06:44:02','11C','Booked');
/*!40000 ALTER TABLE `booking_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_details`
--

DROP TABLE IF EXISTS `flight_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_details` (
  `flight_id` int NOT NULL AUTO_INCREMENT,
  `flight_number` varchar(10) NOT NULL,
  `airline` varchar(50) NOT NULL,
  `origin` varchar(50) NOT NULL,
  `destination` varchar(50) NOT NULL,
  `departure_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_date` date DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `status` enum('Scheduled','Delayed','Cancelled','Departed','Arrived') DEFAULT 'Scheduled',
  `seat_capacity` int NOT NULL,
  `available_seats` int NOT NULL,
  PRIMARY KEY (`flight_id`),
  UNIQUE KEY `flight_number` (`flight_number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_details`
--

LOCK TABLES `flight_details` WRITE;
/*!40000 ALTER TABLE `flight_details` DISABLE KEYS */;
INSERT INTO `flight_details` VALUES (1,'ET101','Ethiopian Airlines','Nairobi','Addis Ababa','2024-11-20','09:00:00','2024-11-20','11:00:00','Delayed',180,150),(2,'QR202','Qatar Airways','Nairobi','Doha','2024-11-21','22:30:00','2024-11-22','04:00:00','Scheduled',200,176),(3,'BA303','British Airways','Nairobi','London','2024-11-22','12:00:00','2024-11-22','18:30:00','Scheduled',250,220),(4,'KQ404','Kenya Airways','Nairobi','Johannesburg','2024-11-23','07:00:00','2024-11-23','10:00:00','Delayed',170,139),(5,'SA505','South African Airways','Nairobi','Cape Town','2024-11-24','14:00:00','2024-11-24','17:00:00','Scheduled',160,130);
/*!40000 ALTER TABLE `flight_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger_records`
--

DROP TABLE IF EXISTS `passenger_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger_records` (
  `passenger_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `passport_number` varchar(20) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`passenger_id`),
  UNIQUE KEY `passport_number` (`passport_number`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger_records`
--

LOCK TABLES `passenger_records` WRITE;
/*!40000 ALTER TABLE `passenger_records` DISABLE KEYS */;
INSERT INTO `passenger_records` VALUES (1,'Jane','Kaschana','1989-02-14','A12345678','Kenyan','+254712345678','jane.kaschana@example.com'),(2,'Grace','Wambui','1985-07-22','B23456789','Kenyan','+254722123456','grace.wambui@example.com'),(3,'Benjamin','Katana','1990-01-15','C34567890','Kenyan','+254732234567','benjamin.katana@example.com'),(4,'Joy','Atieno','1993-05-03','D45678901','Kenyan','+254742345678','joy.atieno@example.com'),(5,'John','Kamau','1991-04-10','F67890123','Kenyan','+254715678901','john.kamau@example.com'),(6,'Mohammed','Abdul','1987-08-13','G78901234','Kenyan','+254726789012','mohammed.abdul@example.com'),(7,'Lisa','Nyaboke','1995-09-25','H89012345','Kenyan','+254737890123','lisa.nyaboke@example.com');
/*!40000 ALTER TABLE `passenger_records` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-28 10:23:04
