CREATE DATABASE  IF NOT EXISTS `medical` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `medical`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: medical
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `biomedical_engineer`
--

DROP TABLE IF EXISTS `biomedical_engineer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biomedical_engineer` (
  `bio_id` int(10) unsigned NOT NULL,
  `bio_f_name` varchar(45) NOT NULL,
  `bio_m_name` varchar(45) NOT NULL,
  `bio_l_name` varchar(45) NOT NULL,
  `bio_birth_date` datetime NOT NULL,
  `bio_address` varchar(45) NOT NULL,
  `bio_salary` int(10) unsigned NOT NULL,
  `bio_sex` char(6) NOT NULL,
  `company_bio` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bio_id`),
  KEY `company_idx` (`company_bio`),
  CONSTRAINT `company` FOREIGN KEY (`company_bio`) REFERENCES `company` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biomedical_engineer`
--

LOCK TABLES `biomedical_engineer` WRITE;
/*!40000 ALTER TABLE `biomedical_engineer` DISABLE KEYS */;
INSERT INTO `biomedical_engineer` VALUES (123456789,'Mohamed','Mostafa','Ali','1993-05-01 00:00:00','Cairo',4200,'M',123456789),(987654321,'Nada','Amr','Mohamed','1994-08-05 00:00:00','Giza',5000,'F',987654321);
/*!40000 ALTER TABLE `biomedical_engineer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `code` int(10) unsigned NOT NULL,
  `company_name` varchar(45) NOT NULL,
  `mother_company` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (123456789,'Alcan','American Company','Medical','USA','Medical Company'),(987654321,'Horizon','Italian Company','Electra','Italy','Company');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `serial_no` int(10) unsigned NOT NULL,
  `d_name` varchar(45) NOT NULL,
  `manufacture` varchar(45) NOT NULL,
  `production_date` datetime NOT NULL,
  `life_time` int(10) unsigned NOT NULL,
  `status` varchar(45) NOT NULL,
  `device_bio` int(10) unsigned NOT NULL,
  `device_company` int(10) unsigned NOT NULL,
  PRIMARY KEY (`serial_no`),
  KEY `company_device_idx` (`device_company`),
  KEY `bio_eng_idx` (`device_bio`),
  CONSTRAINT `bio_eng` FOREIGN KEY (`device_bio`) REFERENCES `biomedical_engineer` (`bio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `company_device` FOREIGN KEY (`device_company`) REFERENCES `company` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (123456789,'Cobalt','American  Company','2000-10-12 00:00:00',10,'Excellent',123456789,123456789),(987654321,'Linear Accelerator','Italian Company','2001-09-05 00:00:00',15,'Good',987654321,987654321);
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physician`
--

DROP TABLE IF EXISTS `physician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `physician` (
  `phy_id` int(10) unsigned NOT NULL,
  `phy_f_name` varchar(45) NOT NULL,
  `phy_m_name` varchar(45) NOT NULL,
  `phy_l_name` varchar(45) NOT NULL,
  `phy_birth_date` datetime NOT NULL,
  `phy_address` varchar(45) NOT NULL,
  `phy_salary` int(10) unsigned NOT NULL,
  `phy_sex` char(6) NOT NULL,
  `phy_device` int(10) unsigned NOT NULL,
  `phy_bio` int(10) unsigned NOT NULL,
  PRIMARY KEY (`phy_id`),
  KEY `id_idx` (`phy_bio`),
  KEY `device_idx` (`phy_device`),
  CONSTRAINT `bio_eng_id` FOREIGN KEY (`phy_bio`) REFERENCES `biomedical_engineer` (`bio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `device` FOREIGN KEY (`phy_device`) REFERENCES `device` (`serial_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physician`
--

LOCK TABLES `physician` WRITE;
/*!40000 ALTER TABLE `physician` DISABLE KEYS */;
INSERT INTO `physician` VALUES (123456789,'Mona','Mohamed','Yassin','1994-12-08 00:00:00','Giza',4000,'F',123456789,123456789),(987654321,'Hany','Mohamed','Ahmed','1994-05-08 00:00:00','Cairo',3800,'M',987654321,987654321);
/*!40000 ALTER TABLE `physician` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-13 19:09:51
