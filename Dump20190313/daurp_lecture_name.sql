-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: daurp
-- ------------------------------------------------------
-- Server version	5.5.62-log

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
-- Table structure for table `lecture_name`
--

DROP TABLE IF EXISTS `lecture_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lecture_name` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `lecture_code` varchar(100) NOT NULL COMMENT '회차코드',
  `lecture_name` varchar(1000) DEFAULT NULL COMMENT '회차명',
  `lecture_location` varchar(400) DEFAULT NULL COMMENT '교육장소',
  `app_period` datetime DEFAULT NULL COMMENT '모집기한',
  `lecture_startdate` date DEFAULT NULL COMMENT '개강일',
  `lecture_enddate` date DEFAULT NULL COMMENT '종강일',
  `lecture_idclose` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`seq`,`lecture_code`),
  UNIQUE KEY `lecture_code_UNIQUE` (`lecture_code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture_name`
--

LOCK TABLES `lecture_name` WRITE;
/*!40000 ALTER TABLE `lecture_name` DISABLE KEYS */;
INSERT INTO `lecture_name` VALUES (7,'A201913260','스마트 팩토리 운영관리사 2회차','동아대학교 승학캠퍼스','2019-02-15 00:00:00',NULL,NULL,NULL);
/*!40000 ALTER TABLE `lecture_name` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-13 18:11:55
