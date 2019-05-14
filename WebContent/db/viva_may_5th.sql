-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: vivita
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
-- Table structure for table `business_values`
--

DROP TABLE IF EXISTS `business_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `business_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_values`
--

LOCK TABLES `business_values` WRITE;
/*!40000 ALTER TABLE `business_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bv_epic`
--

DROP TABLE IF EXISTS `bv_epic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bv_epic` (
  `epic_id` int(11) NOT NULL,
  `bv_assigned` int(11) NOT NULL,
  `bv_achieved` int(11) DEFAULT NULL,
  `date_added` date NOT NULL,
  `date_last_modified` date NOT NULL,
  PRIMARY KEY (`epic_id`),
  CONSTRAINT `bv_epicId_epicTable_fk` FOREIGN KEY (`epic_id`) REFERENCES `epic` (`idepic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bv_epic`
--

LOCK TABLES `bv_epic` WRITE;
/*!40000 ALTER TABLE `bv_epic` DISABLE KEYS */;
/*!40000 ALTER TABLE `bv_epic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bv_project`
--

DROP TABLE IF EXISTS `bv_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bv_project` (
  `project_id` int(11) NOT NULL,
  `bv_id` int(11) NOT NULL,
  `prj_bv_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`,`bv_id`),
  UNIQUE KEY `prj_bv_id_UNIQUE` (`prj_bv_id`),
  KEY `bv_id_bv_table_fk_idx` (`bv_id`),
  KEY `prj_id_project_table_fk_idx` (`project_id`),
  KEY `id_idx` (`prj_bv_id`),
  CONSTRAINT `bv_id_bv_table_fk` FOREIGN KEY (`bv_id`) REFERENCES `business_values` (`id`),
  CONSTRAINT `bv_project_bv_report_fk` FOREIGN KEY (`prj_bv_id`) REFERENCES `bv_report` (`id`),
  CONSTRAINT `prj_id_project_table_fk` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bv_project`
--

LOCK TABLES `bv_project` WRITE;
/*!40000 ALTER TABLE `bv_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `bv_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bv_report`
--

DROP TABLE IF EXISTS `bv_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bv_report` (
  `id` int(11) NOT NULL,
  `achieved` int(11) NOT NULL,
  `date_added` date NOT NULL,
  `date_modified` date NOT NULL,
  `added_user` varchar(100) NOT NULL,
  `updated_user` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adde_user_idx` (`added_user`),
  KEY `updated_user_fk_idx` (`updated_user`),
  CONSTRAINT `adde_user` FOREIGN KEY (`added_user`) REFERENCES `user` (`id`),
  CONSTRAINT `updated_user_fk` FOREIGN KEY (`updated_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bv_report`
--

LOCK TABLES `bv_report` WRITE;
/*!40000 ALTER TABLE `bv_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `bv_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bv_sprint`
--

DROP TABLE IF EXISTS `bv_sprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bv_sprint` (
  `sprint_id` int(11) NOT NULL,
  `bv` int(11) NOT NULL,
  `achieved_percentage` int(11) NOT NULL DEFAULT '0',
  `date_assigned` date NOT NULL,
  `date_last_modified` date NOT NULL,
  PRIMARY KEY (`sprint_id`),
  KEY `bv_bv_idx` (`bv`),
  CONSTRAINT `bv_bv` FOREIGN KEY (`bv`) REFERENCES `business_values` (`id`),
  CONSTRAINT `sprint_id` FOREIGN KEY (`sprint_id`) REFERENCES `sprint` (`sprint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bv_sprint`
--

LOCK TABLES `bv_sprint` WRITE;
/*!40000 ALTER TABLE `bv_sprint` DISABLE KEYS */;
/*!40000 ALTER TABLE `bv_sprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bv_sprint_report`
--

DROP TABLE IF EXISTS `bv_sprint_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bv_sprint_report` (
  `sprint_id` int(11) NOT NULL,
  `bv_assigned` int(11) DEFAULT NULL,
  `bv_achieved` int(11) DEFAULT NULL,
  `date_assigned` date DEFAULT NULL,
  `date_last_modified` date DEFAULT NULL,
  PRIMARY KEY (`sprint_id`),
  CONSTRAINT `sprintid_sprintTable_fk` FOREIGN KEY (`sprint_id`) REFERENCES `sprint` (`sprint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bv_sprint_report`
--

LOCK TABLES `bv_sprint_report` WRITE;
/*!40000 ALTER TABLE `bv_sprint_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `bv_sprint_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bv_us_report`
--

DROP TABLE IF EXISTS `bv_us_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bv_us_report` (
  `user_story_id` int(11) NOT NULL,
  `business_values_assigned` int(11) DEFAULT NULL,
  `business_values_achieved` int(11) DEFAULT NULL,
  `date_assigned` date NOT NULL,
  `date_last_modified` varchar(45) NOT NULL,
  PRIMARY KEY (`user_story_id`),
  KEY `bvr_user_fk_idx` (`user_story_id`),
  CONSTRAINT `bvr_user_fk` FOREIGN KEY (`user_story_id`) REFERENCES `user_story` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bv_us_report`
--

LOCK TABLES `bv_us_report` WRITE;
/*!40000 ALTER TABLE `bv_us_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `bv_us_report` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'stake holder','Business Person'),(2,'Project Manager','Project Manager'),(3,'Techincal Team','Techincal Team Member');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epic`
--

DROP TABLE IF EXISTS `epic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `epic` (
  `idepic_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) DEFAULT NULL,
  `sprint_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `hours_estimation` int(11) DEFAULT NULL,
  `hours_consumed` int(11) DEFAULT NULL,
  `viva` int(11) DEFAULT NULL,
  `owner` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idepic_id`),
  KEY `epic_owner_user_id_fk_idx` (`owner`),
  KEY `epic_sprint_fk_idx` (`sprint_id`),
  CONSTRAINT `epic_owner_user_id_fk` FOREIGN KEY (`owner`) REFERENCES `user` (`id`),
  CONSTRAINT `epic_sprint_fk` FOREIGN KEY (`sprint_id`) REFERENCES `sprint` (`sprint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epic`
--

LOCK TABLES `epic` WRITE;
/*!40000 ALTER TABLE `epic` DISABLE KEYS */;
/*!40000 ALTER TABLE `epic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priority`
--

DROP TABLE IF EXISTS `priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priority`
--

LOCK TABLES `priority` WRITE;
/*!40000 ALTER TABLE `priority` DISABLE KEYS */;
/*!40000 ALTER TABLE `priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `estimated_hours` int(11) DEFAULT NULL,
  `hours_consumed` int(11) DEFAULT NULL,
  `manager_name` varchar(100) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `Manager_fk_idx` (`manager_name`),
  KEY `created_by_fk_idx` (`created_by`),
  CONSTRAINT `Manager_fk` FOREIGN KEY (`manager_name`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `created_by_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'sample project',1,100,0,'xyz@gmail.com','email@mail.com'),(2,'Authentication',1,30,0,'email@mail.com','email@mail.com');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_bv`
--

DROP TABLE IF EXISTS `project_bv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `project_bv` (
  `project_id` int(11) NOT NULL,
  `bv_id` int(11) NOT NULL,
  `values_assigned` int(11) NOT NULL,
  `values_accepted` int(11) DEFAULT NULL,
  PRIMARY KEY (`project_id`,`bv_id`),
  KEY `project_bv_business_values_fk_idx` (`bv_id`),
  CONSTRAINT `project_bv_business_values_fk` FOREIGN KEY (`bv_id`) REFERENCES `business_values` (`id`),
  CONSTRAINT `project_bv_project_fk` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_bv`
--

LOCK TABLES `project_bv` WRITE;
/*!40000 ALTER TABLE `project_bv` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_bv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sprint`
--

DROP TABLE IF EXISTS `sprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sprint` (
  `sprint_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `hours_estimation` int(11) DEFAULT NULL,
  `hours_consumed` int(11) DEFAULT NULL,
  PRIMARY KEY (`sprint_id`),
  KEY `Sprint_project_pk_idx` (`project_id`),
  CONSTRAINT `sprint_project_pk` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sprint`
--

LOCK TABLES `sprint` WRITE;
/*!40000 ALTER TABLE `sprint` DISABLE KEYS */;
INSERT INTO `sprint` VALUES (2,'login sprint',2,1,NULL,NULL,22,0),(3,'sprint 2',2,1,NULL,NULL,22,0);
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
  `departement` int(11) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `security_question` varchar(200) NOT NULL,
  `security_answer` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_department_idx` (`departement`),
  CONSTRAINT `user_department` FOREIGN KEY (`departement`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('email@mail.com','swathi','rikkala','2019-04-09',1,'project owner','password','se1','sa1'),('xyz@gmail.com','abc','efg','2019-04-17',2,'ded','password','seq2','secA');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_invite`
--

DROP TABLE IF EXISTS `user_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_invite` (
  `user_id` varchar(100) NOT NULL,
  `role` int(11) NOT NULL,
  `invited_by` varchar(100) NOT NULL,
  `invited_on` datetime DEFAULT NULL,
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `invited_by_fk_idx` (`invited_by`),
  CONSTRAINT `invited_by_fk` FOREIGN KEY (`invited_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invite`
--

LOCK TABLES `user_invite` WRITE;
/*!40000 ALTER TABLE `user_invite` DISABLE KEYS */;
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
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `epic_id` int(11) NOT NULL,
  `hours_estimated` int(11) NOT NULL,
  `hours_consumed` int(11) DEFAULT NULL,
  `owner` varchar(100) NOT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_story_epic_fk_idx` (`epic_id`),
  KEY `user_story_user_fk_idx` (`owner`),
  CONSTRAINT `user_story_epic_fk` FOREIGN KEY (`epic_id`) REFERENCES `epic` (`idepic_id`),
  CONSTRAINT `user_story_user_fk` FOREIGN KEY (`owner`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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

-- Dump completed on 2019-05-05 22:16:05
