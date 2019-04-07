CREATE DATABASE  IF NOT EXISTS `agreektourism` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `agreektourism`;
-- MySQL dump 10.16  Distrib 10.2.22-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: agreektourism
-- ------------------------------------------------------
-- Server version	10.2.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Activities`
--

DROP TABLE IF EXISTS `Activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Activities` (
  `idActivities` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `quote` varchar(300) DEFAULT NULL,
  `description` varchar(5000) NOT NULL,
  `photoUrl` varchar(500) DEFAULT NULL,
  `reviewRate` float DEFAULT 0,
  `capacity` int(4) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `price` float DEFAULT 0,
  `isProduct` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'If this table points to a product rather than activity, then isProduct = 1',
  `categoryId` int(11) NOT NULL,
  `providerId` int(11) NOT NULL,
  `regionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idActivities`),
  UNIQUE KEY `idActivities_UNIQUE` (`idActivities`),
  KEY `fk_Activities_1_idx` (`providerId`),
  KEY `fk_Activities_2_idx` (`regionId`),
  KEY `fk_Activities_3_idx` (`categoryId`),
  CONSTRAINT `fk_Activities_1` FOREIGN KEY (`providerId`) REFERENCES `Users` (`idUsers`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Activities_2` FOREIGN KEY (`regionId`) REFERENCES `Regions` (`idRegions`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Activities_3` FOREIGN KEY (`categoryId`) REFERENCES `Categories` (`idCategories`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Activities`
--

LOCK TABLES `Activities` WRITE;
/*!40000 ALTER TABLE `Activities` DISABLE KEYS */;
INSERT INTO `Activities` VALUES (1,'Μαθήματα αμπελουργίας στη Σαντορίνη','Κύκλος ζωής καλλιέργειας σταφυλλιού και παραγωγής κρασιού.','Μαθήματα αμπελουργίας απο έμπειρο αμπελουργό. Μάθετε τον κύκλο ζωής για την παραγωγή προιόντων σταφυλιού, δουλέψτε με ντόπιους ανθρώπους, δοκιμάστε τοπικά κρασιά και παράγωγα σταφυλιού και ζήστε όπως τους δικούς μας ανθρώπους για μία μέρα.','https://images.pexels.com/photos/39511/purple-grapes-vineyard-napa-valley-napa-vineyard-39511.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',4,12,'3',15,0,1,2,1),(2,'Ασύρτικο Κτήμα Ανδρεάδης','Το μοναδικό ασύρτικο Σαντορίνης με την ιδιαίτερη γεύση του.','Κινούμαστε βορειοδυτικά, σε απόσταση μιάμισης ώρας από την χώρα της Σαντορίνης, για να φτάσουμε στη μαγική Οία, την πατρίδα των όμορφων ηλιοβασιλεμάτων. Εκεί, ζυμώνεται για πολλές δεκαετίες, χωρίς διακοπή, εξαιρετικός μούστος, ο οποίος μεγαλώνει γενιές, όπως αυτή της οικογένειας Ανδρεάδη. Ο Παναγιώτης Ανδρεάδης, με έμπνευση την παράδοση του τόπου του, δημιούργησε το 1946 μια μικρή μονάδα οινοποίησης και από τότε.. όλα πήραν το δρόμο τους.','../public/assets/me.jpg',5,NULL,NULL,45,1,4,2,1),(3,'Μέλι ελάτου','Μοναδική γεύση και άρωμα','Μία δοκιμή θα σας πείσει, τα λόγια είναι απλά περιττά..','https://images.pexels.com/photos/41958/honey-honey-jar-honey-for-sale-beekeeper-41958.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',4.5,NULL,NULL,12,1,5,1,2),(4,'Επαφή με την παράδοση','Μάθετε την παραδοσιακή μας μουσική','Μαθήματα παραδοσιακών χορών από τον τοπικό πολιτιστικό σύλλογο \"Πίνδος\".','../public/assets/dancingtasia.jpg',4,30,'2',5,0,3,1,2);
/*!40000 ALTER TABLE `Activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categories` (
  `idCategories` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `isProduct` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'If this table points to a product rather than activity, then isProduct = 1',
  PRIMARY KEY (`idCategories`),
  UNIQUE KEY `idCategories_UNIQUE` (`idCategories`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` VALUES (1,'Γεωργία',0),(2,'Θάλασσα',0),(3,'Λαογραφία',0),(4,'Κρασί',1),(5,'Μέλι',1);
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Departments`
--

DROP TABLE IF EXISTS `Departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Departments` (
  `idDepartments` int(11) NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(45) NOT NULL,
  `mapUrl` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idDepartments`),
  UNIQUE KEY `idDepartment_UNIQUE` (`idDepartments`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departments`
--

LOCK TABLES `Departments` WRITE;
/*!40000 ALTER TABLE `Departments` DISABLE KEYS */;
INSERT INTO `Departments` VALUES (1,'Νησιά Αιγαίου',NULL),(2,'Μακεδονία',NULL),(3,'Θεσσαλία',NULL);
/*!40000 ALTER TABLE `Departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Multimedia`
--

DROP TABLE IF EXISTS `Multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Multimedia` (
  `idMultimedia` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(1000) NOT NULL,
  `isPhoto` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'isPhoto indicates if the url is a photograph, same the rest',
  `isVideo` tinyint(4) NOT NULL DEFAULT 0,
  `isFacebook` tinyint(4) NOT NULL DEFAULT 0,
  `isInstagram` tinyint(4) NOT NULL DEFAULT 0,
  `isAirBnb` tinyint(4) NOT NULL DEFAULT 0,
  `activityId` int(11) NOT NULL,
  PRIMARY KEY (`idMultimedia`),
  UNIQUE KEY `idMultimedia_UNIQUE` (`idMultimedia`),
  KEY `fk_Multimedia_1_idx` (`activityId`),
  CONSTRAINT `fk_Multimedia_1` FOREIGN KEY (`activityId`) REFERENCES `Activities` (`idActivities`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Multimedia`
--

LOCK TABLES `Multimedia` WRITE;
/*!40000 ALTER TABLE `Multimedia` DISABLE KEYS */;
INSERT INTO `Multimedia` VALUES (1,'https://images.pexels.com/photos/39511/purple-grapes-vineyard-napa-valley-napa-vineyard-39511.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',1,0,0,0,0,1),(2,'../public/assets/me.jpg',1,0,0,0,0,2);
/*!40000 ALTER TABLE `Multimedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Regions`
--

DROP TABLE IF EXISTS `Regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Regions` (
  `idRegions` int(11) NOT NULL AUTO_INCREMENT,
  `regionName` varchar(45) NOT NULL,
  `mapUrl` varchar(1000) DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRegions`),
  UNIQUE KEY `idRegions_UNIQUE` (`idRegions`),
  KEY `fk_Regions_1_idx` (`departmentId`),
  CONSTRAINT `fk_Regions_1` FOREIGN KEY (`departmentId`) REFERENCES `Departments` (`idDepartments`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Regions`
--

LOCK TABLES `Regions` WRITE;
/*!40000 ALTER TABLE `Regions` DISABLE KEYS */;
INSERT INTO `Regions` VALUES (1,'Σαντορίνη','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6417.596759931409!2d25.376782977298195!3d36.46242849872438!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1499cb8b1c44c1a9%3A0x400bd2ce2b9c750!2zzp_Or86xIDg0NyAwMg!5e0!3m2!1sel!2sgr!4v1554616614090!5m2!1sel!2sgr',1),(2,'Ελάτη Τρικάλων','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d12314.689931288627!2d21.534981580841322!3d39.49930952065617!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x13593eefe49f522f%3A0x500bd2ce2bb3200!2zzpXOu86sz4TOtyA0MjAgMzI!5e0!3m2!1sel!2sgr!4v1554619452497!5m2!1sel!2sgr',3);
/*!40000 ALTER TABLE `Regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservations`
--

DROP TABLE IF EXISTS `Reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reservations` (
  `idReservations` int(11) NOT NULL AUTO_INCREMENT,
  `reserveDate` varchar(45) DEFAULT NULL,
  `reserveHour` varchar(45) DEFAULT NULL,
  `reserveCapacity` int(4) DEFAULT NULL,
  `available` tinyint(4) NOT NULL DEFAULT 0,
  `reviewDescription` varchar(5000) DEFAULT NULL,
  `reviewStars` int(11) DEFAULT NULL,
  `activityId` int(11) NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReservations`),
  UNIQUE KEY `idReservations_UNIQUE` (`idReservations`),
  KEY `fk_Reservations_1_idx` (`activityId`),
  KEY `fk_Reservations_2_idx` (`customerId`),
  CONSTRAINT `fk_Reservations_1` FOREIGN KEY (`activityId`) REFERENCES `Activities` (`idActivities`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservations_2` FOREIGN KEY (`customerId`) REFERENCES `Users` (`idUsers`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservations`
--

LOCK TABLES `Reservations` WRITE;
/*!40000 ALTER TABLE `Reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `idUsers` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `contactMail` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `isCustomer` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'If this table refers to a customer, then isCustomer = 1, else if a provider isCustomer = 0',
  PRIMARY KEY (`idUsers`),
  UNIQUE KEY `idUsers_UNIQUE` (`idUsers`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'anastasia','drosi','Αναστασία','Δρόση','anastdrosi@gmail.com','2441076552','Λευκάδος2, Ελάτη Τρικάλων, 16218',0),(2,'panagiotis','andreadis','Παναγιώτης','Ανδρεάδης','pandreadis@gmail.com','22860 22492','Φηρών 23, Οία',0),(3,'ioanna','sotiriou','Ιωάννα','Σωτηρίου','ioannasotiriou@hotmail.com','210 9268375','Αθηνάς 94, Γλυφάδα',1);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-07 15:48:04
