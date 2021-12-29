-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: cs336project
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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `AccountsName` varchar(50) DEFAULT NULL,
  `AccountsPhoneNum` int DEFAULT NULL,
  `AccountsPass` varchar(50) DEFAULT NULL,
  `AccountsAdress` varchar(50) DEFAULT NULL,
  `AccountsUniqueAccNum` varchar(50) NOT NULL DEFAULT '',
  `AccountSSN` varchar(30) DEFAULT NULL,
  `AccountsEmail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AccountsUniqueAccNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrativestaffmember`
--

DROP TABLE IF EXISTS `administrativestaffmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrativestaffmember` (
  `AdministrativeStaffMemberName` varchar(50) DEFAULT NULL,
  `AdministrativeStaffMemberSSN` varchar(30) NOT NULL DEFAULT '',
  `AdministrativeStaffMemberEmail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AdministrativeStaffMemberSSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrativestaffmember`
--

LOCK TABLES `administrativestaffmember` WRITE;
/*!40000 ALTER TABLE `administrativestaffmember` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrativestaffmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `associatedrelation`
--

DROP TABLE IF EXISTS `associatedrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `associatedrelation` (
  `CardNum` int NOT NULL DEFAULT '0',
  `AccountsUniqueAccNum` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`CardNum`,`AccountsUniqueAccNum`),
  KEY `AccountsUniqueAccNum` (`AccountsUniqueAccNum`),
  CONSTRAINT `associatedrelation_ibfk_1` FOREIGN KEY (`AccountsUniqueAccNum`) REFERENCES `accounts` (`AccountsUniqueAccNum`),
  CONSTRAINT `associatedrelation_ibfk_2` FOREIGN KEY (`CardNum`) REFERENCES `paymentmethod` (`CardNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associatedrelation`
--

LOCK TABLES `associatedrelation` WRITE;
/*!40000 ALTER TABLE `associatedrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `associatedrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendrelation`
--

DROP TABLE IF EXISTS `attendrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendrelation` (
  `UpperBoundPrice` int DEFAULT NULL,
  `AccountsUniqueAccNum` varchar(50) NOT NULL DEFAULT '',
  `BidNum` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AccountsUniqueAccNum`,`BidNum`),
  KEY `BidNum` (`BidNum`),
  CONSTRAINT `attendrelation_ibfk_1` FOREIGN KEY (`AccountsUniqueAccNum`) REFERENCES `accounts` (`AccountsUniqueAccNum`),
  CONSTRAINT `attendrelation_ibfk_2` FOREIGN KEY (`BidNum`) REFERENCES `bid` (`BidNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendrelation`
--

LOCK TABLES `attendrelation` WRITE;
/*!40000 ALTER TABLE `attendrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid` (
  `Bid_Time` varchar(4) DEFAULT NULL,
  `Bid_date` date DEFAULT NULL,
  `BidNum` int NOT NULL DEFAULT '0',
  `FloorPrice` int DEFAULT NULL,
  `BidIncrement` int DEFAULT NULL,
  PRIMARY KEY (`BidNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyersaccounts`
--

DROP TABLE IF EXISTS `buyersaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyersaccounts` (
  `AccountsUniqueAccNum` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`AccountsUniqueAccNum`),
  CONSTRAINT `buyersaccounts_ibfk_1` FOREIGN KEY (`AccountsUniqueAccNum`) REFERENCES `accounts` (`AccountsUniqueAccNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyersaccounts`
--

LOCK TABLES `buyersaccounts` WRITE;
/*!40000 ALTER TABLE `buyersaccounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `buyersaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confirmation_weak_entity_set`
--

DROP TABLE IF EXISTS `confirmation_weak_entity_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `confirmation_weak_entity_set` (
  `BidNum` int NOT NULL DEFAULT '0',
  `BidHistory` int DEFAULT NULL,
  `WinnersUniqueAccountNum` int DEFAULT NULL,
  PRIMARY KEY (`BidNum`),
  CONSTRAINT `confirmation_weak_entity_set_ibfk_1` FOREIGN KEY (`BidNum`) REFERENCES `bid` (`BidNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirmation_weak_entity_set`
--

LOCK TABLES `confirmation_weak_entity_set` WRITE;
/*!40000 ALTER TABLE `confirmation_weak_entity_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `confirmation_weak_entity_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerrepresentatives`
--

DROP TABLE IF EXISTS `customerrepresentatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerrepresentatives` (
  `CustomerRepresentativesName` varchar(50) DEFAULT NULL,
  `CustomerRepresentativesSSN` varchar(30) NOT NULL DEFAULT '',
  `CustomerRepresentativesEmail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CustomerRepresentativesSSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerrepresentatives`
--

LOCK TABLES `customerrepresentatives` WRITE;
/*!40000 ALTER TABLE `customerrepresentatives` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerrepresentatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `haverelation`
--

DROP TABLE IF EXISTS `haverelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `haverelation` (
  `BidNum` int NOT NULL DEFAULT '0',
  KEY `BidNum` (`BidNum`),
  CONSTRAINT `haverelation_ibfk_1` FOREIGN KEY (`BidNum`) REFERENCES `bid` (`BidNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `haverelation`
--

LOCK TABLES `haverelation` WRITE;
/*!40000 ALTER TABLE `haverelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `haverelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethod`
--

DROP TABLE IF EXISTS `paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentmethod` (
  `CardNum` int NOT NULL DEFAULT '0',
  `CardType` varchar(10) DEFAULT NULL,
  `CVV` int DEFAULT NULL,
  `HoldersName` varchar(50) DEFAULT NULL,
  `ExpirationDate` date DEFAULT NULL,
  PRIMARY KEY (`CardNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethod`
--

LOCK TABLES `paymentmethod` WRITE;
/*!40000 ALTER TABLE `paymentmethod` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_recieve_relaton`
--

DROP TABLE IF EXISTS `post_recieve_relaton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_recieve_relaton` (
  `Reserve_price` int DEFAULT NULL,
  `BidNum` int NOT NULL DEFAULT '0',
  `AccountsUniqueAccNum` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`BidNum`),
  KEY `AccountsUniqueAccNum` (`AccountsUniqueAccNum`),
  CONSTRAINT `post_recieve_relaton_ibfk_1` FOREIGN KEY (`BidNum`) REFERENCES `bid` (`BidNum`),
  CONSTRAINT `post_recieve_relaton_ibfk_2` FOREIGN KEY (`AccountsUniqueAccNum`) REFERENCES `accounts` (`AccountsUniqueAccNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_recieve_relaton`
--

LOCK TABLES `post_recieve_relaton` WRITE;
/*!40000 ALTER TABLE `post_recieve_relaton` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_recieve_relaton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Product_name` varchar(200) DEFAULT NULL,
  `Product_num` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Product_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `related_relation`
--

DROP TABLE IF EXISTS `related_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `related_relation` (
  `Product_num` int NOT NULL DEFAULT '0',
  `BidNum` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Product_num`),
  KEY `BidNum` (`BidNum`),
  CONSTRAINT `related_relation_ibfk_1` FOREIGN KEY (`Product_num`) REFERENCES `product` (`Product_num`),
  CONSTRAINT `related_relation_ibfk_2` FOREIGN KEY (`BidNum`) REFERENCES `bid` (`BidNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `related_relation`
--

LOCK TABLES `related_relation` WRITE;
/*!40000 ALTER TABLE `related_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `related_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellersaccounts`
--

DROP TABLE IF EXISTS `sellersaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellersaccounts` (
  `AccountsUniqueAccNum` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`AccountsUniqueAccNum`),
  CONSTRAINT `sellersaccounts_ibfk_1` FOREIGN KEY (`AccountsUniqueAccNum`) REFERENCES `accounts` (`AccountsUniqueAccNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellersaccounts`
--

LOCK TABLES `sellersaccounts` WRITE;
/*!40000 ALTER TABLE `sellersaccounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sellersaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `send_relation`
--

DROP TABLE IF EXISTS `send_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `send_relation` (
  `AccountsUniqueAccNum` varchar(50) NOT NULL DEFAULT '',
  `CustomerRepresentativesSSN` varchar(30) NOT NULL DEFAULT '',
  `RequestedID` int DEFAULT NULL,
  PRIMARY KEY (`CustomerRepresentativesSSN`,`AccountsUniqueAccNum`),
  KEY `AccountsUniqueAccNum` (`AccountsUniqueAccNum`),
  CONSTRAINT `send_relation_ibfk_1` FOREIGN KEY (`AccountsUniqueAccNum`) REFERENCES `accounts` (`AccountsUniqueAccNum`),
  CONSTRAINT `send_relation_ibfk_2` FOREIGN KEY (`CustomerRepresentativesSSN`) REFERENCES `customerrepresentatives` (`CustomerRepresentativesSSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `send_relation`
--

LOCK TABLES `send_relation` WRITE;
/*!40000 ALTER TABLE `send_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `send_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffaccount`
--

DROP TABLE IF EXISTS `staffaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffaccount` (
  `StaffAccountName` varchar(50) DEFAULT NULL,
  `StaffAccountPhoneNum` int DEFAULT NULL,
  `StaffAccountPass` varchar(50) DEFAULT NULL,
  `StaffAccountUniqueAccNum` varchar(20) NOT NULL DEFAULT '',
  `StaffAccountAdress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`StaffAccountUniqueAccNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffaccount`
--

LOCK TABLES `staffaccount` WRITE;
/*!40000 ALTER TABLE `staffaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `staffaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffsignup`
--

DROP TABLE IF EXISTS `staffsignup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffsignup` (
  `StaffAccountUniqueAccNum` varchar(20) NOT NULL DEFAULT '',
  `AdministrativeStaffMemberSSN` varchar(30) NOT NULL DEFAULT '',
  `CustomerRepresentativesSSN` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`StaffAccountUniqueAccNum`),
  KEY `AdministrativeStaffMemberSSN` (`AdministrativeStaffMemberSSN`),
  KEY `CustomerRepresentativesSSN` (`CustomerRepresentativesSSN`),
  CONSTRAINT `staffsignup_ibfk_1` FOREIGN KEY (`StaffAccountUniqueAccNum`) REFERENCES `staffaccount` (`StaffAccountUniqueAccNum`),
  CONSTRAINT `staffsignup_ibfk_2` FOREIGN KEY (`AdministrativeStaffMemberSSN`) REFERENCES `administrativestaffmember` (`AdministrativeStaffMemberSSN`),
  CONSTRAINT `staffsignup_ibfk_3` FOREIGN KEY (`CustomerRepresentativesSSN`) REFERENCES `customerrepresentatives` (`CustomerRepresentativesSSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffsignup`
--

LOCK TABLES `staffsignup` WRITE;
/*!40000 ALTER TABLE `staffsignup` DISABLE KEYS */;
/*!40000 ALTER TABLE `staffsignup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-22 15:03:06