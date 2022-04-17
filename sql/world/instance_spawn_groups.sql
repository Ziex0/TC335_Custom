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
-- Table structure for table `instance_spawn_groups`
--

DROP TABLE IF EXISTS `instance_spawn_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_spawn_groups` (
  `instanceMapId` smallint(5) unsigned NOT NULL,
  `bossStateId` tinyint(3) unsigned NOT NULL,
  `bossStates` tinyint(3) unsigned NOT NULL,
  `spawnGroupId` int(10) unsigned NOT NULL,
  `flags` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`instanceMapId`,`bossStateId`,`spawnGroupId`,`bossStates`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_spawn_groups`
--

LOCK TABLES `instance_spawn_groups` WRITE;
/*!40000 ALTER TABLE `instance_spawn_groups` DISABLE KEYS */;
INSERT INTO `instance_spawn_groups` (`instanceMapId`, `bossStateId`, `bossStates`, `spawnGroupId`, `flags`) VALUES (249,0,23,10,1),(565,0,23,11,1),(565,1,23,12,1),(544,0,23,13,1),(616,0,23,14,1),(615,1,23,15,1),(615,2,23,16,1),(615,3,23,17,1),(615,0,23,18,1),(724,0,23,19,1),(724,2,23,20,1),(724,1,23,21,1),(724,3,23,22,1),(576,0,23,23,1),(576,1,23,24,1),(576,2,23,25,1),(576,3,23,26,1),(576,4,23,27,1),(624,0,23,28,1),(624,1,23,29,1),(624,2,23,30,1),(624,3,23,31,1),(604,0,23,32,1),(604,1,23,33,1),(604,2,23,34,1),(604,3,23,35,1),(604,4,23,36,1),(658,0,23,39,1),(658,1,23,40,1),(658,2,23,41,1),(658,0,23,42,1),(658,1,23,42,1),(658,0,23,43,1),(658,1,23,43,1),(632,0,23,37,1),(632,1,23,38,1),(550,0,23,44,1),(550,1,23,45,1),(550,2,23,46,1),(550,3,23,47,1),(543,0,23,48,1),(543,1,23,49,1),(543,2,8,49,2),(543,3,8,49,2),(543,1,23,50,1),(543,2,23,51,1),(543,3,8,51,2),(469,0,23,59,1),(469,1,23,60,1),(469,2,23,61,1),(469,5,23,62,1),(469,3,23,63,1),(469,4,23,64,1),(469,6,23,65,1),(469,7,23,66,1);
/*!40000 ALTER TABLE `instance_spawn_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-17 18:39:49
