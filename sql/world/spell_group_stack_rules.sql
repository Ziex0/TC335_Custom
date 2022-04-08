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
-- Table structure for table `spell_group_stack_rules`
--

DROP TABLE IF EXISTS `spell_group_stack_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_group_stack_rules` (
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `stack_rule` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spell_group_stack_rules`
--

LOCK TABLES `spell_group_stack_rules` WRITE;
/*!40000 ALTER TABLE `spell_group_stack_rules` DISABLE KEYS */;
INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`) VALUES (1,1),(2,1),(1001,1),(1002,4),(1003,4),(1004,4),(1005,4),(1006,1),(1007,1),(1008,1),(1009,1),(1010,2),(1011,2),(1015,3),(1016,4),(1019,3),(1022,4),(1025,3),(1029,1),(1033,1),(1036,4),(1037,3),(1038,3),(1046,4),(1048,4),(1051,3),(1054,3),(1055,4),(1056,3),(1058,3),(1059,3),(1060,3),(1061,4),(1062,4),(1083,4),(1084,4),(1085,4),(1086,4),(1087,4),(1088,4),(1089,4),(1090,4),(1093,4),(1094,3),(1095,4),(1096,4),(1097,1),(1098,4),(1099,2),(1100,1),(1101,3),(1104,1),(1105,3),(1106,1),(1107,4),(1108,4),(1109,1),(1110,1),(1121,1),(1111,1),(1023,4),(1024,4),(1112,1),(1122,4),(1123,1),(68529,1);
/*!40000 ALTER TABLE `spell_group_stack_rules` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-04 21:47:13
