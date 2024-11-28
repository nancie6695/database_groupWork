-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: Financial_Investors
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
-- Table structure for table `Assets`
--

DROP TABLE IF EXISTS `Assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Assets` (
  `AssetID` int NOT NULL AUTO_INCREMENT,
  `TypeName` enum('Stock','Bond','ETF','Mutual Fund','Real Estate') NOT NULL,
  `Symbol` varchar(30) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Exchange` enum('Nairobi Securities Exchange','Alternative Investment Market') NOT NULL,
  `CurrentPrice` decimal(10,2) NOT NULL,
  `MarketCap` decimal(15,2) DEFAULT NULL,
  `DividendYield` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`AssetID`),
  UNIQUE KEY `Symbol` (`Symbol`),
  UNIQUE KEY `Symbol_2` (`Symbol`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assets`
--

LOCK TABLES `Assets` WRITE;
/*!40000 ALTER TABLE `Assets` DISABLE KEYS */;
INSERT INTO `Assets` VALUES (9,'Stock','SAFCOM','Safaricom PLC','Nairobi Securities Exchange',31.50,1000000000.00,3.50),(10,'Stock','EABL','East African Breweries Limited','Nairobi Securities Exchange',225.00,750000000.00,4.20),(11,'Stock','KCB','Kenya Commercial Bank','Nairobi Securities Exchange',52.75,500000000.00,5.10),(12,'Bond','KE-GOVT-2030','Kenya Government 10-Year Bond','Alternative Investment Market',102.50,NULL,7.50);
/*!40000 ALTER TABLE `Assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `HighPerformingPortfolios`
--

DROP TABLE IF EXISTS `HighPerformingPortfolios`;
/*!50001 DROP VIEW IF EXISTS `HighPerformingPortfolios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `HighPerformingPortfolios` AS SELECT 
 1 AS `PortfolioID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `PortfolioName`,
 1 AS `TotalValue`,
 1 AS `AssetCount`,
 1 AS `AvgDividendYield`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Investors`
--

DROP TABLE IF EXISTS `Investors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Investors` (
  `InvestorID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `RegistrationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`InvestorID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Investors`
--

LOCK TABLES `Investors` WRITE;
/*!40000 ALTER TABLE `Investors` DISABLE KEYS */;
INSERT INTO `Investors` VALUES (1,'Albert','Njorege','albert.njorege@example.com','+254712345678','1980-05-15','2024-11-27 02:59:33'),(2,'Peter','Ochieng','peter.ochieng@example.com','+254722334455','1975-03-10','2024-11-27 02:59:33'),(3,'Janet','Nekesa','janet.nekesa@example.com','+254711112233','1990-07-19','2024-11-27 02:59:33'),(4,'Alex','Kamau','alex.kamau@example.com','+254733445566','1988-12-25','2024-11-27 02:59:33');
/*!40000 ALTER TABLE `Investors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PortfolioAssets`
--

DROP TABLE IF EXISTS `PortfolioAssets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PortfolioAssets` (
  `PortfolioAssetID` int NOT NULL AUTO_INCREMENT,
  `PortfolioID` int DEFAULT NULL,
  `AssetID` int DEFAULT NULL,
  `Quantity` decimal(15,4) NOT NULL,
  `PurchasePrice` decimal(10,2) NOT NULL,
  `PurchaseDate` date NOT NULL,
  PRIMARY KEY (`PortfolioAssetID`),
  KEY `PortfolioID` (`PortfolioID`),
  KEY `AssetID` (`AssetID`),
  CONSTRAINT `PortfolioAssets_ibfk_1` FOREIGN KEY (`PortfolioID`) REFERENCES `Portfolios` (`PortfolioID`),
  CONSTRAINT `PortfolioAssets_ibfk_2` FOREIGN KEY (`AssetID`) REFERENCES `Assets` (`AssetID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PortfolioAssets`
--

LOCK TABLES `PortfolioAssets` WRITE;
/*!40000 ALTER TABLE `PortfolioAssets` DISABLE KEYS */;
INSERT INTO `PortfolioAssets` VALUES (11,1,9,1050.0000,30.00,'2023-01-15'),(12,1,10,500.0000,220.00,'2023-02-20'),(13,2,12,10000.0000,100.00,'2023-04-05'),(14,3,11,200.0000,50.00,'2023-05-10'),(15,4,10,300.0000,210.00,'2023-06-15'),(16,2,11,-1500.0000,50.00,'2024-11-28');
/*!40000 ALTER TABLE `PortfolioAssets` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdatePortfolioValue` AFTER INSERT ON `PortfolioAssets` FOR EACH ROW BEGIN
    UPDATE Portfolios p
    SET p.TotalValue = (
        SELECT SUM(pa.Quantity * a.CurrentPrice)
        FROM PortfolioAssets pa
        JOIN Assets a ON pa.AssetID = a.AssetID
        WHERE pa.PortfolioID = p.PortfolioID
    )
    WHERE p.PortfolioID = NEW.PortfolioID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Portfolios`
--

DROP TABLE IF EXISTS `Portfolios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portfolios` (
  `PortfolioID` int NOT NULL AUTO_INCREMENT,
  `InvestorID` int DEFAULT NULL,
  `PortfolioName` varchar(100) NOT NULL,
  `TotalValue` decimal(15,2) DEFAULT '0.00',
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PortfolioID`),
  KEY `InvestorID` (`InvestorID`),
  CONSTRAINT `Portfolios_ibfk_1` FOREIGN KEY (`InvestorID`) REFERENCES `Investors` (`InvestorID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Portfolios`
--

LOCK TABLES `Portfolios` WRITE;
/*!40000 ALTER TABLE `Portfolios` DISABLE KEYS */;
INSERT INTO `Portfolios` VALUES (1,1,'Albert\'s Growth Portfolio',145575.00,'2024-11-27 02:59:47'),(2,2,'Peter\'s Conservative Fund',945875.00,'2024-11-27 02:59:47'),(3,3,'Janet\'s Balanced Strategy',0.00,'2024-11-27 02:59:47'),(4,4,'Alex\'s Aggressive Portfolio',0.00,'2024-11-27 02:59:47');
/*!40000 ALTER TABLE `Portfolios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transactions`
--

DROP TABLE IF EXISTS `Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transactions` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `PortfolioID` int DEFAULT NULL,
  `AssetID` int DEFAULT NULL,
  `TransactionType` enum('Buy','Sell') NOT NULL,
  `Quantity` decimal(15,4) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `TransactionDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TransactionID`),
  KEY `PortfolioID` (`PortfolioID`),
  KEY `AssetID` (`AssetID`),
  CONSTRAINT `Transactions_ibfk_1` FOREIGN KEY (`PortfolioID`) REFERENCES `Portfolios` (`PortfolioID`),
  CONSTRAINT `Transactions_ibfk_2` FOREIGN KEY (`AssetID`) REFERENCES `Assets` (`AssetID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transactions`
--

LOCK TABLES `Transactions` WRITE;
/*!40000 ALTER TABLE `Transactions` DISABLE KEYS */;
INSERT INTO `Transactions` VALUES (7,1,9,'Buy',100.0000,31.50,'2024-11-27 03:11:30'),(8,1,9,'Sell',50.0000,31.50,'2024-11-27 03:12:48'),(9,2,11,'Buy',1000.0000,50.00,'2024-11-28 05:54:33'),(10,2,11,'Sell',500.0000,48.00,'2024-11-28 06:55:54'),(11,2,11,'Sell',1000.0000,48.00,'2024-11-28 07:00:49'),(12,2,11,'Sell',1000.0000,48.00,'2024-11-28 07:01:07'),(13,2,11,'Sell',10000.0000,48.00,'2024-11-28 07:01:19'),(14,2,11,'Sell',10000.0000,48.00,'2024-11-28 07:01:31'),(15,2,11,'Sell',10000.0000,48.00,'2024-11-28 07:01:34'),(16,2,11,'Sell',10000.0000,48.00,'2024-11-28 07:01:35'),(17,2,11,'Buy',10000.0000,48.00,'2024-11-28 07:01:56'),(18,2,11,'Buy',10000.0000,48.00,'2024-11-28 07:02:09'),(19,2,11,'Buy',10000.0000,48.00,'2024-11-28 07:02:12'),(20,2,11,'Buy',10000.0000,48.00,'2024-11-28 07:02:14');
/*!40000 ALTER TABLE `Transactions` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdatePortfolioAssets` AFTER INSERT ON `Transactions` FOR EACH ROW BEGIN
    
    IF EXISTS (
        SELECT 1
        FROM PortfolioAssets
        WHERE PortfolioID = NEW.PortfolioID AND AssetID = NEW.AssetID
    ) THEN
        
        UPDATE PortfolioAssets
        SET Quantity = Quantity + 
            CASE 
                WHEN NEW.TransactionType = 'Buy' THEN NEW.Quantity
                WHEN NEW.TransactionType = 'Sell' THEN -NEW.Quantity
                ELSE 0
            END
        WHERE PortfolioID = NEW.PortfolioID AND AssetID = NEW.AssetID;
    ELSE
        
        IF NEW.TransactionType = 'Buy' THEN
            INSERT INTO PortfolioAssets (PortfolioID, AssetID, Quantity, PurchasePrice, PurchaseDate)
            VALUES (NEW.PortfolioID, NEW.AssetID, NEW.Quantity, NEW.Price, NEW.TransactionDate);
        END IF;
    END IF;

    
    UPDATE Portfolios p
    SET p.TotalValue = (
        SELECT SUM(pa.Quantity * a.CurrentPrice)
        FROM PortfolioAssets pa
        JOIN Assets a ON pa.AssetID = a.AssetID
        WHERE pa.PortfolioID = p.PortfolioID
    )
    WHERE p.PortfolioID = NEW.PortfolioID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `HighPerformingPortfolios`
--

/*!50001 DROP VIEW IF EXISTS `HighPerformingPortfolios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `HighPerformingPortfolios` AS select `p`.`PortfolioID` AS `PortfolioID`,`i`.`FirstName` AS `FirstName`,`i`.`LastName` AS `LastName`,`p`.`PortfolioName` AS `PortfolioName`,`p`.`TotalValue` AS `TotalValue`,count(`pa`.`AssetID`) AS `AssetCount`,avg(`a`.`DividendYield`) AS `AvgDividendYield` from (((`Portfolios` `p` join `Investors` `i` on((`p`.`InvestorID` = `i`.`InvestorID`))) join `PortfolioAssets` `pa` on((`p`.`PortfolioID` = `pa`.`PortfolioID`))) join `Assets` `a` on((`pa`.`AssetID` = `a`.`AssetID`))) group by `p`.`PortfolioID`,`i`.`FirstName`,`i`.`LastName`,`p`.`PortfolioName`,`p`.`TotalValue` having (`p`.`TotalValue` > 100000) */;
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

-- Dump completed on 2024-11-28 10:24:46
