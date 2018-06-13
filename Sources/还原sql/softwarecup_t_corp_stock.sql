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
-- Table structure for table `t_corp_stock`
--

DROP TABLE IF EXISTS `t_corp_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_corp_stock` (
  `ORG` decimal(20,0) DEFAULT NULL,
  `ID` decimal(20,0) DEFAULT NULL,
  `SEQ_ID` decimal(20,0) DEFAULT NULL,
  `STOCK_TYPE` varchar(50) DEFAULT NULL,
  `COUNTRY` varchar(50) DEFAULT NULL,
  `CERTIFICATE_TYPE` varchar(50) DEFAULT NULL,
  `CERTIFICATE_NO` varchar(50) DEFAULT NULL,
  `STOCK_NAME` varchar(100) DEFAULT NULL,
  `STOCK_CAPI_TYPE` decimal(10,0) DEFAULT NULL,
  `STOCK_CAPI` decimal(25,0) DEFAULT NULL,
  `STOCK_CAPI_DOLLAR` decimal(15,3) DEFAULT NULL,
  `STOCK_CAPI_RMB` decimal(10,0) DEFAULT NULL,
  `STOCK_PERCENT` varchar(50) DEFAULT NULL,
  `STOCK_RATE_RMB` decimal(10,0) DEFAULT NULL,
  `STOCK_RATE_DOLLAR` decimal(12,6) DEFAULT NULL,
  `CREATE_DATE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_corp_stock`
--

LOCK TABLES `t_corp_stock` WRITE;
/*!40000 ALTER TABLE `t_corp_stock` DISABLE KEYS */;
INSERT INTO `t_corp_stock` VALUES (876,77008,4,'101','','','','江苏省轻工业厅（江苏省轻工资产管理有限公司）',NULL,1482000000,NULL,NULL,'',NULL,NULL,'2004/9/15'),(876,76934,4,'73','','1792','3200001105118','江苏省惠隆资产管理有限公司',NULL,2000000000,NULL,NULL,'',NULL,NULL,'2004/10/28'),(876,76913,6,'','','','','江苏省电信实业集团有限责任公司',NULL,1408000000,NULL,NULL,'',NULL,NULL,'2005/3/29'),(876,75621,4,'36','','1791','330325590312461','谢公社',NULL,103000000,NULL,NULL,'',NULL,NULL,'2004/3/29'),(876,75623,4,'36','','1791','330325040521021','欧玉叶',NULL,23200000,NULL,NULL,'',NULL,NULL,'2004/3/29'),(876,75624,6,'36','','1791','320106591023323','魏异军',NULL,121000000,NULL,NULL,'',NULL,NULL,'2005/9/23'),(876,75625,6,'36','','1791','320112281003162','邱宗玉',NULL,79000000,NULL,NULL,'',NULL,NULL,'2005/9/23'),(876,76784,6,'98','','','','江苏省人民政府',NULL,30000000000,NULL,NULL,'',NULL,NULL,'2004/5/13'),(876,76790,2,'101','','','','江苏省人民政府侨务办公室',NULL,60000000,NULL,NULL,'',NULL,NULL,'2003/4/23'),(876,76967,2,'','','','','南京841研究所',NULL,2071000000,NULL,NULL,'',NULL,NULL,'2005/2/4'),(876,76968,3,'73','','1792','3200001105153','江苏省粮食集团有限责任公司',NULL,714800000,NULL,NULL,'',NULL,NULL,'2003/8/4'),(876,82011,3,'36','','1791','321084670207321','金传国',2774,40000000,0.000,0,'2',NULL,NULL,'2011/11/17 14:18'),(876,76961,6,'43','','1792','1000001000124','中国石油化工集团公司',NULL,152599600000,NULL,NULL,'',NULL,NULL,'2005/9/6'),(876,76824,2,'36','','1791','320103550703051','王尔康',NULL,10000000,NULL,NULL,'',NULL,NULL,'2002/3/4'),(876,76825,2,'36','','1791','320106681011242','张凌',NULL,5000000,NULL,NULL,'',NULL,NULL,'2002/3/4'),(876,78419,2,'43','','1792','1000001001047','中国石油物资装备（集团）总公司',NULL,5515000000,NULL,NULL,'',NULL,NULL,'2002/4/25'),(876,79002,2,'43','','','3200001100986','江苏省非金属设备材料公司',NULL,100000000,NULL,NULL,'',NULL,NULL,'2004/4/14'),(876,78262,5,'97','','','','江苏省贸易厅（江苏省贸易资产管理有限公司）',NULL,586000000,NULL,NULL,'',NULL,NULL,'2005/8/4'),(876,78719,3,'101','','','','江苏省贸易厅（江苏省贸易资产管理有限公司）',NULL,6402000000,NULL,NULL,'',NULL,NULL,'2005/9/5'),(876,78499,2,'101','','','','南京大学',NULL,30300000,NULL,NULL,'',NULL,NULL,'2003/6/10'),(876,78503,2,'','','','','南京艺术学院',NULL,120000000,NULL,NULL,'',NULL,NULL,'2002/5/21'),(876,77279,1,'1','36','1791','320682198810230000','张馨',130,1000,2000.000,0,'0',NULL,NULL,'2014/1/3 17:30'),(876,76988,2,'101','','','','江苏省药品监督管理局',NULL,156550000,NULL,NULL,'',NULL,NULL,'2003/8/21'),(876,76799,1,'73','','1792','','江苏交通控股有限公司',NULL,3860600000,NULL,NULL,'',NULL,NULL,'2002/12/9'),(876,78487,3,'73','','1792','3200001105120','江苏省国有资产经营（控股）有限公司',NULL,3012000000,NULL,NULL,'',NULL,NULL,'2005/3/2'),(876,75622,4,'36','','1791','330325540922462','谢三妹',NULL,32600000,NULL,NULL,'',NULL,NULL,'2004/3/29'),(876,76984,3,'101','','','','江苏人民广播电台',NULL,141900000,NULL,NULL,'',NULL,NULL,'2004/2/18'),(876,76846,2,'73','','1792','3200001104918','江苏省轻工资产管理有限公司',NULL,582000000,NULL,NULL,'',NULL,NULL,'2001/12/31'),(876,78479,2,'94','','1805','','王良龙',NULL,1500000000,NULL,NULL,'',NULL,NULL,'2002/9/24'),(876,76826,2,'36','','1791','320106670624085','钱军',NULL,5000000,NULL,NULL,'',NULL,NULL,'2002/3/4'),(876,76827,2,'36','','1791','320105500324004','武玲芳',NULL,5000000,NULL,NULL,'',NULL,NULL,'2002/3/4'),(876,76828,2,'36','','1791','321022471006281','吴新安',NULL,5000000,NULL,NULL,'',NULL,NULL,'2002/3/4'),(876,76829,2,'36','','1791','320107690920031','李骁',NULL,5000000,NULL,NULL,'',NULL,NULL,'2002/3/4'),(876,76830,2,'36','','1791','3201013510928000','秦志玲',NULL,5000000,NULL,NULL,'',NULL,NULL,'2002/3/4'),(876,76831,2,'36','','1791','320104700714001','路海晨',NULL,2000000,NULL,NULL,'',NULL,NULL,'2002/3/4'),(876,76832,2,'36','','1791','320103471106004','费郁馥',NULL,3000000,NULL,NULL,'',NULL,NULL,'2002/3/4'),(876,76833,2,'36','','1791','320103660322126','何晴',NULL,2000000,NULL,NULL,'',NULL,NULL,'2002/3/4'),(876,76834,2,'36','','1791','320103541022152','张俊慧',NULL,2000000,NULL,NULL,'',NULL,NULL,'2002/3/4'),(876,76835,2,'36','','1791','320104670315081','张晨兵',NULL,1000000,NULL,NULL,'',NULL,NULL,'2002/3/4'),(876,76838,2,'101','','','','江苏省公安厅',NULL,200000000,NULL,NULL,'',NULL,NULL,'2001/10/9'),(876,78639,2,'101','','','','江苏省国家安全厅',NULL,1000000000,NULL,NULL,'',NULL,NULL,'2003/5/13'),(876,78718,2,'43','','1792','1000001000162','中国黄金集团公司',NULL,50500000,NULL,NULL,'',NULL,NULL,'2004/3/18'),(876,78497,3,'101','','','','中国林业科学研究院林产化学工业研究所',NULL,123000000,NULL,NULL,'',NULL,NULL,'2004/11/26'),(876,78607,1,'73','','','3200001103268','江苏方源集团有限公司',NULL,3000000000,NULL,NULL,'',NULL,NULL,'2001/7/27'),(876,78608,2,'43','','','','河海大学',NULL,150000000,NULL,NULL,'',NULL,NULL,'2004/3/11'),(876,78610,3,'101','','','','江苏省新闻出版局',NULL,89220000,NULL,NULL,'',NULL,NULL,'2005/1/14'),(876,78108,2,'43','','','','南京分析仪器厂',NULL,10000000,NULL,NULL,'',NULL,NULL,'2002/3/13'),(876,78109,2,'43','','','','南京第一化工仪表厂',NULL,5000000,NULL,NULL,'',NULL,NULL,'2002/3/13'),(876,78516,3,'','','','','江苏省人民代表大会常务委员会办公厅',NULL,584000000,NULL,NULL,'',NULL,NULL,'2003/10/30'),(876,78518,2,'','','','','南京邮电学院',NULL,7000000,NULL,NULL,'',NULL,NULL,'2004/3/12'),(876,78690,2,'43','','','3200001100521','江苏省通信设备厂',NULL,11900000,NULL,NULL,'',NULL,NULL,'2005/8/9'),(876,78691,3,'101','','','','江苏省计量测试技术研究所',NULL,15000000,NULL,NULL,'',NULL,NULL,'2003/11/24'),(876,77982,2,'101','','','','南京体育学院',NULL,31000000,NULL,NULL,'',NULL,NULL,'2004/2/25'),(876,79872,2,'43','','1805','','江苏金陵科技集团公司',NULL,68000000,NULL,NULL,'',NULL,NULL,'2002/3/13'),(876,78725,7,'','','','','江苏省信息中心',NULL,580000000,NULL,NULL,'',NULL,NULL,'2004/9/6'),(876,79012,2,'101','','','','南京师范大学',NULL,16000000,NULL,NULL,'',NULL,NULL,'2004/4/28'),(876,78216,2,'95','','','','江苏省总工会',NULL,168000000,NULL,NULL,'',NULL,NULL,'2003/12/31'),(876,78220,2,'36','','1791','320106460808001','周怀成',NULL,60000000,NULL,NULL,'',NULL,NULL,'2003/5/26'),(876,78110,2,'43','','','','南京化工电器仪表厂',NULL,5000000,NULL,NULL,'',NULL,NULL,'2002/3/13'),(876,78114,2,'43','','','','南通凯登仪表',NULL,10000000,NULL,NULL,'',NULL,NULL,'2002/3/13'),(876,78115,2,'44','','','','阜宁县阀门厂',NULL,5000000,NULL,NULL,'',NULL,NULL,'2002/3/13'),(876,78116,2,'44','','','','江都仪表厂',NULL,6000000,NULL,NULL,'',NULL,NULL,'2002/3/13'),(876,78117,2,'44','','','','无锡仪表阀门厂',NULL,15000000,NULL,NULL,'',NULL,NULL,'2002/3/13'),(876,78566,3,'73','','1792','3200001100621','南京金陵饭店集团有限公司',NULL,443200000,NULL,NULL,'',NULL,NULL,'2004/3/2'),(876,78567,1,'43','','','','河海大学',NULL,201100000,NULL,NULL,'',NULL,NULL,'2001/2/27'),(876,78256,2,'101','','','','南京大学',NULL,12000000,NULL,NULL,'',NULL,NULL,'2004/2/27'),(876,78258,2,'101','','','','水利部、交通部、电力工业部南京水利科学研究院',NULL,1167000000,NULL,NULL,'',NULL,NULL,'2002/3/21'),(876,78570,2,'101','','','','南京博物院',NULL,50000000,NULL,NULL,'',NULL,NULL,'2004/3/25'),(876,78574,1,'43','','1792','1000001000008','中国煤炭物产集团公司',NULL,273500000,NULL,NULL,'',NULL,NULL,'2001/4/10'),(876,78575,3,'101','','','','中国药科大学',NULL,36000000,NULL,NULL,'',NULL,NULL,'2004/8/27'),(876,79867,4,'101','','1805','','江苏省中医院',NULL,56000000,NULL,NULL,'',NULL,NULL,'2005/3/17'),(876,79880,6,'101','','1805','','中商企业集团公司',NULL,5000000000,NULL,NULL,'',NULL,NULL,'2005/3/4'),(876,78519,3,'','','','','中国矿业大学',NULL,710900000,NULL,NULL,'',NULL,NULL,'2004/4/15'),(876,78689,3,'101','','','','南京林业大学',NULL,100000000,NULL,NULL,'',NULL,NULL,'2004/3/8'),(876,78643,3,'','','','','中国轻工集团公司',NULL,3177700000,NULL,NULL,'',NULL,NULL,'2004/6/28'),(876,79010,2,'','','','','江苏省科教电影电视协会',NULL,50000000,NULL,NULL,'',NULL,NULL,'2005/3/3'),(876,78221,2,'','','','','中国烟草总公司江苏省公司',NULL,772000000,NULL,NULL,'',NULL,NULL,'2002/2/28'),(876,78222,3,'','','','','中国物资储运总公司',NULL,1713000000,NULL,NULL,'',NULL,NULL,'2004/5/11'),(876,78111,2,'44','','','','南京压力表厂',NULL,5000000,NULL,NULL,'',NULL,NULL,'2002/3/13'),(876,78616,2,'94','','','','江苏省科学技术协会',NULL,157500000,NULL,NULL,'',NULL,NULL,'2004/2/19'),(876,78620,2,'','','','','河海大学劳动服务公司',NULL,6000000,NULL,NULL,'',NULL,NULL,'2005/1/24'),(876,78112,2,'43','','','','常州热工仪表厂',NULL,5000000,NULL,NULL,'',NULL,NULL,'2002/3/13'),(876,78113,2,'44','','','','苏州仪表总厂',NULL,5000000,NULL,NULL,'',NULL,NULL,'2002/3/13'),(876,78259,2,'101','','','','江苏省轻工业厅（江苏省轻工资产管理有限公司）',NULL,712500000,NULL,NULL,'',NULL,NULL,'2004/3/9'),(876,79477,3,'101','','','','南京林业大学',NULL,81000000,NULL,NULL,'',NULL,NULL,'2004/4/9'),(876,78506,6,'','','','','如皋无线电二厂',NULL,42000000,NULL,NULL,'',NULL,NULL,'2004/6/7'),(876,78507,6,'','','','','如皋教学试剂厂',NULL,28000000,NULL,NULL,'',NULL,NULL,'2004/6/7'),(876,78248,3,'25','','1792','3200001100465','中国烟草总公司江苏省公司',NULL,47000000,NULL,NULL,'',NULL,NULL,'2005/6/24'),(876,78026,2,'43','','1792','3200001101767','江苏省物资集团总公司',NULL,1079000000,NULL,NULL,'',NULL,NULL,'2003/11/26'),(876,81180,2,'95','','1805','苏民社登字00264号','江苏省建设机械金属结构协会',NULL,3000000,NULL,NULL,'',NULL,NULL,'2004/3/8'),(876,79899,3,'43','','1792','3200001100680','中国石化集团南京设计院',NULL,501000000,NULL,NULL,'',NULL,NULL,'2004/4/13'),(876,79901,1,'','','','','江苏省计划与经济劳动服务公司',NULL,218000000,NULL,NULL,'',NULL,NULL,'2001/3/28'),(876,81262,1,'94','','1792','事证第132000000916号','南京师范大学',NULL,11000000,NULL,NULL,'',NULL,NULL,'2003/6/20'),(876,81267,2,'101','','','','江苏省国家税务局',NULL,40000000,NULL,NULL,'',NULL,NULL,'2004/2/3'),(876,78942,1,'36','','1791','310105197004062000','章斌',NULL,3000000,NULL,NULL,'',NULL,NULL,'2003/3/11'),(876,78943,1,'36','','1791','310105681003285','杨光',NULL,3000000,NULL,NULL,'',NULL,NULL,'2003/3/11'),(876,78946,1,'36','','1791','320107631005348','鲁红',NULL,2000000,NULL,NULL,'',NULL,NULL,'2003/3/11'),(876,78834,4,'101','','','','省气象台',NULL,50000000,NULL,NULL,'',NULL,NULL,'2004/2/25'),(876,79476,4,'94','','1792','','南京大学',NULL,494500000,NULL,NULL,'',NULL,NULL,'2004/6/23'),(876,79825,2,'94','','1792','','南京中医药大学',NULL,1641779313,NULL,NULL,'',NULL,NULL,'2003/12/4'),(876,78089,2,'101','','','','南京大学',NULL,32500000,NULL,NULL,'',NULL,NULL,'2004/2/27'),(876,78504,6,'','','','','周远征等874名内部职工股',NULL,160000000,NULL,NULL,'',NULL,NULL,'2004/6/7'),(876,78505,6,'','','','','南通市城市建设开发公司',NULL,200000000,NULL,NULL,'',NULL,NULL,'2004/6/7'),(876,78508,6,'','','','','如皋市国有资产经营有限公司',NULL,873000000,NULL,NULL,'',NULL,NULL,'2004/6/7'),(876,78511,3,'101','','','','东南大学',NULL,512000000,NULL,NULL,'',NULL,NULL,'2003/6/26'),(876,78625,4,'','','','','江苏商业管理干部学院',NULL,30000000,NULL,NULL,'',NULL,NULL,'2004/4/5'),(876,78997,8,'43','','1792','1000001000041','中国中化集团公司',NULL,5000000000,NULL,NULL,'',NULL,NULL,'2005/5/30'),(876,78515,4,'43','','1792','','中国石油化工集团公司',NULL,1606000000,NULL,NULL,'',NULL,NULL,'2004/4/14'),(876,78246,3,'101','','','','南京化工职业技术学院',NULL,90000000,NULL,NULL,'',NULL,NULL,'2004/3/24'),(876,78993,3,'101','','','','南京师范大学',NULL,5000000,NULL,NULL,'',NULL,NULL,'2005/11/30'),(876,81263,3,'101','','','','南京信息工程大学',NULL,38000000,NULL,NULL,'',NULL,NULL,'2004/12/17'),(876,81264,2,'','','','','南京师范大学',NULL,60700000,NULL,NULL,'',NULL,NULL,'2004/5/11'),(876,81266,1,'101','','','','江苏省环境保护厅',NULL,812000000,NULL,NULL,'',NULL,NULL,'2001/3/13'),(876,78944,1,'36','','1791','320106541030087','杨天鹏',NULL,2000000,NULL,NULL,'',NULL,NULL,'2003/3/11'),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,''),(NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,NULL,'');
/*!40000 ALTER TABLE `t_corp_stock` ENABLE KEYS */;
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
