-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: openvpn
-- ------------------------------------------------------
-- Server version	5.6.16-log

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
-- Table structure for table `login_log`
--

DROP TABLE IF EXISTS `login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `trusted_ip` varchar(32) DEFAULT NULL,
  `trusted_port` varchar(20) DEFAULT NULL,
  `protocol` varchar(20) DEFAULT NULL,
  `remote_ip` varchar(32) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `bytes_received` varchar(20) DEFAULT NULL,
  `bytes_sent` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_log`
--

LOCK TABLES `login_log` WRITE;
/*!40000 ALTER TABLE `login_log` DISABLE KEYS */;
INSERT INTO `login_log` VALUES (1,'akin','2017-01-12 17:02:35','61.148.203.234','52057','tcp-server','10.100.100.6',NULL,NULL,NULL),(2,'akin','2017-01-12 17:19:29','61.148.203.230','56287','tcp-server','10.100.100.6',NULL,NULL,NULL),(3,'akin','2017-01-12 17:22:25','61.148.203.230','56413','tcp-server','10.100.100.6',NULL,NULL,NULL),(4,'akin','2017-01-12 17:39:42','61.148.203.234','57701','tcp-server','10.100.100.6',NULL,NULL,NULL),(5,'akin','2017-01-12 17:41:50','61.148.203.234','57854','tcp-server','10.100.100.6',NULL,NULL,NULL),(6,'akin','2017-01-12 17:45:58','61.148.203.234','58085','tcp-server','10.100.100.6','2017-01-12 17:48:56','4082','6544'),(7,'akin','2017-01-12 17:49:09','61.148.203.234','58220','tcp-server','10.100.100.6','2017-01-12 17:49:16','2748','5133'),(8,'test','2017-01-12 20:48:43','115.171.50.189','14916','tcp-server','10.100.100.10','2017-01-12 20:53:51','33035','207484'),(9,'akin','2017-01-12 21:29:45','223.104.254.6','2587','tcp-server','10.100.100.6','2017-01-12 21:32:57','14380','24231'),(10,'test','2017-01-12 21:43:44','115.171.50.189','18177','tcp-server','10.100.100.10','2017-01-12 23:00:09','110233','1104253'),(11,'akin','2017-01-12 22:33:01','123.117.47.29','11087','tcp-server','10.100.100.6','2017-01-12 22:33:57','4673','7092'),(12,'akin','2017-01-12 22:34:04','123.117.47.29','38735','tcp-server','10.100.100.6','2017-01-12 22:48:01','6762','10494'),(13,'akin','2017-01-13 09:51:34','61.148.203.234','49548','tcp-server','10.100.100.6','2017-01-13 09:51:39','2748','5133'),(14,'akin','2017-01-13 13:42:36','61.148.203.234','55695','tcp-server','10.100.100.6','2017-01-13 14:13:11','12341','15088'),(15,'akin','2017-01-13 16:52:48','61.148.203.230','57747','tcp-server','10.100.100.6','2017-01-13 17:20:16','514077','4011360'),(16,'akin','2017-01-13 18:44:43','61.148.203.234','59912','tcp-server','10.100.100.6','2017-01-13 19:01:30','7942','10578'),(17,'akin','2017-01-13 23:25:18','123.117.39.201','42581','tcp-server','10.100.100.6','2017-01-14 02:26:43','66726','77070'),(18,'akin','2017-01-14 10:55:43','123.117.39.201','28516','tcp-server','10.100.100.6','2017-01-14 12:43:22','38962','44522'),(19,'akin','2017-01-16 09:46:49','61.148.203.234','53561','tcp-server','10.100.100.6',NULL,NULL,NULL);
/*!40000 ALTER TABLE `login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `name` char(20) NOT NULL,
  `password` char(128) DEFAULT NULL,
  `active` int(10) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('akin','b1761c9419b142203ec803e88800c404',1),('test','cc03e747a6afbbcbf8be7668acfebee5',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-16 11:27:22
