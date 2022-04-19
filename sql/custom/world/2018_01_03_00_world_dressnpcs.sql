SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for creature_template_outfits
-- ----------------------------
DROP TABLE IF EXISTS `creature_template_outfits`;
CREATE TABLE `creature_template_outfits`  (
  `entry` int(10) UNSIGNED NOT NULL,
  `npcsoundsid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'entry from NPCSounds.dbc/db2',
  `race` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `class` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `gender` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 for male, 1 for female',
  `skin` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `face` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `hair` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `haircolor` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `facialhair` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `head` varchar(10) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL DEFAULT '0',
  `shoulders` varchar(10) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL DEFAULT '0',
  `body` varchar(10) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL DEFAULT '0',
  `chest` varchar(10) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL DEFAULT '0',
  `waist` varchar(10) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL DEFAULT '0',
  `legs` varchar(10) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL DEFAULT '0',
  `feet` varchar(10) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL DEFAULT '0',
  `wrists` varchar(10) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL DEFAULT '0',
  `hands` varchar(10) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL DEFAULT '0',
  `back` varchar(10) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL DEFAULT '0',
  `tabard` varchar(10) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL DEFAULT '0',
  `guildid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `description` text CHARACTER SET latin1 COLLATE latin1_german1_ci NULL,
  PRIMARY KEY (`entry`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_german1_ci COMMENT = 'Use positive values for item entries and negative to use item displayid for head, shoulders etc.' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
