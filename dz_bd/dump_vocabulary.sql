-- MySQL dump 10.13  Distrib 5.5.50, for Win32 (x86)
--
-- Host: localhost    Database: Vocabulary
-- ------------------------------------------------------
-- Server version	5.5.50

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
-- Table structure for table `Dictionary`
--

DROP TABLE IF EXISTS `Dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dictionary` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `dictionary` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dictionary`
--

LOCK TABLES `Dictionary` WRITE;
/*!40000 ALTER TABLE `Dictionary` DISABLE KEYS */;
INSERT INTO `Dictionary` VALUES (1,'Sleng'),(2,'orthographic');
/*!40000 ALTER TABLE `Dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_ex`
--

DROP TABLE IF EXISTS `st_ex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_ex` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Stable_Expression` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_ex`
--

LOCK TABLES `st_ex` WRITE;
/*!40000 ALTER TABLE `st_ex` DISABLE KEYS */;
INSERT INTO `st_ex` VALUES (1,'I ran out of ammo.(У меня закончились боеприпасы.)'),(4,'You can kick his arse.(Можешь надрать ему задницу.)');
/*!40000 ALTER TABLE `st_ex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `synonym`
--

DROP TABLE IF EXISTS `synonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonym` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Synonym` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `synonym`
--

LOCK TABLES `synonym` WRITE;
/*!40000 ALTER TABLE `synonym` DISABLE KEYS */;
INSERT INTO `synonym` VALUES (1,NULL),(4,'ass');
/*!40000 ALTER TABLE `synonym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wordbook`
--

DROP TABLE IF EXISTS `wordbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wordbook` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `english` varchar(64) DEFAULT NULL,
  `translate` varchar(64) DEFAULT NULL,
  `vocabulary` varchar(64) DEFAULT NULL,
  `synonyms` varchar(64) DEFAULT NULL,
  `stable_expression` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wordbook`
--

LOCK TABLES `wordbook` WRITE;
/*!40000 ALTER TABLE `wordbook` DISABLE KEYS */;
INSERT INTO `wordbook` VALUES (1,'ammo','боеприпасы','','',''),(4,'arse','задница',NULL,NULL,NULL);
/*!40000 ALTER TABLE `wordbook` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-15 12:24:47
