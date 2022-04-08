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
-- Table structure for table `game_event_model_equip`
--

DROP TABLE IF EXISTS `game_event_model_equip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_event_model_equip` (
  `eventEntry` tinyint(4) NOT NULL COMMENT 'Entry of the game event.',
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` int(10) unsigned NOT NULL DEFAULT '0',
  `equipment_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_event_model_equip`
--

LOCK TABLES `game_event_model_equip` WRITE;
/*!40000 ALTER TABLE `game_event_model_equip` DISABLE KEYS */;
INSERT INTO `game_event_model_equip` (`eventEntry`, `guid`, `modelid`, `equipment_id`) VALUES (25,12088,0,1),(25,12093,0,1),(25,12095,0,1),(25,79670,0,1),(25,79675,0,1),(25,79690,0,1),(25,79792,0,1),(25,79807,0,1),(25,79814,0,1);
/*!40000 ALTER TABLE `game_event_model_equip` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-04 21:46:52
