-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user info',7,'add_userinfo'),(20,'Can change user info',7,'change_userinfo'),(21,'Can delete user info',7,'delete_userinfo'),(22,'Can add order',8,'add_order'),(23,'Can change order',8,'change_order'),(24,'Can delete order',8,'delete_order'),(25,'Can add goods',9,'add_goods'),(26,'Can change goods',9,'change_goods'),(27,'Can delete goods',9,'delete_goods'),(28,'Can add goods info',10,'add_goodsinfo'),(29,'Can change goods info',10,'change_goodsinfo'),(30,'Can delete goods info',10,'delete_goodsinfo'),(31,'Can add type info',11,'add_typeinfo'),(32,'Can change type info',11,'change_typeinfo'),(33,'Can delete type info',11,'delete_typeinfo'),(34,'Can add my cars',12,'add_mycars'),(35,'Can change my cars',12,'change_mycars'),(36,'Can delete my cars',12,'delete_mycars'),(37,'Can view log entry',1,'view_logentry'),(38,'Can view group',4,'view_group'),(39,'Can view permission',2,'view_permission'),(40,'Can view user',3,'view_user'),(41,'Can view content type',5,'view_contenttype'),(42,'Can view session',6,'view_session'),(43,'Can view user info',7,'view_userinfo'),(44,'Can view goods info',10,'view_goodsinfo'),(45,'Can view type info',11,'view_typeinfo'),(46,'Can add order info',13,'add_orderinfo'),(47,'Can change order info',13,'change_orderinfo'),(48,'Can delete order info',13,'delete_orderinfo'),(49,'Can view order info',13,'view_orderinfo'),(50,'Can add order detail info',14,'add_orderdetailinfo'),(51,'Can change order detail info',14,'change_orderdetailinfo'),(52,'Can delete order detail info',14,'delete_orderdetailinfo'),(53,'Can view order detail info',14,'view_orderdetailinfo'),(54,'Can view goods',9,'view_goods'),(55,'Can view order',8,'view_order'),(56,'Can view my cars',12,'view_mycars');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$oixKEEPbCqzp$SLUCX8V65cNDoTTzyQBoIhU8p2u73vmPEWn2nPywlDo=','2018-10-08 00:44:07.672990',1,'zhaoning','','','123@163.com',1,1,'2018-10-08 00:44:01.679191');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_goods_goodsinfo`
--

DROP TABLE IF EXISTS `df_goods_goodsinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_goods_goodsinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gtitle` varchar(20) NOT NULL,
  `gpic` varchar(100) NOT NULL,
  `gprice` decimal(10,2) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `gunit` varchar(20) NOT NULL,
  `gclick` int(11) NOT NULL,
  `gjianjie` varchar(200) NOT NULL,
  `gkucun` int(11) NOT NULL,
  `gcontent` longtext NOT NULL,
  `gtype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_goods_goodsinfo_gtype_id_63a02cef_fk_df_goods_typeinfo_id` (`gtype_id`),
  CONSTRAINT `df_goods_goodsinfo_gtype_id_63a02cef_fk_df_goods_typeinfo_id` FOREIGN KEY (`gtype_id`) REFERENCES `df_goods_typeinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_goods_goodsinfo`
--

LOCK TABLES `df_goods_goodsinfo` WRITE;
/*!40000 ALTER TABLE `df_goods_goodsinfo` DISABLE KEYS */;
INSERT INTO `df_goods_goodsinfo` VALUES (1,'寒锋战术夹克秋冬新款轻薄软壳冲锋衣','df_goods/20180906081454373.jpg',399.00,0,'件',97,'龙牙（Dragon Tooth）寒锋战术软壳夹克秋冬新款都市特工运动防风轻薄男士软壳冲锋衣',500,'<p>&nbsp;</p>\r\n<p>寒锋战术软壳夹克秋冬新款都市特工运动防风轻薄男士软壳冲锋衣</p>\r\n<p>&nbsp;</p>',1),(2,'姜振宇龙牙合作款男士户外运动卫衣','df_goods/20180110035423844.jpg',499.00,0,'件',99,'姜振宇龙牙合作款男士户外运动卫衣',100,'<h2 class=\"productname\">龙牙定制版豹子头战术卫衣 姜振宇龙牙合作款男士户外运动卫衣</h2>',1),(3,'战地夹克男士户外防风衣','df_goods/20180911120058946.jpg',266.00,0,'件',46,'M65战地夹克男士户外防风衣 连帽外套运动冲锋衣',200,'<p>M65战地夹克男士户外防风衣 连帽外套运动冲锋衣</p>',1),(4,'防风男秋冬款大衣','df_goods/20141222093109890_XSWpS0u.jpg',599.00,0,'件',53,'5.11 5合1风衣 冬季保暖外套 防风男秋冬款大衣 511风衣',300,'<p>5.11 5合1风衣 冬季保暖外套 防风男秋冬款大衣 511风衣</p>',1),(5,'寒锋战术软壳长裤','df_goods/20170103021335674.jpg',399.00,0,'件',50,'秋冬新品 龙牙寒锋战术软壳长裤 抓绒保暖防风防泼水',200,'<p>秋冬新品 龙牙寒锋战术软壳长裤 抓绒保暖防风防泼水</p>',2),(6,'轻量快干战术长裤','df_goods/20180822040628230.jpg',788.00,0,'件',22,'美国Propper“暗号”轻量快干战术长裤 军迷户外工装',33,'<p>美国Propper&ldquo;暗号&rdquo;轻量快干战术长裤 军迷户外工装</p>',2),(7,'二代潜伏者战术裤','df_goods/20161010073338365.jpg',666.00,0,'件',66,'龙牙二代潜伏者战术裤 四面弹高级面料 黑竹炭纤维',33,'<p>龙牙二代潜伏者战术裤 四面弹高级面料 黑竹炭纤维</p>',2),(8,'破锋者特战长裤','df_goods/20141112105421473.jpg',888.00,0,'件',366,'破锋者特战长裤 男式户外塑形加强版长裤',666,'<p>破锋者特战长裤 男式户外塑形加强版长裤</p>',2),(9,'男特种兵男士运动鞋','df_goods/20180111034422376.jpg',788.00,0,'双',45,'龙牙城市猎人战术通勤靴作战靴男特种兵男士运动鞋',44,'<p>龙牙城市猎人战术通勤靴作战靴男特种兵男士运动鞋</p>',3),(10,'美军700V作战靴','df_goods/20180202110446117.jpg',455.00,0,'双',55,'Belleville 美军700V作战靴',55,'<p>Belleville 美军700V作战靴</p>',3),(11,'夏季8寸沙漠战靴','df_goods/20180111034605243.jpg',666.00,0,'双',66,'君洛克飞鱼SFB轻夏季8寸沙漠战靴',66,'<p>君洛克飞鱼SFB轻夏季8寸沙漠战靴</p>',3),(12,'户外作战靴训练鞋','df_goods/20171116051133281.jpg',555.00,0,'双',77,'Lowa Z-8S GTX男式中帮户外作战靴训练鞋 耐磨防滑',77,'<p>Lowa Z-8S GTX男式中帮户外作战靴训练鞋 耐磨防滑</p>',3),(13,'潜水自动机械腕表','df_goods/20160104121513528.jpg',4552.00,0,'块',66,'MARATHON马拉松 海军陆战队潜水自动机械腕表',66,'<p>MARATHON马拉松 海军陆战队潜水自动机械腕表</p>',4),(14,'Jungmann飞行表','df_goods/20130421055718016.jpg',6662.00,0,'块',66,'瑞士机芯 Traser T5302 Aviator Jungmann飞行表',77,'<p>瑞士机芯 Traser T5302 Aviator Jungmann飞行表</p>',4),(15,'机械自动潜水表','df_goods/20160415034641205.jpg',3331.00,0,'块',88,'MARATHON马拉松 双语双时潜水专家 机械自动潜水表',88,'<p>MARATHON马拉松 双语双时潜水专家 机械自动潜水表</p>',4),(16,'ELITE CHRONOGRAPH','df_goods/20171115044946268.jpg',3442.00,0,'块',44,'瑞士机芯 Traser 精英三眼计时 ELITE CHRONOGRAPH',44,'<p>瑞士机芯 Traser 精英三眼计时 ELITE CHRONOGRAPH</p>',4),(17,'Molle 行者挎包','df_goods/20170307100526387.jpg',333.00,0,'件',50,'COMBAT2000 Molle 行者挎包',50,'<p>COMBAT2000 Molle 行者挎包</p>',5),(18,'波兰豹纹背包(军版)','df_goods/20151102110449506.jpg',233.00,0,'件',36,'剩余物资 波兰豹纹背包(军版) 男女户外旅行 军版登山',41,'<p>剩余物资 波兰豹纹背包(军版) 男女户外旅行 军版登山</p>',5),(19,'3日背包全套','df_goods/20161008024126143.jpg',341.99,0,'件',14,'COMBAT2000 Molle 3日背包全套',5425,'<p>COMBAT2000 Molle 3日背包全套</p>',5),(20,'TT基础双肩包','df_goods/20160914022434986.jpg',434.00,0,'件',14,'塔虎TASMANIAN TIGER TT基础双肩包 MKII 战术户外便',50,'<p>塔虎TASMANIAN TIGER TT基础双肩包 MKII 战术户外便</p>',5),(21,'海军陆战队棒球帽','df_goods/20161230103544051.jpg',232.00,0,'件',46,'Rapid Dominance 海军陆战队棒球帽',44,'<p>Rapid Dominance 海军陆战队棒球帽</p>',6),(22,'军事防护太阳镜','df_goods/20161221125552338.jpg',2323.00,0,'件',33,'WILEY X SAINT SUNGLASSES 军事防护太阳镜',33,'<p>WILEY X SAINT SUNGLASSES 军事防护太阳镜</p>',6),(23,'户外防晒太阳帽遮阳帽','df_goods/20160829020859392.jpg',333.00,0,'件',44,'5.11 2016 LOGO帽 89433 户外防晒太阳帽遮阳帽',55,'<p>5.11 2016 LOGO帽 89433 户外防晒太阳帽遮阳帽</p>',6),(24,'型防风沙护目镜','df_goods/20161221125552338_cCBMRWc.jpg',222.00,0,'件',11,'Rothco G.I.型防风沙护目镜 黑色 10350',44,'<p>Rothco G.I.型防风沙护目镜 黑色 10350</p>',6);
/*!40000 ALTER TABLE `df_goods_goodsinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_goods_typeinfo`
--

DROP TABLE IF EXISTS `df_goods_typeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_goods_typeinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ttitle` varchar(50) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_goods_typeinfo`
--

LOCK TABLES `df_goods_typeinfo` WRITE;
/*!40000 ALTER TABLE `df_goods_typeinfo` DISABLE KEYS */;
INSERT INTO `df_goods_typeinfo` VALUES (1,'上衣',0),(2,'裤子',0),(3,'鞋类',0),(4,'６６军用手表',0),(5,'战术包具',0),(6,'战术配饰',0);
/*!40000 ALTER TABLE `df_goods_typeinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_order_orderdetailinfo`
--

DROP TABLE IF EXISTS `df_order_orderdetailinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_order_orderdetailinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_order_orderdetail_goods_id_d0acef4d_fk_df_goods_` (`goods_id`),
  KEY `df_order_orderdetail_order_id_b91dcf67_fk_df_order_` (`order_id`),
  CONSTRAINT `df_order_orderdetail_goods_id_d0acef4d_fk_df_goods_` FOREIGN KEY (`goods_id`) REFERENCES `df_goods_goodsinfo` (`id`),
  CONSTRAINT `df_order_orderdetail_order_id_b91dcf67_fk_df_order_` FOREIGN KEY (`order_id`) REFERENCES `df_order_orderinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_order_orderdetailinfo`
--

LOCK TABLES `df_order_orderdetailinfo` WRITE;
/*!40000 ALTER TABLE `df_order_orderdetailinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `df_order_orderdetailinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_order_orderinfo`
--

DROP TABLE IF EXISTS `df_order_orderinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_order_orderinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oIsPay` tinyint(1) NOT NULL,
  `Ototal` decimal(10,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_order_orderinfo_user_id_2d705949_fk_df_user_userinfo_id` (`user_id`),
  CONSTRAINT `df_order_orderinfo_user_id_2d705949_fk_df_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `df_user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_order_orderinfo`
--

LOCK TABLES `df_order_orderinfo` WRITE;
/*!40000 ALTER TABLE `df_order_orderinfo` DISABLE KEYS */;
INSERT INTO `df_order_orderinfo` VALUES (1,0,276.00,1);
/*!40000 ALTER TABLE `df_order_orderinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_user_userinfo`
--

DROP TABLE IF EXISTS `df_user_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_user_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `upwd` varchar(40) NOT NULL,
  `uemail` varchar(30) NOT NULL,
  `ushou` varchar(20) NOT NULL,
  `uaddress` varchar(100) NOT NULL,
  `uyoubian` varchar(6) NOT NULL,
  `uphone` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_user_userinfo`
--

LOCK TABLES `df_user_userinfo` WRITE;
/*!40000 ALTER TABLE `df_user_userinfo` DISABLE KEYS */;
INSERT INTO `df_user_userinfo` VALUES (1,'zhaoning','17870e7521aecea1a42d7df936160255ee195fd5','41414@qq.com','','','',''),(2,'wc38954','147d4e9368a5b57c4fc96436560efd195686a8f1','154sfd@qq.com','','','','');
/*!40000 ALTER TABLE `df_user_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-10-08 01:16:04.885809','1','上衣',1,'[{\"added\": {}}, {\"added\": {\"name\": \"goods info\", \"object\": \"\\u5bd2\\u950b\\u6218\\u672f\\u5939\\u514b\\u79cb\\u51ac\\u65b0\\u6b3e\\u8f7b\\u8584\\u8f6f\\u58f3\\u51b2\\u950b\\u8863\"}}, {\"added\": {\"name\": \"goods info\", \"object\": \"\\u59dc\\u632f\\u5b87\\u9f99\\u7259\\u5408\\u4f5c\\u6b3e\\u7537\\u58eb\\u6237\\u5916\\u8fd0\\u52a8\\u536b\\u8863\"}}, {\"added\": {\"name\": \"goods info\", \"object\": \"\\u6218\\u5730\\u5939\\u514b\\u7537\\u58eb\\u6237\\u5916\\u9632\\u98ce\\u8863\"}}, {\"added\": {\"name\": \"goods info\", \"object\": \"\\u9632\\u98ce\\u7537\\u79cb\\u51ac\\u6b3e\\u5927\\u8863\"}}]',11,1),(2,'2018-10-08 01:20:51.570423','2','裤子',1,'[{\"added\": {}}, {\"added\": {\"name\": \"goods info\", \"object\": \"\\u5bd2\\u950b\\u6218\\u672f\\u8f6f\\u58f3\\u957f\\u88e4\"}}, {\"added\": {\"name\": \"goods info\", \"object\": \"\\u8f7b\\u91cf\\u5feb\\u5e72\\u6218\\u672f\\u957f\\u88e4\"}}, {\"added\": {\"name\": \"goods info\", \"object\": \"\\u4e8c\\u4ee3\\u6f5c\\u4f0f\\u8005\\u6218\\u672f\\u88e4\"}}, {\"added\": {\"name\": \"goods info\", \"object\": \"\\u7834\\u950b\\u8005\\u7279\\u6218\\u957f\\u88e4\"}}]',11,1),(3,'2018-10-08 01:25:16.718500','3','鞋类',1,'[{\"added\": {}}, {\"added\": {\"name\": \"goods info\", \"object\": \"\\u7537\\u7279\\u79cd\\u5175\\u7537\\u58eb\\u8fd0\\u52a8\\u978b\"}}, {\"added\": {\"name\": \"goods info\", \"object\": \"\\u7f8e\\u519b700V\\u4f5c\\u6218\\u9774\"}}, {\"added\": {\"name\": \"goods info\", \"object\": \"\\u590f\\u5b638\\u5bf8\\u6c99\\u6f20\\u6218\\u9774\"}}, {\"added\": {\"name\": \"goods info\", \"object\": \"\\u6237\\u5916\\u4f5c\\u6218\\u9774\\u8bad\\u7ec3\\u978b\"}}]',11,1),(4,'2018-10-08 01:30:32.776161','4','６６军用手表',1,'[{\"added\": {}}, {\"added\": {\"name\": \"goods info\", \"object\": \"\\u6f5c\\u6c34\\u81ea\\u52a8\\u673a\\u68b0\\u8155\\u8868\"}}, {\"added\": {\"name\": \"goods info\", \"object\": \"Jungmann\\u98de\\u884c\\u8868\"}}, {\"added\": {\"name\": \"goods info\", \"object\": \"\\u673a\\u68b0\\u81ea\\u52a8\\u6f5c\\u6c34\\u8868\"}}, {\"added\": {\"name\": \"goods info\", \"object\": \"ELITE CHRONOGRAPH\"}}]',11,1),(5,'2018-10-08 01:33:41.810902','5','战术包具',1,'[{\"added\": {}}, {\"added\": {\"name\": \"goods info\", \"object\": \"Molle \\u884c\\u8005\\u630e\\u5305\"}}, {\"added\": {\"name\": \"goods info\", \"object\": \"\\u6ce2\\u5170\\u8c79\\u7eb9\\u80cc\\u5305(\\u519b\\u7248)\"}}, {\"added\": {\"name\": \"goods info\", \"object\": \"3\\u65e5\\u80cc\\u5305\\u5168\\u5957\"}}, {\"added\": {\"name\": \"goods info\", \"object\": \"TT\\u57fa\\u7840\\u53cc\\u80a9\\u5305\"}}]',11,1),(6,'2018-10-08 01:39:16.632645','6','战术配饰',1,'[{\"added\": {}}, {\"added\": {\"name\": \"goods info\", \"object\": \"\\u6d77\\u519b\\u9646\\u6218\\u961f\\u68d2\\u7403\\u5e3d\"}}, {\"added\": {\"name\": \"goods info\", \"object\": \"\\u519b\\u4e8b\\u9632\\u62a4\\u592a\\u9633\\u955c\"}}, {\"added\": {\"name\": \"goods info\", \"object\": \"\\u6237\\u5916\\u9632\\u6652\\u592a\\u9633\\u5e3d\\u906e\\u9633\\u5e3d\"}}, {\"added\": {\"name\": \"goods info\", \"object\": \"\\u578b\\u9632\\u98ce\\u6c99\\u62a4\\u76ee\\u955c\"}}]',11,1),(7,'2018-10-08 01:41:21.905484','6','战术配饰',2,'[]',11,1),(8,'2018-10-08 02:10:03.513883','1','上衣',2,'[{\"changed\": {\"name\": \"goods info\", \"object\": \"\\u5bd2\\u950b\\u6218\\u672f\\u5939\\u514b\\u79cb\\u51ac\\u65b0\\u6b3e\\u8f7b\\u8584\\u8f6f\\u58f3\\u51b2\\u950b\\u8863\", \"fields\": [\"gpic\"]}}]',11,1),(9,'2018-10-08 02:27:47.646435','1','上衣',2,'[{\"changed\": {\"name\": \"goods info\", \"object\": \"\\u5bd2\\u950b\\u6218\\u672f\\u5939\\u514b\\u79cb\\u51ac\\u65b0\\u6b3e\\u8f7b\\u8584\\u8f6f\\u58f3\\u51b2\\u950b\\u8863\", \"fields\": [\"gcontent\"]}}]',11,1),(10,'2018-10-08 02:29:06.652186','1','上衣',2,'[{\"changed\": {\"name\": \"goods info\", \"object\": \"\\u5bd2\\u950b\\u6218\\u672f\\u5939\\u514b\\u79cb\\u51ac\\u65b0\\u6b3e\\u8f7b\\u8584\\u8f6f\\u58f3\\u51b2\\u950b\\u8863\", \"fields\": [\"gcontent\"]}}]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(10,'df_goods','goodsinfo'),(11,'df_goods','typeinfo'),(14,'df_order','orderdetailinfo'),(13,'df_order','orderinfo'),(7,'df_user','userinfo'),(9,'pay','goods'),(8,'pay','order'),(6,'sessions','session'),(12,'shoppingCar','mycars');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-09-29 01:16:24.640763'),(2,'auth','0001_initial','2018-09-29 01:16:25.090375'),(3,'admin','0001_initial','2018-09-29 01:16:25.188451'),(4,'admin','0002_logentry_remove_auto_add','2018-09-29 01:16:25.205708'),(5,'contenttypes','0002_remove_content_type_name','2018-09-29 01:16:25.269918'),(6,'auth','0002_alter_permission_name_max_length','2018-09-29 01:16:25.306308'),(7,'auth','0003_alter_user_email_max_length','2018-09-29 01:16:25.392469'),(8,'auth','0004_alter_user_username_opts','2018-09-29 01:16:25.401604'),(9,'auth','0005_alter_user_last_login_null','2018-09-29 01:16:25.529325'),(10,'auth','0006_require_contenttypes_0002','2018-09-29 01:16:25.534728'),(11,'auth','0007_alter_validators_add_error_messages','2018-09-29 01:16:25.546616'),(12,'auth','0008_alter_user_username_max_length','2018-09-29 01:16:25.658766'),(13,'df_goods','0001_initial','2018-09-29 01:16:25.757759'),(14,'df_user','0001_initial','2018-09-29 01:16:25.780248'),(15,'pay','0001_initial','2018-09-29 01:16:25.846625'),(16,'sessions','0001_initial','2018-09-29 01:16:25.879205'),(17,'shoppingCar','0001_initial','2018-09-29 01:16:25.958383'),(18,'admin','0003_logentry_add_action_flag_choices','2018-10-12 07:16:47.061930'),(19,'auth','0009_alter_user_last_name_max_length','2018-10-12 07:16:47.101834'),(20,'df_order','0001_initial','2018-10-12 07:16:47.271122');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0o1h3z6n8m5bzj723vn6c1nv0u7tdzgx','NTRhODQwM2NjNTg5MmExYjAwNzg5NjJhNDU3ZTQzYWE3YjU4Mzk2OTp7InVzZXJfbmFtZSI6IndjMzg5NTQiLCJpZCI6Mn0=','2018-10-26 07:20:30.946636'),('ctv9h9t437jtmqr36cm52bpg6udxfnh3','NGU3ZGQ2YTViZjA3ZWI2YmQzODA1NGUyOTE2YTZkOTYzYzAwMzc1YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjMwZTlkMDE4ZDg5YTJjODYxZWM2ZjEzMGJkMzgwYjhhM2VlZjdmOTYiLCJ1c2VyX25hbWUiOiJ6aGFvbmluZyIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiaWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-10-22 01:56:02.203618');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_goods`
--

DROP TABLE IF EXISTS `pay_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_goods`
--

LOCK TABLES `pay_goods` WRITE;
/*!40000 ALTER TABLE `pay_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_order`
--

DROP TABLE IF EXISTS `pay_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(64) NOT NULL,
  `status` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pay_order_goods_id_7ae4df83_fk_pay_goods_id` (`goods_id`),
  CONSTRAINT `pay_order_goods_id_7ae4df83_fk_pay_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `df_goods_goodsinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_order`
--

LOCK TABLES `pay_order` WRITE;
/*!40000 ALTER TABLE `pay_order` DISABLE KEYS */;
INSERT INTO `pay_order` VALUES (1,'439466ee-bcac-46b1-9dc9-fd1793c98e1d',1,1);
/*!40000 ALTER TABLE `pay_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingCar_mycars`
--

DROP TABLE IF EXISTS `shoppingCar_mycars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingCar_mycars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingCar_mycars_goods_id_909c1fac_fk_df_goods_goodsinfo_id` (`goods_id`),
  KEY `shoppingCar_mycars_user_id_e9eb2bc6_fk_df_user_userinfo_id` (`user_id`),
  CONSTRAINT `shoppingCar_mycars_goods_id_909c1fac_fk_df_goods_goodsinfo_id` FOREIGN KEY (`goods_id`) REFERENCES `df_goods_goodsinfo` (`id`),
  CONSTRAINT `shoppingCar_mycars_user_id_e9eb2bc6_fk_df_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `df_user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingCar_mycars`
--

LOCK TABLES `shoppingCar_mycars` WRITE;
/*!40000 ALTER TABLE `shoppingCar_mycars` DISABLE KEYS */;
INSERT INTO `shoppingCar_mycars` VALUES (2,4,3,2),(3,7,4,2);
/*!40000 ALTER TABLE `shoppingCar_mycars` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-12 15:54:49
