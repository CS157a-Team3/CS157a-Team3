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
INSERT INTO `address` VALUES ('1234 1st Street','CA','Arcadia','95112','Danny','Song','000f6bef-aa0d-4f84-9924-e0426599580b'),('746 N. 847th St.','CA','Arcadia','91006','Leann','Zhao ','06d6c223-0b60-41d8-8446-30539490732f'),('1154 S. 81st Street','CA','Arcadia','91006','Johnathan ','Smith','107454df-eb86-4f91-96f7-f1d22c9d0843'),('738 S. 5th St','CA','San Jose','95112','Frank ','Lin','4b46728b-7d80-47a9-a1e6-a75983dc27c1'),('7439 Third St.','CA','San Jose','95112','Eunice ','Sim','5b063cf8-24b4-4027-8a30-9c6d082ba09e'),('7432 First St','CA','San Jose','95112','Colin ','Chow','692d7f02-7a56-4345-b275-ae30d9a252e2'),('8574 S. First St.','CA','San Jose','95112','Mathew','Kessler','706b0294-4149-46c3-972e-9f8c68e4402f'),('1234 Main St.','CA','Arcadia','91006','Melissa','Song','83352e36-5920-4985-aa1a-65b895f01497'),('Hogwarts','CA','Somewhere','91006','Harry','Potter','853cedb1-1b51-4550-88bf-2ba63554acaf'),('7584 N. 915th St.','CA','Arcadia','91006','Jeff','Sayer','8975ffc3-20ca-4770-bd7f-69c5cc2481e0'),('8475 Death Star','CA','Space','74934','Darth ','Vader','a64a0047-cf78-47f7-a8b6-51dcecd3a100'),('8373 Second St','CA','San Jose','95112','Mike','Wu','a7f870d2-2594-4510-867d-f3907b608fca'),('583 N. 15th St','CA','San Jose','95112','Kevin','Lee','ab7098c6-b841-465a-9d01-858c327d4899'),('8409 Fairy Land','CA','Fairies','91006','Peter','Pan','e349dae1-15e3-4336-bc3a-ace2703675a1'),('1840 Fifth St','CA','San Jose','95112','John','John','e657178c-3ee0-4275-8ebd-ef822b4031eb');
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
INSERT INTO `carts` VALUES ('0fc62bb4-213b-419e-b655-7cd8e3ddc8a8',0),('20068727-df29-4a37-b5ff-816cfc2ceb9b',0),('2c0037af-f8a1-475d-a821-3dbb829bbdf6',0),('395ced40-b16a-49c3-8f7d-df641a17cb2b',0),('4836113a-d8c5-4d1e-871c-44e789eb0257',0),('59daeea0-f1f2-49e3-841d-7d4486b8feb1',0),('6bc72b14-f7ab-4ba4-8b00-c4ea92721790',0),('6d601156-b8ec-4fdb-ac36-fd50fdc5106d',0),('7f81ccb8-fb80-4301-8c57-c21d2a270645',0),('838c54bf-b836-4b27-8505-7b0cef9fe6d7',0),('8dd73680-3b27-4fee-bc82-15ac7d7a58d8',0),('8fac3217-7c92-42c3-86d3-9bfc62e9f930',0),('b3124b76-614b-4c5a-bbd0-1efc75fdd24f',0),('b56f0ae2-a444-4576-a4fa-d784b508a627',0),('e32ec436-3228-40d8-a193-d87493cf3af4',0);
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
  `cardNum` varchar(19) DEFAULT NULL,
  `cardName` varchar(50) DEFAULT NULL,
  `CVV` int(11) DEFAULT NULL,
  `expDate` varchar(6) DEFAULT NULL,
  `cardID` varchar(36) NOT NULL,
  PRIMARY KEY (`cardID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditCard`
--

LOCK TABLES `creditCard` WRITE;
/*!40000 ALTER TABLE `creditCard` DISABLE KEYS */;
INSERT INTO `creditCard` VALUES ('7483954209','Colin Chow',39,'09/22','014d24b2-0e79-4532-ab1a-663b7b6773cb'),('7589406857','Johnathan Smith ',758,'05/22','208da21e-7e23-4f27-a030-bed42850d119'),('8573948573','Mike Wu',847,'06/21','228ec534-89be-4033-9f4a-860f3cd5be11'),('7483759405','John John',748,'05/22','2804e412-831b-44e6-be9e-60387805d8c8'),('0987654321','Darth Vader',738,'05/22','2b3e40af-249e-48c9-bc3a-ed151ba5676b'),('74859463527','Darth Vader',748,'05/22','2f03010d-f559-48f2-a29b-f3e0577b311a'),('7483726590','Frank Lin',843,'05/22','361bd773-2129-4987-a2c6-2699923c17d7'),('1234567890','Danny Song',738,'01/21','366bf41f-4119-438e-a7a8-6372c626d613'),('7485948372','Harry Potter',999,'09/21','7fea1a1d-ea12-455d-a9de-16c22cb59357'),('7483749506','Eunice Sim',738,'05/19','822d807f-972b-431d-ac9c-0c51728b839f'),('8594736405','Leann Zhao',738,'06/21','8f4f0678-eea8-4657-a062-07605133d381'),('7485726354','Mathew Kessler',748,'09/22','c197d2a4-e972-43f4-9785-9753d3da55c7'),('7483929576','Peter Pan',948,'09/22','d55b6dc5-a01a-40e6-8544-4b0089b60697'),('0987654321','Melissa Song',765,'05/22','ef8e0ef1-da15-45bd-b33a-3384bfe35efa'),('8475920485','Jeff Sayer',174,'05/22','f619afbd-1395-42d5-912d-375277a76ba3'),('7485920396','Kevin Lee',567,'06/21','fc7df58c-7b48-496e-aad9-f67805b72cdd');
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
INSERT INTO `edits` VALUES ('c59362fe-3e11-4b49-8ddb-9404a360c67c','0fc62bb4-213b-419e-b655-7cd8e3ddc8a8'),('f16cc27f-9cca-4250-8654-2782ed691798','20068727-df29-4a37-b5ff-816cfc2ceb9b'),('541b7d3d-e41f-4727-b81d-2c0242f2a91b','2c0037af-f8a1-475d-a821-3dbb829bbdf6'),('f917d020-4c8b-4430-a435-737cc7cb7fc7','395ced40-b16a-49c3-8f7d-df641a17cb2b'),('af2d7de3-95ed-4aef-af05-9a349266b135','4836113a-d8c5-4d1e-871c-44e789eb0257'),('5be06677-734e-4ead-b33a-613f23201a94','59daeea0-f1f2-49e3-841d-7d4486b8feb1'),('f1cee8f7-f844-4532-aac3-8a18f625f0c3','6bc72b14-f7ab-4ba4-8b00-c4ea92721790'),('82bdc38e-d1e5-4633-9a7c-d082139e6bb5','6d601156-b8ec-4fdb-ac36-fd50fdc5106d'),('6cbf8b7c-5289-4366-984b-e437367dc592','7f81ccb8-fb80-4301-8c57-c21d2a270645'),('8f278db7-9230-4383-8e30-0ff8b33b9277','838c54bf-b836-4b27-8505-7b0cef9fe6d7'),('8a81cd30-94d6-4f21-ba7c-70ca973ee6c5','8dd73680-3b27-4fee-bc82-15ac7d7a58d8'),('95380a3f-e6fd-4e64-b92a-b809048d6125','8fac3217-7c92-42c3-86d3-9bfc62e9f930'),('e79b77c3-b816-4605-86d2-9ab8b05fa43d','b3124b76-614b-4c5a-bbd0-1efc75fdd24f'),('29711512-efbe-47ab-a253-b940468eead0','b56f0ae2-a444-4576-a4fa-d784b508a627'),('a653dad7-8378-4c10-859c-15715d959ff9','e32ec436-3228-40d8-a193-d87493cf3af4');
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
INSERT INTO `inCart` VALUES ('0fc62bb4-213b-419e-b655-7cd8e3ddc8a8','0c027521-1316-11ea-a993-40a3cc604820',1),('0fc62bb4-213b-419e-b655-7cd8e3ddc8a8','a789fc7d-12d1-11ea-bd11-40a3cc604820',1),('20068727-df29-4a37-b5ff-816cfc2ceb9b','0c027521-1316-11ea-a993-40a3cc604820',1),('20068727-df29-4a37-b5ff-816cfc2ceb9b','42c3e154-131c-11ea-a993-40a3cc604820',1),('2c0037af-f8a1-475d-a821-3dbb829bbdf6','0c022f3d-1316-11ea-a993-40a3cc604820',1),('2c0037af-f8a1-475d-a821-3dbb829bbdf6','6278d724-12e2-11ea-a993-40a3cc604820',1),('395ced40-b16a-49c3-8f7d-df641a17cb2b','a789ee8c-12d1-11ea-bd11-40a3cc604820',15),('4836113a-d8c5-4d1e-871c-44e789eb0257','c07fcc93-131e-11ea-a993-40a3cc604820',1),('59daeea0-f1f2-49e3-841d-7d4486b8feb1','a789ee8c-12d1-11ea-bd11-40a3cc604820',1),('59daeea0-f1f2-49e3-841d-7d4486b8feb1','a78a086d-12d1-11ea-bd11-40a3cc604820',1),('6bc72b14-f7ab-4ba4-8b00-c4ea92721790','62794da3-12e2-11ea-a993-40a3cc604820',1),('6d601156-b8ec-4fdb-ac36-fd50fdc5106d','8ffdd141-131c-11ea-a993-40a3cc604820',1),('7f81ccb8-fb80-4301-8c57-c21d2a270645','a789ad7f-12d1-11ea-bd11-40a3cc604820',10),('838c54bf-b836-4b27-8505-7b0cef9fe6d7','42c396ac-131c-11ea-a993-40a3cc604820',1),('838c54bf-b836-4b27-8505-7b0cef9fe6d7','42c3c5ca-131c-11ea-a993-40a3cc604820',1),('8dd73680-3b27-4fee-bc82-15ac7d7a58d8','0c028e96-1316-11ea-a993-40a3cc604820',1),('8dd73680-3b27-4fee-bc82-15ac7d7a58d8','a789ad7f-12d1-11ea-bd11-40a3cc604820',1),('8fac3217-7c92-42c3-86d3-9bfc62e9f930','0c027521-1316-11ea-a993-40a3cc604820',15),('b3124b76-614b-4c5a-bbd0-1efc75fdd24f','0c0244de-1316-11ea-a993-40a3cc604820',1),('b3124b76-614b-4c5a-bbd0-1efc75fdd24f','a789fc7d-12d1-11ea-bd11-40a3cc604820',1),('b56f0ae2-a444-4576-a4fa-d784b508a627','0c028e96-1316-11ea-a993-40a3cc604820',1),('e32ec436-3228-40d8-a193-d87493cf3af4','42c3b3d2-131c-11ea-a993-40a3cc604820',1),('e32ec436-3228-40d8-a193-d87493cf3af4','a788ea25-12d1-11ea-bd11-40a3cc604820',1);
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
  `cardID` varchar(36) NOT NULL,
  PRIMARY KEY (`userID`,`cardID`),
  KEY `fk_paysWith_2_idx` (`cardID`),
  CONSTRAINT `fk_paysWith_1` FOREIGN KEY (`userID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_paysWith_2` FOREIGN KEY (`cardID`) REFERENCES `creditCard` (`cardID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paysWith`
--

LOCK TABLES `paysWith` WRITE;
/*!40000 ALTER TABLE `paysWith` DISABLE KEYS */;
INSERT INTO `paysWith` VALUES ('541b7d3d-e41f-4727-b81d-2c0242f2a91b','014d24b2-0e79-4532-ab1a-663b7b6773cb'),('af2d7de3-95ed-4aef-af05-9a349266b135','208da21e-7e23-4f27-a030-bed42850d119'),('82bdc38e-d1e5-4633-9a7c-d082139e6bb5','228ec534-89be-4033-9f4a-860f3cd5be11'),('f917d020-4c8b-4430-a435-737cc7cb7fc7','2804e412-831b-44e6-be9e-60387805d8c8'),('f1cee8f7-f844-4532-aac3-8a18f625f0c3','2b3e40af-249e-48c9-bc3a-ed151ba5676b'),('f16cc27f-9cca-4250-8654-2782ed691798','2f03010d-f559-48f2-a29b-f3e0577b311a'),('a653dad7-8378-4c10-859c-15715d959ff9','361bd773-2129-4987-a2c6-2699923c17d7'),('f1cee8f7-f844-4532-aac3-8a18f625f0c3','366bf41f-4119-438e-a7a8-6372c626d613'),('e79b77c3-b816-4605-86d2-9ab8b05fa43d','7fea1a1d-ea12-455d-a9de-16c22cb59357'),('c59362fe-3e11-4b49-8ddb-9404a360c67c','822d807f-972b-431d-ac9c-0c51728b839f'),('5be06677-734e-4ead-b33a-613f23201a94','8f4f0678-eea8-4657-a062-07605133d381'),('95380a3f-e6fd-4e64-b92a-b809048d6125','c197d2a4-e972-43f4-9785-9753d3da55c7'),('6cbf8b7c-5289-4366-984b-e437367dc592','d55b6dc5-a01a-40e6-8544-4b0089b60697'),('29711512-efbe-47ab-a253-b940468eead0','ef8e0ef1-da15-45bd-b33a-3384bfe35efa'),('8a81cd30-94d6-4f21-ba7c-70ca973ee6c5','f619afbd-1395-42d5-912d-375277a76ba3'),('8f278db7-9230-4383-8e30-0ff8b33b9277','fc7df58c-7b48-496e-aad9-f67805b72cdd');
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
  `addressID` varchar(100) NOT NULL,
  PRIMARY KEY (`userID`,`addressID`),
  CONSTRAINT `fk_shipTo_1` FOREIGN KEY (`userID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipsTo`
--

LOCK TABLES `shipsTo` WRITE;
/*!40000 ALTER TABLE `shipsTo` DISABLE KEYS */;
INSERT INTO `shipsTo` VALUES ('29711512-efbe-47ab-a253-b940468eead0','83352e36-5920-4985-aa1a-65b895f01497'),('541b7d3d-e41f-4727-b81d-2c0242f2a91b','692d7f02-7a56-4345-b275-ae30d9a252e2'),('5be06677-734e-4ead-b33a-613f23201a94','06d6c223-0b60-41d8-8446-30539490732f'),('6cbf8b7c-5289-4366-984b-e437367dc592','e349dae1-15e3-4336-bc3a-ace2703675a1'),('82bdc38e-d1e5-4633-9a7c-d082139e6bb5','a7f870d2-2594-4510-867d-f3907b608fca'),('8a81cd30-94d6-4f21-ba7c-70ca973ee6c5','8975ffc3-20ca-4770-bd7f-69c5cc2481e0'),('8f278db7-9230-4383-8e30-0ff8b33b9277','ab7098c6-b841-465a-9d01-858c327d4899'),('95380a3f-e6fd-4e64-b92a-b809048d6125','706b0294-4149-46c3-972e-9f8c68e4402f'),('a653dad7-8378-4c10-859c-15715d959ff9','4b46728b-7d80-47a9-a1e6-a75983dc27c1'),('af2d7de3-95ed-4aef-af05-9a349266b135','107454df-eb86-4f91-96f7-f1d22c9d0843'),('c59362fe-3e11-4b49-8ddb-9404a360c67c','5b063cf8-24b4-4027-8a30-9c6d082ba09e'),('e79b77c3-b816-4605-86d2-9ab8b05fa43d','853cedb1-1b51-4550-88bf-2ba63554acaf'),('f16cc27f-9cca-4250-8654-2782ed691798','a64a0047-cf78-47f7-a8b6-51dcecd3a100'),('f1cee8f7-f844-4532-aac3-8a18f625f0c3','000f6bef-aa0d-4f84-9924-e0426599580b'),('f917d020-4c8b-4430-a435-737cc7cb7fc7','e657178c-3ee0-4275-8ebd-ef822b4031eb');
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
INSERT INTO `user` VALUES ('29711512-efbe-47ab-a253-b940468eead0','Melissa Song','melissa@lol.com','1234567890','12345'),('541b7d3d-e41f-4727-b81d-2c0242f2a91b','Colin Chow','colin@lol.com','4089587364','12345'),('5be06677-734e-4ead-b33a-613f23201a94','Leann Zhao ','leann@lol.com','8495867384','12345'),('6cbf8b7c-5289-4366-984b-e437367dc592','Peter Pan','peter@lol.com','6268020549','12345'),('82bdc38e-d1e5-4633-9a7c-d082139e6bb5','Mike Wu','mike@lol.com','8047385746','12345'),('8a81cd30-94d6-4f21-ba7c-70ca973ee6c5','Jeff Sayer','jeff@lol.com','7483960594','12345'),('8f278db7-9230-4383-8e30-0ff8b33b9277','Kevin Lee','kevin@lol.com','6267384759','12345'),('95380a3f-e6fd-4e64-b92a-b809048d6125','Mathew Kessler','mathew@lol.com','6375849384','12345'),('a653dad7-8378-4c10-859c-15715d959ff9','Frank Lin','frank@lol.com','408593827','12345'),('af2d7de3-95ed-4aef-af05-9a349266b135','Johnathan Smith','johnathan@lol.com','7463829576','12345'),('c59362fe-3e11-4b49-8ddb-9404a360c67c','Eunice Sim','eunice@lol.com','4086273849','12345'),('e79b77c3-b816-4605-86d2-9ab8b05fa43d','Harry Potter','harry@lol.com','80473857482','12345'),('f16cc27f-9cca-4250-8654-2782ed691798','Darth Vader','darth@lol.com','4089574837','12345'),('f1cee8f7-f844-4532-aac3-8a18f625f0c3','Danny Song','danny@lol.com','6268020549','12345'),('f917d020-4c8b-4430-a435-737cc7cb7fc7','John John','john@lol.com','75849374650','12345');
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

-- Dump completed on 2019-12-08 22:09:19
