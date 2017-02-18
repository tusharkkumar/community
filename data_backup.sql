-- MySQL dump 10.13  Distrib 5.7.17, for Linux (i686)
--
-- Host: localhost    Database: communitybase
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
-- Table structure for table `communication`
--

DROP TABLE IF EXISTS `communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communication` (
  `id` int(11) NOT NULL,
  `send_from` varchar(255) NOT NULL,
  `send_to` varchar(255) NOT NULL,
  `message` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communication`
--

LOCK TABLES `communication` WRITE;
/*!40000 ALTER TABLE `communication` DISABLE KEYS */;
INSERT INTO `communication` VALUES (37,'tushar','preeti','hey how are you buddy'),(35,'preeti','tushar','hey how are you buddy'),(35,'preeti','tushar','i m gud yar'),(37,'tushar','preeti','hello preeti	'),(37,'tushar','preeti','hey'),(35,'preeti','tushar','hello	'),(38,'rishav','tushar','testing messages'),(37,'tushar','preeti','how are you buddy'),(35,'preeti','tushar','i m great you tell'),(35,'preeti','tushar','hey i m going to start a conversation with the best of the effort i want you to enjoy a lot with that'),(37,'tushar','preeti','ooo really cool i see'),(37,'tushar','preeti','ooo really cool i see'),(37,'tushar','rishav','testing messages'),(37,'tushar','preeti','hey cool'),(37,'tushar','preeti','hey i m going to start a conversation with the best of the effort i want you to enjoy a lot with that'),(39,'tushark','Tushar Goel','hey how are you'),(36,'Tushar Goel','tushark','i m good u tell'),(40,'sandeepk','tushar','hi saleya ki haal aa\n'),(37,'tushar','sandeepk','bus bro theek aa '),(41,'rockstar','Tushar Goel','hey	'),(42,'bunnyk','tushark','hey how are you buddy'),(39,'tushark','bunnyk','i m gud bro u tell'),(42,'bunnyk','tushark','bus i m great fine thank you'),(37,'tushar','preeti','hey'),(37,'tushar','rishav','testing messages'),(37,'tushar','preeti','hey');
/*!40000 ALTER TABLE `communication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_details`
--

DROP TABLE IF EXISTS `community_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name_community` varchar(50) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_member` tinyint(1) NOT NULL,
  `is_updated` datetime NOT NULL,
  `is_created` datetime NOT NULL,
  `is_modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_details`
--

LOCK TABLES `community_details` WRITE;
/*!40000 ALTER TABLE `community_details` DISABLE KEYS */;
INSERT INTO `community_details` VALUES (35,'preeti','tushar','preeti@gmail.com','g1',1,0,'2016-08-13 00:07:35','2016-08-13 00:07:35','2016-08-13 00:07:35'),(36,'Tushar Goel','manu21','tushar.goel821@gmail.com','TG',1,0,'2016-08-13 00:20:21','2016-08-13 00:20:21','2016-08-13 00:20:21'),(37,'tushar','TUSHAR','tushar.kumar786.tk@gmail.com','Technical Stars',1,0,'2016-08-13 00:24:47','2016-08-13 00:24:47','2016-08-13 00:24:47'),(38,'rishav','1234567','rishav@GMAIL.COM','RISHAVDON',1,0,'2016-08-14 05:20:10','2016-08-14 05:20:10','2016-08-14 05:20:10'),(39,'tushark','tushark','toofantushar786.tk@gmail.com','technostars',1,0,'2016-10-15 01:19:40','2016-10-15 01:19:40','2016-10-15 01:19:40'),(40,'sandeepk','sandytk','sandy@gmail.com','sandstrome',1,0,'2016-10-17 19:40:43','2016-10-17 19:40:43','2016-10-17 19:40:43'),(41,'rockstar','tushark','tkkumar76@gmail.com','tkrockstar',1,0,'2016-12-13 00:08:49','2016-12-13 00:08:49','2016-12-13 00:08:49'),(42,'bunnyk','tushar','kumarbuns@gmail.com','hubby',1,0,'2016-12-13 00:32:45','2016-12-13 00:32:45','2016-12-13 00:32:45');
/*!40000 ALTER TABLE `community_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_details`
--

DROP TABLE IF EXISTS `person_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_name` varchar(50) NOT NULL,
  `qualification` varchar(50) NOT NULL,
  `interests` varchar(70) NOT NULL,
  `contact_no` bigint(11) NOT NULL,
  `experiance` varchar(1000) NOT NULL,
  `requirement` varchar(1000) NOT NULL,
  `address` varchar(100) NOT NULL,
  `working_projects` varchar(1000) NOT NULL,
  `language_working` varchar(50) NOT NULL,
  `member_working` int(11) NOT NULL,
  `language_live` varchar(50) NOT NULL,
  `live_projects` varchar(1000) NOT NULL,
  `member_live` int(11) NOT NULL,
  `skills` varchar(1000) NOT NULL,
  `last_seen` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_details`
--

LOCK TABLES `person_details` WRITE;
/*!40000 ALTER TABLE `person_details` DISABLE KEYS */;
INSERT INTO `person_details` VALUES (35,'rishav','under graduate','asd',12343123412,'1year','asd ','asdaasdasdasdasdasdasd','classroom management','ruby',1,'ruby','school',2,'good in ruby,excellent in html,confidence,java,php','2016-09-26 19:14:47'),(36,'Tushar','under graduate','programming',7696249254,'3years','new languages learn','H.NO.38 Birring Jalandhar Cantt		','','',0,'','',0,'','2016-10-15 02:02:16'),(37,'tk ','under graduate','no interests',9056104621,'1year','hehe','wg 422 nakodar road niwah suraj ganj','community_site','ruby',2,'ruby','killer_star',2,'html,css,javascript,bootstrap,killer','2017-02-17 23:28:30'),(38,'RISHAV','under graduate','JAVA',12345678,'no experiance yet','JOB','NAKODAR','RJservices','ruby',2,'ruby','rj services',2,'','2016-09-26 18:14:54');
/*!40000 ALTER TABLE `person_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programminglang`
--

DROP TABLE IF EXISTS `programminglang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programminglang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruby` varchar(1000) NOT NULL,
  `html` varchar(1000) NOT NULL,
  `cplus` varchar(1000) NOT NULL,
  `java` varchar(1000) NOT NULL,
  `android` varchar(1000) NOT NULL,
  `rubyonrails` varchar(1000) NOT NULL,
  `python` varchar(1000) NOT NULL,
  `database` varchar(1000) NOT NULL,
  `php` varchar(1000) NOT NULL,
  `others` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programminglang`
--

LOCK TABLES `programminglang` WRITE;
/*!40000 ALTER TABLE `programminglang` DISABLE KEYS */;
/*!40000 ALTER TABLE `programminglang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quara`
--

DROP TABLE IF EXISTS `quara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quara` (
  `id` int(11) NOT NULL DEFAULT '0',
  `quesans` text NOT NULL,
  `shareideas` text NOT NULL,
  `complaints` varchar(100) NOT NULL,
  `user` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quara`
--

LOCK TABLES `quara` WRITE;
/*!40000 ALTER TABLE `quara` DISABLE KEYS */;
INSERT INTO `quara` VALUES (35,'','sharing done','this is the coplaint box for complaint						','preeti'),(37,'','i m sharing this with you','askdjoak','tushar');
/*!40000 ALTER TABLE `quara` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_for`
--

DROP TABLE IF EXISTS `search_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_for` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_name` bit(10) NOT NULL,
  `community_name` bit(10) NOT NULL,
  `registeredproject_name` bit(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_for`
--

LOCK TABLES `search_for` WRITE;
/*!40000 ALTER TABLE `search_for` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_for` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_paid` bit(10) NOT NULL,
  `is_free` bit(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_navigation`
--

DROP TABLE IF EXISTS `web_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_navigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `find_address` varchar(50) NOT NULL,
  `find_nearestplace` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_navigation`
--

LOCK TABLES `web_navigation` WRITE;
/*!40000 ALTER TABLE `web_navigation` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_navigation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-18 12:42:21
