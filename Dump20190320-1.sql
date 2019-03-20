-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 192.168.11.101    Database: daurp
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
INSERT INTO `cms_auth_list` VALUES (10,'ROLE_LECTURE','교육담당','2019-03-08',NULL),(20,'ROLE_CERTIFICATE','자격증시험담당','2019-03-08',NULL),(30,'ROLE_EXAM','시험담당','2019-03-08',NULL),(40,'ROLE_SET_QUEST','문제출제담당','2019-03-08',NULL),(50,'ROLE_ADMIN','전체관리자','2019-03-14',NULL);
/*!40000 ALTER TABLE `cms_auth_list` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='페이지 목록을 관리하는 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_url_list`
--

LOCK TABLES `cms_url_list` WRITE;
/*!40000 ALTER TABLE `cms_url_list` DISABLE KEYS */;
INSERT INTO `cms_url_list` VALUES (7,'20','/cms/isDespoitChk','입금내역관리','입금 내역을 관리','2019-03-12',NULL),(10,'10','/cms/cmsAttendChk','출결관리','교육생 출결 관리','2019-03-12',NULL),(11,'10','/cms/lecture_subject','강의과목관리','교육생 과목 관리','2019-03-12',NULL),(12,'10','/cms/lectureManager','강의회차관리','교육 회차 관리','2019-03-20',NULL),(13,'50','/cms/cmsUserAuth','유저관리','권한별유저관리','2019-03-20',NULL),(14,'50','/cms/cmsAuthList','권한관리','권한리스트관리','2019-03-20',NULL),(15,'50','/cms/cmsUrlList','페이지관리','권한별 페이지 관리','2019-03-20',NULL),(17,'50','/cms','관리자페이지','전체페이지관리','2019-03-20',NULL);
/*!40000 ALTER TABLE `cms_url_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_auth`
--

DROP TABLE IF EXISTS `cms_user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_auth` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(200) DEFAULT NULL,
  `USER_PW` varchar(200) DEFAULT NULL,
  `USER_NAME` varchar(60) DEFAULT NULL,
  `USER_EMAIL` varchar(200) DEFAULT NULL,
  `USER_AUTH_CODE` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1' COMMENT '사용여부',
  `LAST_MODIFY_DATE` date DEFAULT NULL,
  `MODIFY_USER` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='페이지를 이용하는 유저들의 권한 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_auth`
--

LOCK TABLES `cms_user_auth` WRITE;
/*!40000 ALTER TABLE `cms_user_auth` DISABLE KEYS */;
INSERT INTO `cms_user_auth` VALUES (1,'sykwon','1','권순영','wunyoung2@naver.com','10',1,'2019-03-14',NULL),(2,'daurp','6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b','관리자','nglp','50',1,'2019-03-14',NULL),(4,'sykwon2','6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b','권순영2','dsfsdf','10',1,'2019-03-20',NULL);
/*!40000 ALTER TABLE `cms_user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture_attend`
--

DROP TABLE IF EXISTS `lecture_attend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lecture_attend` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `LEC_SEQ` int(11) DEFAULT NULL,
  `atnd_date` date DEFAULT NULL,
  `lecture_code` varchar(100) DEFAULT NULL,
  `entrance_time` time DEFAULT NULL,
  `getout_time` time DEFAULT NULL,
  PRIMARY KEY (`seq`),
  KEY `lecture_PK_code_idx` (`lecture_code`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='출석체크를 위한 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture_attend`
--

LOCK TABLES `lecture_attend` WRITE;
/*!40000 ALTER TABLE `lecture_attend` DISABLE KEYS */;
INSERT INTO `lecture_attend` VALUES (24,84,'2019-02-18','A201913260','16:14:26','16:47:32'),(26,85,'2019-02-19','A201913260','09:33:58','11:37:24'),(48,84,'2019-02-19','A201913260','11:19:55','11:55:45'),(49,87,'2019-02-19','A201913260','11:37:58','11:39:13'),(50,88,'2019-02-19','A201913260','11:38:11','11:39:05'),(51,92,'2019-02-19','A201913260','11:38:15','11:59:45'),(52,91,'2019-02-19','A201913260','11:38:18','11:38:53'),(53,84,'2019-02-20','A201913260','09:25:52','14:56:27'),(54,86,'2019-02-20','A201913260','09:26:22','09:36:39'),(55,87,'2019-02-20','A201913260','09:26:35','10:29:14'),(56,88,'2019-02-20','A201913260','09:26:39','09:31:36'),(57,93,'2019-02-20','A201913260','09:32:09','10:28:12'),(58,92,'2019-02-20','A201913260','09:33:07','09:37:13'),(59,91,'2019-02-20','A201913260','09:39:08','09:54:41'),(60,94,'2019-02-20','A201913260','10:28:24','10:28:40'),(68,85,'2019-02-20','A201913260','14:49:49','14:49:56'),(69,110,'2019-02-25','A201913260','14:56:02','14:57:06');
/*!40000 ALTER TABLE `lecture_attend` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `lecture_subject`
--

DROP TABLE IF EXISTS `lecture_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lecture_subject` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `lecture_code` varchar(100) DEFAULT NULL,
  `subject_code` varchar(100) DEFAULT NULL,
  `subject_name` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture_subject`
--

LOCK TABLES `lecture_subject` WRITE;
/*!40000 ALTER TABLE `lecture_subject` DISABLE KEYS */;
INSERT INTO `lecture_subject` VALUES (18,'A201913260','A201919118','스마트팩토리 개론','2019-02-21','09:00:00','11:00:00'),(20,'A201913260','A201914989','IOT 기술 I','2019-02-21','11:00:00','13:00:00'),(22,'A201913260','A201915856','IOT 기술 II','2019-02-21','14:00:00','16:00:00'),(23,'A201913260','A201911053','스마트팩토리 정보시스템','2019-02-21','16:00:00','18:00:00');
/*!40000 ALTER TABLE `lecture_subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-20 18:25:41
