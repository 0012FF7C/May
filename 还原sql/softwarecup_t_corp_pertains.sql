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
-- Table structure for table `t_corp_pertains`
--

DROP TABLE IF EXISTS `t_corp_pertains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_corp_pertains` (
  `ORG` int(15) DEFAULT NULL,
  `ID` int(15) DEFAULT NULL,
  `SEQ_ID` int(15) DEFAULT NULL,
  `CERTIFICATE_TYPE` varchar(50) DEFAULT NULL,
  `PERSON_NAME` varchar(50) DEFAULT NULL,
  `PERSON_TYPE` varchar(50) DEFAULT NULL,
  `CERTIFICATE_NO` varchar(50) DEFAULT NULL,
  `SELECT_TYPE` varchar(50) DEFAULT NULL,
  `HOLDPOST_START` varchar(30) DEFAULT NULL,
  `HOLDPOST_EDN` varchar(30) DEFAULT NULL,
  `SEX` varchar(10) DEFAULT NULL,
  `AGE` varchar(30) DEFAULT NULL,
  `COUNTRY` varchar(30) DEFAULT NULL,
  `CREATE_DATE` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_corp_pertains`
--

LOCK TABLES `t_corp_pertains` WRITE;
/*!40000 ALTER TABLE `t_corp_pertains` DISABLE KEYS */;
INSERT INTO `t_corp_pertains` VALUES (876,148741,1,'1861','陈贵平','1869','360102197005016338','1888','','','','','','2005/7/25'),(876,77131,2,'1861','许平','1869','320112520923041','1888','','','','','','2003/2/11'),(876,76465,2,'1861','刘为君','1871','320219','1888','','','','','','2002/5/20'),(876,76466,4,'1861','蔡佩琪','1872','320219481223729','1888','','','','','','2004/4/8'),(876,76267,2,'1861','张俊臣','1869','320625560726693','1888','','','','','','2003/3/21'),(876,76267,2,'1861','张俊臣','1869','320625560726693','1888','','','','','','2003/3/21'),(876,76939,3,'1861','曾北华','1866','420107541018154','1888','','','','','','2004/12/29'),(876,76960,1,'','金建平','1865','320106560620321','1889','','','','','','2001/9/26'),(876,75906,2,'','姜宗祥','1869','320106490308323','1889','','','','','','2002/7/4'),(876,76442,1,'1861','王正龙','1869','320103640214077','1888','','','','','','2003/12/16'),(876,76677,1,'1861','吴家驹','1869','3200001102198','','','','','','','2001/8/23'),(876,76684,2,'1861','高翔','1869','3200001102198','','','','','','','2001/8/31'),(876,76673,2,'1861','李宝泉','1869','3200001102198','','','','','','','2001/8/31'),(876,76682,2,'1861','沙晓明','1869','3200001102198','','','','','','','2001/8/31'),(876,76679,2,'1861','王明禄','1868','3200001102198','','','','','','','2001/8/31'),(876,76688,1,'1861','高翔','1869','320622580824001','1888','','','','','','2001/9/26'),(876,77137,1,'1861','戴汉忠','1871','320112600128043','1888','','','','','','2002/2/28'),(876,146278,1,'1861','王建平','1871','321002611003303','1888','','','','','','2005/3/29'),(876,75958,1,'','邓绍栋','','','','','','','','','1899/12/30'),(876,76048,2,'1861','张瑞琪','1872','320924196006158776','1888','','','','','','2005/2/4'),(876,76040,3,'1861','谈加茹','1869','320104611008082','1888','','','','','','2005/10/24'),(876,76040,3,'1861','谈加茹','1869','320104611008082','1888','','','','','','2005/10/24'),(876,76040,3,'1861','谈加茹','1869','320104611008082','1888','','','','','','2005/10/24'),(876,76040,3,'1861','谈加茹','1869','320104611008082','1888','','','','','','2005/10/24'),(876,148745,1,'1861','陆燕荪','1866','110102331226277','1888','','','','','','2005/7/25'),(876,76443,2,'1861','马赋华','1869','320102490414163','1888','','','','','','2004/7/21'),(876,76443,2,'1861','马赋华','1869','320102490414163','1888','','','','','','2004/7/21'),(876,76443,2,'1861','马赋华','1869','320102490414163','1888','','','','','','2004/7/21'),(876,76443,2,'1861','马赋华','1869','320102490414163','1888','','','','','','2004/7/21'),(876,76443,2,'1861','马赋华','1869','320102490414163','1888','','','','','','2004/7/21'),(876,76442,2,'1861','王正龙','1869','320103640214077','1888','','','','','','2004/7/21'),(876,76442,2,'1861','王正龙','1869','320103640214077','1888','','','','','','2004/7/21'),(876,76442,2,'1861','王正龙','1869','320103640214077','1888','','','','','','2004/7/21'),(876,76442,2,'1861','王正龙','1869','320103640214077','1888','','','','','','2004/7/21'),(876,76442,2,'1861','王正龙','1869','320103640214077','1888','','','','','','2004/7/21'),(876,76453,1,'1861','华金荣','1876','3200203380618091','1888','','','','','','2000/11/3'),(876,77969,1,'1861','公方军','1868','3200001100611','','','','','','','2001/3/1'),(876,77880,1,'1861','王玉英','1867','','','','','','','','2000/1/28'),(876,76135,1,'1862','寺泽辉彦(TERASAWA TE','1878','TE6064264','1889','','','','','','2001/11/2'),(876,76137,1,'1862','饭岛庸吉','1866','MQ7127355','1889','','','','','','2003/12/19'),(876,148747,2,'1861','姚远国','1869','321081195612087511','1888','','','','','','2005/8/15'),(876,148747,2,'1861','姚远国','1869','321081195612087511','1888','','','','','','2005/8/15'),(876,148747,2,'1861','姚远国','1869','321081195612087511','1888','','','','','','2005/8/15'),(876,148751,2,'1861','赵西平','1869','11010119640607034','1888','','','','','','2005/8/15'),(876,148751,2,'1861','赵西平','1869','11010119640607034','1888','','','','','','2005/8/15'),(876,148751,2,'1861','赵西平','1869','11010119640607034','1888','','','','','','2005/8/15'),(876,76948,1,'1861','李海星','1868','321002480722301','1890','','','','','','2004/3/24'),(876,75789,1,'','施献新','80092','','','','','','','','1899/12/30'),(876,75788,1,'','杨振武','1865','','','','','','','','1899/12/30'),(876,76250,2,'1861','王尔康','1869','3200001100225','','','','','','','2002/3/4'),(876,76250,2,'1861','王尔康','1869','3200001100225','','','','','','','2002/3/4'),(876,76253,2,'1861','张  凌','1869','3200001100225','','','','','','','2002/3/4'),(876,76253,2,'1861','张  凌','1869','3200001100225','','','','','','','2002/3/4'),(876,76902,1,'1861','邹之中','1869','360103550908271','1888','','','','','','1999/12/21'),(876,76897,2,'1861','张禹清','1871','320625520608691','1888','','','','','','2003/3/10'),(876,76900,2,'1861','张祝南','1869','320625690220692','1888','','','','','','2003/3/10'),(876,77345,3,'1861','石铭','1876','110105195710117111','1888','','','','','','2004/8/19'),(876,78273,2,'1861','王中浩','1868','3200001100785','','','','','','','2001/9/29'),(876,75911,4,'','蔡清泉','1869','003519002B','1889','','','','','','2005/9/8'),(876,75911,4,'','蔡清泉','1869','003519002B','1889','','','','','','2005/9/8'),(876,75911,4,'','蔡清泉','1869','003519002B','1889','','','','','','2005/9/8'),(876,75915,1,'','胡咏华','1867','320106570710201','','','','','','','1899/12/30'),(876,77110,3,'1861','陈志涛','1865','320125641012601','1889','','','','','','2003/2/10'),(876,76636,2,'','高炳华','1872','320623480815781','1888','','','','','','2002/8/27'),(876,76647,1,'','刘志刚','1869','320623660929421','1888','','','','','','2002/8/27'),(876,76641,2,'','张沛华','1869','320623510921781','1888','','','','','','2002/8/27'),(876,76632,2,'','张蔚','1871','32062340073421','1888','','','','','','2002/8/27'),(876,77181,1,'1861','唐臻华','1869','320621620711001','1888','','','','','','2004/8/2'),(876,77152,1,'1861',' 佟晓庭','1869','320105600125165','1888','','','','','','2001/5/31'),(876,76851,1,'1861','陈玉英','1867','','','','','','','','1996/12/30'),(876,76871,1,'1861','张祝南','1869','','','','','','','','1999/1/28'),(876,76879,1,'1861','李辉','1867','','','','','','','','1999/12/21'),(876,76884,1,'1861','张汉朝','1869','','','','','','','','1999/12/21'),(876,76246,2,'1861','花美芳','1871','320623560625782','1888','','','','','','2001/10/30'),(876,75981,2,'','陈金虎','','','','','','','','','2003/11/24'),(876,75989,1,'','徐  勇','','','','','','','','','1899/12/30'),(876,76114,1,'','路建平','1867','320103551028051','','','','','','','1988/6/21'),(876,76689,3,'1861','朱武','1871','320622510926021','1888','','','','','','2004/3/5'),(876,76911,2,'','张世一','1869','320106360318041','','','','','','','2001/9/20'),(876,76917,1,'','庄斌舵','1869','320106621014121','1889','','','','','','2004/7/1'),(876,77108,1,'1861','昌跃进','1872','320926590817841','1890','','','','','','2000/7/4'),(876,75861,1,'','杨晋珠','80092','','','','','','','','1899/12/30'),(876,75860,1,'','杨晓青','1867','','','','','','','','1899/12/30'),(876,76256,1,'1861','钱军','1869','320106670624085','1888','','','','','','2001/7/27'),(876,78459,1,'1861','杨炳生','','','','','','','','','1996/12/26'),(876,78468,1,'1861','胡兆辉','','','','','','','','','1999/3/3'),(876,78464,1,'1861','黄金监','','','','','','','','','1999/3/3'),(876,77515,3,'1861','潘天仪','1868','320113470715283','1890','','','','','','2003/1/21'),(876,78268,3,'1861','李  东','1869','320103630707181','1888','','','','','','2002/12/2'),(876,78271,3,'1861','朱亚平','1865','320106541206085','1889','','','','','','2002/12/2'),(876,78271,4,'1861','朱亚平','1869','320106541206085','1888','','','','','','2003/11/25'),(876,78268,5,'1861','李  东','1869','320103630707181','1888','','','','','','2004/2/25'),(876,76233,2,'1861','徐子平','1869','320623370514781','1888','','','','','','2001/10/30'),(876,146284,2,'1861','严山平','1869','321002550824063','1888','','','','','','2005/9/16'),(876,146272,3,'1861','仇翼建','1869','321002195709213031','1888','','','','','','2005/10/9'),(876,146272,3,'1861','仇翼建','1869','321002195709213031','1888','','','','','','2005/10/9'),(876,146272,3,'1861','仇翼建','1869','321002195709213031','1888','','','','','','2005/10/9'),(876,146272,3,'1861','仇翼建','1869','321002195709213031','1888','','','','','','2005/10/9'),(876,146272,3,'1861','仇翼建','1869','321002195709213031','1888','','','','','','2005/10/9'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76117,3,'1861','杨金生','1869','320114500727033','1889','','','','','','2005/4/20'),(876,76522,1,'1861','孙宝玉','','','','','','','','','1992/5/20'),(876,76553,1,'1861','高有华','1869','','','','','','','','1994/10/17'),(876,76487,1,'1861','王之麒','','','','','','','','','1991/3/13'),(876,76495,1,'1861','杨国民','','','','','','','','','1991/3/13'),(876,76966,2,'','沈厚有','1878','320104590714219','1889','','','','','','2002/7/4'),(876,76966,2,'','沈厚有','1878','320104590714219','1889','','','','','','2002/7/4'),(876,76966,2,'','沈厚有','1878','320104590714219','1889','','','','','','2002/7/4'),(876,76966,2,'','沈厚有','1878','320104590714219','1889','','','','','','2002/7/4'),(876,76966,2,'','沈厚有','1878','320104590714219','1889','','','','','','2002/7/4'),(876,76969,2,'1861','夏建中','1872','320622440203003','1888','','','','','','2002/3/5'),(876,76058,4,'','刘安平','1876','320103560311201','1888','','','','','','2003/3/4'),(876,76756,2,'1861','王泽忠','1869','130105195205201834','1888','','','','','','2005/1/10'),(876,77919,1,'1861','倪龙兴','1869','','','','','','','','2000/4/19'),(876,77916,1,'1861','魏钟林','1869','','','','','','','','2000/4/19'),(876,78667,6,'1861','夏  强','1876','320106571005041','1888','','','','','','2004/5/18'),(876,78680,1,'1861','王留彪','','','','','','','','','1993/8/7'),(876,76630,1,'1861','胡相如','1869','','','','','','','','1999/10/21'),(876,76952,2,'1861','刘仓娣','1871','321003480906026','1888','','','','','','2004/10/25'),(876,77009,1,'1861','吴同礼','','','','','','','','','1995/11/3'),(876,77010,1,'1861','许发华','','','','','','','','','1995/11/3'),(876,77000,1,'1861','张文高','','','','','','','','','1995/11/3'),(876,77015,1,'1861','周行磊','','','','','','','','','1995/11/3'),(876,77052,1,'1861','许发华','','','','','','','','','1998/11/27'),(876,76404,3,'1861','薛庆龙','1869','320621640419021','1888','','','','','','2003/2/27'),(876,76397,3,'1861','于银军','1871','320621711012791','1888','','','','','','2003/2/27'),(876,76397,4,'1861','于银军','1871','320621711012791','1888','','','','','','2004/3/11'),(876,76398,4,'1861','于拥军','1869','320211680622343','1888','','','','','','2004/3/11'),(876,76397,5,'1861','于银军','1871','320621711012791','1888','','','','','','2005/4/12'),(876,77165,1,'1861','赵富次','1869','3200001100251','','','','','','','2001/4/28'),(876,75799,1,'','乔华清','80092','','','','','','','','1899/12/30'),(876,75802,1,'1861','李双成','1865','320106460619123','1888','','','','','','2002/3/29'),(876,76241,1,'1861','吴友福','1869','320623510620003','1888','','','','','','2000/12/11'),(876,146271,1,'1861','陈勤','1871','321002571130331','1888','','','','','','2005/3/29'),(876,76090,2,'','陈锡尧','1869','N100374285','1889','','','','','','2004/10/26'),(876,76099,2,'','麦耀明','1869','779660692494','1889','','','','','','2004/10/26'),(876,76096,3,'','李耀祥','1866','262150694382','1889','','','','','','2004/12/21'),(876,76473,5,'1861','薛  强','1878','3200001100262','1888','','','','','','2004/9/21'),(876,76486,3,'1861','杨超','1871','320112197903251618','1888','','','','','','2004/11/26'),(876,76437,2,'1861','梁中田','1865','320811510811053','1888','','','','','','2003/3/25'),(876,76437,2,'1861','梁中田','1865','320811510811053','1888','','','','','','2003/3/25'),(876,76417,2,'1861','徐玉奎','1868','3200001100174','','','','','','','2003/3/25'),(876,76417,2,'1861','徐玉奎','1868','3200001100174','','','','','','','2003/3/25'),(876,77275,4,'1861','范远程','1871','321102560804005','1888','','','','','','2004/1/16'),(876,77264,4,'1861','鞠金虎','1869','321102196912231911','1888','','','','','','2004/1/16'),(876,77908,1,'1861','朱聪林','1869','','','','','','','','2000/4/19'),(876,77926,1,'1861','曹正核','1867','','','','','','','','2001/2/16'),(876,77939,1,'1861','沈建生','1869','','','','','','','','2001/2/16'),(876,77934,1,'1861','衣玉建','1869','','','','','','','','2001/2/16'),(876,146286,3,'1861','朱学林','1865','321002570319303','1888','','','','','','2005/10/9'),(876,146286,3,'1861','朱学林','1865','321002570319303','1888','','','','','','2005/10/9'),(876,146286,3,'1861','朱学林','1865','321002570319303','1888','','','','','','2005/10/9'),(876,146286,3,'1861','朱学林','1865','321002570319303','1888','','','','','','2005/10/9'),(876,146286,3,'1861','朱学林','1865','321002570319303','1888','','','','','','2005/10/9'),(876,76659,1,'','刘新安','1865','','','','','','','','1991/3/31'),(876,76009,1,'','郭  炜','','','','','','','','','1899/12/30'),(876,76561,1,'1861','王建华','1869','','','','','','','','1994/10/17'),(876,76985,1,'1861','丁宏梅','1871','320622680824002','1888','','','','','','2004/5/31'),(876,76983,3,'1861','倪绍荣','1871','320622610930001','1888','','','','','','2004/5/31'),(876,76968,4,'1861','朱瑞林','1869','320622420816001','1888','','','','','','2004/6/7'),(876,76968,4,'1861','朱瑞林','1869','320622420816001','1888','','','','','','2004/6/7'),(876,76978,1,'1861','缪一强','1869','320622520131003','1888','','','','','','2002/3/11'),(876,76399,2,'1861','黄长根','1869','320621660510023','1888','','','','','','2002/8/23'),(876,76404,2,'1861','薛庆龙','1869','320621640419021','1888','','','','','','2002/8/23'),(876,76402,3,'1861','陈警娇','1869','320621580528002','','','','','','','2003/2/27'),(876,76751,3,'','刘建华','1869','610103710629217','1888','','','','','','2005/5/9'),(876,76751,3,'','刘建华','1869','610103710629217','1888','','','','','','2005/5/9'),(876,76751,3,'','刘建华','1869','610103710629217','1888','','','','','','2005/5/9'),(876,76751,3,'','刘建华','1869','610103710629217','1888','','','','','','2005/5/9'),(876,76751,3,'','刘建华','1869','610103710629217','1888','','','','','','2005/5/9'),(876,77383,1,'1861','孙汉文','','','','','','','','','1996/11/26'),(876,77387,1,'1861','杨汉琴','','','','','','','','','1996/11/26'),(876,77400,1,'1861','洪欣','','','','','','','','','1996/11/26'),(876,77407,1,'1861','孔雪梅','','','','','','','','','1997/11/21'),(876,76408,3,'1861','王综武','1874','320105430710001','1888','','','','','','2004/9/28'),(876,78129,1,'1861','王伟鸣','1866','320114591003247','1888','','','','','','2004/8/13'),(876,77327,1,'1861','殷正坤','1871','320107460408341','1888','','','','','','1996/12/31'),(876,77334,1,'1861','俞国忠','1876','320107430206341','1888','','','','','','1996/12/31'),(876,77332,1,'1861','朱进','1879','320103560223177','1888','','','','','','1996/12/31'),(876,77337,3,'1861','刘德湘','1869','320103600808053','1888','','','','','','2003/4/4'),(876,77490,1,'','徐达书','1868','320102600205241','','','','','','','1992/11/9'),(876,78575,1,'1861','许宝成','1869','','','','','','','','1995/11/14'),(876,78796,1,'1861','王毅','1867','','','','','','','','1996/12/31'),(876,79424,1,'1861','李金亮','','','','','','','','','1994/4/1'),(876,77974,1,'1861','俞荣林','1868','3201066600509083','1889','','','','','','2001/3/1'),(876,78506,2,'','姜建友','1878','32100219660328095','1888','','','','','','2002/12/27'),(876,78425,2,'1861','蒋建平','1871','320223600320111','1888','','','','','','2003/4/14'),(876,78426,2,'1861','徐南','1871','320223571017111','1888','','','','','','2003/4/14'),(876,78420,3,'1861','陈全超','1866','320223520620111','1888','','','','','','2003/11/17'),(876,78908,3,'1861','陈博麟','1878','320101470810021','1889','','','','','','2002/4/10'),(876,78510,2,'','吴晓梅','1869','120103580120266','1888','','','','','','2005/7/28'),(876,78510,2,'','吴晓梅','1869','120103580120266','1888','','','','','','2005/7/28'),(876,78510,2,'','吴晓梅','1869','120103580120266','1888','','','','','','2005/7/28'),(876,78510,2,'','吴晓梅','1869','120103580120266','1888','','','','','','2005/7/28'),(876,78510,2,'','吴晓梅','1869','120103580120266','1888','','','','','','2005/7/28'),(876,77271,5,'1861','缪光全','1869','321102570318191','1888','','','','','','2004/9/22'),(876,77271,5,'1861','缪光全','1869','321102570318191','1888','','','','','','2004/9/22'),(876,77710,1,'','肖平生','1867','320106570422081','','','','','','','1993/2/4'),(876,78667,3,'1861','夏  强','1876','320106571005041','1888','','','','','','2003/4/23'),(876,80098,6,'1861','姜国良','1866','320622195411262194','1888','','','','','','2004/11/10'),(876,80106,7,'1861','张德昌','1872','320622461029023','1888','','','','','','2005/4/22'),(876,80106,7,'1861','张德昌','1872','320622461029023','1888','','','','','','2005/4/22'),(876,80121,1,'1861','浦忠文','1871','320106680508323','1888','','','','','','2003/5/22');
/*!40000 ALTER TABLE `t_corp_pertains` ENABLE KEYS */;
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
