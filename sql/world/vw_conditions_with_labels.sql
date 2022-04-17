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
-- Temporary table structure for view `vw_conditions_with_labels`
--

DROP TABLE IF EXISTS `vw_conditions_with_labels`;
/*!50001 DROP VIEW IF EXISTS `vw_conditions_with_labels`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_conditions_with_labels` (
  `SourceTypeOrReferenceId` tinyint NOT NULL,
  `SourceGroup` tinyint NOT NULL,
  `SourceEntry` tinyint NOT NULL,
  `SourceId` tinyint NOT NULL,
  `ElseGroup` tinyint NOT NULL,
  `ConditionTypeOrReference` tinyint NOT NULL,
  `ConditionTarget` tinyint NOT NULL,
  `ConditionValue1` tinyint NOT NULL,
  `ConditionValue2` tinyint NOT NULL,
  `ConditionValue3` tinyint NOT NULL,
  `NegativeCondition` tinyint NOT NULL,
  `ErrorType` tinyint NOT NULL,
  `ErrorTextId` tinyint NOT NULL,
  `ScriptName` tinyint NOT NULL,
  `Comment` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_conditions_with_labels`
--

/*!50001 DROP TABLE IF EXISTS `vw_conditions_with_labels`*/;
/*!50001 DROP VIEW IF EXISTS `vw_conditions_with_labels`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `vw_conditions_with_labels` AS (select (case when (`conditions`.`SourceTypeOrReferenceId` = 0) then 'CONDITION_SOURCE_TYPE_NONE' when (`conditions`.`SourceTypeOrReferenceId` = 1) then 'CONDITION_SOURCE_TYPE_CREATURE_LOOT_TEMPLATE' when (`conditions`.`SourceTypeOrReferenceId` = 2) then 'CONDITION_SOURCE_TYPE_DISENCHANT_LOOT_TEMPLATE' when (`conditions`.`SourceTypeOrReferenceId` = 3) then 'CONDITION_SOURCE_TYPE_FISHING_LOOT_TEMPLATE' when (`conditions`.`SourceTypeOrReferenceId` = 4) then 'CONDITION_SOURCE_TYPE_GAMEOBJECT_LOOT_TEMPLATE' when (`conditions`.`SourceTypeOrReferenceId` = 5) then 'CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE' when (`conditions`.`SourceTypeOrReferenceId` = 6) then 'CONDITION_SOURCE_TYPE_MAIL_LOOT_TEMPLATE' when (`conditions`.`SourceTypeOrReferenceId` = 7) then 'CONDITION_SOURCE_TYPE_MILLING_LOOT_TEMPLATE' when (`conditions`.`SourceTypeOrReferenceId` = 8) then 'CONDITION_SOURCE_TYPE_PICKPOCKETING_LOOT_TEMPLATE' when (`conditions`.`SourceTypeOrReferenceId` = 9) then 'CONDITION_SOURCE_TYPE_PROSPECTING_LOOT_TEMPLATE' when (`conditions`.`SourceTypeOrReferenceId` = 10) then 'CONDITION_SOURCE_TYPE_REFERENCE_LOOT_TEMPLATE' when (`conditions`.`SourceTypeOrReferenceId` = 11) then 'CONDITION_SOURCE_TYPE_SKINNING_LOOT_TEMPLATE' when (`conditions`.`SourceTypeOrReferenceId` = 12) then 'CONDITION_SOURCE_TYPE_SPELL_LOOT_TEMPLATE' when (`conditions`.`SourceTypeOrReferenceId` = 13) then 'CONDITION_SOURCE_TYPE_SPELL_IMPLICIT_TARGET' when (`conditions`.`SourceTypeOrReferenceId` = 14) then 'CONDITION_SOURCE_TYPE_GOSSIP_MENU' when (`conditions`.`SourceTypeOrReferenceId` = 15) then 'CONDITION_SOURCE_TYPE_GOSSIP_MENU_OPTION' when (`conditions`.`SourceTypeOrReferenceId` = 16) then 'CONDITION_SOURCE_TYPE_CREATURE_TEMPLATE_VEHICLE' when (`conditions`.`SourceTypeOrReferenceId` = 17) then 'CONDITION_SOURCE_TYPE_SPELL' when (`conditions`.`SourceTypeOrReferenceId` = 18) then 'CONDITION_SOURCE_TYPE_SPELL_CLICK_EVENT' when (`conditions`.`SourceTypeOrReferenceId` = 19) then 'CONDITION_SOURCE_TYPE_QUEST_AVAILABLE' when (`conditions`.`SourceTypeOrReferenceId` = 21) then 'CONDITION_SOURCE_TYPE_VEHICLE_SPELL' when (`conditions`.`SourceTypeOrReferenceId` = 22) then 'CONDITION_SOURCE_TYPE_SMART_EVENT' when (`conditions`.`SourceTypeOrReferenceId` = 23) then 'CONDITION_SOURCE_TYPE_NPC_VENDOR' when (`conditions`.`SourceTypeOrReferenceId` = 24) then 'CONDITION_SOURCE_TYPE_SPELL_PROC' when (`conditions`.`SourceTypeOrReferenceId` = 25) then 'CONDITION_SOURCE_TYPE_TERRAIN_SWAP' when (`conditions`.`SourceTypeOrReferenceId` = 26) then 'CONDITION_SOURCE_TYPE_PHASE' when (`conditions`.`SourceTypeOrReferenceId` = 27) then 'CONDITION_SOURCE_TYPE_GRAVEYARD' else `conditions`.`SourceTypeOrReferenceId` end) AS `SourceTypeOrReferenceId`,`conditions`.`SourceGroup` AS `SourceGroup`,`conditions`.`SourceEntry` AS `SourceEntry`,`conditions`.`SourceId` AS `SourceId`,`conditions`.`ElseGroup` AS `ElseGroup`,(case when (`conditions`.`SourceTypeOrReferenceId` = 0) then 'CONDITION_NONE' when (`conditions`.`SourceTypeOrReferenceId` = 1) then 'CONDITION_AURA' when (`conditions`.`SourceTypeOrReferenceId` = 2) then 'CONDITION_ITEM' when (`conditions`.`SourceTypeOrReferenceId` = 3) then 'CONDITION_ITEM_EQUIPPED' when (`conditions`.`SourceTypeOrReferenceId` = 4) then 'CONDITION_ZONEID' when (`conditions`.`SourceTypeOrReferenceId` = 5) then 'CONDITION_REPUTATION_RANK' when (`conditions`.`SourceTypeOrReferenceId` = 6) then 'CONDITION_TEAM' when (`conditions`.`SourceTypeOrReferenceId` = 7) then 'CONDITION_SKILL' when (`conditions`.`SourceTypeOrReferenceId` = 8) then 'CONDITION_QUESTREWARDED' when (`conditions`.`SourceTypeOrReferenceId` = 9) then 'CONDITION_QUESTTAKEN' when (`conditions`.`SourceTypeOrReferenceId` = 10) then 'CONDITION_DRUNKENSTATE' when (`conditions`.`SourceTypeOrReferenceId` = 11) then 'CONDITION_WORLD_STATE' when (`conditions`.`SourceTypeOrReferenceId` = 12) then 'CONDITION_ACTIVE_EVENT' when (`conditions`.`SourceTypeOrReferenceId` = 13) then 'CONDITION_INSTANCE_INFO' when (`conditions`.`SourceTypeOrReferenceId` = 14) then 'CONDITION_QUEST_NONE' when (`conditions`.`SourceTypeOrReferenceId` = 15) then 'CONDITION_CLASS' when (`conditions`.`SourceTypeOrReferenceId` = 16) then 'CONDITION_RACE' when (`conditions`.`SourceTypeOrReferenceId` = 17) then 'CONDITION_ACHIEVEMENT' when (`conditions`.`SourceTypeOrReferenceId` = 18) then 'CONDITION_TITLE' when (`conditions`.`SourceTypeOrReferenceId` = 19) then 'CONDITION_SPAWNMASK' when (`conditions`.`SourceTypeOrReferenceId` = 20) then 'CONDITION_GENDER' when (`conditions`.`SourceTypeOrReferenceId` = 21) then 'CONDITION_UNIT_STATE' when (`conditions`.`SourceTypeOrReferenceId` = 22) then 'CONDITION_MAPID' when (`conditions`.`SourceTypeOrReferenceId` = 23) then 'CONDITION_AREAID' when (`conditions`.`SourceTypeOrReferenceId` = 24) then 'CONDITION_CREATURE_TYPE' when (`conditions`.`SourceTypeOrReferenceId` = 25) then 'CONDITION_SPELL' when (`conditions`.`SourceTypeOrReferenceId` = 26) then 'CONDITION_PHASEMASK' when (`conditions`.`SourceTypeOrReferenceId` = 27) then 'CONDITION_LEVEL' when (`conditions`.`SourceTypeOrReferenceId` = 28) then 'CONDITION_QUEST_COMPLETE' when (`conditions`.`SourceTypeOrReferenceId` = 29) then 'CONDITION_NEAR_CREATURE' when (`conditions`.`SourceTypeOrReferenceId` = 30) then 'CONDITION_NEAR_GAMEOBJECT' when (`conditions`.`SourceTypeOrReferenceId` = 31) then 'CONDITION_OBJECT_ENTRY_GUID' when (`conditions`.`SourceTypeOrReferenceId` = 32) then 'CONDITION_TYPE_MASK' when (`conditions`.`SourceTypeOrReferenceId` = 33) then 'CONDITION_RELATION_TO' when (`conditions`.`SourceTypeOrReferenceId` = 34) then 'CONDITION_REACTION_TO' when (`conditions`.`SourceTypeOrReferenceId` = 35) then 'CONDITION_DISTANCE_TO' when (`conditions`.`SourceTypeOrReferenceId` = 36) then 'CONDITION_ALIVE' when (`conditions`.`SourceTypeOrReferenceId` = 37) then 'CONDITION_HP_VAL' when (`conditions`.`SourceTypeOrReferenceId` = 38) then 'CONDITION_HP_PCT' when (`conditions`.`SourceTypeOrReferenceId` = 39) then 'CONDITION_REALM_ACHIEVEMENT' when (`conditions`.`SourceTypeOrReferenceId` = 40) then 'CONDITION_IN_WATER' when (`conditions`.`SourceTypeOrReferenceId` = 41) then 'CONDITION_TERRAIN_SWAP' when (`conditions`.`SourceTypeOrReferenceId` = 42) then 'CONDITION_STAND_STATE' when (`conditions`.`SourceTypeOrReferenceId` = 43) then 'CONDITION_DAILY_QUEST_DONE' when (`conditions`.`SourceTypeOrReferenceId` = 44) then 'CONDITION_CHARMED' when (`conditions`.`SourceTypeOrReferenceId` = 45) then 'CONDITION_PET_TYPE' when (`conditions`.`SourceTypeOrReferenceId` = 46) then 'CONDITION_TAXI' when (`conditions`.`SourceTypeOrReferenceId` = 47) then 'CONDITION_QUESTSTATE' when (`conditions`.`SourceTypeOrReferenceId` = 48) then 'CONDITION_QUEST_OBJECTIVE_PROGRESS' when (`conditions`.`SourceTypeOrReferenceId` = 49) then 'CONDITION_DIFFICULTY_ID' when (`conditions`.`SourceTypeOrReferenceId` = 50) then 'CONDITION_GAMEMASTER' when (`conditions`.`SourceTypeOrReferenceId` = 51) then 'CONDITION_OBJECT_ENTRY_GUID_MASTER' when (`conditions`.`SourceTypeOrReferenceId` = 52) then 'CONDITION_TYPE_MASK_MASTER' else `conditions`.`ConditionTypeOrReference` end) AS `ConditionTypeOrReference`,`conditions`.`ConditionTarget` AS `ConditionTarget`,`conditions`.`ConditionValue1` AS `ConditionValue1`,`conditions`.`ConditionValue2` AS `ConditionValue2`,`conditions`.`ConditionValue3` AS `ConditionValue3`,`conditions`.`NegativeCondition` AS `NegativeCondition`,`conditions`.`ErrorType` AS `ErrorType`,`conditions`.`ErrorTextId` AS `ErrorTextId`,`conditions`.`ScriptName` AS `ScriptName`,`conditions`.`Comment` AS `Comment` from `conditions`) */;
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

-- Dump completed on 2022-04-17 18:40:10
