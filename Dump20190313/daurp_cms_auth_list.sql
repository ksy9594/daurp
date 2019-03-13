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
-- Table structure for table `cms_auth_list`
--

DROP TABLE IF EXISTS `cms_auth_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_auth_list` (
  `AUTH_CODE` int(11) NOT NULL COMMENT '권한 코드 번호',
  `AUTH_NAME` varchar(60) DEFAULT NULL COMMENT '권한명',
  `AUTH_COMMENT` varchar(200) DEFAULT NULL COMMENT '권한에 대한 설명',
  `AUTH_LAST_MODIFY_DATE` date DEFAULT NULL COMMENT '권한 설정을 마지막으로 수정한 날짜',
  `AUTH_MODIFY_USER` varchar(60) DEFAULT NULL COMMENT '권한 목록을 마지막으로 수정한 유저',
  PRIMARY KEY (`AUTH_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='권한 리스트를 관리하는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_auth_list`
--

LOCK TABLES `cms_auth_list` WRITE;
/*!40000 ALTER TABLE `cms_auth_list` DISABLE KEYS */;
INSERT INTO `cms_auth_list` VALUES (10,'ROLE_LECTURE','교육담당','2019-03-08',NULL),(20,'ROLE_CERTIFICATE','자격증시험담당','2019-03-08',NULL),(30,'ROLE_EXAM','시험담당','2019-03-08',NULL),(40,'ROLE_SET_QUEST','문제출제담당','2019-03-08',NULL);
/*!40000 ALTER TABLE `cms_auth_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-13 18:12:06
