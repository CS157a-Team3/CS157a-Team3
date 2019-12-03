-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: Flip_Kart
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.19.04.1

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `address` varchar(100) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `zip` varchar(5) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `addressID` varchar(36) NOT NULL,
  PRIMARY KEY (`addressID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES ('1234 Main St.','CA','Arcadai','91006','Danny','Song','93337f42-5e37-4b77-a975-fddb7c67fe55');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `cartID` varchar(36) NOT NULL,
  `totalCost` double DEFAULT NULL,
  PRIMARY KEY (`cartID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES ('258c18e1-1f76-4334-a623-e2321b118b96',NULL),('2cbe6f11-7537-4a5c-b5f6-a1872dd17065',NULL),('8d27d69e-1333-11ea-a993-40a3cc604820',0),('97767342-de59-4554-8684-2f7ee809fbf4',NULL);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `categoryId` varchar(36) NOT NULL,
  `categoryName` varchar(45) NOT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('1','Phones'),('2','Cameras'),('3','Movies'),('4','Books'),('5','Videogames'),('6','Laptops'),('7','Toys');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditCard`
--

DROP TABLE IF EXISTS `creditCard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditCard` (
  `cardNum` varchar(19) NOT NULL,
  `cardName` varchar(50) DEFAULT NULL,
  `CVV` int(11) DEFAULT NULL,
  `expDate` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`cardNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditCard`
--

LOCK TABLES `creditCard` WRITE;
/*!40000 ALTER TABLE `creditCard` DISABLE KEYS */;
INSERT INTO `creditCard` VALUES ('123457890','Danny Song',544,'05/19');
/*!40000 ALTER TABLE `creditCard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edits`
--

DROP TABLE IF EXISTS `edits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edits` (
  `UserID` varchar(36) NOT NULL,
  `cartID` varchar(36) NOT NULL,
  PRIMARY KEY (`UserID`,`cartID`),
  KEY `CartFK_idx` (`cartID`),
  CONSTRAINT `CartFK` FOREIGN KEY (`cartID`) REFERENCES `carts` (`cartID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `UserFK` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edits`
--

LOCK TABLES `edits` WRITE;
/*!40000 ALTER TABLE `edits` DISABLE KEYS */;
INSERT INTO `edits` VALUES ('b61e5d59-42da-49c5-b58e-f78113698aff','258c18e1-1f76-4334-a623-e2321b118b96'),('c38b902b-2d9f-4ad1-9cee-b0031b4f1ac3','2cbe6f11-7537-4a5c-b5f6-a1872dd17065'),('24872575-124a-11ea-bd11-40a3cc604820','8d27d69e-1333-11ea-a993-40a3cc604820'),('abec77c8-7291-4f7b-ad69-0f20e9102efa','97767342-de59-4554-8684-2f7ee809fbf4');
/*!40000 ALTER TABLE `edits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inCart`
--

DROP TABLE IF EXISTS `inCart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inCart` (
  `cartID` varchar(36) NOT NULL,
  `productID` varchar(36) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartID`,`productID`),
  KEY `fk_inCart_2_idx` (`productID`),
  CONSTRAINT `fk_inCart_1` FOREIGN KEY (`cartID`) REFERENCES `carts` (`cartID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inCart_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inCart`
--

LOCK TABLES `inCart` WRITE;
/*!40000 ALTER TABLE `inCart` DISABLE KEYS */;
INSERT INTO `inCart` VALUES ('258c18e1-1f76-4334-a623-e2321b118b96','a788f7e0-12d1-11ea-bd11-40a3cc604820',1),('8d27d69e-1333-11ea-a993-40a3cc604820','a788f7e0-12d1-11ea-bd11-40a3cc604820',5),('8d27d69e-1333-11ea-a993-40a3cc604820','a78a086d-12d1-11ea-bd11-40a3cc604820',1);
/*!40000 ALTER TABLE `inCart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inCat`
--

DROP TABLE IF EXISTS `inCat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inCat` (
  `productID` varchar(36) NOT NULL,
  `categoryId` varchar(36) NOT NULL,
  PRIMARY KEY (`productID`,`categoryId`),
  KEY `categoryFK_idx` (`categoryId`),
  CONSTRAINT `categoryFK` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `productFK` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inCat`
--

LOCK TABLES `inCat` WRITE;
/*!40000 ALTER TABLE `inCat` DISABLE KEYS */;
INSERT INTO `inCat` VALUES ('a788ea25-12d1-11ea-bd11-40a3cc604820','1'),('a788f7e0-12d1-11ea-bd11-40a3cc604820','1'),('a789ad7f-12d1-11ea-bd11-40a3cc604820','1'),('a789ee8c-12d1-11ea-bd11-40a3cc604820','1'),('a789fc7d-12d1-11ea-bd11-40a3cc604820','1'),('a78a086d-12d1-11ea-bd11-40a3cc604820','1'),('a78a0eb9-12d1-11ea-bd11-40a3cc604820','1'),('0c022f3d-1316-11ea-a993-40a3cc604820','2'),('5db0dfb4-12e5-11ea-a993-40a3cc604820','2'),('6278d724-12e2-11ea-a993-40a3cc604820','2'),('62794da3-12e2-11ea-a993-40a3cc604820','2'),('0c0244de-1316-11ea-a993-40a3cc604820','3'),('0c025819-1316-11ea-a993-40a3cc604820','3'),('0c027521-1316-11ea-a993-40a3cc604820','3'),('0c028e96-1316-11ea-a993-40a3cc604820','3'),('8ffdd141-131c-11ea-a993-40a3cc604820','4'),('42c396ac-131c-11ea-a993-40a3cc604820','5'),('42c3b3d2-131c-11ea-a993-40a3cc604820','5'),('42c3c5ca-131c-11ea-a993-40a3cc604820','5'),('42c3e154-131c-11ea-a993-40a3cc604820','5'),('c07fb85e-131e-11ea-a993-40a3cc604820','6'),('c07fcc93-131e-11ea-a993-40a3cc604820','6');
/*!40000 ALTER TABLE `inCat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paysWith`
--

DROP TABLE IF EXISTS `paysWith`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paysWith` (
  `userID` varchar(36) NOT NULL,
  `cardNum` varchar(19) NOT NULL,
  PRIMARY KEY (`userID`,`cardNum`),
  KEY `fk_paysWith_2_idx` (`cardNum`),
  CONSTRAINT `fk_paysWith_1` FOREIGN KEY (`userID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_paysWith_2` FOREIGN KEY (`cardNum`) REFERENCES `creditCard` (`cardNum`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paysWith`
--

LOCK TABLES `paysWith` WRITE;
/*!40000 ALTER TABLE `paysWith` DISABLE KEYS */;
INSERT INTO `paysWith` VALUES ('24872575-124a-11ea-bd11-40a3cc604820','123457890');
/*!40000 ALTER TABLE `paysWith` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productID` varchar(36) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(400) NOT NULL,
  `Price` double NOT NULL,
  `Image` varchar(45) NOT NULL,
  PRIMARY KEY (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('0c022f3d-1316-11ea-a993-40a3cc604820','Nikon Z6','Mirrorless camera that includes FTZ Mount Adapter for using F-mount lenses, a memory card, and a camera bag.',1696.95,'z6.jpg'),('0c0244de-1316-11ea-a993-40a3cc604820','Iron Man 3','Plagued with worry and insomnia since saving New York from destruction, Tony Stark, now, is more dependent on the suits that give him his Iron Man persona ',5.99,'ironman3.jpg'),('0c025819-1316-11ea-a993-40a3cc604820','Han Solo','Smuggler. Scoundrel. Hero. Han Solo, captain of the Millennium Falcon, was one of the great leaders of the Rebel Alliance.',10.99,'hansolo.jpg'),('0c027521-1316-11ea-a993-40a3cc604820','Free Solo','Professional rock climber Alex Honnold attempts to conquer the first free solo climb of famed El Capitan\'s 900-metre vertical rock face at Yosemite National Park.',15.99,'freesolo.jpg'),('0c028e96-1316-11ea-a993-40a3cc604820','Moana','An adventurous teenager sails out on a daring mission to save her people.',10.99,'moana.jpg'),('42c396ac-131c-11ea-a993-40a3cc604820','Pokemon Sword','Pokémon Sword and Pokémon Shield are role-playing video games developed by Game Freak and published by The Pokémon Company and Nintendo for the Nintendo Switch.',59.99,'sword.jpg'),('42c3b3d2-131c-11ea-a993-40a3cc604820','Super Smash Bros. Ultimate','Super Smash Bros. Ultimate is a 2018 crossover fighting game developed by Bandai Namco Studios and Sora Ltd., and published by Nintendo for the Nintendo Switch.',59.99,'smash.jpg'),('42c3c5ca-131c-11ea-a993-40a3cc604820','Forza Horizon 4','Forza Horizon 4 is an open world racing video game developed by Playground Games and published by Microsoft Studios.',59.99,'forza4.jpg'),('42c3e154-131c-11ea-a993-40a3cc604820','Star Wars Jedi: Fallen Order ','Cinematic, Immersive Combat Jedi: Fallen Order delivers the fantasy of becoming a Jedi through its innovative lightsaber combat system striking, parrying, dodging partnered with a suite of powerful Force abilities you’ll need to leverage to overcome obstacles that stand in your way',59.99,'jedi.jpg'),('5db0dfb4-12e5-11ea-a993-40a3cc604820','Sony Alpha a7 III ','Mirrorless camera that is bundeled with lots of stuff',1798.99,'a7III.jpg'),('6278d724-12e2-11ea-a993-40a3cc604820','Canon EOS 5D Mark IV','Comes with spare battery, memory card, and camera bag',2499.99,'eos5d.jpg'),('62794da3-12e2-11ea-a993-40a3cc604820','Nikon D850 DSLR','Comes with  with an external hard drive and a memory card.',2796.99,'D850.jpg'),('8ffdd141-131c-11ea-a993-40a3cc604820','Cracking the Coding Interview','Cracking the Coding Interview is here to help you through this process, teaching you what you need to know and enabling you to perform at your very best.',34.99,'ctci.jpg'),('a788ea25-12d1-11ea-bd11-40a3cc604820','Google Pixel 3','Google flagship with increadible camera',549.99,'pixel3.jpg'),('a788f7e0-12d1-11ea-bd11-40a3cc604820','Google Pixel 3a','Budget Google phone with an amazing camera',299.99,'pixel3a.jpg'),('a789ad7f-12d1-11ea-bd11-40a3cc604820','Samsung Galaxy S10+','Samsung flagship with innovative punch out',699.99,'galaxys10plus.jpg'),('a789ee8c-12d1-11ea-bd11-40a3cc604820','iPhone 11 Pro','Expensive',999.99,'iphone11pro.png'),('a789fc7d-12d1-11ea-bd11-40a3cc604820','iPhone 11','Overpriced',699.99,'iphone11.png'),('a78a086d-12d1-11ea-bd11-40a3cc604820','OnePlus 7t','Flagship performance at budget phone price',599.99,'op7t.jpg'),('a78a0eb9-12d1-11ea-bd11-40a3cc604820','Samsung Galaxy Note 10','Samsung flagship with cool pen',899.99,'galaxy_note.jpg'),('c07fb85e-131e-11ea-a993-40a3cc604820','Surface Laptop 3','Slim and stylish, with 13.5” touchscreen, rich color options, and two durable finishes. Make a powerful statement and get improved speed, performance, and all-day battery life.',1199.99,'surface3.jpg'),('c07fcc93-131e-11ea-a993-40a3cc604820','Macbook Pro','Apple\'s most powerful notebooks featuring fast processors, incredible graphics, Touch Bar, and a spectacular Retina display.',1299.99,'macbookpro.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipsTo`
--

DROP TABLE IF EXISTS `shipsTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipsTo` (
  `userID` varchar(36) NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`userID`,`address`),
  CONSTRAINT `fk_shipTo_1` FOREIGN KEY (`userID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipsTo`
--

LOCK TABLES `shipsTo` WRITE;
/*!40000 ALTER TABLE `shipsTo` DISABLE KEYS */;
INSERT INTO `shipsTo` VALUES ('24872575-124a-11ea-bd11-40a3cc604820','93337f42-5e37-4b77-a975-fddb7c67fe55');
/*!40000 ALTER TABLE `shipsTo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserID` varchar(36) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `PhoneNumber` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('24872575-124a-11ea-bd11-40a3cc604820','Danny Song','dannysong@lol.com','6268020549','12345'),('abec77c8-7291-4f7b-ad69-0f20e9102efa','Eunice','eunice@lol.com','12345789','12345'),('b61e5d59-42da-49c5-b58e-f78113698aff','Mike Wu','mike@lol.com','1234567','12345'),('c38b902b-2d9f-4ad1-9cee-b0031b4f1ac3','Mitchell','mitchell@lol.com','123456789','12345');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-02 20:22:18
