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
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bv`
--

LOCK TABLES `bv` WRITE;
/*!40000 ALTER TABLE `bv` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epic`
--

LOCK TABLES `epic` WRITE;
/*!40000 ALTER TABLE `epic` DISABLE KEYS */;
INSERT INTO `epic` VALUES (1,'manager1@mail.com',1,NULL,0,NULL,'		      asdafs','manager1@mail.com','manager1@mail.com',NULL,NULL);
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
  KEY `ebv_bvidfk_idx` (`bid`),
  CONSTRAINT `ebv_bvidfk` FOREIGN KEY (`bid`) REFERENCES `bv` (`id`),
  CONSTRAINT `ebv_eidfk` FOREIGN KEY (`eid`) REFERENCES `epic` (`id`)
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
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `comment` text,
  `ttime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
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
  KEY `pbv_bvidfk_idx` (`bvid`),
  CONSTRAINT `pbv_bvidfk` FOREIGN KEY (`bvid`) REFERENCES `bv` (`id`),
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
  `modified_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT 'Not Started',
  `viva` int(11) DEFAULT '0',
  `created_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `created_by_fk_idx` (`created_by`),
  CONSTRAINT `created_by_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'28 project','0','2019-05-02','2019-05-31','manager1@mail.com','','sadfasdfasdf','manager1@mail.com','2019-05-28 16:45:12','Not Started',0,NULL),(2,'sample project','0','2019-05-08','2019-05-31','manager1@mail.com','','sample description','manager1@mail.com','2019-05-28 16:52:54','Not Started',0,NULL);
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
  KEY `sbv_bvidfk_idx` (`bvid`),
  CONSTRAINT `sbv_bvidfk` FOREIGN KEY (`bvid`) REFERENCES `bv` (`id`),
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
  KEY `project_id_fk_idx` (`project`),
  KEY `manager_fk_idx` (`manager`),
  KEY `created_fk_idx` (`created_by`),
  KEY `last_modified_fk_idx` (`last_modified_by`),
  CONSTRAINT `createdByFk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `projectFk` FOREIGN KEY (`project`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sprint`
--

LOCK TABLES `sprint` WRITE;
/*!40000 ALTER TABLE `sprint` DISABLE KEYS */;
INSERT INTO `sprint` VALUES (3,'dd',1,4,'null','2019-05-01','2019-05-31','manager1@mail.com','fff','null','2019-05-28 23:00:49','Work in progress',NULL),(4,'sample sprint under project 28',2,0,'null','2019-05-01','2019-05-11','manager1@mail.com','dasfasf',NULL,'2019-05-29 07:16:02','Not Started',NULL);
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
  KEY `usbv_bvidFk_idx` (`bvid`),
  CONSTRAINT `usbv_bvidFk` FOREIGN KEY (`bvid`) REFERENCES `bv` (`id`),
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
  `priority` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `description` text,
  `lmb` varchar(100) DEFAULT NULL,
  `lmd` date DEFAULT NULL,
  `viva` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usCreatedByFk_idx` (`created_by`),
  KEY `usProjectFk_idx` (`project`),
  KEY `usSprintFk_idx` (`sprint`),
  KEY `usEpicFk_idx` (`epic`),
  CONSTRAINT `usCreatedByFk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `usEpicFk` FOREIGN KEY (`epic`) REFERENCES `epic` (`id`),
  CONSTRAINT `usProjectFk` FOREIGN KEY (`project`) REFERENCES `project` (`id`),
  CONSTRAINT `usSprintFk` FOREIGN KEY (`sprint`) REFERENCES `sprint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_story`
--

LOCK TABLES `user_story` WRITE;
/*!40000 ALTER TABLE `user_story` DISABLE KEYS */;
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

-- Dump completed on 2019-05-29  8:30:41
