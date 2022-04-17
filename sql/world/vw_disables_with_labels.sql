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
-- Temporary table structure for view `vw_disables_with_labels`
--

DROP TABLE IF EXISTS `vw_disables_with_labels`;
/*!50001 DROP VIEW IF EXISTS `vw_disables_with_labels`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_disables_with_labels` (
  `sourceType` tinyint NOT NULL,
  `entry` tinyint NOT NULL,
  `flags` tinyint NOT NULL,
  `params_0` tinyint NOT NULL,
  `params_1` tinyint NOT NULL,
  `comment` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_disables_with_labels`
--

/*!50001 DROP TABLE IF EXISTS `vw_disables_with_labels`*/;
/*!50001 DROP VIEW IF EXISTS `vw_disables_with_labels`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `vw_disables_with_labels` AS (select (case when (`disables`.`sourceType` = 0) then 'DISABLE_TYPE_SPELL' when (`disables`.`sourceType` = 1) then 'DISABLE_TYPE_QUEST' when (`disables`.`sourceType` = 2) then 'DISABLE_TYPE_MAP' when (`disables`.`sourceType` = 3) then 'DISABLE_TYPE_BATTLEGROUND' when (`disables`.`sourceType` = 4) then 'DISABLE_TYPE_ACHIEVEMENT_CRITERIA' when (`disables`.`sourceType` = 5) then 'DISABLE_TYPE_OUTDOORPVP' when (`disables`.`sourceType` = 6) then 'DISABLE_TYPE_VMAP' when (`disables`.`sourceType` = 7) then 'DISABLE_TYPE_MMAP' when (`disables`.`sourceType` = 8) then 'DISABLE_TYPE_LFG_MAP' else `disables`.`sourceType` end) AS `sourceType`,`disables`.`entry` AS `entry`,`disables`.`flags` AS `flags`,`disables`.`params_0` AS `params_0`,`disables`.`params_1` AS `params_1`,`disables`.`comment` AS `comment` from `disables`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-17 18:40:11
