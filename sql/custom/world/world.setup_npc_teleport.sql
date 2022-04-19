REPLACE INTO `creature_template` VALUES (95034, 0, 0, 0, 0, 0, 26502, 0, 0, 0, 'Thore Ericson', 'Globaler Reisedienst', NULL, 0, 83, 83, 0, 35, 1, 1, 1.14286, 2, 1, 0, 0, 0, 1, 1, 1, 2, 2048, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 3, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, 'npc_teleport', 0);

DROP TABLE IF EXISTS `custom_npc_tele_category`;
CREATE TABLE `custom_npc_tele_category` (
  `id` int(6) unsigned NOT NULL default '0',
  `icon` CHAR(100) NOT NULL default 'inv_misc_shadowegg',
  `size` CHAR(100) NOT NULL default '30',
  `colour` CHAR(100) NOT NULL default '000000',
  `name` varchar(255) NOT NULL default '',
  `flag` tinyint(3) unsigned NOT NULL default '0',
  `data0` bigint(20) unsigned NOT NULL default '0',
  `data1` int(6) unsigned NOT NULL default '0',
  `name_loc1` varchar(255) NOT NULL default '',
  `name_loc2` varchar(255) NOT NULL default '',
  `name_loc3` varchar(255) NOT NULL default '',
  `name_loc4` varchar(255) NOT NULL default '',
  `name_loc5` varchar(255) NOT NULL default '',
  `name_loc6` varchar(255) NOT NULL default '',
  `name_loc7` varchar(255) NOT NULL default '',
  `name_loc8` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `custom_npc_tele_destination`;
CREATE TABLE `custom_npc_tele_destination` (
  `id` int(6) unsigned NOT NULL auto_increment,
  `icon` CHAR(100) NOT NULL default 'inv_misc_shadowegg',
  `size` CHAR(100) NOT NULL default '30',
  `colour` CHAR(100) NOT NULL default '000000',
  `name` char(100) NOT NULL default '',
  `pos_X` float NOT NULL default '0',
  `pos_Y` float NOT NULL default '0',
  `pos_Z` float NOT NULL default '0',
  `map` smallint(5) unsigned NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `level` tinyint(3) unsigned NOT NULL default '0',
  `cost` int(10) unsigned NOT NULL default '0',
  `name_loc1` varchar(255) NOT NULL default '',
  `name_loc2` varchar(255) NOT NULL default '',
  `name_loc3` varchar(255) NOT NULL default '',
  `name_loc4` varchar(255) NOT NULL default '',
  `name_loc5` varchar(255) NOT NULL default '',
  `name_loc6` varchar(255) NOT NULL default '',
  `name_loc7` varchar(255) NOT NULL default '',
  `name_loc8` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `custom_npc_tele_association`;
CREATE TABLE `custom_npc_tele_association` (
  `cat_id` int(6) unsigned NOT NULL default '0',
  `dest_id` int(6) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`, `dest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE `custom_npc_tele_category`;
INSERT INTO `custom_npc_tele_category`
  (`id`, `icon`, `size`, `colour`, `name`, `flag`, `data0`, `data1`, name_loc2, name_loc3)
VALUES
   (1, 'inv_misc_shadowegg', 30, 000000, 'Cities', 0, 1, 0, "", "Städte"),
   (2, 'inv_misc_shadowegg', 30, 000000, 'Cities', 0, 2, 0, "", "Städte"),
   (3, 'inv_misc_shadowegg', 30, 000000, 'Battlegrounds', 0, 1, 0, "", "Schlachtfelder"),
   (4, 'inv_misc_shadowegg', 30, 000000, 'Battlegrounds', 0, 2, 0, "", "Schlachtfelder"),
   (5, 'inv_misc_shadowegg', 30, 000000, 'Arenas', 0, 0, 0, "", "Kampf-Arenen"),
   (6, 'inv_misc_shadowegg', 30, 000000, '[Instances Lvl 1-60]', 0, 0, 0, "", "Instanzen Level 1-60"),
   (7, 'inv_misc_shadowegg', 30, 000000, '[Instances Lvl 60+]', 5, 60, 0, "", "Instanzen Level 60+"),
   (8, 'inv_misc_shadowegg', 30, 000000, '[Instances Lvl 70+]', 5, 70, 0, "", "Instanzen Level 70+"),
   (9, 'inv_misc_shadowegg', 30, 000000, 'Destinations MJ', 3, 0, 0, "", "GM Insel");

TRUNCATE `custom_npc_tele_destination`;
INSERT INTO `custom_npc_tele_destination`
   (`id`, `icon`, `size`, `colour`, `name`, `pos_X`, `pos_Y`, `pos_Z`, `map`, `orientation`, `level`, `cost`, name_loc2, name_loc3)
VALUES
   (1, 'inv_misc_shadowegg', 30, 000000, 'Alterac Valley', 883.187, -489.375, 96.7618, 30, 3.06932, 0, 0, "", "Alteractal"),
   (2, 'inv_misc_shadowegg', 30, 000000, 'Alterac Valley', -818.155, -623.043, 54.0884, 30, 2.1, 0, 0, "", "Alteractal"),
   (3, 'inv_misc_shadowegg', 30, 000000, 'Arathi Basin', 686.053, 683.165, -12.9149, 529, 0.18, 0, 0, "", "Arathibecken"),
   (4, 'inv_misc_shadowegg', 30, 000000, 'Arathi Basin', 1308.68, 1306.03, -9.0107, 529, 3.91285, 0, 0, "", "Arathibecken"),
   (5, 'inv_misc_shadowegg', 30, 000000, 'Black Temple', -3610.72, 324.988, 37.4, 530, 3.28298, 0, 0, "", "Der Schwarze Tempel"),
   (6, 'inv_misc_shadowegg', 30, 000000, 'Blackfathom Deeps', 4254.58, 664.74, -29.04, 1, 1.97, 0, 0, "", "Tiefschwarze Grotte"),
   (7, 'inv_misc_shadowegg', 30, 000000, 'Blackrock Depths', -7301.03, -913.19, 165.37, 0, 0.08, 0, 0, "", "Schwarzfelstiefen"),
   (8, 'inv_misc_shadowegg', 30, 000000, 'Blackrock Spire', -7535.43, -1212.04, 285.45, 0, 5.29, 0, 0, "", "Schwarzfelsspitze"),
   (9, 'inv_misc_shadowegg', 30, 000000, 'Blackwing Lair', -7665.55, -1102.49, 400.679, 469, 0, 0, 0, "", "Pechschwingenhort"),
   (10, 'inv_misc_shadowegg', 30, 000000, 'Caverns of Time', -8173.66, -4746.36, 33.8423, 1, 4.93989, 0, 0, "", "Höhlen der Zeit"),
   (11, 'inv_misc_shadowegg', 30, 000000, 'Circle of Blood', 2839.44, 5930.17, 11.1002, 530, 3.16284, 0, 0, "", "Zirkels des Blutes"),
   (12, 'inv_misc_shadowegg', 30, 000000, 'Coilfang Reservoir', 517.288, 6976.28, 32.0072, 530, 0, 0, 0, "", "Der Echsenkessel"),
   (13, 'inv_misc_shadowegg', 30, 000000, 'Darnassus', 9947.52, 2482.73, 1316.21, 1, 0, 0, 0, "", "Darnassus"),
   (14, 'inv_misc_shadowegg', 30, 000000, 'Dire Maul', -3982.47, 1127.79, 161.02, 1, 0.05, 0, 0, "", "Düsterbruch"),
   (15, 'inv_misc_shadowegg', 30, 000000, 'Exodar', -4073.03, -12020.4, -1.47, 530, 0, 0, 0, "", "Die Exodar"),
   (16, 'inv_misc_shadowegg', 30, 000000, 'Eye of the Storm', 2487.72, 1609.12, 1224.64, 566, 3.35671, 0, 0, "", "Auge des Sturms"),
   (17, 'inv_misc_shadowegg', 30, 000000, 'Eye of the Storm', 1843.73, 1529.77, 1224.43, 566, 0.297579, 0, 0, "", "Auge des Sturms"),
   (18, 'inv_misc_shadowegg', 30, 000000, 'Goldshire', -9464, 62, 56, 0, 0, 0, 0, "", "Goldhain"),
   (19, 'inv_misc_shadowegg', 30, 000000, "Gruul's Lair", 3539.01, 5082.36, 1.69107, 530, 0, 0, 0, "", "Gruuls Unterschlupf"),
   (20, 'inv_misc_shadowegg', 30, 000000, 'Gurubashi', -13261.3, 168.294, 35.0792, 0, 1.00688, 0, 0, "", "Gurubashi"),
   (21, 'inv_misc_shadowegg', 30, 000000, 'Hellfire Citadel', -305.816, 3056.4, -2.47318, 530, 2.01, 0, 0, "", "Höllenfeuer"),
   (22, 'inv_misc_shadowegg', 30, 000000, 'Ironforge', -4924.07, -951.95, 501.55, 0, 5.4, 0, 0, "", "Eisenschmiede"),
   (23, 'inv_misc_shadowegg', 30, 000000, "Isle Of Quel'Danas", 12947.4, -6893.31, 5.68398, 530, 3.09154, 0, 0, "", "Insel von Quel'Danas"),
   (24, 'inv_misc_shadowegg', 30, 000000, 'Karazhan', -11118.8, -2010.84, 47.0807, 0, 0, 0, 0, "", "Karazhan"),
   (25, 'inv_misc_shadowegg', 30, 000000, 'Maraudon', -1433.33, 2955.34, 96.21, 1, 4.82, 0, 0, "", "Maraudon"),
   (26, 'inv_misc_shadowegg', 30, 000000, 'Molten Core', 1121.45, -454.317, -101.33, 230, 3.5, 0, 0, "", "Geschmolzener Kern"),
   (27, 'inv_misc_shadowegg', 30, 000000, 'Naxxramas', 3125.18, -3748.02, 136.049, 0, 0, 0, 0, "", "Naxxramas");
