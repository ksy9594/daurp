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
-- Table structure for table `cms_url_list`
--

DROP TABLE IF EXISTS `cms_url_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_url_list` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `AUTH_CODE` varchar(60) DEFAULT NULL COMMENT '페이지 권한',
  `URL_PATH` varchar(200) DEFAULT NULL COMMENT '페이지 주소',
  `URL_NAME` varchar(60) DEFAULT NULL COMMENT '주소명',
  `URL_COMMENT` varchar(200) DEFAULT NULL COMMENT '페이지 설명',
  `URL_MODIFY_DATE` date DEFAULT NULL COMMENT '수정일',
  `URL_MODIFY_USER` varchar(60) DEFAULT NULL COMMENT '최근 수정자',
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='페이지 목록을 관리하는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_url_list`
--

LOCK TABLES `cms_url_list` WRITE;
/*!40000 ALTER TABLE `cms_url_list` DISABLE KEYS */;
INSERT INTO `cms_url_list` VALUES (7,'20','/cms/isDespoitChk','입금내역관리','입금 내역을 관리','2019-03-12',NULL),(10,'10','/cms/cmsAttendChk','출결관리','교육생 출결 관리','2019-03-12',NULL),(11,'10','/cms/lecture_subject','강의과목관리','교육생 과목 관리','2019-03-12',NULL);
/*!40000 ALTER TABLE `cms_url_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-14 18:21:41
