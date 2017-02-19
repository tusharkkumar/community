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
INSERT INTO `communication` VALUES (1,'tushar','tushki','asda'),(2,'tushki','tushar','i got it');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_details`
--

LOCK TABLES `community_details` WRITE;
/*!40000 ALTER TABLE `community_details` DISABLE KEYS */;
INSERT INTO `community_details` VALUES (1,'tushar','tkkumar','tushar.kumar786.tk@gmail.com','jasa',1,0,'2017-02-18 15:33:08','2017-02-18 15:33:08','2017-02-18 15:33:08'),(2,'tushki','tkkumar','kumarbuns@gmail.com','tkstar',1,0,'2017-02-18 22:38:22','2017-02-18 22:38:22','2017-02-18 22:38:22'),(3,'sameer','tkkumar','samgupta@gmail.com','samking',1,0,'2017-02-18 22:41:56','2017-02-18 22:41:56','2017-02-18 22:41:56');
/*!40000 ALTER TABLE `community_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` int(11) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live_project`
--

DROP TABLE IF EXISTS `live_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live_project` (
  `id` int(11) DEFAULT NULL,
  `live_projects` varchar(10) DEFAULT NULL,
  `member_no` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_project`
--

LOCK TABLES `live_project` WRITE;
/*!40000 ALTER TABLE `live_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `live_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_details`
--

DROP TABLE IF EXISTS `person_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_name` varchar(10) DEFAULT NULL,
  `qualification` varchar(50) DEFAULT NULL,
  `interests` varchar(70) DEFAULT NULL,
  `contact_no` bigint(11) DEFAULT NULL,
  `experiance` varchar(1000) DEFAULT NULL,
  `requirement` varchar(1000) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `working_projects` varchar(1000) DEFAULT NULL,
  `language_working` varchar(50) DEFAULT NULL,
  `member_working` int(11) DEFAULT NULL,
  `language_live` varchar(50) DEFAULT NULL,
  `live_projects` varchar(1000) DEFAULT NULL,
  `member_live` int(11) DEFAULT NULL,
  `skills` varchar(10000) DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_details`
--

LOCK TABLES `person_details` WRITE;
/*!40000 ALTER TABLE `person_details` DISABLE KEYS */;
INSERT INTO `person_details` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-20 00:56:27'),(2,'tuski','under graduate','ruby,python,rails ',9056104621,'1year','no specified requirements','wg 422 nakodar road niwah suraj ganj	',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-20 01:03:14');
/*!40000 ALTER TABLE `person_details` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `quara` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tk`
--

DROP TABLE IF EXISTS `tk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tk` (
  `id` int(10) NOT NULL,
  `contact` int(10) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tk`
--

LOCK TABLES `tk` WRITE;
/*!40000 ALTER TABLE `tk` DISABLE KEYS */;
INSERT INTO `tk` VALUES (1,NULL,NULL);
/*!40000 ALTER TABLE `tk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `working_project`
--

DROP TABLE IF EXISTS `working_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `working_project` (
  `id` int(11) DEFAULT NULL,
  `working_projects` varchar(10) DEFAULT NULL,
  `member_no` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `working_project`
--

LOCK TABLES `working_project` WRITE;
/*!40000 ALTER TABLE `working_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `working_project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-20  1:07:31
