CREATE DATABASE  IF NOT EXISTS `viva` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `viva`;
-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: viva
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bv`
--

DROP TABLE IF EXISTS `bv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bv`
--

LOCK TABLES `bv` WRITE;
/*!40000 ALTER TABLE `bv` DISABLE KEYS */;
INSERT INTO `bv` VALUES (1,'Common Good','Common Good',1),(2,'Public Interest','Public Interest',1),(4,'Social cohesion','Social cohesion',1),(5,'Altruism','Altruism',1),(6,'Human dignity','Human dignity',1),(7,'Sustainability','Sustainability',1),(8,'Voice of the future','Voice of the future',1),(9,'Regime dignity','Regime dignity',1),(10,'Regime Stability','Regime Stability',1),(11,'Majority rule','Majority rule',1),(12,'Democracy','Democracy',1),(13,'Will of the people','Will of the people',1),(14,'Collective choice','Collective choice',1),(15,'User Democracy','User Democracy',1),(16,'Local governance','Local governance',1),(17,'Citizen involvement','Citizen involvement',1),(18,'Protection of minories','Protection of minories',1),(19,'Protection of individual rights','Protection of individual rights',1),(20,'Political loyalty','Political loyalty',1),(21,'Accountability','Accountability',1);
/*!40000 ALTER TABLE `bv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (0,'admin','admin'),(5,'Manager','project managers');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epic`
--

DROP TABLE IF EXISTS `epic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `epic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `project` int(11) DEFAULT NULL,
  `sprint` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `description` text,
  `created_by` varchar(100) NOT NULL,
  `lmb` varchar(100) DEFAULT NULL,
  `lmd` date DEFAULT NULL,
  `viva` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `epic_project_fk_idx` (`project`),
  KEY `epic_sprint_fk_idx` (`sprint`),
  KEY `epic_createdBy_fk_idx` (`created_by`),
  CONSTRAINT `epic_createdBy_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `epic_project_fk` FOREIGN KEY (`project`) REFERENCES `project` (`id`),
  CONSTRAINT `epic_sprint_fk` FOREIGN KEY (`sprint`) REFERENCES `sprint` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epic`
--

LOCK TABLES `epic` WRITE;
/*!40000 ALTER TABLE `epic` DISABLE KEYS */;
INSERT INTO `epic` VALUES (2,'asdf',6,NULL,0,NULL,'sample sprint description','manager1@mail.com','manager1@mail.com',NULL,NULL),(3,'xyz epic',6,NULL,0,NULL,'sample epic description','manager1@mail.com','manager1@mail.com',NULL,NULL),(4,'sample epic 123',6,NULL,6,NULL,'asdfsdfasdf','manager1@mail.com','manager1@mail.com',NULL,NULL);
/*!40000 ALTER TABLE `epic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epic_bv`
--

DROP TABLE IF EXISTS `epic_bv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `epic_bv` (
  `eid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  `viva` int(11) DEFAULT NULL,
  PRIMARY KEY (`eid`,`bid`),
  KEY `epic_epicbv_fk_idx` (`bid`),
  CONSTRAINT `epic_epicbv_fk` FOREIGN KEY (`bid`) REFERENCES `bv` (`id`),
  CONSTRAINT `epic_epicid_fk` FOREIGN KEY (`eid`) REFERENCES `epic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epic_bv`
--

LOCK TABLES `epic_bv` WRITE;
/*!40000 ALTER TABLE `epic_bv` DISABLE KEYS */;
/*!40000 ALTER TABLE `epic_bv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `job_type` varchar(10) NOT NULL,
  `comment` text NOT NULL,
  `hdate` date NOT NULL,
  `owner` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,1,'PJ','Created','2019-06-02','manager1@mail.com'),(2,1,'PJ','Created','2019-06-02','manager1@mail.com'),(3,1,'ab','new business value added','2019-06-05','admin@mail.com'),(4,1,'ab','new business value added','2019-06-05','admin@mail.com'),(5,1,'ab','new business value added','2019-06-05','admin@mail.com'),(6,1,'ab','new business value added','2019-06-05','admin@mail.com'),(7,1,'ab','new business value added','2019-06-05','admin@mail.com'),(8,1,'ab','new business value added','2019-06-05','admin@mail.com'),(9,1,'ab','new business value added','2019-06-05','admin@mail.com'),(10,1,'ab','new business value added','2019-06-05','admin@mail.com'),(11,1,'ab','new business value added','2019-06-05','admin@mail.com'),(12,1,'ab','new business value added','2019-06-05','admin@mail.com'),(13,1,'ab','new business value added','2019-06-05','admin@mail.com'),(14,1,'ab','new business value added','2019-06-05','admin@mail.com'),(15,1,'ab','new business value added','2019-06-05','admin@mail.com'),(16,1,'ab','new business value added','2019-06-05','admin@mail.com'),(17,1,'ab','new business value added','2019-06-05','admin@mail.com'),(18,1,'ab','new business value added','2019-06-05','admin@mail.com'),(19,1,'ab','new business value added','2019-06-05','admin@mail.com'),(20,1,'ab','new business value added','2019-06-05','admin@mail.com'),(21,1,'ab','new business value added','2019-06-05','admin@mail.com'),(22,1,'ab','new business value added','2019-06-05','admin@mail.com');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_bv`
--

DROP TABLE IF EXISTS `p_bv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `p_bv` (
  `pid` int(11) NOT NULL,
  `bvid` int(11) NOT NULL,
  `viva` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`,`bvid`),
  KEY `pbv_bvfk_idx` (`bvid`),
  CONSTRAINT `pbv_bvfk` FOREIGN KEY (`bvid`) REFERENCES `bv` (`id`),
  CONSTRAINT `pbv_pidfk` FOREIGN KEY (`pid`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_bv`
--

LOCK TABLES `p_bv` WRITE;
/*!40000 ALTER TABLE `p_bv` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_bv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `priority` varchar(45) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `manager` varchar(100) DEFAULT NULL,
  `description` text NOT NULL,
  `modified_by` varchar(100) DEFAULT NULL,
  `modified_on` date NOT NULL,
  `status` varchar(50) DEFAULT 'Not Started',
  `viva` int(11) DEFAULT '0',
  `created_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `created_by_fk_idx` (`created_by`),
  CONSTRAINT `created_by_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (5,'sample project','3','2019-06-01','2019-06-30','manager1@mail.com','manager1@mail.com','sample description','manager1@mail.com','2019-06-02','Open',0,'2019-06-02'),(6,'demo project','0','2000-01-01','2000-01-01','manager1@mail.com','','demo description.','manager1@mail.com','2019-06-02','Not Started',0,'2019-06-02'),(7,'new project','0','2000-01-01','2000-01-01','manager1@mail.com','','sample project description','manager1@mail.com','2019-06-02','Not Started',0,'2019-06-02');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_bv`
--

DROP TABLE IF EXISTS `s_bv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `s_bv` (
  `sid` int(11) NOT NULL,
  `bvid` int(11) NOT NULL,
  `viva` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`,`bvid`),
  KEY `sbv_bvfk_idx` (`bvid`),
  CONSTRAINT `sbv_bvfk` FOREIGN KEY (`bvid`) REFERENCES `bv` (`id`),
  CONSTRAINT `sbv_sidfk` FOREIGN KEY (`sid`) REFERENCES `sprint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_bv`
--

LOCK TABLES `s_bv` WRITE;
/*!40000 ALTER TABLE `s_bv` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_bv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sprint`
--

DROP TABLE IF EXISTS `sprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sprint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `project` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT '0',
  `manager` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `description` text,
  `last_modified_by` varchar(100) DEFAULT NULL,
  `last_modified_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(45) DEFAULT 'Not Started',
  `viva` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `project_id_fk_idx` (`project`),
  KEY `manager_fk_idx` (`manager`),
  KEY `created_fk_idx` (`created_by`),
  KEY `last_modified_fk_idx` (`last_modified_by`),
  CONSTRAINT `createdByFk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `projectFk` FOREIGN KEY (`project`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sprint`
--

LOCK TABLES `sprint` WRITE;
/*!40000 ALTER TABLE `sprint` DISABLE KEYS */;
INSERT INTO `sprint` VALUES (13,'sample sprint',7,0,'null','2019-06-01','2019-06-30','manager1@mail.com','sample description','manager1@mail.com','2019-06-12 22:06:51','Not Started',NULL);
/*!40000 ALTER TABLE `sprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_bv`
--

DROP TABLE IF EXISTS `us_bv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `us_bv` (
  `usid` int(11) NOT NULL,
  `bvid` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `viva` int(11) DEFAULT NULL,
  PRIMARY KEY (`usid`),
  KEY `usbv_bv_fk_idx` (`bvid`),
  CONSTRAINT `usbv_bv_fk` FOREIGN KEY (`bvid`) REFERENCES `bv` (`id`),
  CONSTRAINT `usbv_usidFk` FOREIGN KEY (`usid`) REFERENCES `user` (`department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_bv`
--

LOCK TABLES `us_bv` WRITE;
/*!40000 ALTER TABLE `us_bv` DISABLE KEYS */;
/*!40000 ALTER TABLE `us_bv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `department` int(11) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `security_question` varchar(200) NOT NULL,
  `security_answer` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_department_idx` (`department`),
  CONSTRAINT `user_department` FOREIGN KEY (`department`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin@mail.com','admin','admin','2019-05-02',0,'admin','admin','admin','admin'),('manager1@mail.com','manager','1','2019-05-09',5,'manager','manager','manager','manager');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_story`
--

DROP TABLE IF EXISTS `user_story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_story` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project` int(11) DEFAULT NULL,
  `sprint` int(11) DEFAULT NULL,
  `epic` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `priority` varchar(45) DEFAULT '0',
  `status` varchar(45) DEFAULT 'Not Started',
  `created_by` varchar(100) DEFAULT NULL,
  `description` text,
  `lmb` varchar(100) DEFAULT NULL,
  `lmd` date DEFAULT NULL,
  `viva` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `usCreatedByFk_idx` (`created_by`),
  KEY `usProjectFk_idx` (`project`),
  KEY `usSprintFk_idx` (`sprint`),
  KEY `usEpicFk_idx` (`epic`),
  CONSTRAINT `usCreatedByFk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `usEpicFk` FOREIGN KEY (`epic`) REFERENCES `epic` (`id`),
  CONSTRAINT `usProjectFk` FOREIGN KEY (`project`) REFERENCES `project` (`id`),
  CONSTRAINT `usSprintFk` FOREIGN KEY (`sprint`) REFERENCES `sprint` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_story`
--

LOCK TABLES `user_story` WRITE;
/*!40000 ALTER TABLE `user_story` DISABLE KEYS */;
INSERT INTO `user_story` VALUES (3,6,NULL,3,'sample user story 1','6','Not Started','manager1@mail.com','sample description','manager1@mail.com','2019-06-13',NULL),(4,6,NULL,4,'sample user story','15','Not Started','manager1@mail.com','sample desct\\rtion','manager1@mail.com','2019-06-13',NULL);
/*!40000 ALTER TABLE `user_story` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-13 11:51:01
