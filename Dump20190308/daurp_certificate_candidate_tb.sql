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
-- Table structure for table `certificate_candidate_tb`
--

DROP TABLE IF EXISTS `certificate_candidate_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificate_candidate_tb` (
  `CER_SEQ` int(11) NOT NULL AUTO_INCREMENT,
  `CER_CODE` varchar(30) DEFAULT NULL,
  `CER_NAME` varchar(60) DEFAULT NULL,
  `CER_IMAGE` varchar(200) DEFAULT NULL,
  `CER_TEL` varchar(45) DEFAULT NULL,
  `CER_BIRTHDAY` date DEFAULT NULL,
  `CER_ZIPCODE` varchar(60) DEFAULT NULL,
  `CER_ADDRESS1` varchar(200) DEFAULT NULL,
  `CER_ADDRESS2` varchar(200) DEFAULT NULL,
  `CER_EMAIL` varchar(1000) DEFAULT NULL,
  `CER_SPEC` varchar(30) DEFAULT NULL,
  `CER_COLLEGE` varchar(200) DEFAULT NULL,
  `CER_MAJOR` varchar(60) DEFAULT NULL,
  `CER_ENTERPRISENAME` varchar(200) DEFAULT NULL,
  `CER_ENTERPRISEWORK` varchar(200) DEFAULT NULL,
  `CER_RECEIPTDATE` date DEFAULT NULL,
  `CER_SCORE` int(11) DEFAULT NULL,
  `CER_ISDESPOIT` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`CER_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='자격증 접수를 한 응시자들을 관리하는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate_candidate_tb`
--

LOCK TABLES `certificate_candidate_tb` WRITE;
/*!40000 ALTER TABLE `certificate_candidate_tb` DISABLE KEYS */;
INSERT INTO `certificate_candidate_tb` VALUES (37,'20191854','권지영','20191216147997.png','01028569594','1993-08-05','48437','부산광역시 남구 못골번영로46번길 32','4층 403호','wunyoung2@naver.com','대졸','동의대학교','문헌정보학과','','','2019-02-21',NULL,NULL),(38,'20191854','홍길동','201912162727282.png','01021140113','2021-02-02','48437','부산광역시 남구 못골번영로46번길 32','11','wunyoung2@naver.com','대학재학중','동의대학교','컴퓨터공학','','','2019-02-21',NULL,NULL),(39,'20191854','테스트1','201912163822290.png','01028859594','2021-02-02','03900','서울특별시 마포구 가양대로 3','미림크라운 4층 403호','wunyoung2@naver.com','대졸','동의대학교','컴퓨터공학','','','2019-02-21',NULL,NULL),(40,'20191854','xptmxm2','20191216505578.png','01028869594','1122-02-02','48437','부산광역시 남구 진남로46번길 7','미림크라운 4층 403호','wunyoung2@naver.com','대졸','동아대학교','문헌정보학과','','','2019-02-21',NULL,NULL),(41,'20191854','권순영33','20191253329196.PNG','0102885833','2021-02-02','48445','부산광역시 남구 못골번영로 6','미림크라운 304호','wunyoung2@naver.com','대학재학중','동의대학교','컴퓨터공학과','','','2019-02-25',NULL,NULL),(42,'null','권순영','20191264830835.jpg','01028859593','2021-02-02','06267','서울 강남구 강남대로 238','미림크라운 4층 403호','wunyoung2@naver.com','대졸','세종대학교','경영학과','','','2019-02-26',NULL,NULL);
/*!40000 ALTER TABLE `certificate_candidate_tb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-08 18:52:27
