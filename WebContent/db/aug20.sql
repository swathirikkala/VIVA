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
INSERT INTO `bv` VALUES (1,'Common Good','Common Good',0),(2,'Public Interest','Public Interest',1),(4,'Social cohesion','Social cohesion',1),(5,'Altruism','Altruism',1),(6,'Human dignity','Human dignity',1),(7,'Sustainability','Sustainability',1),(8,'Voice of the future','Voice of the future',1),(9,'Regime dignity','Regime dignity',1),(10,'Regime Stability','Regime Stability',1),(11,'Majority rule','Majority rule',1),(12,'Democracy','Democracy',1),(13,'Will of the people','Will of the people',1),(14,'Collective choice','Collective choice',1),(15,'User Democracy','User Democracy',1),(16,'Local governance','Local governance',1),(17,'Citizen involvement','Citizen involvement',1),(18,'Protection of minories','Protection of minories',1),(19,'Protection of individual rights','Protection of individual rights',1),(20,'Political loyalty','Political loyalty',1),(21,'Accountability','Accountability',1);
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
  KEY `epic_project_fk_idx` (`project`),
  KEY `epic_createdBy_fk_idx` (`created_by`),
  CONSTRAINT `epic_createdBy_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `epic_project_fk` FOREIGN KEY (`project`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epic`
--

LOCK TABLES `epic` WRITE;
/*!40000 ALTER TABLE `epic` DISABLE KEYS */;
INSERT INTO `epic` VALUES (10,'Tenants safety feature',17,0,2,'null','All the Tenants registered with the council should be able to complain  to the council in case of any disturbances','manager1@mail.com','manager1@mail.com',NULL,68),(11,'Reduction of manpower in customer care',17,NULL,0,NULL,'Reduction of an manpower in the council to answer calls regarding status updated of issues raised by Tenants','manager1@mail.com','manager1@mail.com',NULL,NULL),(12,'a feature to report about stray dogs online to council',18,NULL,2,NULL,'an online feature to report stray dogs to coucil','manager1@mail.com','manager1@mail.com',NULL,NULL),(13,'track my request',18,NULL,2,NULL,'the user should be able to track the request ','manager1@mail.com','manager1@mail.com',NULL,39),(14,'Adopt stray dogs',17,NULL,5,NULL,'a feature to adopt the listed stray dogs','manager1@mail.com','manager1@mail.com',NULL,NULL),(15,'Report lost dogs',18,NULL,1,NULL,'a feature to report the  lost dogs','manager1@mail.com','manager1@mail.com',NULL,NULL);
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
  `viva` int(11) DEFAULT '0',
  `comment` varchar(450) DEFAULT '',
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
INSERT INTO `epic_bv` VALUES (10,1,1,0,'this feature helps people to connect more with the council'),(10,2,1,0,'this feature is much requested from the public'),(10,17,1,0,'this feature helps to gather feedback from the public'),(12,1,1,0,''),(12,2,1,0,''),(13,16,1,0,''),(13,19,1,0,''),(13,21,1,0,''),(14,1,1,0,''),(14,14,1,0,''),(15,1,1,0,''),(15,2,1,0,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,1,'PJ','Created','2019-06-02','manager1@mail.com'),(2,1,'PJ','Created','2019-06-02','manager1@mail.com'),(3,1,'ab','new business value added','2019-06-05','admin@mail.com'),(4,1,'ab','new business value added','2019-06-05','admin@mail.com'),(5,1,'ab','new business value added','2019-06-05','admin@mail.com'),(6,1,'ab','new business value added','2019-06-05','admin@mail.com'),(7,1,'ab','new business value added','2019-06-05','admin@mail.com'),(8,1,'ab','new business value added','2019-06-05','admin@mail.com'),(9,1,'ab','new business value added','2019-06-05','admin@mail.com'),(10,1,'ab','new business value added','2019-06-05','admin@mail.com'),(11,1,'ab','new business value added','2019-06-05','admin@mail.com'),(12,1,'ab','new business value added','2019-06-05','admin@mail.com'),(13,1,'ab','new business value added','2019-06-05','admin@mail.com'),(14,1,'ab','new business value added','2019-06-05','admin@mail.com'),(15,1,'ab','new business value added','2019-06-05','admin@mail.com'),(16,1,'ab','new business value added','2019-06-05','admin@mail.com'),(17,1,'ab','new business value added','2019-06-05','admin@mail.com'),(18,1,'ab','new business value added','2019-06-05','admin@mail.com'),(19,1,'ab','new business value added','2019-06-05','admin@mail.com'),(20,1,'ab','new business value added','2019-06-05','admin@mail.com'),(21,1,'ab','new business value added','2019-06-05','admin@mail.com'),(22,1,'ab','new business value added','2019-06-05','admin@mail.com'),(23,8,'PJ','Created','2019-06-22','manager1@mail.com'),(24,1,'nu','Created','2019-06-23','admin@mail.com'),(25,1,'nu','Created','2019-06-24','admin@mail.com'),(26,9,'PJ','Created','2019-06-24','manager1@mail.com'),(27,13,'PJ','Created','2019-07-03','manager1@mail.com'),(28,14,'PJ','Created','2019-07-03','manager1@mail.com'),(29,15,'PJ','Created','2019-07-03','manager1@mail.com'),(30,16,'PJ','Created','2019-07-03','manager1@mail.com'),(31,17,'PJ','Created','2019-07-04','manager1@mail.com'),(32,18,'PJ','Created','2019-07-05','manager1@mail.com'),(33,1,'nu','Created','2019-08-20','admin@mail.com'),(34,1,'nu','Created','2019-08-20','admin@mail.com'),(35,1,'nu','Created','2019-08-20','admin@mail.com');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (17,'Residents well being','0','2019-07-04','2019-08-31','manager1@mail.com','rikkala.swathi@gmail.com','an application is to be developed to ensure that the residents of the council can login ,complain and track their requests.','manager1@mail.com','2019-07-04','Work in progress',78,'2019-07-04'),(18,'Stray dogs project','0','2019-07-05','2019-07-31','manager1@mail.com','rikkala.swathi@gmail.com','a project to report the stray dogs to the council','manager1@mail.com','2019-07-05','Not Started',66,'2019-07-05');
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
  KEY `project_id_fk_idx` (`project`),
  KEY `manager_fk_idx` (`manager`),
  KEY `created_fk_idx` (`created_by`),
  KEY `last_modified_fk_idx` (`last_modified_by`),
  CONSTRAINT `createdByFk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `projectFk` FOREIGN KEY (`project`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sprint`
--

LOCK TABLES `sprint` WRITE;
/*!40000 ALTER TABLE `sprint` DISABLE KEYS */;
INSERT INTO `sprint` VALUES (19,'Sprint 1',17,1,'null','2019-07-04','2019-07-11','manager1@mail.com','','manager1@mail.com','2019-07-04 19:34:39','Not Started',79),(21,'sprint sample',18,1,'null','2019-07-05','2019-07-19','manager1@mail.com','test',NULL,'2019-07-05 10:27:53','Not Started',87),(22,'Sprint 2',17,0,'null','2019-07-10','2019-07-17','manager1@mail.com','','manager1@mail.com','2019-07-10 07:32:23','Not Started',76),(23,'Sprint 1',17,0,'null','2019-08-16','2019-08-23','manager1@mail.com','testing','manager1@mail.com','2019-08-16 08:41:26','Not Started',NULL),(24,'Sprint 11',18,2,'null','2019-08-02','2019-08-30','manager1@mail.com','ASD',NULL,'2019-08-20 10:57:39','Not Started',NULL);
/*!40000 ALTER TABLE `sprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(450) NOT NULL,
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'team A',1),(2,'Team B',1);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_bv`
--

DROP TABLE IF EXISTS `us_bv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `us_bv` (
  `usid` int(11) NOT NULL,
  `bvid` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  `viva` int(11) DEFAULT '0',
  `comment` varchar(450) DEFAULT '',
  PRIMARY KEY (`usid`,`bvid`),
  KEY `usbv_bv_fk_idx` (`bvid`),
  CONSTRAINT `bvid_bvfk` FOREIGN KEY (`bvid`) REFERENCES `bv` (`id`),
  CONSTRAINT `usid_usfk` FOREIGN KEY (`usid`) REFERENCES `user_story` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_bv`
--

LOCK TABLES `us_bv` WRITE;
/*!40000 ALTER TABLE `us_bv` DISABLE KEYS */;
INSERT INTO `us_bv` VALUES (14,1,1,100,''),(14,4,1,65,''),(15,21,1,76,''),(16,1,1,50,''),(16,2,1,100,''),(17,1,1,75,''),(17,2,1,60,''),(17,6,1,85,''),(18,12,1,45,''),(18,16,1,0,''),(18,19,1,0,''),(18,21,1,75,''),(19,1,1,100,''),(19,2,1,0,''),(20,17,1,100,''),(21,21,1,75,''),(22,1,1,100,'this feature helps people to connect more with the council'),(22,2,1,0,'this feature is much requested from the public'),(22,12,1,0,'it gives flexibility to the user to log issues anytime anywhere'),(22,17,1,50,'this feature helps to gather feedback from the public');
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
  `project` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('abc@gmail.com','abc','xyz','2019-08-20',5,'Project Owner','abc','What was your childhood nickname?','abc',17),('admin@mail.com','admin','admin','2019-05-02',0,'admin','admin','admin','admin',0),('manager1@mail.com','manager','1','2019-05-09',5,'manager','manager','manager','manager',0),('rikkala.swathi@gmail.com','swathi','rikkala','2015-02-11',5,'developer','password','pet name','chocky',0),('sap.koduri@gmail.com','demo','user','2019-06-01',5,'manager','password','name','demo',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_invite`
--

DROP TABLE IF EXISTS `user_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_invite` (
  `user_email` varchar(100) NOT NULL,
  `project` int(11) NOT NULL,
  `department` varchar(250) NOT NULL,
  `status` varchar(45) DEFAULT 'invited',
  `token` varchar(450) NOT NULL,
  `invited_by` varchar(100) NOT NULL,
  `invited_on` date NOT NULL,
  `designation` varchar(100) NOT NULL,
  PRIMARY KEY (`user_email`),
  KEY `invited_by_fk_idx` (`invited_by`),
  CONSTRAINT `invited_by_fk` FOREIGN KEY (`invited_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invite`
--

LOCK TABLES `user_invite` WRITE;
/*!40000 ALTER TABLE `user_invite` DISABLE KEYS */;
INSERT INTO `user_invite` VALUES ('abc@gmail.com',17,'Product','invited','N8AQnKDS4SLbWfaaewSOxAYW40xNPu0sSSPRbdA8kC0DBAtrj2ynWvUjkeBzPPK25','manager1@mail.com','2019-08-20','Project Owner'),('abdak@gmail.com',1,'5','invited','PuVkbstPvYn3ga2ldEiRYMSb2nAZMQfWHiKNKdCWBmzvkYgaheHTjqG4R453Omy','manager1@mail.com','2019-08-19','admin support'),('djakhdja@gmail.com',1,'5','invited','jqsaRwGqOCQ3We72II8ySio9cSTNbzh5YgfB7VzYgXwltEdAjCG3i9XjO5kdXLU29D9TiYuBYNylYr','manager1@mail.com','2019-08-19','manager'),('rikkala.swathi@gmail.com',1,'5','invited','osVbHL5LIBly4UVT43gphmiV3TyRPAbskb5im78eSoMXb9D9Gks13Elc0nydaHQBn7uEiIgKe','manager1@mail.com','2019-06-24','developer'),('sap.koduri@gmail.com',1,'5','invited','lfOVnEDsCrHby8seM9CoNnd7xFN7sntPVijb9auG2AyuL7iKzREbWL3irPerielBuj3nGZ4lYXLaK','manager1@mail.com','2019-06-23','manager'),('swathi_r2',2,'5','invited','15yhsDY9pAg9S0FArHhiTKQ10nothcaDyGNQpLKBx6ht716vAXKyOImVAfsZIY','manager1@mail.com','2019-08-18','manager'),('swathi_r2@yahoo.com',1,'5','invited','AxsFxuwZoD1GCEbJ22cVV9tUfELbFxQUuSh8plsIA7EeOTBHsRt4G','manager1@mail.com','2019-08-18','manager');
/*!40000 ALTER TABLE `user_invite` ENABLE KEYS */;
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
  KEY `usCreatedByFk_idx` (`created_by`),
  KEY `usProjectFk_idx` (`project`),
  KEY `usSprintFk_idx` (`sprint`),
  KEY `usEpicFk_idx` (`epic`),
  CONSTRAINT `usCreatedByFk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `usEpicFk` FOREIGN KEY (`epic`) REFERENCES `epic` (`id`),
  CONSTRAINT `usProjectFk` FOREIGN KEY (`project`) REFERENCES `project` (`id`),
  CONSTRAINT `usSprintFk` FOREIGN KEY (`sprint`) REFERENCES `sprint` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_story`
--

LOCK TABLES `user_story` WRITE;
/*!40000 ALTER TABLE `user_story` DISABLE KEYS */;
INSERT INTO `user_story` VALUES (14,17,19,10,'Complain feature','3','Not Started','manager1@mail.com','As a tenant,i should be able to log a complaint in the online council app','manager1@mail.com','2019-08-05',83),(15,17,22,10,'track complaint','2','Not Started','manager1@mail.com','As a tenant i should be able to track the complaint in the council app','manager1@mail.com','2019-07-04',76),(16,17,22,10,'supporting files of the complaint','4','Not Started','manager1@mail.com','As a tenant,i should be able to upload supporting files like photos vedios along with complaint in the online council application','manager1@mail.com','2019-07-10',75),(17,18,21,12,'Report straydogs','1','Not Started','manager1@mail.com','As a resident of the council ,i should be able to report any stray dogs to the council online','manager1@mail.com','2019-07-06',74),(18,18,NULL,13,'online tracking','1','Not Started','manager1@mail.com','as a  user i should be able to track my online request that i have posted for listing the stray dogs','manager1@mail.com','2019-07-06',30),(19,18,NULL,15,'Report lost dogs online','1','Not Started','manager1@mail.com','as a user i should be able to report my lost dog online','manager1@mail.com','2019-07-06',50),(20,18,21,15,'Report mistreated  dog','6','Not Started','manager1@mail.com','As a user i should be able to report about the mistreated dog online','manager1@mail.com','2019-07-06',100),(21,18,19,13,'Feedback ','3','Not Started','manager1@mail.com','As a owner of the council application,i should be able to take feedback online of the requests raised.','manager1@mail.com','2019-07-06',75),(22,17,NULL,10,'time saving','3','Not Started','manager1@mail.com','As a user i should be able to view my complaint anytime anywhere online','manager1@mail.com','2019-08-03',38);
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

-- Dump completed on 2019-08-20 17:02:18
