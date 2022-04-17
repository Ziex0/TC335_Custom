-- MySQL dump 10.13  Distrib 5.5.37, for Win32 (x86)
--
-- Host: 192.168.178.55    Database: wotlk_world
-- ------------------------------------------------------
-- Server version	5.7.37-log

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
-- Table structure for table `custom_npc_tele_association`
--

DROP TABLE IF EXISTS `custom_npc_tele_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_npc_tele_association` (
  `cat_id` int(6) unsigned NOT NULL DEFAULT '0',
  `dest_id` int(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`,`dest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_npc_tele_association`
--

LOCK TABLES `custom_npc_tele_association` WRITE;
/*!40000 ALTER TABLE `custom_npc_tele_association` DISABLE KEYS */;
INSERT INTO `custom_npc_tele_association` (`cat_id`, `dest_id`) VALUES (1,13),(1,15),(1,18),(1,22),(1,23),(1,37),(1,39),(2,23),(2,29),(2,30),(2,37),(2,38),(2,48),(2,50),(3,1),(3,4),(3,16),(3,52),(4,2),(4,3),(4,17),(4,51),(5,11),(5,20),(5,33),(5,44),(6,6),(6,7),(6,8),(6,14),(6,25),(6,31),(6,32),(6,35),(6,36),(6,40),(6,43),(6,45),(6,46),(6,47),(6,49),(6,54),(7,9),(7,26),(7,27),(7,28),(7,34),(7,42),(7,55),(8,5),(8,10),(8,12),(8,19),(8,21),(8,24),(8,41),(8,53),(9,56);
/*!40000 ALTER TABLE `custom_npc_tele_association` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-17 18:39:42
