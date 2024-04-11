-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: skill_db
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `project_experience`
--

DROP TABLE IF EXISTS `project_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_experience` (
  `project_id` int NOT NULL,
  `description` text,
  `end_duration` date NOT NULL,
  `project_title` varchar(50) NOT NULL,
  `reponsibility` text,
  `role` varchar(45) NOT NULL,
  `start_duration` date NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`project_id`),
  KEY `FKh6hw0adljt9g7ywqysqym6ued` (`employee_id`),
  CONSTRAINT `FKh6hw0adljt9g7ywqysqym6ued` FOREIGN KEY (`employee_id`) REFERENCES `user_profile` (`employee_id`),
  CONSTRAINT `project_check` CHECK ((`start_duration` < `end_duration`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_experience`
--

LOCK TABLES `project_experience` WRITE;
/*!40000 ALTER TABLE `project_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_experience_seq`
--

DROP TABLE IF EXISTS `project_experience_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_experience_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_experience_seq`
--

LOCK TABLES `project_experience_seq` WRITE;
/*!40000 ALTER TABLE `project_experience_seq` DISABLE KEYS */;
INSERT INTO `project_experience_seq` VALUES (1);
/*!40000 ALTER TABLE `project_experience_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualification`
--

DROP TABLE IF EXISTS `qualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qualification` (
  `qualification_id` int NOT NULL,
  `qualification_title` varchar(50) NOT NULL,
  `institution_name` varchar(50) NOT NULL,
  `place` varchar(50) DEFAULT NULL,
  `start_duration` date NOT NULL,
  `end_duration` date NOT NULL,
  `score` double NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`qualification_id`),
  KEY `qfk_employee_id_idx` (`employee_id`),
  CONSTRAINT `qfk_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `user_profile` (`employee_id`),
  CONSTRAINT `verify_duration` CHECK ((`start_duration` < `end_duration`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualification`
--

LOCK TABLES `qualification` WRITE;
/*!40000 ALTER TABLE `qualification` DISABLE KEYS */;
/*!40000 ALTER TABLE `qualification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualification_seq`
--

DROP TABLE IF EXISTS `qualification_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qualification_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualification_seq`
--

LOCK TABLES `qualification_seq` WRITE;
/*!40000 ALTER TABLE `qualification_seq` DISABLE KEYS */;
INSERT INTO `qualification_seq` VALUES (1);
/*!40000 ALTER TABLE `qualification_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `skill_id` int NOT NULL,
  `cluster_id` int NOT NULL,
  `skill_name` varchar(50) NOT NULL,
  PRIMARY KEY (`skill_id`),
  KEY `fk_cluster_id_idx` (`cluster_id`),
  CONSTRAINT `fk_cluster_id` FOREIGN KEY (`cluster_id`) REFERENCES `skill_cluster` (`skill_cluster_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_cluster`
--

DROP TABLE IF EXISTS `skill_cluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_cluster` (
  `skill_cluster_id` int NOT NULL,
  `cluster_name` varchar(50) NOT NULL,
  PRIMARY KEY (`skill_cluster_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_cluster`
--

LOCK TABLES `skill_cluster` WRITE;
/*!40000 ALTER TABLE `skill_cluster` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_cluster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_cluster_seq`
--

DROP TABLE IF EXISTS `skill_cluster_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_cluster_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_cluster_seq`
--

LOCK TABLES `skill_cluster_seq` WRITE;
/*!40000 ALTER TABLE `skill_cluster_seq` DISABLE KEYS */;
INSERT INTO `skill_cluster_seq` VALUES (601);
/*!40000 ALTER TABLE `skill_cluster_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_seq`
--

DROP TABLE IF EXISTS `skill_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_seq`
--

LOCK TABLES `skill_seq` WRITE;
/*!40000 ALTER TABLE `skill_seq` DISABLE KEYS */;
INSERT INTO `skill_seq` VALUES (1);
/*!40000 ALTER TABLE `skill_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tools`
--

DROP TABLE IF EXISTS `tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tools` (
  `tool_id` int NOT NULL,
  `tool_name` varchar(50) NOT NULL,
  `skill_id` int NOT NULL,
  PRIMARY KEY (`tool_id`),
  KEY `fk_skill_id_idx` (`skill_id`),
  CONSTRAINT `fk_skill_id` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tools`
--

LOCK TABLES `tools` WRITE;
/*!40000 ALTER TABLE `tools` DISABLE KEYS */;
/*!40000 ALTER TABLE `tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tools_seq`
--

DROP TABLE IF EXISTS `tools_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tools_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tools_seq`
--

LOCK TABLES `tools_seq` WRITE;
/*!40000 ALTER TABLE `tools_seq` DISABLE KEYS */;
INSERT INTO `tools_seq` VALUES (1);
/*!40000 ALTER TABLE `tools_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unclassified_skills`
--

DROP TABLE IF EXISTS `unclassified_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unclassified_skills` (
  `skill_id` int NOT NULL,
  `skill_name` varchar(50) NOT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unclassified_skills`
--

LOCK TABLES `unclassified_skills` WRITE;
/*!40000 ALTER TABLE `unclassified_skills` DISABLE KEYS */;
INSERT INTO `unclassified_skills` VALUES (52,'Ruby'),(53,'Rust'),(54,'React'),(55,'GoLang');
/*!40000 ALTER TABLE `unclassified_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unclassified_skills_seq`
--

DROP TABLE IF EXISTS `unclassified_skills_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unclassified_skills_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unclassified_skills_seq`
--

LOCK TABLES `unclassified_skills_seq` WRITE;
/*!40000 ALTER TABLE `unclassified_skills_seq` DISABLE KEYS */;
INSERT INTO `unclassified_skills_seq` VALUES (151);
/*!40000 ALTER TABLE `unclassified_skills_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_certificate`
--

DROP TABLE IF EXISTS `user_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_certificate` (
  `certificate_id` int NOT NULL,
  `certification_name` varchar(50) NOT NULL,
  `issuing_organization` varchar(50) NOT NULL,
  `issuing_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`certificate_id`),
  KEY `employee_id_idx` (`employee_id`),
  CONSTRAINT `employee_id` FOREIGN KEY (`employee_id`) REFERENCES `user_profile` (`employee_id`),
  CONSTRAINT `verify_date` CHECK ((`issuing_date` < `expiration_date`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_certificate`
--

LOCK TABLES `user_certificate` WRITE;
/*!40000 ALTER TABLE `user_certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_certificate_seq`
--

DROP TABLE IF EXISTS `user_certificate_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_certificate_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_certificate_seq`
--

LOCK TABLES `user_certificate_seq` WRITE;
/*!40000 ALTER TABLE `user_certificate_seq` DISABLE KEYS */;
INSERT INTO `user_certificate_seq` VALUES (1);
/*!40000 ALTER TABLE `user_certificate_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profile` (
  `employee_id` int NOT NULL,
  `reporting_manager` varchar(50) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `about_me` text,
  `role` enum('USER','MANAGER','SUPERUSER') NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `emaid_address_UNIQUE` (`email_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_skill_mapping`
--

DROP TABLE IF EXISTS `user_skill_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_skill_mapping` (
  `employee_id` int NOT NULL,
  `skill_id` int DEFAULT NULL,
  `proficiency_level` varchar(50) NOT NULL,
  `skill_name` varchar(50) NOT NULL,
  KEY `usfk1_employee_id_idx` (`employee_id`),
  KEY `usfk2_skill_id_idx` (`skill_id`),
  CONSTRAINT `usfk1_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `user_profile` (`employee_id`),
  CONSTRAINT `usfk2_skill_id` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_skill_mapping`
--

LOCK TABLES `user_skill_mapping` WRITE;
/*!40000 ALTER TABLE `user_skill_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_skill_mapping` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-11 19:40:29
