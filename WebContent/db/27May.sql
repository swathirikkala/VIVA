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
  `name` varchar(200) DEFAULT NULL,
  `sprint` int(11) DEFAULT NULL,
  `project` int(11) DEFAULT NULL,
  `manager` varchar(100) DEFAULT NULL,
  `assigned_to` varchar(100) DEFAULT NULL,
  `severity` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text,
  `lmb` varchar(100) DEFAULT NULL,
  `lmt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epic`
--

LOCK TABLES `epic` WRITE;
/*!40000 ALTER TABLE `epic` DISABLE KEYS */;
INSERT INTO `epic` VALUES (1,'sample epic',0,0,'manager1@mail.com','manager1@mail.com',1,'null','2019-05-01','2019-05-22','sdasdfqwerwer','manager1@mail.com',NULL);
/*!40000 ALTER TABLE `epic` ENABLE KEYS */;
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
  `severity` varchar(45) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_by` varchar(100) NOT NULL,
  `manager` varchar(100) DEFAULT NULL,
  `description` text NOT NULL,
  `modified_by` varchar(100) DEFAULT NULL,
  `modified_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT '0',
  `viva` int(11) DEFAULT '0',
  `created_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `created_by_fk_idx` (`created_by`),
  CONSTRAINT `created_by_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'demo project','1','2019-05-01','2019-05-13','manager1@mail.com','manager1@mail.com','sample project\r\n',NULL,'2019-05-12 21:48:59','Not Started',0,NULL),(7,'sdf','1','2019-05-01','2019-05-13','manager1@mail.com','manager1@mail.com','sfdfg','manager1@mail.com','2019-05-13 17:08:28','Not Started',0,NULL),(8,'Project name edited','8','2019-05-01','2019-05-30','manager1@mail.com','manager1@mail.com','Project 8 description updated','manager1@mail.com','2019-05-13 17:13:32','Closed',0,NULL),(9,'saassasa','1','2019-05-06','2019-05-29','manager1@mail.com','manager1@mail.com','assaassa','manager1@mail.com','2019-05-13 17:37:16','Not Started',0,NULL),(10,'project name asd','1','2019-05-13','2019-05-20','manager1@mail.com','manager1@mail.com','jsvkjsdkfvksjdjkvsdkjfvkjsdhfgkjhsdkfgkdsfgsdfg','manager1@mail.com','2019-05-20 22:57:54','Not Started',0,NULL),(11,'project name asd','1','2019-05-13','2019-05-20','manager1@mail.com','manager1@mail.com','jsvkjsdkfvksjdjkvsdkjfvkjsdhfgkjhsdkfgkdsfgsdfg','manager1@mail.com','2019-05-20 23:03:40','Not Started',0,NULL),(12,'project name asd','1','2019-05-13','2019-05-20','manager1@mail.com','manager1@mail.com','jsvkjsdkfvksjdjkvsdkjfvkjsdhfgkjhsdkfgkdsfgsdfg','manager1@mail.com','2019-05-20 23:05:10','Not Started',0,NULL),(15,'project name asd','0','2000-01-01','2000-01-01','manager1@mail.com','','rsdfgdfgsdfg','manager1@mail.com','2019-05-26 22:29:59','0',0,NULL);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
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
  `project` int(11) NOT NULL,
  `severity` int(11) NOT NULL,
  `manager` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `last_modified_by` varchar(100) DEFAULT NULL,
  `last_modified_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(45) DEFAULT 'Not Started',
  PRIMARY KEY (`id`),
  KEY `project_id_fk_idx` (`project`),
  KEY `manager_fk_idx` (`manager`),
  KEY `created_fk_idx` (`created_by`),
  KEY `last_modified_fk_idx` (`last_modified_by`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sprint`
--

LOCK TABLES `sprint` WRITE;
/*!40000 ALTER TABLE `sprint` DISABLE KEYS */;
INSERT INTO `sprint` VALUES (1,'sample sprint 1',1,1,'manager1@mail.com','2019-05-01','2019-05-14','manager1@mail.com','asdfasdfasdf',NULL,'2019-05-14 07:01:02','Not Started'),(2,'sample sprint 1',1,1,'manager1@mail.com','2019-05-01','2019-05-14','manager1@mail.com','asdfasdfasdf',NULL,'2019-05-14 07:42:46','Not Started'),(3,'demo sprint',1,3,'manager1@mail.com','2019-05-14','2019-05-14','manager1@mail.com','',NULL,'2019-05-14 08:21:29','Not Started'),(4,'demo sprint',7,3,'manager1@mail.com','2019-05-14','2019-05-14','manager1@mail.com','',NULL,'2019-05-14 09:20:02','Not Started'),(5,'asd',1,1,'manager1@mail.com','2019-05-01','2019-05-21','manager1@mail.com','asdasdasd',NULL,'2019-05-20 23:06:13','Not Started'),(6,'asd',1,1,'manager1@mail.com','2019-05-01','2019-05-21','manager1@mail.com','asdasdasd',NULL,'2019-05-20 23:07:26','Not Started'),(7,'asd',1,1,'manager1@mail.com','2019-05-01','2019-05-21','manager1@mail.com','asdasdasd',NULL,'2019-05-20 23:38:30','Not Started'),(8,'sample sprint',15,20,'null','2019-05-01','2019-05-28','manager1@mail.com','sample sprint',NULL,'2019-05-27 08:19:05','Not Started'),(9,'Sample Sprint',1,8,'null','2019-05-01','2019-05-27','manager1@mail.com','sample description',NULL,'2019-05-27 08:22:41','Not Started'),(10,'sdf sprint',7,4,'null','2019-05-03','2019-05-28','manager1@mail.com','adasdfasd',NULL,'2019-05-27 08:28:10','Not Started'),(11,'sample sprint 2 edited',8,14,'null','2019-05-16','2019-06-06','manager1@mail.com','sample description',NULL,'2019-05-27 10:00:36','Not Started'),(12,'demo sprint 2',8,9,'null','2019-05-02','2019-05-17','manager1@mail.com','asdaf',NULL,'2019-05-27 10:03:07','Not Started'),(13,'sample sprint 2 edited',8,14,'null','2019-05-16','2019-06-06','manager1@mail.com','sample description',NULL,'2019-05-27 10:34:51','Not Started');
/*!40000 ALTER TABLE `sprint` ENABLE KEYS */;
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
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `manager` varchar(100) DEFAULT NULL,
  `assign_to` varchar(100) DEFAULT NULL,
  `description` text,
  `lmb` varchar(100) DEFAULT NULL,
  `lmt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_story`
--

LOCK TABLES `user_story` WRITE;
/*!40000 ALTER TABLE `user_story` DISABLE KEYS */;
INSERT INTO `user_story` VALUES (1,1,0,1,'asdfasdf','null','2019-05-14','2019-05-21','manager1@mail.com','manager1@mail.com','asdfasdfasdf','manager1@mail.com',NULL);
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

-- Dump completed on 2019-05-27 10:50:41
