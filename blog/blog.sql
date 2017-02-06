-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) DEFAULT NULL,
  `comment_parent_id` bigint(20) DEFAULT NULL,
  `comment_username` varchar(255) DEFAULT NULL,
  `comment_text` text,
  `comment_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `comment_id` (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,2,NULL,'Jessica','What about extending the operation to the rest of the world?','2017-01-17 22:56:54'),(2,2,1,'Nn Rr','lol jesus, have some patience.. someone\'s gotta test dis shit.. :- )  calm yourself','2017-01-17 23:00:58'),(3,2,NULL,'Rosa Vasquez','Worldwide release happening anytime soon?','2017-01-17 23:02:32'),(4,3,NULL,'Harvey Birdman','I\'ve just got 1 and yet another 2 extra','2017-01-17 23:13:22'),(5,3,4,'Frédéric Donckels','Pretty cool, I hope they\'ll keep it that way','2017-01-17 23:15:02'),(6,3,NULL,'Stephan Mayer','U can get much more then 3. I have seen a screenshot with 6 keys. ','2017-01-17 23:17:06'),(7,4,NULL,'Francine Daley','Awesome. Good to see 3 kiwis on the board. Thanks','2017-01-17 23:23:05'),(8,4,NULL,'Aaron Almeida','Full results link is dead.','2017-01-17 23:23:59'),(9,4,7,'Sean Graham','Is it just bug fixes and the Luminary badge string?','2017-01-17 23:25:10'),(10,2,1,'azaza','commmenetre','2017-01-30 20:08:28'),(16,5,NULL,'дед мороз','504 points while Enlightened are in control in Setouchi','2017-01-31 14:02:06'),(17,58,NULL,'санта клаус','умер на бали','2017-01-31 14:47:36'),(18,36,NULL,'Трансент','пятьсот рублей','2017-01-31 14:55:13'),(21,36,18,'нетрансент','четыреста','2017-01-31 15:30:54'),(22,36,18,'пол трансента','триста','2017-01-31 21:30:58'),(23,59,NULL,'Эксперт','брэд','2017-02-01 08:13:56'),(24,59,23,'1','нэт','2017-02-01 08:15:00'),(25,2,1,'цвцув','цвуцк','2017-02-01 10:10:05'),(26,2,3,'dssd','fgsdfg','2017-02-01 11:42:38'),(27,2,3,'ssdffgfg','sddsfsd','2017-02-01 11:42:50'),(28,2,1,'1','1','2017-02-01 12:30:03'),(29,2,2,'1','wewwwww','2017-02-01 12:36:55'),(30,2,28,'222','222','2017-02-01 12:40:52'),(31,60,NULL,'главный','главный коммент','2017-02-01 13:31:19'),(32,60,31,'второй','ответ главному','2017-02-01 13:32:18'),(33,60,32,'третий','ответ второму','2017-02-01 13:33:26'),(34,60,31,'второй ответ на гланый комент','текст','2017-02-01 13:37:55'),(35,60,32,'четвертый комент','ответ третьему','2017-02-01 13:38:42');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_admin`
--

DROP TABLE IF EXISTS `login_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_admin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_admin`
--

LOCK TABLES `login_admin` WRITE;
/*!40000 ALTER TABLE `login_admin` DISABLE KEYS */;
INSERT INTO `login_admin` VALUES (1,'admin','1');
/*!40000 ALTER TABLE `login_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `post_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_title` varchar(255) DEFAULT NULL,
  `post_min_text` text,
  `post_text` text,
  `post_create_datetime` timestamp NULL DEFAULT NULL,
  `post_update_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `post_id` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'subject','look at my poni look at my poni look at my poni look at my poni look at my poni look at my poni look at my poni look at my poni look at my poni look at my poni look at my poni look at my poni look at my poni look at my poni look at my poni look at my poni look at my poni look at my poni look at my poni look at my poni look at my poni ','                        text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body	  text body		        	','2017-01-17 22:10:46','2017-01-28 22:47:14'),(2,'Operation Portal Becon','                             Reports are coming in of the first portals to go live that were reviewed                                                                             ','                         Reports are coming in of the first portals to go live that were reviewed via Operation Portal Recon. Rejection e-mails from reviewed portals are also reported to be going out.		        			        	','2017-01-17 22:20:43','2017-01-29 12:51:26'),(3,'18','                               Get up to 3 keys without a fracker?                                                                           ','                        Get up to 3 keys without a fracker? A game changing tweak explored with Sean Graham﻿		        			        	','2017-01-17 22:22:07','2017-01-29 12:52:00'),(4,'IngressFS','Another month, another set of results from #IngressFS                                                      ','                        Another month, another set of results from #IngressFS  Jordon Mizzi takes you through the results including the special two year anniversary with some gifts.﻿﻿		        	','2017-01-17 22:23:38','2017-01-28 22:46:11'),(5,'ViaLuxLive','  dfsasdfdsfasga132546544357                               ','                                                Right now, Resistance are leading significantly in Singapore by 704 points and Macau by 504 points while Enlightened are in control in Setouchi by 570 points. Mumbai looks to be a close battle with Resistance in the lead by 34 points.		        			        	','2017-01-17 22:25:12','2017-01-29 15:12:58'),(14,'wsdasds','dasdasdas','dasdasdasdd','2017-01-29 12:56:28','2017-01-29 12:56:28'),(36,'dsfsdafgdsafdsfdsfdsf','kjghjhkjhkjkggjh','jhkhjkghjkhjkhjk','2017-01-29 20:59:06','2017-01-29 20:59:06'),(58,'1','1','1','2017-01-30 10:04:37','2017-01-30 10:04:37'),(59,'Ни о чем','                             В одной из прошлых статей «Построение иерархического дерева. Рекурсивная функция» я уже рассказывал о построении иерархического дерева.                        ','                                                В одной из прошлых статей «Построение иерархического дерева. Рекурсивная функция» я уже рассказывал о построении иерархического дерева. В сегодняшней статье я покажу Вам еще один очень интересный способ вывода иерархического дерева или древовидной структуры. А чтобы было нагляднее, я решил показать Вам, как можно организовать вывод древовидных комментариев. Обращаю Ваше внимание, что в этой статье будет затронут ТОЛЬКО ВЫВОД древовидных комментариев и не будет освещаться вопрос добавления комментариев, и все что с этим связано.\r\n\r\nПочему именно древовидные комментарии? Да потому что они встречаются практически на каждом блоге, вот я и решил рассказать Вам, как же они устроены.\r\n\r\nПервое с чего следует начать, так это с организации структуры базы данных, для хранения древовидной структуры. Структура наших древовидных комментариев ничем не будет отличаться от структуры, о которой я рассказывал в прошлой статье. Разве что у нас появятся дополнительные колонки.\r\n\r\nИтак, наша таблица в базе данных будет иметь следующие поля:		        	    		        	    ','2017-01-30 10:04:51','2017-02-01 08:11:13'),(60,'Ниочем II','                             фыпаваипдваэжыпваоижвадьямслч                         ','                        выафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюивар   ловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыдвыафывюлармвюиварловаыд		        	    ','2017-02-01 13:30:54','2017-02-01 13:31:42');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_to_tag`
--

DROP TABLE IF EXISTS `post_to_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_to_tag` (
  `post_to_tag_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  UNIQUE KEY `post_to_tag_id` (`post_to_tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_to_tag`
--

LOCK TABLES `post_to_tag` WRITE;
/*!40000 ALTER TABLE `post_to_tag` DISABLE KEYS */;
INSERT INTO `post_to_tag` VALUES (1,1,2),(2,2,5),(3,5,1),(4,3,4),(5,1,6),(6,4,5),(7,2,1),(8,3,1),(9,5,1),(10,1,7),(11,14,2),(12,14,7),(13,15,2),(14,15,5),(18,36,40),(19,36,41),(20,36,42),(21,37,43),(22,37,44),(23,37,45),(29,38,51),(30,38,52),(31,38,53),(32,38,54),(33,39,55),(34,40,56),(35,40,57),(36,40,58),(37,41,59),(38,42,0),(39,43,0),(40,44,0),(41,45,0),(42,50,60),(43,51,61),(44,52,62),(45,52,63),(46,54,64),(47,57,1),(48,58,1),(49,59,65),(50,59,66),(51,60,67);
/*!40000 ALTER TABLE `post_to_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tag_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tag_title` varchar(128) DEFAULT NULL,
  UNIQUE KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'tag'),(2,'mytag'),(3,'yourtag'),(4,'mazeltof'),(5,'karamba'),(6,'people'),(7,'ztramp'),(12,'tag2'),(13,'tag3'),(14,'tag25'),(15,'tag12'),(16,'tag8'),(37,'zxczxc'),(38,'xzcxzc'),(39,'xzczxc'),(40,'karl'),(41,'gravicapa'),(42,'kacap'),(43,'ksssarl'),(44,'grasssvicapa'),(45,'kadxfsfcap'),(51,'ksssarl'),(52,'grasssvicapa'),(65,'tag45'),(66,'мазелтоф'),(67,'Возвращение');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 15:45:59
