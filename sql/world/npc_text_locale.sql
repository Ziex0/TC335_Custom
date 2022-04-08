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
-- Table structure for table `npc_text_locale`
--

DROP TABLE IF EXISTS `npc_text_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `npc_text_locale` (
  `ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Locale` varchar(4) NOT NULL,
  `Text0_0` longtext,
  `Text0_1` longtext,
  `Text1_0` longtext,
  `Text1_1` longtext,
  `Text2_0` longtext,
  `Text2_1` longtext,
  `Text3_0` longtext,
  `Text3_1` longtext,
  `Text4_0` longtext,
  `Text4_1` longtext,
  `Text5_0` longtext,
  `Text5_1` longtext,
  `Text6_0` longtext,
  `Text6_1` longtext,
  `Text7_0` longtext,
  `Text7_1` longtext,
  PRIMARY KEY (`ID`,`Locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npc_text_locale`
--

LOCK TABLES `npc_text_locale` WRITE;
/*!40000 ALTER TABLE `npc_text_locale` DISABLE KEYS */;
INSERT INTO `npc_text_locale` (`ID`, `Locale`, `Text0_0`, `Text0_1`, `Text1_0`, `Text1_1`, `Text2_0`, `Text2_1`, `Text3_0`, `Text3_1`, `Text4_0`, `Text4_1`, `Text5_0`, `Text5_1`, `Text6_0`, `Text6_1`, `Text7_0`, `Text7_1`) VALUES (518,'deDE','Viel zu tun, viel zu tun! Der Verband hat uns Fristen gesetzt, die wir besser nicht überschreiten sollten!','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(519,'deDE','Direktor Riddlevox hat mir die Verantwortung für das Schredder-Entwicklungsprogramm des Verbands übertragen. Ich bin erst wenige Monate dabei und sitze schon in der Tinte! Ich könnte Eure Hilfe brauchen, $n!','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2433,'deDE','Hallo, Ihr da! Man nennt mich Gregan. Was kann ich für Euch tun?','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2638,'deDE','Willkommen im Camp Mojache, oh $C. Wie kann ich Euch heute dienen?','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3293,'deDE','Hallo, $N. Willkommen in der Zuflucht.','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3553,'deDE','Ich kam von Süden nach Crossroads und suchte Hilfe, $C, finde aber nur Feiglinge, die sich von mir abwenden - selbst der mächtige Thork beleidigt mich auf diese Weise. Er ist ein großer Anführer, aber dass er mein Flehen nicht erhört, erzürnt mich doch sehr.$B$BEr behauptet, meine Wut mache mich unbedacht, sie beeinträchtige mein Urteilsvermögen, aber ich werde erst ruhen, wenn ich mich gerächt habe!','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3753,'deDE','Willkommen an der Front, $C. Politiker mögen ja vielleicht an einem Tag untereinander gemeinsame Sache machen und am nächsten Tag Ränke gegeneinander schmieden, aber so etwas können wir uns hier nicht leisten. Dies ist das Bollwerk, hier kämpfen wir jeden Tag erneut um unser Überleben.$B$BWenn Ihr hergekommen seid, um Euch als $GHeld:Heldin; zu beweisen, dann werdet Ihr hier reichlich Gelegenheit dazu haben... vor allem, sobald wir auf Andorhal vorstoßen - auf Andorhal und auf die bösartige Macht, die dort die Geißel kontrolliert.','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4782,'deDE','Willkommen, $g mein Bruder:meine Schwester;. Wenn Ihr hier seid um zu lernen, dann bin ich nur zu gern bereit, Euch auszubilden.$B$BEs gehen Gerüchte um von Zwistigkeiten innerhalb des Zirkels des Cenarius, aber Ihr solltet solch leichtfertigem Gerede keinen Glauben schenken. Unser Erzdruide, Fandral Staghelm, führt uns und ganz Teldrassil zum Ruhm!','Willkommen, $g mein Bruder:meine Schwester;. Wenn Ihr hier seid um zu lernen, dann bin ich nur zu gern bereit, Euch auszubilden.$B$BEs gehen Gerüchte um von Zwistigkeiten innerhalb des Zirkels des Cenarius, aber Ihr solltet solch leichtfertigem Gerede keinen Glauben schenken. Unser Erzdruide, Fandral Staghelm, führt uns und ganz Teldrassil zum Ruhm!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4935,'deDE','Seid gegrüßt, $N, und willkommen im Camp Narache. Die Kunde Eures Kommens hat sich wie ein Lauffeuer im Stamm verbreitet.','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4937,'deDE','Hmmm, Ihr seht mir recht handfest aus. Vielleicht könnt Ihr mir bei ein, zwei Dingen zur Hand gehen. Außer ein paar Lehrlingen, die noch grün hinter den Ohren sind und anderes zu tun haben, gibt es hier nicht viel Hilfe.','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5529,'deDE','','Hört Ihr den Ruf der Jagd, $C? Ihr müsst genau hinhören, denn der Ruf kommt aus Eurem Inneren. Er kommt tief aus dem Inneren von uns allen.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7114,'deDE','Vielleicht war das doch nicht so ein guter Standpunkt für ein Geschäft...','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7240,'deDE','','Mystische Waren und Bedarfsartikel sind mein Geschäft, $g Fremder:Fremde;.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7790,'deDE','','Oh, das ist einfach! Ihr verwendet sie wie alles andere, das man aktivieren muss. Keine Sorge, ich kümmere mich um den Zünder. Sobald Ihr in der Luft seid, werdet Ihr feststellen, dass Ihr zu \"schweben\" scheint, aber das hält nicht ewig an. Ihr müsst ein Ziel weit hinten auf dem See anvisieren. Vergesst nicht Euren Landeanflug zur richtigen Zeit zu beginnen, indem Ihr Eure \"Flügel\" ausbreitet, um auch im Wasser zu landen... mh, ja, ich verkaufe keine Lebensversicherungen.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8077,'deDE','Metzens Augen leuchten voller Rentierglück auf, als Ihr ihn mit Staub berieselt. Er schüttelt sein Geweih und atmet mit einem schweren Seufzer aus, der wie eine Erleichterung klingt.$B$BMagische Energie beginnt sich um Euch herum auszudehnen. Es scheint ganz so, als ob etwas passieren würde!','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8321,'deDE','Der Inhalt der Seiten dieses Buch scheint in ständiger Bewegung inbegriffen zu sein.Ihr fühlt Euch, als würden Euch Eure Gedanken entrissen und von dem Buch verzehrt.','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8332,'deDE','Thrall hat mir große Güte gezeigt, als er mir Schutz in seinem Reich anbot. Ich will nicht länger hier verweilen, als ich willkommen bin. Es wäre eine große Schmach für mich, wenn ich unseren Anführer in Gefahr bringen sollte.','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8358,'deDE','','Seid gegrüßt, $C. Bitte entschuldigt mich, da ich noch ein Wörtchen mit Rimblat zu reden habe. Er ist der Meinung, dass selbst diese Länder noch gerettet werden können.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8174,'deDE','Urahne Hammershout hält sich innerhalb der Mauern von Stormwind auf.','Urahne Hammershout hält sich innerhalb der Mauern von Stormwind auf.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8179,'deDE','Urahnin Moonstrike kann in der Küstenstadt Auberdine an der Dunkelküste angetroffen werden.','Urahnin Moonstrike kann in der Küstenstadt Auberdine an der Dunkelküste angetroffen werden.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8186,'deDE','Urahne High Mountain ist im Camp Taurajo im Brachland.','Urahne High Mountain ist im Camp Taurajo im Brachland.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8187,'deDE','Urahne Moonwarden wacht über Crossroads im Brachland.','Urahne Moonwarden wacht über Crossroads im Brachland.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8188,'deDE','Urahne Ezra Wheathoof genießt die Aussicht auf Mulgore von Thunder Bluff aus.','Urahne Ezra Wheathoof genießt die Aussicht auf Mulgore von Thunder Bluff aus.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8190,'deDE','Urahnin Morningdew wurde dabei beobachtet, sich die Rennen auf der Illusionenrennbahn in Tausend Nadeln anzusehen.','Urahnin Morningdew wurde dabei beobachtet, sich die Rennen auf der Illusionenrennbahn in Tausend Nadeln anzusehen.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8195,'deDE','Ich glaube Urahne Splitrock ist nach Maraudon in Desolace gereist.','Ich glaube Urahne Splitrock ist nach Maraudon in Desolace gereist.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13321,'deDE','','Von diesem Dock aus fährt die Bravado zwischen Sturmwind und Auberdine hin und her.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `npc_text_locale` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-04 21:46:59
