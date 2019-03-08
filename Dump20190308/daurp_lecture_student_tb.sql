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
-- Table structure for table `lecture_student_tb`
--

DROP TABLE IF EXISTS `lecture_student_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lecture_student_tb` (
  `LEC_SEQ` int(11) NOT NULL AUTO_INCREMENT,
  `LEC_NAME` varchar(60) DEFAULT NULL,
  `LEC_TEL` varchar(60) DEFAULT NULL,
  `LEC_BIRTHDAY` date DEFAULT NULL,
  `LEC_ZIPCODE` varchar(40) DEFAULT NULL,
  `LEC_ADDRESS1` varchar(1000) DEFAULT NULL,
  `LEC_ADDRESS2` varchar(1000) DEFAULT NULL,
  `LEC_EMAIL` varchar(1000) DEFAULT NULL,
  `LEC_SPEC` varchar(60) DEFAULT NULL,
  `LEC_COLLEGE` varchar(60) DEFAULT NULL,
  `LEC_MAJOR` varchar(200) DEFAULT NULL,
  `LEC_ENTERPRISENAME` varchar(200) DEFAULT NULL,
  `LEC_ENTERPRISEWORK` varchar(200) DEFAULT NULL,
  `LEC_RECEIPTDATE` datetime DEFAULT NULL,
  `lecture_code` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`LEC_SEQ`),
  UNIQUE KEY `LEC_TEL_UNIQUE` (`LEC_TEL`),
  KEY `lecture_PK_code_idx` (`lecture_code`),
  CONSTRAINT `lectureCode` FOREIGN KEY (`lecture_code`) REFERENCES `lecture_name` (`lecture_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='스마트 팩토리 운영관리사 양성교육을 신청한 유저들을 관리하는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture_student_tb`
--

LOCK TABLES `lecture_student_tb` WRITE;
/*!40000 ALTER TABLE `lecture_student_tb` DISABLE KEYS */;
INSERT INTO `lecture_student_tb` VALUES (84,'권순영','01028879593','1990-12-22','48437','부산광역시 남구 못골번영로46번길 32','미림크라운 4층 403호','wunyoung2@naver.com','대졸','동의대학교','컴퓨터공학과','','','2019-01-29 18:10:58','A201913260'),(85,'권지영','01028569594','1993-08-05','48437','부산광역시 남구 못골번영로46번길 32','미림크라운 4층 403호','wunyoung2@naver.com','대졸','동의대학교','문헌정보학과','','','2019-01-30 10:26:02','A201913260'),(86,'홍길동','01028828282','1885-08-05','48437','부산광역시 남구 못골번영로46번길 32','상암동','wunyoung2@naver.com','중졸','동의대학교','컴퓨터공학과','','','2019-01-30 10:27:47','A201913260'),(87,'김철수','01022330111','2017-11-30','48437','부산광역시 남구 못골번영로40번길 32','4층 403호','wunyoung2@naver.com','고졸','동의대학교','문헌정보학과','','','2019-01-30 15:44:39','A201913260'),(88,'이지은','01021140118','2018-11-30','03900','서울특별시 마포구 가양대로 3','상암동','wunyoung2@naver.com','대학재학중','세종대학교','경영학과','','','2019-01-30 15:45:33','A201913260'),(91,'홍준포','01021140113','2002-10-29','48437','부산광역시 남구 못골번영로46번길 32','미림크라운 4층 403호','wunyoung2@naver.com','대졸','동의대학교','컴퓨터공학과','','','2019-02-01 15:56:56','A201913260'),(92,'테스트1','01035524289','1994-12-25','03180','서울특별시 종로구 경교장1길 5','교남동','wunyoung2@naver.com','고졸','세종대학교','컴퓨터공학과','','','2019-02-08 14:23:50','A201913260'),(93,'엔지엘','01012345678','2008-11-28','48822','부산광역시 동구 중앙대로180번길 12-6','3층','engp@hanbiro.net','대졸','동아대학교','컴퓨터공학','엔지엘','개발자','2019-02-20 09:31:10','A201913260'),(94,'정지훈','01022332222','1981-03-01','03900','서울특별시 마포구 가양대로 1','상암동','wunyoung2@naver.com','대졸','세종대학교','문헌정보학과','','','2019-02-20 09:35:41','A201913260'),(106,'권순영2','01028879592','2021-03-03','48437','부산광역시 남구 못골번영로46번길 32','미림크라운 4층 403호','wunyoung2@naver.com','대졸','동의대학교','컴퓨터공학과','','','2019-02-22 14:23:46','A201913260'),(107,'김찬우','01043025744','2017-11-30','42425','대구광역시 남구 중앙대로 180','111','cwkim@nglp.kr','중졸','동아','컴퓨터공학','ㅁㄴㅇㅁㄴㅇ','ㅁㄴㅇㅁㄴㅇ','2019-02-22 14:30:32','A201913260'),(108,'유용현','01075910924','1991-01-01','48822','부산광역시 동구 중앙대로180번길 12-6','3층','test@test.test','대졸','빅','빅','빅','빅','2019-02-22 14:32:30','A201913260'),(109,'전헌수','01095298283','1989-06-10','48107','부산광역시 해운대구 대천로 187','107동 402호','hsjeon@nglp.kr','대졸','부산외국어','커뮤니케이션일본어','엔지엘(주)','개발','2019-02-22 14:35:05','A201913260'),(110,'권순영3','01028879594','2020-02-02','48437','부산 남구 못골번영로46번길 32','미림크라운 4층 403호','wunyoung2@naver.com','대졸','동의대학교','컴퓨터공학과','','','2019-02-25 10:33:50','A201913260'),(111,'권순영4','01028879595','2020-02-02','06267','서울 강남구 강남대로 238','미림크라운 304호','wunyoung2@naver.com','대졸','동의대학교','컴퓨터공학과','','','2019-02-25 14:46:12','A201913260'),(112,'권순영','01028859594','2020-02-02','06097','서울 강남구 봉은사로 403','상암동','wunyoung2@naver.com','대졸','세종대학교','경영학과','','','2019-02-26 11:59:46','A201913260'),(113,'홍길동','01028839594','2021-02-02','06327','서울 강남구 삼성로 11','미림크라운 4층 403호','wunyoung2@naver.com','대졸','동의대학교','경영학과','','','2019-02-26 16:07:23','A201913260');
/*!40000 ALTER TABLE `lecture_student_tb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-08 18:52:23
