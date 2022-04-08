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
-- Table structure for table `achievement_dbc`
--

DROP TABLE IF EXISTS `achievement_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievement_dbc` (
  `ID` int(10) unsigned NOT NULL,
  `requiredFaction` int(11) NOT NULL DEFAULT '-1',
  `mapID` int(11) NOT NULL DEFAULT '-1',
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `refAchievement` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievement_dbc`
--

LOCK TABLES `achievement_dbc` WRITE;
/*!40000 ALTER TABLE `achievement_dbc` DISABLE KEYS */;
INSERT INTO `achievement_dbc` (`ID`, `requiredFaction`, `mapID`, `points`, `flags`, `count`, `refAchievement`) VALUES (3696,-1,-1,0,2,1,0),(4788,-1,-1,0,2,1,0),(4789,-1,-1,0,2,1,0);
/*!40000 ALTER TABLE `achievement_dbc` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-04 21:46:34
