-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: lekkoatletyka
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `arenas`
--

DROP TABLE IF EXISTS `arenas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arenas` (
  `arena_id` varchar(255) NOT NULL,
  `rank_id` enum('international','continental','national','usual') NOT NULL,
  `country` char(255) NOT NULL,
  `city` char(255) NOT NULL,
  PRIMARY KEY (`arena_id`),
  KEY `rank_id` (`rank_id`),
  CONSTRAINT `arenas_ibfk_1` FOREIGN KEY (`rank_id`) REFERENCES `ranks` (`rank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arenas`
--

LOCK TABLES `arenas` WRITE;
/*!40000 ALTER TABLE `arenas` DISABLE KEYS */;
INSERT INTO `arenas` VALUES ('Agrykola','usual','Poland','Warszawa'),('Kal','national','Poland','Kalisz'),('KatAWF','continental','Poland','Katowice'),('KraAWF','usual','Poland','Kraków'),('Olimpia','national','Poland','Poznań'),('OlipWro','national','Poland','Wrocław'),('Słu','national','Poland','Słubice'),('StadionŚląski','international','Poland','Chorzów'),('Suw','continental','Poland','Suwałki'),('Żer','usual','Poland','Żerków');
/*!40000 ALTER TABLE `arenas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `athlete_jump_results`
--

DROP TABLE IF EXISTS `athlete_jump_results`;
/*!50001 DROP VIEW IF EXISTS `athlete_jump_results`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `athlete_jump_results` AS SELECT 
 1 AS `athlete_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `birth_date`,
 1 AS `nationality`,
 1 AS `club`,
 1 AS `discipline`,
 1 AS `sex`,
 1 AS `result`,
 1 AS `meeting_date`,
 1 AS `stadium`,
 1 AS `stadium_city`,
 1 AS `stadium_country`,
 1 AS `meeting_rank`,
 1 AS `meeting`,
 1 AS `series`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `athlete_track_results`
--

DROP TABLE IF EXISTS `athlete_track_results`;
/*!50001 DROP VIEW IF EXISTS `athlete_track_results`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `athlete_track_results` AS SELECT 
 1 AS `athlete_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `birth_date`,
 1 AS `nationality`,
 1 AS `club`,
 1 AS `discipline`,
 1 AS `sex`,
 1 AS `result`,
 1 AS `meeting_date`,
 1 AS `stadium`,
 1 AS `stadium_city`,
 1 AS `stadium_country`,
 1 AS `meeting_rank`,
 1 AS `meeting`,
 1 AS `series`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `athletes`
--

DROP TABLE IF EXISTS `athletes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `athletes` (
  `athlete_id` int NOT NULL AUTO_INCREMENT,
  `club_id` int DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `birth` date NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `sex` enum('male','female') NOT NULL,
  PRIMARY KEY (`athlete_id`),
  KEY `club_id` (`club_id`),
  CONSTRAINT `athletes_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`club_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `athletes`
--

LOCK TABLES `athletes` WRITE;
/*!40000 ALTER TABLE `athletes` DISABLE KEYS */;
INSERT INTO `athletes` VALUES (1,1,'Piotr','Lisek','1992-08-16','Poland','male'),(2,2,'Paweł','Wojciechowski','1989-06-06','Poland','male'),(3,NULL,'Bo Kanda Lita','Baehre','1999-04-29','Poland','male'),(4,NULL,'Scott','Houston','1990-06-11','USA','male'),(5,NULL,'Mareks','Arents','1986-08-06','Latvia,','male'),(6,NULL,'Torben','Blech','1995-02-12','Germany','male'),(7,3,'Robert','Sobera','1991-01-19','Poland','male'),(8,NULL,'Emmanouil','Karalis','1999-10-20','Greece','male'),(9,2,'Karol','Pawlik','1994-03-17','Poland','male'),(10,NULL,'Mariya','Lasitskene','1993-01-14','Russia','female'),(11,NULL,'Anna','Simic','1990-05-05','Croatia','female'),(12,NULL,'Nicola','McDermott','1996-12-28','Austrialia','female'),(13,16,'Paulina','Borys','1998-05-14','Poland','female'),(14,NULL,'Inika','McPherson','1986-09-29','USA','female'),(15,2,'Adrianna','Sułek','1999-04-03','Poland','female'),(16,NULL,'Isiah','Young','1990-06-05','USA','male'),(17,NULL,'Seye','Ogunlewe','1991-08-30','Nigeria','male'),(18,NULL,'Brandon','Carnes','1995-03-06','USA','male'),(19,NULL,'Tommy','Ramdhan','1996-11-28','GB','male'),(20,NULL,'Sean','Safo-Antwi','1990-01-01','Ghana','male'),(21,NULL,'Samuel','Osewa','1991-04-17','GB','male'),(22,2,'Remigiusz','Olszewski','1992-09-20','Poland','male'),(23,NULL,'Yazaldes','Nascimento','1986-10-12','Portugal','male'),(24,15,'Ewa','Swoboda','1997-07-26','Poland','female'),(25,NULL,'Quanesha','Burks','1995-03-15','USA','female'),(26,NULL,'Luca','Kozak','1996-06-01','Hungary','female'),(27,NULL,'Nooralotta','Neziri','1992-11-09','Finland','female'),(28,17,'Ada','Kołodziej','1995-03-24','Poland','female'),(29,2,'Marika','Popowicz-Drapała','1988-04-28','Poland','female'),(30,NULL,'Yana','Kachur','1997-01-13','Ukraine','female'),(31,NULL,'Shannon','Osika','1993-06-15','USA','female'),(32,NULL,'Dariya','Barysevich','1999-04-06','Belarus','female'),(33,NULL,'Diana','Mezulianikova ','1992-04-10','Czech Republic','female'),(34,NULL,'Beyenu','Degefu','1999-07-12','Ethiopia','female'),(35,20,'Katarzyna','Jankowska','1994-01-14','Poland','female'),(36,5,'Sofia','Ennaoui','1997-01-01','Poland','female'),(37,NULL,'Betlehem','Desalegn','1991-11-13','United Arab Emirates','female'),(38,2,'Marcin','Lewandowski','1987-06-13','Poland','male'),(39,6,'Adam','Kszczot','1989-09-02','Poland','male'),(40,19,'Michał','Rozmys','1995-09-02','Poland','male'),(41,NULL,'Andrew','Osagie','1988-02-19','GB','male'),(42,NULL,'Nikolay','Verbitskiy','1990-04-13','Bosnia and Herzegovina','male'),(43,NULL,'Ali','Mohamed','1988-02-17','Dijbouti','male'),(44,NULL,'Norbert','Kolombos','1995-02-23','Kenya','male'),(45,8,'Kacper','Kozłowski','1986-03-22','Poland','male'),(46,NULL,'Steven','Gardiner','1995-09-12','Bahamas','male'),(47,NULL,'Yousif','Rabah','1986-11-12','GB','male'),(48,NULL,'Tyrell','Richard','1997-08-04','USA','male'),(49,3,'Rafał','Omelko','1989-01-16','Poland','male'),(50,4,'Jakub','Krzewina','1989-10-10','Poland','male'),(51,NULL,'Dwayne','Cowan','1985-01-01','GB','male'),(52,15,'Karol','Zalewski','1993-02-23','Poland','male'),(53,4,'Łukasz','Krawczuk','1989-06-15','Poland','male'),(54,4,'Tymoteusz','Zimny','1998-03-14','Poland','male');
/*!40000 ALTER TABLE `athletes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubs`
--

DROP TABLE IF EXISTS `clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubs` (
  `club_id` int NOT NULL AUTO_INCREMENT,
  `c_name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  PRIMARY KEY (`club_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubs`
--

LOCK TABLES `clubs` WRITE;
/*!40000 ALTER TABLE `clubs` DISABLE KEYS */;
INSERT INTO `clubs` VALUES (1,'OSOT Szczecin','Poland','Szczecin'),(2,'CWZS Zawisza Bydgoszcz SL','Poland','Bydgoszcz'),(3,'KS AZS AWF Wrocław','Poland','Wrocław'),(4,'WKS Śląsk Wrocław','Poland','Wrocław'),(5,'AZS UMCS Lublin','Poland','Lublin'),(6,'RKS Łódź','Poland','Łódź'),(7,'OŚ AZS Poznań','Poland','Poznań '),(8,'KS AZS UWM Olsztyn','Poland','Olsztyn'),(9,'MUKS Park Zduńska Wola','Poland','Zduńska Wola'),(10,'MKS Iskra Pszczyna','Poland','Pszczyna'),(11,'AZS-AWFiS Gdańsk','Poland','Gdańsk'),(12,'RLTL ZTE Radom','Poland','Radom'),(13,'KS Gwardia Piła','Poland','Piła'),(14,'KS AZS AWF Kraków','Poland','Kraków'),(15,'AZS-AWF Katowice','Poland','Katowice'),(16,'SKLA Sopot','Poland','Sopot'),(17,'UKS Sprint 2020 Warszawa','Poland','Warszawa'),(18,'KL Bałtyk Koszalin','Poland','Koszalin'),(19,'UKS Barnim Goleniów','Poland','Goleniów'),(20,'KS Podlasie Białystok','Poland','Białystok');
/*!40000 ALTER TABLE `clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplines`
--

DROP TABLE IF EXISTS `disciplines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplines` (
  `discipline_id` int NOT NULL AUTO_INCREMENT,
  `discipline` varchar(255) NOT NULL,
  `sex` enum('male','female') NOT NULL,
  `d_description` varchar(1024) NOT NULL,
  PRIMARY KEY (`discipline_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplines`
--

LOCK TABLES `disciplines` WRITE;
/*!40000 ALTER TABLE `disciplines` DISABLE KEYS */;
INSERT INTO `disciplines` VALUES (1,'100m','male','Najkrótszy dystans w biegach lekkoatletycznych na otwartym stadionie \n (w hali biega się 60 metrów), klasyczny bieg sprinterski. Rekordzistów świata na tym dystansie \n określa się często mianem „najszybszego mężczyzny/najszybszej kobiety świata”. \nRywalizacja na tym dystansie przyciąga zawsze wiele uwagi.'),(2,'100m','female','Najkrótszy dystans w biegach lekkoatletycznych na otwartym stadionie (w hali biega się 60 metrów), \nklasyczny bieg sprinterski. Rekordzistów świata na tym dystansie określa się często mianem \n„najszybszego mężczyzny/najszybszej kobiety świata”. \nRywalizacja na tym dystansie przyciąga zawsze wiele uwagi.'),(3,'200m','male','Bieg sprinterski rozgrywany zarówno na otwartym stadionie, jak i w hali.'),(4,'200m','female','Bieg sprinterski rozgrywany zarówno na otwartym stadionie, jak i w hali.'),(5,'400m','male','Najdłuższy dystans spośród biegów krótkich. Na standardowym stadionie 400 m \nstanowi dokładnie jedno okrążenie stadionu po wewnętrznym torze. W hali jest to dystans dwóch okrążeń.'),(6,'400m','female','Najdłuższy dystans spośród biegów krótkich. Na standardowym stadionie 400 m \nstanowi dokładnie jedno okrążenie stadionu po wewnętrznym torze. W hali jest to dystans dwóch okrążeń.'),(7,'800m','male','Lekkoatletyczna konkurencja biegowa, zaliczana do biegów średnich. \nNa otwartym stadionie bieg na 800 metrów to dwa okrążenia stadionu. Pierwsze 100 metrów zawodnicy \nbiegną po swoich torach, po czym mogą zbiec ku wewnętrznemu torowi.'),(8,'800m','female','Lekkoatletyczna konkurencja biegowa, zaliczana do biegów średnich. \nNa otwartym stadionie bieg na 800 metrów to dwa okrążenia stadionu. Pierwsze 100 metrów zawodnicy \nbiegną po swoich torach, po czym mogą zbiec ku wewnętrznemu torowi.'),(9,'1000m','male','Lekkoatletyczna konkurencja biegowa, zaliczana do biegów średnich. Na otwartym stadionie 1000m odpowiada dwa i pół okrążenia.'),(10,'1000m','female','Lekkoatletyczna konkurencja biegowa, zaliczana do biegów średnich. Na otwartym stadionie 1000m odpowiada dwa i pół okrążenia.'),(11,'1500m','male','Lekkoatletyczna konkurencja biegowa, zaliczana do biegów średnich. \nNa otwartym stadionie zawodnicy biegną najpierw 300 m odcinek, a później trzy pełne okrążenia stadionu.'),(12,'1500m','female','Lekkoatletyczna konkurencja biegowa, zaliczana do biegów średnich. \nNa otwartym stadionie zawodnicy biegną najpierw 300 m odcinek, a później trzy pełne okrążenia stadionu.'),(13,'5000m','male','Konkurencja lekkoatletyczna, zaliczana do biegów długich. Zawodnicy pokonują \n12,5 okrążeń bieżni stadionu bądź 25 okrążeń w hali, choć ten dystans nie jest rozgrywany na \nnajważniejszych imprezach halowych. '),(14,'5000m','female','Konkurencja lekkoatletyczna, zaliczana do biegów długich. Zawodnicy pokonują \n12,5 okrążeń bieżni stadionu bądź 25 okrążeń w hali, choć ten dystans nie jest rozgrywany na \nnajważniejszych imprezach halowych.'),(15,'10000m','male','Konkurencja lekkoatletyczna, zaliczana do biegów długich. Zawodnicy\n pokonują 25 okrążeń bieżni stadionu.'),(16,'10000m','female','Konkurencja lekkoatletyczna, zaliczana do biegów długich. Zawodnicy\n pokonują 25 okrążeń bieżni stadionu.'),(17,'long jump','male','Konkurencja lekkoatletyczna, w której zawodnicy wykonują rozbieg, \n odbijają się z jednej nogi z belki i lądują na piaszczystej części skoczni.'),(18,'long jump','female','Konkurencja lekkoatletyczna, w której zawodnicy wykonują rozbieg, \n odbijają się z jednej nogi z belki i lądują na piaszczystej części skoczni.'),(19,'high jump','male','Konkurencja lekkoatletyczna, polegająca na odbiciu się (po wykonaniu rozbiegu) i\n przeniesieniu całego ciała ponad poprzeczką zawieszoną na pionowych stojakach. Zawodnicy mają \n trzy próby na pokonanie danej wysokości.'),(20,'high jump','female','Konkurencja lekkoatletyczna, polegająca na odbiciu się (po wykonaniu rozbiegu) i\n przeniesieniu całego ciała ponad poprzeczką zawieszoną na pionowych stojakach. Zawodnicy mają \n trzy próby na pokonanie danej wysokości.'),(21,'triple jump','male','Trójskok – konkurencja lekkoatletyczna, w której zawodnik musi wykonać trzy\n następujące po sobie skoki: pierwszy – odbicie z jednej nogi i lądowanie na nogę odbijającą, \n drugi – lądowanie na nogę przeciwną, trzeci – lądowanie na piaszczystej skoczni obunóż.\n Zasady rozbiegu, odbicia, lądowania i mierzenia są identyczne jak w skoku w dal. Dwa pierwsze skoki \n odbywają się na twardej bieżni, trzeci skok kończy się na piasku.'),(22,'triple jump','female','Trójskok – konkurencja lekkoatletyczna, w której zawodnik musi wykonać trzy\n następujące po sobie skoki: pierwszy – odbicie z jednej nogi i lądowanie na nogę odbijającą, \n drugi – lądowanie na nogę przeciwną, trzeci – lądowanie na piaszczystej skoczni obunóż.\n Zasady rozbiegu, odbicia, lądowania i mierzenia są identyczne jak w skoku w dal. Dwa pierwsze skoki \n odbywają się na twardej bieżni, trzeci skok kończy się na piasku.'),(23,'pole vault','male','Konkurencja lekkoatletyczna, w której skok odbywa się na takich zasadach \n jak w skoku wzwyż, z tą różnicą, że zawodnik do pokonania poprzeczki używa tyczki.'),(24,'pole vault','female','Konkurencja lekkoatletyczna, w której skok odbywa się na takich zasadach \n jak w skoku wzwyż, z tą różnicą, że zawodnik do pokonania poprzeczki używa tyczki.');
/*!40000 ALTER TABLE `disciplines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `jump_records`
--

DROP TABLE IF EXISTS `jump_records`;
/*!50001 DROP VIEW IF EXISTS `jump_records`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `jump_records` AS SELECT 
 1 AS `discipline`,
 1 AS `sex`,
 1 AS `Record`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `nationality`,
 1 AS `club`,
 1 AS `meeting_date`,
 1 AS `stadium`,
 1 AS `stadium_city`,
 1 AS `stadium_country`,
 1 AS `meeting_rank`,
 1 AS `meeting`,
 1 AS `series`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `jump_results`
--

DROP TABLE IF EXISTS `jump_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jump_results` (
  `jump_result_id` int NOT NULL AUTO_INCREMENT,
  `athlete_id` int NOT NULL,
  `series_id` int NOT NULL,
  `result` decimal(5,3) DEFAULT NULL,
  PRIMARY KEY (`jump_result_id`),
  KEY `athlete_id` (`athlete_id`),
  KEY `series_id` (`series_id`),
  CONSTRAINT `jump_results_ibfk_1` FOREIGN KEY (`athlete_id`) REFERENCES `athletes` (`athlete_id`),
  CONSTRAINT `jump_results_ibfk_2` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jump_results`
--

LOCK TABLES `jump_results` WRITE;
/*!40000 ALTER TABLE `jump_results` DISABLE KEYS */;
INSERT INTO `jump_results` VALUES (1,1,1,5.820),(2,2,1,5.720),(3,3,1,5.620),(4,4,1,5.520),(5,5,1,5.420),(6,6,1,5.420),(7,7,1,5.220),(8,8,1,NULL),(9,9,1,NULL),(10,10,2,1.940),(11,11,2,1.900),(12,12,2,1.900),(13,13,2,1.800),(14,14,2,1.800),(15,15,2,NULL);
/*!40000 ALTER TABLE `jump_results` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `jump_dsq` AFTER UPDATE ON `jump_results` FOR EACH ROW BEGIN
    DECLARE meeting_id_dsq INT;
    SELECT meeting_id
    INTO meeting_id_dsq
    FROM jump_results j
    JOIN series ON (j.series_id=s.series_id)
    WHERE j.series_id=NEW.series_id;
    
    IF NEW.result IS NULL THEN
		CREATE TEMPORARY TABLE series_to_dsq
		SELECT series_id
		FROM series
		WHERE meeting_id = meeting_id_dsq;
	
		UPDATE jump_results
        SET result = NULL
        WHERE athlete_id=NEW.athlete_id AND meeting_id=meeting_id_dsq;

		DROP TEMPORARY TABLE series_to_dsq;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `limits`
--

DROP TABLE IF EXISTS `limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `limits` (
  `meeting_id` int NOT NULL,
  `discipline_id` int NOT NULL,
  `track_res` time(3) DEFAULT NULL,
  `jump_res` decimal(5,3) DEFAULT NULL,
  PRIMARY KEY (`meeting_id`,`discipline_id`),
  KEY `discipline_id` (`discipline_id`),
  CONSTRAINT `limits_ibfk_1` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`meeting_id`),
  CONSTRAINT `limits_ibfk_2` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`discipline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limits`
--

LOCK TABLES `limits` WRITE;
/*!40000 ALTER TABLE `limits` DISABLE KEYS */;
/*!40000 ALTER TABLE `limits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetings` (
  `meeting_id` int NOT NULL AUTO_INCREMENT,
  `rank_id` enum('international','continental','national','usual') NOT NULL,
  `arena_id` varchar(255) NOT NULL,
  `m_date` date NOT NULL,
  `m_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`meeting_id`),
  KEY `rank_id` (`rank_id`),
  KEY `arena_id` (`arena_id`),
  CONSTRAINT `meetings_ibfk_1` FOREIGN KEY (`rank_id`) REFERENCES `ranks` (`rank_id`),
  CONSTRAINT `meetings_ibfk_2` FOREIGN KEY (`arena_id`) REFERENCES `arenas` (`arena_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
INSERT INTO `meetings` VALUES (1,'usual','StadionŚląski','2019-09-14','10. Lotto Memoriał Kamili Skolimowskiej'),(2,'usual','Kal','2020-05-20','Kalisz 2020');
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ranks` (
  `rank_id` enum('international','continental','national','usual') NOT NULL,
  `rank_description` varchar(255) NOT NULL,
  PRIMARY KEY (`rank_id`),
  CONSTRAINT `ranks_chk_1` CHECK ((`rank_id` in (1,2,3,4)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranks`
--

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
INSERT INTO `ranks` VALUES ('international','Najwyższa ranga obiektu, uprawniająca obiekt do rozgrywania na nim\n zawodów takich jak igrzyska olimpijskie czy mistrzostwa świata. Ranga ta pozwala też rozgrywać zawody \n o niżej randze niż obiektu'),('continental','Ranga uprawniająca obiekt do rozgrywania na nim zawodów na poziomie kontynetalnym -\n różnego typu mistrzostwa kontynetów. Ranga ta pozwala też rozgrywać zawody \n o niżej randze niż obiektu'),('national','Ranga uprawniająca obiekt do rozgrywania na nim zawodów na poziomie narodowym - \n mistrzostwa krajów. Ranga ta pozwala też rozgrywać zawody \n o niżej randze niż obiektu'),('usual','Ranga uprawniająca obiekt do rozgrywania na nim zawodów - podstawowych meetingów. Na obiekcie o \n tej randze nie ma możliwości zorganizowania imprez mistrzowskich');
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `series_id` int NOT NULL AUTO_INCREMENT,
  `discipline_id` int NOT NULL,
  `meeting_id` int NOT NULL,
  `s_type` enum('final','semi-final','quarter-final','1/8','1/16','elimination') NOT NULL,
  PRIMARY KEY (`series_id`),
  KEY `discipline_id` (`discipline_id`),
  KEY `meeting_id` (`meeting_id`),
  CONSTRAINT `series_ibfk_1` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`discipline_id`),
  CONSTRAINT `series_ibfk_2` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`meeting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,23,1,'final'),(2,20,1,'final'),(3,1,1,'final'),(4,2,1,'final'),(5,10,1,'final'),(6,9,1,'final'),(7,5,1,'final'),(8,1,2,'final');
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signups`
--

DROP TABLE IF EXISTS `signups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signups` (
  `athlete_id` int NOT NULL,
  `meeting_id` int NOT NULL,
  `discipline_id` int NOT NULL,
  PRIMARY KEY (`athlete_id`,`meeting_id`,`discipline_id`),
  KEY `meeting_id` (`meeting_id`),
  KEY `discipline_id` (`discipline_id`),
  CONSTRAINT `signups_ibfk_1` FOREIGN KEY (`athlete_id`) REFERENCES `athletes` (`athlete_id`),
  CONSTRAINT `signups_ibfk_2` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`meeting_id`),
  CONSTRAINT `signups_ibfk_3` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`discipline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signups`
--

LOCK TABLES `signups` WRITE;
/*!40000 ALTER TABLE `signups` DISABLE KEYS */;
INSERT INTO `signups` VALUES (1,1,21),(2,1,21),(3,1,21),(4,1,21),(5,1,21),(6,1,21),(7,1,21),(8,1,21),(9,1,21),(10,1,18),(11,1,18),(12,1,18),(13,1,18),(14,1,18),(15,1,18),(16,1,1),(16,1,18),(17,1,1),(17,1,18),(18,1,1),(18,1,18),(19,1,1),(19,1,18),(20,1,1),(20,1,18),(21,1,1),(21,1,18),(22,1,1),(22,1,18),(23,1,1),(23,1,18),(24,1,1),(24,1,2),(24,1,18),(25,1,1),(25,1,2),(25,1,18),(26,1,1),(26,1,2),(26,1,18),(27,1,1),(27,1,2),(27,1,18),(28,1,1),(28,1,2),(28,1,18),(29,1,1),(29,1,2),(29,1,18),(30,1,1),(30,1,2),(30,1,18),(31,1,1),(31,1,2),(31,1,10),(31,1,18),(32,1,1),(32,1,2),(32,1,10),(32,1,18),(33,1,1),(33,1,2),(33,1,10),(33,1,18),(34,1,1),(34,1,2),(34,1,10),(34,1,18),(35,1,1),(35,1,2),(35,1,10),(35,1,18),(36,1,1),(36,1,2),(36,1,10),(36,1,18),(37,1,1),(37,1,2),(37,1,10),(37,1,18),(38,1,1),(38,1,2),(38,1,10),(38,1,18),(38,1,23),(39,1,1),(39,1,2),(39,1,10),(39,1,18),(39,1,23),(40,1,1),(40,1,2),(40,1,10),(40,1,18),(40,1,23),(41,1,1),(41,1,2),(41,1,10),(41,1,18),(41,1,23),(42,1,1),(42,1,2),(42,1,10),(42,1,18),(42,1,23),(43,1,1),(43,1,2),(43,1,10),(43,1,18),(43,1,23),(44,1,1),(44,1,2),(44,1,10),(44,1,18),(44,1,23),(45,1,1),(45,1,2),(45,1,10),(45,1,18),(45,1,23),(46,1,1),(46,1,2),(46,1,5),(46,1,10),(46,1,18),(46,1,23),(47,1,1),(47,1,2),(47,1,5),(47,1,10),(47,1,18),(47,1,23),(48,1,1),(48,1,2),(48,1,5),(48,1,10),(48,1,18),(48,1,23),(49,1,1),(49,1,2),(49,1,5),(49,1,10),(49,1,18),(49,1,23),(50,1,1),(50,1,2),(50,1,5),(50,1,10),(50,1,18),(50,1,23),(51,1,1),(51,1,2),(51,1,5),(51,1,10),(51,1,18),(51,1,23),(52,1,1),(52,1,2),(52,1,5),(52,1,10),(52,1,18),(52,1,23),(53,1,1),(53,1,2),(53,1,5),(53,1,10),(53,1,18),(53,1,23),(54,1,1),(54,1,2),(54,1,5),(54,1,10),(54,1,18),(54,1,23),(1,2,1),(2,2,1),(3,2,1),(4,2,1),(5,2,1),(6,2,1),(7,2,1),(8,2,1);
/*!40000 ALTER TABLE `signups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `track_records`
--

DROP TABLE IF EXISTS `track_records`;
/*!50001 DROP VIEW IF EXISTS `track_records`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `track_records` AS SELECT 
 1 AS `discipline`,
 1 AS `sex`,
 1 AS `Record`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `nationality`,
 1 AS `club`,
 1 AS `meeting_date`,
 1 AS `stadium`,
 1 AS `stadium_city`,
 1 AS `stadium_country`,
 1 AS `meeting_rank`,
 1 AS `meeting`,
 1 AS `series`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `track_results`
--

DROP TABLE IF EXISTS `track_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `track_results` (
  `track_result_id` int NOT NULL AUTO_INCREMENT,
  `athlete_id` int NOT NULL,
  `series_id` int NOT NULL,
  `result` time(3) DEFAULT NULL,
  PRIMARY KEY (`track_result_id`),
  KEY `athlete_id` (`athlete_id`),
  KEY `series_id` (`series_id`),
  CONSTRAINT `track_results_ibfk_1` FOREIGN KEY (`athlete_id`) REFERENCES `athletes` (`athlete_id`),
  CONSTRAINT `track_results_ibfk_2` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_results`
--

LOCK TABLES `track_results` WRITE;
/*!40000 ALTER TABLE `track_results` DISABLE KEYS */;
INSERT INTO `track_results` VALUES (1,16,3,'00:00:10.220'),(2,17,3,'00:00:10.380'),(3,18,3,'00:00:10.420'),(4,19,3,'00:00:10.420'),(5,20,3,'00:00:10.420'),(6,21,3,'00:00:10.490'),(7,22,3,'00:00:10.800'),(8,23,3,NULL),(9,24,4,'00:00:11.290'),(10,25,4,'00:00:11.520'),(11,26,4,'00:00:11.660'),(12,27,4,'00:00:11.690'),(13,28,4,'00:00:11.840'),(14,29,4,'00:00:11.840'),(15,30,4,'00:00:11.960'),(16,31,5,'00:04:01.800'),(17,32,5,'00:04:10.750'),(18,33,5,'00:04:12.830'),(19,34,5,'00:04:17.120'),(20,35,5,'00:04:17.290'),(21,36,5,'00:04:20.530'),(22,37,5,NULL),(23,38,6,'00:02:21.010'),(24,39,6,'00:02:21.420'),(25,40,6,'00:02:21.720'),(26,41,6,'00:02:22.830'),(27,42,6,'00:02:22.960'),(28,43,6,'00:02:23.950'),(29,44,6,'00:02:24.270'),(30,45,6,'00:02:24.750'),(31,46,7,'00:00:44.140'),(32,47,7,'00:00:46.020'),(33,48,7,'00:00:46.270'),(34,49,7,'00:00:46.280'),(35,50,7,'00:00:46.370'),(36,51,7,'00:00:46.610'),(37,52,7,'00:00:46.630'),(38,53,7,'00:00:46.750'),(39,54,7,'00:00:47.770'),(40,1,1,'00:00:10.220'),(41,2,1,'00:00:10.410'),(42,3,1,'00:00:10.500'),(43,4,1,'00:00:10.690'),(44,5,1,'00:00:10.800'),(45,6,1,'00:00:10.870'),(46,7,1,'00:00:10.990'),(47,8,1,'00:00:10.990');
/*!40000 ALTER TABLE `track_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'lekkoatletyka'
--
/*!50003 DROP PROCEDURE IF EXISTS `athlete_dsq` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `athlete_dsq`(IN athlete_id_p INT, meeting_id_p INT)
BEGIN
	UPDATE track_results
        SET result = NULL
        WHERE athlete_id=athlete_id_p AND series_id IN	(SELECT series_id
															FROM series
															WHERE meeting_id = meeting_id_p);
	UPDATE jump_results
        SET result = NULL
        WHERE athlete_id=athlete_id_p AND series_id IN	(SELECT series_id
															FROM series
															WHERE meeting_id = meeting_id_p);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_limit_jump` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_limit_jump`(IN meeting_id_p INT, discipline_id_p INT)
BEGIN

    DECLARE meeting_date date;
    DECLARE event_rank VARCHAR(13);
    DECLARE average_result DECIMAL(5,3);
    
	SELECT m_date
    INTO meeting_date
	FROM meetings m
	WHERE m.meeting_id=meeting_id_p;
    
    SELECT rank_id
    INTO event_rank
    FROM meetings m
    WHERE m.meeting_id=meeting_id_p;
    
    SELECT 
        AVG(j.result)
	INTO
		average_result
    FROM
        jump_results j
        JOIN athletes a ON a.athlete_id = j.athlete_id
        LEFT JOIN clubs c ON c.club_id = a.club_id
        JOIN series s ON s.series_id = j.series_id
        JOIN meetings m ON m.meeting_id = s.meeting_id
	WHERE m.m_date > DATE_ADD(meeting_date, INTERVAL -1 YEAR)
		AND m.rank_id = event_rank
		AND s.discipline_id = discipline_id_p;
    
    INSERT INTO limits (meeting_id, discipline_id, jump_res)
    VALUES (meeting_id_p, discipline_id_p, average_result)
    ON DUPLICATE KEY UPDATE jump_res=average_result;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_limit_track` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_limit_track`(IN meeting_id_p INT, discipline_id_p INT)
BEGIN

    DECLARE meeting_date date;
    DECLARE event_rank VARCHAR(13);
    DECLARE average_result TIME(3);
    
	SELECT m_date
    INTO meeting_date
	FROM meetings m
	WHERE m.meeting_id=meeting_id_p;
    
    SELECT rank_id
    INTO event_rank
    FROM meetings m
    WHERE m.meeting_id=meeting_id_p;
    
    SELECT 
        AVG(t.result)
	INTO
		average_result
    FROM
        track_results t
        JOIN athletes a ON a.athlete_id = t.athlete_id
        LEFT JOIN clubs c ON c.club_id = a.club_id
        JOIN series s ON s.series_id = t.series_id
        JOIN meetings m ON m.meeting_id = s.meeting_id
	WHERE m.m_date > DATE_ADD(meeting_date, INTERVAL -1 YEAR)
		AND m.rank_id = event_rank
		AND s.discipline_id = discipline_id_p;
    
    INSERT INTO limits (meeting_id, discipline_id, track_res)
    VALUES (meeting_id_p, discipline_id_p, average_result)
    ON DUPLICATE KEY UPDATE track_res=average_result;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `signup_jump` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `signup_jump`(IN athlete_id_p INT, meeting_id_p INT, discipline_id_p INT)
BEGIN

	DECLARE meeting_limit DECIMAL(5,3);
    DECLARE meeting_date date;
    DECLARE athlete_best_result DECIMAL(5,3);
    DECLARE event_rank VARCHAR(13);
    
	SELECT jump_res
    INTO meeting_limit
	FROM limits
	WHERE meeting_id=meeting_id_p
    AND discipline_id=discipline_id_p;
    
    SELECT m_date
    INTO meeting_date
	FROM meetings
	WHERE meeting_id=meeting_id_p;
    
    SELECT rank_id
    INTO event_rank
    FROM meetings
    WHERE meeting_id=meeting_id_p;
    
    SELECT 
        MAX(j.result)
	INTO
		athlete_best_result
    FROM
        jump_results j
        JOIN athletes a ON a.athlete_id = j.athlete_id
        LEFT JOIN clubs c ON c.club_id = a.club_id
        JOIN series s ON s.series_id = j.series_id
        JOIN meetings m ON m.meeting_id = s.meeting_id
	WHERE m.m_date > DATE_ADD(meeting_date, INTERVAL -1 YEAR)
		AND m.rank_id = event_rank
		AND s.discipline_id = discipline_id_p
        AND a.athlete_id = athlete_id_p;
    
    IF meeting_limit IS NOT NULL THEN
		IF athlete_best_result>meeting_limit THEN
			INSERT INTO signups
            VALUES (athlete_id_p, meeting_id_p, discipline_id_p);
		END IF;
	END IF;
    IF meeting_limit IS NULL THEN
 		INSERT INTO signups
 		VALUES (athlete_id_p, meeting_id_p, discipline_id_p);
     END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `signup_track` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `signup_track`(IN athlete_id_p INT, meeting_id_p INT, discipline_id_p INT)
BEGIN

    DECLARE meeting_limit TIME(3);
    DECLARE meeting_date date;
    DECLARE athlete_best_result TIME(3);
    DECLARE event_rank VARCHAR(13);
    
	SELECT track_res
    INTO meeting_limit
	FROM limits
	WHERE meeting_id=meeting_id_p
    AND discipline_id=discipline_id_p;
    
    SELECT m_date
    INTO meeting_date
	FROM meetings
	WHERE meeting_id=meeting_id_p;
    
    SELECT rank_id
    INTO event_rank
    FROM meetings
    WHERE meeting_id=meeting_id_p;
    
    SELECT 
        MIN(t.result)
	INTO
		athlete_best_result
    FROM
        track_results t
        JOIN athletes a ON a.athlete_id = t.athlete_id
        LEFT JOIN clubs c ON c.club_id = a.club_id
        JOIN series s ON s.series_id = t.series_id
        JOIN meetings m ON m.meeting_id = s.meeting_id
	WHERE m.m_date > DATE_ADD(meeting_date, INTERVAL -1 YEAR)
		AND m.rank_id = event_rank
		AND s.discipline_id = discipline_id_p
        AND a.athlete_id = athlete_id_p;
    
    IF meeting_limit IS NOT NULL THEN
		IF athlete_best_result<meeting_limit THEN
			INSERT INTO signups
            VALUES (athlete_id_p, meeting_id_p, discipline_id_p);
		END IF;
	END IF;
    IF meeting_limit IS NULL THEN
 		INSERT INTO signups
 		VALUES (athlete_id_p, meeting_id_p, discipline_id_p);
     END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `athlete_jump_results`
--

/*!50001 DROP VIEW IF EXISTS `athlete_jump_results`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `athlete_jump_results` AS select `a`.`athlete_id` AS `athlete_id`,`a`.`first_name` AS `first_name`,`a`.`last_name` AS `last_name`,`a`.`birth` AS `birth_date`,`a`.`nationality` AS `nationality`,`c`.`c_name` AS `club`,`d`.`discipline` AS `discipline`,if((`d`.`sex` = 'male'),'M','F') AS `sex`,`j`.`result` AS `result`,`m`.`m_date` AS `meeting_date`,`ar`.`arena_id` AS `stadium`,`ar`.`city` AS `stadium_city`,`ar`.`country` AS `stadium_country`,`r`.`rank_id` AS `meeting_rank`,`m`.`m_description` AS `meeting`,`s`.`s_type` AS `series` from (((((((`jump_results` `j` join `athletes` `a` on((`a`.`athlete_id` = `j`.`athlete_id`))) left join `clubs` `c` on((`c`.`club_id` = `a`.`club_id`))) join `series` `s` on((`s`.`series_id` = `j`.`series_id`))) join `disciplines` `d` on((`d`.`discipline_id` = `s`.`discipline_id`))) join `meetings` `m` on((`m`.`meeting_id` = `s`.`meeting_id`))) join `arenas` `ar` on((`ar`.`arena_id` = `m`.`arena_id`))) join `ranks` `r` on((`m`.`rank_id` = `r`.`rank_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `athlete_track_results`
--

/*!50001 DROP VIEW IF EXISTS `athlete_track_results`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `athlete_track_results` AS select `a`.`athlete_id` AS `athlete_id`,`a`.`first_name` AS `first_name`,`a`.`last_name` AS `last_name`,`a`.`birth` AS `birth_date`,`a`.`nationality` AS `nationality`,`c`.`c_name` AS `club`,`d`.`discipline` AS `discipline`,if((`d`.`sex` = 'male'),'M','F') AS `sex`,`t`.`result` AS `result`,`m`.`m_date` AS `meeting_date`,`ar`.`arena_id` AS `stadium`,`ar`.`city` AS `stadium_city`,`ar`.`country` AS `stadium_country`,`r`.`rank_id` AS `meeting_rank`,`m`.`m_description` AS `meeting`,`s`.`s_type` AS `series` from (((((((`track_results` `t` join `athletes` `a` on((`a`.`athlete_id` = `t`.`athlete_id`))) left join `clubs` `c` on((`c`.`club_id` = `a`.`club_id`))) join `series` `s` on((`s`.`series_id` = `t`.`series_id`))) join `disciplines` `d` on((`d`.`discipline_id` = `s`.`discipline_id`))) join `meetings` `m` on((`m`.`meeting_id` = `s`.`meeting_id`))) join `arenas` `ar` on((`ar`.`arena_id` = `m`.`arena_id`))) join `ranks` `r` on((`m`.`rank_id` = `r`.`rank_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jump_records`
--

/*!50001 DROP VIEW IF EXISTS `jump_records`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `jump_records` AS select `athlete_jump_results`.`discipline` AS `discipline`,`athlete_jump_results`.`sex` AS `sex`,max(`athlete_jump_results`.`result`) AS `Record`,`athlete_jump_results`.`first_name` AS `first_name`,`athlete_jump_results`.`last_name` AS `last_name`,`athlete_jump_results`.`nationality` AS `nationality`,`athlete_jump_results`.`club` AS `club`,`athlete_jump_results`.`meeting_date` AS `meeting_date`,`athlete_jump_results`.`stadium` AS `stadium`,`athlete_jump_results`.`stadium_city` AS `stadium_city`,`athlete_jump_results`.`stadium_country` AS `stadium_country`,`athlete_jump_results`.`meeting_rank` AS `meeting_rank`,`athlete_jump_results`.`meeting` AS `meeting`,`athlete_jump_results`.`series` AS `series` from `athlete_jump_results` group by `athlete_jump_results`.`discipline`,`athlete_jump_results`.`sex` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `track_records`
--

/*!50001 DROP VIEW IF EXISTS `track_records`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `track_records` AS select `athlete_track_results`.`discipline` AS `discipline`,`athlete_track_results`.`sex` AS `sex`,min(`athlete_track_results`.`result`) AS `Record`,`athlete_track_results`.`first_name` AS `first_name`,`athlete_track_results`.`last_name` AS `last_name`,`athlete_track_results`.`nationality` AS `nationality`,`athlete_track_results`.`club` AS `club`,`athlete_track_results`.`meeting_date` AS `meeting_date`,`athlete_track_results`.`stadium` AS `stadium`,`athlete_track_results`.`stadium_city` AS `stadium_city`,`athlete_track_results`.`stadium_country` AS `stadium_country`,`athlete_track_results`.`meeting_rank` AS `meeting_rank`,`athlete_track_results`.`meeting` AS `meeting`,`athlete_track_results`.`series` AS `series` from `athlete_track_results` group by `athlete_track_results`.`discipline`,`athlete_track_results`.`sex` */;
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

-- Dump completed on 2020-05-22 23:56:08
