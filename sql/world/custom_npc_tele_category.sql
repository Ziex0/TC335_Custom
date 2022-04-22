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
-- Table structure for table `custom_npc_tele_category`
--

DROP TABLE IF EXISTS `custom_npc_tele_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_npc_tele_category` (
  `id` int(6) unsigned NOT NULL DEFAULT '0',
  `icon` char(100) NOT NULL DEFAULT 'inv_misc_shadowegg',
  `size` char(100) NOT NULL DEFAULT '30',
  `colour` char(100) NOT NULL DEFAULT '000000',
  `name` varchar(255) NOT NULL DEFAULT '',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data0` bigint(20) unsigned NOT NULL DEFAULT '0',
  `data1` int(6) unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(255) NOT NULL DEFAULT '',
  `name_loc2` varchar(255) NOT NULL DEFAULT '',
  `name_loc3` varchar(255) NOT NULL DEFAULT '',
  `name_loc4` varchar(255) NOT NULL DEFAULT '',
  `name_loc5` varchar(255) NOT NULL DEFAULT '',
  `name_loc6` varchar(255) NOT NULL DEFAULT '',
  `name_loc7` varchar(255) NOT NULL DEFAULT '',
  `name_loc8` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_npc_tele_category`
--

LOCK TABLES `custom_npc_tele_category` WRITE;
/*!40000 ALTER TABLE `custom_npc_tele_category` DISABLE KEYS */;
INSERT INTO `custom_npc_tele_category` (`id`, `icon`, `size`, `colour`, `name`, `flag`, `data0`, `data1`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`, `name_loc6`, `name_loc7`, `name_loc8`) VALUES (1,'inv_misc_shadowegg','30','0','Cities',0,1,0,'','','Städte','','','','',''),(2,'inv_misc_shadowegg','30','0','Cities',0,2,0,'','','Städte','','','','',''),(3,'inv_misc_shadowegg','30','0','Battlegrounds',0,1,0,'','','Schlachtfelder','','','','',''),(4,'inv_misc_shadowegg','30','0','Battlegrounds',0,2,0,'','','Schlachtfelder','','','','',''),(5,'inv_misc_shadowegg','30','0','Arenas',0,0,0,'','','Kampf-Arenen','','','','',''),(6,'inv_misc_shadowegg','30','0','[Instances Lvl 1-60]',0,0,0,'','','Instanzen Level 1-60','','','','',''),(7,'inv_misc_shadowegg','30','0','[Instances Lvl 60+]',5,60,0,'','','Instanzen Level 60+','','','','',''),(8,'inv_misc_shadowegg','30','0','[Instances Lvl 70+]',5,70,0,'','','Instanzen Level 70+','','','','',''),(9,'inv_misc_shadowegg','30','0','Destinations MJ',3,0,0,'','','GM Insel','','','','','');
/*!40000 ALTER TABLE `custom_npc_tele_category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-22  3:55:39
