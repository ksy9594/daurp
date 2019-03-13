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
-- Table structure for table `certificate_number`
--

DROP TABLE IF EXISTS `certificate_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificate_number` (
  `cer_number` varchar(200) NOT NULL COMMENT '시험회차코드',
  `subject_name` varchar(30) DEFAULT NULL COMMENT '종목코드',
  `certificate_degreeNm` varchar(200) DEFAULT NULL,
  `cer_location` varchar(200) DEFAULT NULL COMMENT '시험장소',
  `certificate_date` date DEFAULT NULL COMMENT '시험일자',
  `receipt_date` datetime DEFAULT NULL COMMENT '접수기간',
  `certificate_endcheck` varchar(30) DEFAULT NULL COMMENT '시험종료여부',
  PRIMARY KEY (`cer_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate_number`
--

LOCK TABLES `certificate_number` WRITE;
/*!40000 ALTER TABLE `certificate_number` DISABLE KEYS */;
INSERT INTO `certificate_number` VALUES ('20191854','스마트팩토리 운영관리사 2급','2019년 2월','동아대학교 승학캠퍼스 공대5호관','2019-02-23','2019-02-19 17:00:00',NULL);
/*!40000 ALTER TABLE `certificate_number` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-13 18:12:02
