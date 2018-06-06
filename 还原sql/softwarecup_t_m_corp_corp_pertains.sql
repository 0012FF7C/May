-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: softwarecup
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `t_m_corp_corp_pertains`
--

DROP TABLE IF EXISTS `t_m_corp_corp_pertains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_m_corp_corp_pertains` (
  `ID` int(15) DEFAULT NULL,
  `SEQ_ID` int(15) DEFAULT NULL,
  `ORG` int(15) DEFAULT NULL,
  `SUB_ORG` int(15) DEFAULT NULL,
  `SUB_ID` int(15) DEFAULT NULL,
  `SUB_SEQ_ID` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_m_corp_corp_pertains`
--

LOCK TABLES `t_m_corp_corp_pertains` WRITE;
/*!40000 ALTER TABLE `t_m_corp_corp_pertains` DISABLE KEYS */;
INSERT INTO `t_m_corp_corp_pertains` VALUES (4,1,876,876,465366,1),(4,1,876,876,465367,1),(4,2,876,876,465366,1),(4,2,876,876,465367,1),(4,3,876,876,465366,1),(4,3,876,876,465367,1),(4,4,876,876,465366,1),(4,4,876,876,465367,1),(4,5,876,876,465366,1),(4,5,876,876,465367,1),(4,8,876,876,465366,1),(4,8,876,876,465367,1),(4,9,876,876,465366,1),(4,9,876,876,465367,1),(4,12,876,876,465366,1),(4,12,876,876,465367,1),(4,13,876,876,465366,1),(4,13,876,876,465367,1),(4,14,876,876,465366,1),(4,14,876,876,465367,1),(4,15,876,876,465366,1),(4,15,876,876,465367,1),(4,16,876,876,465366,1),(4,16,876,876,465367,1),(4,17,876,876,465366,1),(4,17,876,876,465367,1),(4,18,876,876,465366,1),(4,18,876,876,465367,1),(4,19,876,876,465366,1),(4,19,876,876,465367,1),(4,20,876,876,465366,1),(4,20,876,876,465367,1),(4,26,876,876,465366,1),(4,26,876,876,465367,1),(4,28,876,876,465366,1),(4,28,876,876,465367,1),(4,29,876,876,465366,1),(4,29,876,876,465367,1),(4,30,876,876,465366,1),(4,30,876,876,465367,1),(118098,1,876,876,75788,1),(118098,1,876,876,75789,1),(118102,1,876,876,75935,1),(118106,1,876,876,75939,1),(118107,1,876,876,75940,1),(118108,1,876,876,75941,1),(118125,1,876,876,75958,1),(118144,1,876,876,75977,1),(118148,2,876,876,75981,2),(118156,1,876,876,75989,1),(118158,1,876,876,75991,1),(118176,1,876,876,76009,1),(118181,1,876,876,76020,1),(118195,3,876,876,504756,1),(118195,4,876,876,504756,1),(118195,5,876,876,504756,1),(118195,6,876,876,504756,1),(118195,7,876,876,504756,1),(118195,8,876,876,504756,1),(118195,9,876,876,504756,1),(118195,10,876,876,504756,1),(118195,11,876,876,504756,1),(118198,20,876,876,76040,2),(118198,20,876,876,76043,2),(118198,20,876,876,76048,2),(118198,21,876,876,76040,3),(118198,22,876,876,76040,3),(118198,22,876,876,76046,4),(118198,23,876,876,76040,3),(118198,23,876,876,76046,4),(118198,24,876,876,76040,3),(118198,24,876,876,76046,4),(118199,1,876,876,76054,1),(118199,2,876,876,76055,2),(118199,3,876,876,76053,3),(118199,4,876,876,76050,4),(118199,4,876,876,76051,4),(118199,5,876,876,76061,1),(118199,8,876,876,76058,4),(118201,2,876,876,76110,2),(118202,1,876,876,76114,1),(118202,2,876,876,76114,2),(118202,4,876,876,76117,3),(118202,5,876,876,76117,3),(118202,5,876,876,76120,3),(118202,6,876,876,76117,3),(118202,6,876,876,76120,3),(118202,7,876,876,76117,3),(118202,7,876,876,76120,3),(118202,8,876,876,76117,3),(118202,8,876,876,76120,3),(118202,10,876,876,76117,3),(118202,10,876,876,76120,3),(118202,12,876,876,76117,3),(118202,12,876,876,76120,3),(118202,13,876,876,76117,3),(118202,13,876,876,76120,3),(118202,14,876,876,76117,3),(118202,14,876,876,76120,3),(118202,16,876,876,76117,3),(118202,16,876,876,76120,3),(118202,18,876,876,76117,3),(118202,18,876,876,76120,3),(118202,20,876,876,76117,3),(118202,20,876,876,76120,3),(118202,21,876,876,76117,3),(118202,21,876,876,76120,3),(118202,22,876,876,76117,3),(118202,22,876,876,76120,3),(118202,23,876,876,76117,3),(118202,23,876,876,76120,3),(118202,24,876,876,76117,3),(118202,24,876,876,76120,3),(118202,25,876,876,76117,3),(118202,25,876,876,76120,3),(118202,26,876,876,76117,3),(118202,26,876,876,76120,3),(118202,27,876,876,76117,3),(118202,27,876,876,76120,3),(118202,28,876,876,76117,3),(118202,28,876,876,76120,3),(118202,29,876,876,76117,3),(118202,29,876,876,76120,3),(118202,30,876,876,76117,3),(118202,30,876,876,76120,3),(118202,31,876,876,76117,3),(118202,31,876,876,76120,3),(118202,32,876,876,76117,3),(118202,32,876,876,76120,3),(118202,33,876,876,76117,3),(118202,33,876,876,76120,3),(118202,34,876,876,76117,3),(118202,34,876,876,76120,3),(118202,36,876,876,76117,3),(118202,36,876,876,76120,3),(118202,38,876,876,76117,3),(118202,38,876,876,76120,3),(118204,1,876,876,76126,1),(118204,2,876,876,76135,1),(118204,3,876,876,76125,3),(118204,3,876,876,76137,1),(118204,4,876,876,76125,4),(118234,6,876,876,76453,1),(118245,1,876,876,76659,1),(118245,1,876,876,76666,1),(118245,4,876,876,409141,1),(118245,5,876,876,409141,1),(118245,7,876,876,409141,1),(118245,8,876,876,409141,1);
/*!40000 ALTER TABLE `t_m_corp_corp_pertains` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-03 10:25:54
