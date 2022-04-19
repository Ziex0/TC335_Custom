REPLACE INTO `creature_template` VALUES (95030, 0, 0, 0, 0, 0, 30072, 0, 0, 0, 'Jeanine Blutaxt', 'Handelsverbund', 'Buy', 57025, 80, 80, 0, 35, 129, 1, 1.14286, 1, 0, 0, 1500, 0, 1, 1, 1, 512, 2048, 8, 0, 7, 138412032, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 0);

REPLACE INTO `creature_template_outfits` (`entry`, `race`, `gender`, `skin`, `face`, `hair`, `haircolor`, `facialhair`, `head`, `shoulders`, `body`, `chest`, `waist`, `legs`, `feet`, `wrists`, `hands`, `back`, `tabard`)
VALUES (3000000123, 11, 1, 14, 4, 10, 3, 5, -31286, -43617, 0, -26267, -26270, -26272, 0, 0, -43698, 0, 0);
UPDATE `creature_template` SET `modelid2` = 3000000123 WHERE `entry` = 95030;
