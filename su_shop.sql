-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.2.3-falcon-alpha-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema su_shop
--

CREATE DATABASE IF NOT EXISTS su_shop;
USE su_shop;

--
-- Definition of table `goods`
--

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `GID` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `GNAME` varchar(45) NOT NULL COMMENT '商品名称',
  `GPRICE` double NOT NULL COMMENT '商品单价',
  `GNUMBER` double NOT NULL COMMENT '商品数量',
  `GKEY` varchar(10) NOT NULL COMMENT '助记码',
  `GDISCOUNT` int(11) NOT NULL DEFAULT '10' COMMENT '折扣',
  `GCOST` double NOT NULL COMMENT '成本',
  `TID` int(11) NOT NULL COMMENT '分类ID',
  PRIMARY KEY (`GID`),
  KEY `TID` (`TID`),
  CONSTRAINT `TID` FOREIGN KEY (`TID`) REFERENCES `type` (`TID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `goods`
--

/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`GID`,`GNAME`,`GPRICE`,`GNUMBER`,`GKEY`,`GDISCOUNT`,`GCOST`,`TID`) VALUES 
 (3,'苹果',12,-1,'pg',90,1,7),
 (4,'水井坊 三国系列 义勇仁 52度500ml单瓶装',369,-1,'sjf',100,350,1),
 (5,'洋河梦之蓝M1 45度500ML 2瓶装绵柔白酒',656,-1,'yhm',100,556,1),
 (10,'雪花干啤',6,-1,'xhgp',100,5,1),
 (11,'雪花淡爽',5,-1,'xhds',100,5,1),
 (12,'雪花鲜啤',4,-1,'xhxp',100,3,1),
 (13,'矿泉水',2,-1,'kqs',100,1,1),
 (14,'姚记扑克',3,-1,'pk',100,2,9),
 (15,'烤羊肉串',2,-1,'kyrc',99,1,11),
 (16,'烤牛肉串',2,-1,'knrc',99,1,11),
 (17,'烤鸡翅中',6,-1,'kjcz',100,3,11),
 (18,'中街老冰棍',1,-1,'zjlbg',100,5,12),
 (19,'笔',2,-1,'b',100,1,14),
 (20,'笔记本',1,-1,'bjb',100,0.5,14),
 (21,'桃李汉堡',6,-1,'tlhb',100,4.5,15),
 (22,'西瓜',2.5,-1,'xg',100,2,7),
 (23,'荔枝',10,-1,'qkl',100,7.3,7),
 (24,'龙眼',15,-1,'ly',100,10,7),
 (25,'哈密瓜',8,-1,'hmg',100,6,7),
 (26,'好利来面包',20,-1,'hllmb',100,10,15),
 (27,'火龙果',12,-1,'hlg',100,9,7),
 (28,'山竹',25,-1,'sz',100,20,7);
INSERT INTO `goods` (`GID`,`GNAME`,`GPRICE`,`GNUMBER`,`GKEY`,`GDISCOUNT`,`GCOST`,`TID`) VALUES 
 (29,'哈根达斯面包',15,-1,'hgdsmb',50,10,15),
 (30,'菠萝',9,-1,'bl',85,6,7),
 (31,'橙子',5,-1,'cz',95,3.5,7),
 (32,'橘子',4.5,-1,'jz',100,3.5,7),
 (33,'GANSO面包',25,-1,'gansomb',50,15,15),
 (34,'麻将',20,-1,'M',100,15,9),
 (35,'猕猴桃',30,-1,'mht',100,25,7),
 (36,'核桃',16,-1,'ht',100,13,7),
 (37,'跳棋',10,-1,'tq',50,5,9),
 (38,'芒果',15,-1,'mg',100,12,7),
 (39,'象棋',5,-1,'xq',100,4,9),
 (40,'草莓',20,-1,'cm',100,15,7),
 (41,'葡萄',9,-1,'pt',100,7.5,7),
 (42,'军旗',10,-1,'jq',100,7,9),
 (43,'伊利红枣雪糕',2,-1,'yl',50,1,12),
 (44,'飞行棋',70,-1,'fxq',80,50,9),
 (45,'冰+',2,-1,'bj',50,1,12),
 (46,'糯米糍',2,-1,'nmc',50,1,12),
 (47,'大富翁',100,-1,'dfw',100,70,9),
 (48,'三国杀',30,-1,'sgs',90,19,9),
 (49,'笔记本电脑',5000,-1,'bjbdn',100,1000,14),
 (50,'英雄杀',30,-1,'yxs',98,12,9),
 (51,'鸡头',2,-1,'jt',100,1,11),
 (52,'鸡胸',3,-1,'jx',100,1,11),
 (53,'塔罗牌',500,-1,'tlp',99,100,9);
INSERT INTO `goods` (`GID`,`GNAME`,`GPRICE`,`GNUMBER`,`GKEY`,`GDISCOUNT`,`GCOST`,`TID`) VALUES 
 (54,'大冒险',12,-1,'dmx',100,11,9),
 (55,'实蛋',0.5,-1,'sd',100,0.4,11),
 (56,'烤蘑菇',1,-1,'kmg',100,0.3,11),
 (57,'烤蘑菇',1,-1,'kmg',100,0.3,11);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;


--
-- Definition of table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `OID` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `ONO` int(11) DEFAULT NULL COMMENT '订单号【170511#1】时间#当日订单号',
  `OTIME` varchar(20) DEFAULT NULL COMMENT '购买时间',
  `GID` int(11) DEFAULT NULL COMMENT '商品ID',
  `ONUM` double DEFAULT NULL COMMENT '商品数量',
  `OPRICE` double DEFAULT NULL COMMENT '总价',
  `OSTATUS` int(11) DEFAULT '0' COMMENT '退订状态',
  `OTTIME` varchar(20) DEFAULT NULL COMMENT '退订时间',
  `OREASON` varchar(1000) DEFAULT NULL COMMENT '退订原因',
  `UID` int(11) DEFAULT NULL COMMENT '售货员ID',
  PRIMARY KEY (`OID`),
  KEY `GID` (`GID`),
  KEY `UID` (`UID`),
  CONSTRAINT `UID` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`OID`,`ONO`,`OTIME`,`GID`,`ONUM`,`OPRICE`,`OSTATUS`,`OTTIME`,`OREASON`,`UID`) VALUES 
 (4,1,'2017-07-01 11:02:57',13,10,2,0,NULL,NULL,1),
 (5,1,'2017-07-01 11:02:57',10,12,6,0,NULL,NULL,1),
 (6,2,'2017-07-01 11:03:21',12,10,4,0,NULL,NULL,1),
 (7,2,'2017-07-01 11:03:21',10,12,6,0,NULL,NULL,1),
 (8,2,'2017-07-01 11:03:21',13,2,2,0,NULL,NULL,1),
 (9,1,'2017-07-02 11:03:52',10,12,6,0,NULL,NULL,1),
 (10,1,'2017-07-02 11:03:52',12,13,4,0,NULL,NULL,1),
 (11,2,'2017-07-02 11:04:03',14,1,3,0,NULL,NULL,1),
 (12,3,'2017-07-02 11:04:11',4,1,369,0,NULL,NULL,1),
 (13,4,'2017-07-02 11:04:24',10,1,6,0,NULL,NULL,1),
 (14,5,'2017-07-02 11:04:36',3,12,10.8,0,NULL,NULL,1),
 (15,6,'2017-07-02 11:04:49',13,12,2,0,NULL,NULL,1),
 (16,7,'2017-07-02 11:04:58',13,11,2,0,NULL,NULL,1),
 (17,1,'2017-07-03 11:05:41',11,12,5,0,NULL,NULL,1),
 (18,2,'2017-07-03 11:05:53',12,1,4,0,NULL,NULL,1),
 (19,2,'2017-07-03 11:05:53',10,1,6,0,NULL,NULL,1),
 (20,2,'2017-07-03 11:05:53',11,1,5,0,NULL,NULL,1),
 (21,2,'2017-07-03 11:05:53',4,1,369,0,NULL,NULL,1),
 (22,2,'2017-07-03 11:05:53',3,1,10.8,0,NULL,NULL,1);
INSERT INTO `orders` (`OID`,`ONO`,`OTIME`,`GID`,`ONUM`,`OPRICE`,`OSTATUS`,`OTTIME`,`OREASON`,`UID`) VALUES 
 (23,3,'2017-07-03 11:06:05',14,1,3,0,NULL,NULL,1),
 (24,3,'2017-07-03 11:06:05',10,21,6,0,NULL,NULL,1),
 (25,1,'2017-07-04 01:15:20',54,1,12,0,NULL,NULL,1),
 (26,1,'2017-07-05 08:10:30',33,100,12.5,0,NULL,NULL,3),
 (27,1,'2017-07-05 08:10:30',49,1000,5000,0,NULL,NULL,3),
 (28,1,'2017-07-05 08:10:30',47,1000,100,1,'2017-07-05 08:14:28','buhao\n',3),
 (29,2,'2017-07-05 08:10:54',49,1,5000,0,NULL,NULL,3),
 (30,3,'2017-07-05 09:26:26',45,2,1,1,'2017-07-05 09:26:49','ss',4),
 (31,3,'2017-07-05 09:26:26',45,1,1,1,'2017-07-05 09:26:49','ss',4),
 (32,1,'2017-07-07 05:05:41',30,1,7.65,0,NULL,NULL,1),
 (33,1,'2017-07-07 05:05:41',40,1,20,0,NULL,NULL,1),
 (34,2,'2017-07-07 05:05:50',30,1,7.65,0,NULL,NULL,1),
 (35,3,'2017-07-07 05:05:59',30,1,7.65,0,NULL,NULL,1),
 (36,4,'2017-07-07 05:06:12',40,2,20,0,NULL,NULL,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


--
-- Definition of table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `TID` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `TNAME` varchar(45) NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`TID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='分类';

--
-- Dumping data for table `type`
--

/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` (`TID`,`TNAME`) VALUES 
 (1,'酒水'),
 (7,'水果'),
 (9,'娱乐用品'),
 (11,'烧烤'),
 (12,'雪糕'),
 (14,'学生用品'),
 (15,'面包');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `UID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `USERNAME` varchar(20) NOT NULL COMMENT '用户名',
  `USERPWD` varchar(10) NOT NULL COMMENT '用户密码',
  `USERNICK` varchar(30) DEFAULT NULL COMMENT '用户昵称',
  `UAUTHORITY` varchar(2) NOT NULL DEFAULT '0' COMMENT '【用户0|管理员1】【修改商品权限】',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`UID`,`USERNAME`,`USERPWD`,`USERNICK`,`UAUTHORITY`) VALUES 
 (1,'palo','123','超级管理员','11'),
 (2,'user1','user1','售货员1','00'),
 (3,'user2','user2','销售员2（管理）','00'),
 (4,'user3','user3','new','00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
