/*
SQLyog Ultimate v8.32 
MySQL - 5.5.48 : Database - ssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm`;

/*Table structure for table `attachment` */

DROP TABLE IF EXISTS `attachment`;

CREATE TABLE `attachment` (
  `attachmentId` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `attachmentName` varchar(50) DEFAULT NULL COMMENT '名称',
  `attachmentPath` varchar(50) DEFAULT NULL COMMENT '路径',
  `attachmentTime` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`attachmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `attachment` */

insert  into `attachment`(`attachmentId`,`attachmentName`,`attachmentPath`,`attachmentTime`) values (1,'手动备份20171129142347.xls','logs/backup','2017-11-29 14:23:47'),(2,'手动备份20171129142641.xls','logs/backup','2017-11-29 14:26:41'),(3,'手动备份20171129142920.xls','logs/backup','2017-11-29 14:29:20');

/*Table structure for table `bj` */

DROP TABLE IF EXISTS `bj`;

CREATE TABLE `bj` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `bname` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bj` */

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `info` varchar(32) DEFAULT NULL,
  `typenum` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`id`,`name`,`price`,`info`,`typenum`) values (1,'admin','1000','好','a'),(4,'ccc','100','还行','a'),(5,'曹雯博','34343','真好','a'),(6,'cola','3','带气的好喝','b'),(8,'Adidas','2600','emmmmm.....','c'),(10,'aabb','3344','aabb','a'),(11,'卫衣','9888','画虎六十','c'),(12,'admin','1000','好','v'),(13,'ccc','100','还行','c'),(14,'曹雯博','88888','真好','b'),(15,'cola','3','带气的好喝','a'),(16,'Adidas','2600','emmmmm.....','v'),(17,'c','8848','sd','a'),(18,'aabb','3344','aabb','c'),(19,'卫衣','9888','画虎六十','b'),(20,'曹雯博','12321','kkj',NULL),(21,'admin','1000','好','a'),(22,'ccc','100','还行','s'),(23,'曹雯博','34343','真好','a'),(24,'cola','3','带气的好喝','b'),(25,'Adidas','2600','emmmmm.....','b'),(26,'aabb','3344','aabb','b'),(27,'卫衣','9888','画虎六十','c'),(28,'admin','1000','好','c'),(29,'ccc','100','还行','v'),(30,'曹雯博','88888','真好','a'),(31,'cola','3','带气的好喝','s'),(32,'Adidas','2600','emmmmm.....','b'),(33,'c','8848','sd','c'),(34,'aabb','3344','aabb','a'),(35,'卫衣','9888','画虎六十','a'),(36,'曹雯博','12321','kkj','c');

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `logId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志',
  `userName` varchar(30) DEFAULT NULL COMMENT '操作人',
  `createTime` datetime DEFAULT NULL COMMENT '时间',
  `content` text COMMENT '详细',
  `operation` varchar(300) DEFAULT NULL COMMENT '操作类型（增删改）',
  `ip` varchar(60) DEFAULT NULL COMMENT 'IP地址',
  `module` varchar(40) DEFAULT NULL COMMENT '所属模块',
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

/*Data for the table `log` */

insert  into `log`(`logId`,`userName`,`createTime`,`content`,`operation`,`ip`,`module`) values (1,'test','2017-11-29 14:31:04',NULL,'退出',NULL,NULL),(2,'test','2017-11-29 14:31:14',NULL,'登录','192.168.1.17',NULL),(3,'admin','2019-09-23 11:54:55',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(4,'admin','2019-09-23 11:55:00',NULL,'退出',NULL,NULL),(5,'admin','2019-09-23 11:55:09',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(6,'admin','2019-09-23 13:48:42',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(7,'admin','2019-09-23 14:36:10',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(8,'admin','2019-09-23 15:17:00',NULL,'退出',NULL,NULL),(9,'admin','2019-09-23 15:17:14',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(10,'admin','2019-09-23 15:17:45',NULL,'退出',NULL,NULL),(11,'admin','2019-09-23 15:17:55',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(12,'admin','2019-09-23 15:31:56',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(13,'admin','2019-09-23 16:12:47',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(14,'admin','2019-09-23 16:18:51',NULL,'退出',NULL,NULL),(15,'admin','2019-09-23 16:19:08',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(16,'admin','2019-09-23 17:03:21','intercept the method: com.xiaoshu.controller.GoodsController.userListFor input string: \"\"','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(17,'admin','2019-09-23 17:05:08','intercept the method: com.xiaoshu.controller.GoodsController.userListFor input string: \"\"','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(18,'admin','2019-09-23 17:05:10','intercept the method: com.xiaoshu.controller.GoodsController.userListFor input string: \"\"','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(19,'admin','2019-09-23 17:05:52','intercept the method: com.xiaoshu.controller.GoodsController.userListFor input string: \"\"','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(20,'admin','2019-09-23 17:07:35','intercept the method: com.xiaoshu.controller.GoodsController.userListFor input string: \"\"','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(21,'admin','2019-09-23 17:09:44','intercept the method: com.xiaoshu.controller.GoodsController.userListFor input string: \"\"','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(22,'admin','2019-09-23 17:11:37','intercept the method: com.xiaoshu.controller.GoodsController.userListFor input string: \"\"','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(23,'admin','2019-09-23 17:12:35','intercept the method: com.xiaoshu.controller.GoodsController.userListFor input string: \"\"','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(24,'admin','2019-09-23 17:13:36',NULL,'退出',NULL,NULL),(25,'admin','2019-09-23 17:13:50',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(26,'admin','2019-09-23 17:13:52','intercept the method: com.xiaoshu.controller.GoodsController.userListFor input string: \"\"','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(27,'admin','2019-09-23 17:19:04',NULL,'退出',NULL,NULL),(28,'admin','2019-09-23 18:27:58',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(29,'admin','2019-09-23 18:47:22',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(30,'admin','2019-09-23 18:55:17',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(31,'admin','2019-09-23 19:13:43',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(32,'admin','2019-09-24 08:12:00',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(33,'admin','2019-09-24 08:12:37',NULL,'退出',NULL,NULL),(34,'admin','2019-09-24 11:34:04',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(35,'admin','2019-09-24 11:34:46',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(36,'admin','2019-09-24 20:49:13',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(37,'admin','2019-09-24 20:49:46',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(38,'admin','2019-09-24 20:51:45',NULL,'退出',NULL,NULL),(39,'admin','2019-09-24 20:51:49',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(40,'admin','2019-09-25 15:22:10',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(41,'admin','2019-09-25 15:25:08',NULL,'退出',NULL,NULL),(42,'admin','2019-09-25 15:25:18',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(43,'admin','2019-09-25 15:52:04',NULL,'退出',NULL,NULL),(44,'admin','2019-09-25 15:52:25',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(45,'admin','2019-09-25 16:06:29',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(46,'admin','2019-09-25 16:06:29',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(47,'admin','2019-09-25 18:39:44',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(48,'admin','2019-09-25 18:39:44',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(49,'admin','2019-09-25 19:54:10',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(50,'admin','2019-09-27 10:37:20',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(51,'admin','2019-09-27 11:18:14',NULL,'退出',NULL,NULL),(52,'admin','2019-09-27 11:18:25',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(53,'admin','2019-09-27 11:22:59',NULL,'退出',NULL,NULL),(54,'admin','2019-09-27 15:48:22',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(55,'admin','2019-09-27 15:48:22',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(56,'admin','2019-09-27 15:49:06',NULL,'退出',NULL,NULL),(57,'admin','2019-09-27 15:49:11',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(58,'admin','2019-09-27 15:49:11',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(59,'admin','2019-09-27 16:34:05',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(60,'admin','2019-09-27 16:44:28',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(61,'admin','2019-09-27 16:44:28',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(62,'admin','2019-09-27 16:44:32','intercept the method: com.xiaoshu.controller.GoodsController.userListCould not get a resource from the pool','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(63,'admin','2019-09-27 19:28:45',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(64,'admin','2019-09-27 19:28:45',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(65,'admin','2019-09-27 19:39:03',NULL,'退出',NULL,NULL),(66,'admin','2019-09-27 19:39:20',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(67,'admin','2019-09-27 19:48:43',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(68,'admin','2019-09-27 19:48:43',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(69,'admin','2019-09-27 19:48:46','intercept the method: com.xiaoshu.controller.GoodsController.userListCould not get a resource from the pool','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(70,'admin','2019-09-27 20:08:28','intercept the method: com.xiaoshu.controller.GoodsController.userListCould not get a resource from the pool','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(71,'admin','2019-09-27 20:53:19',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(72,'admin','2019-09-27 20:53:19',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(73,'admin','2019-09-28 22:53:46',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(74,'admin','2019-09-28 22:53:46',NULL,'登录','0:0:0:0:0:0:0:1',NULL);

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `menuId` int(10) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menuName` varchar(50) DEFAULT NULL COMMENT '名称',
  `menuUrl` varchar(100) DEFAULT NULL COMMENT '方法',
  `parentId` int(11) DEFAULT NULL COMMENT '父ID',
  `menuDescription` varchar(200) DEFAULT NULL COMMENT '描述',
  `state` varchar(20) DEFAULT NULL COMMENT '状态/OPEN/CLOSED',
  `iconCls` varchar(50) DEFAULT NULL COMMENT '图标',
  `seq` int(11) DEFAULT NULL COMMENT '顺序排序',
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`menuId`,`menuName`,`menuUrl`,`parentId`,`menuDescription`,`state`,`iconCls`,`seq`) values (1,'SSM系统','',-1,'主菜单','isParent','fa fa-university',1),(2,'系统管理','',1,'','isParent','fa fa-desktop',1),(3,'修改密码','javascript:editPassword();//',1,'','close','fa fa-key',4),(4,'安全退出','logout.htm',1,'','close','fa fa-user-times',5),(5,'菜单管理','menu/menuIndex.htm',2,'','','fa fa-sliders',4),(6,'角色管理','role/roleIndex.htm',2,'','','fa fa-users',3),(7,'用户管理','user/userIndex.htm',2,'','','fa fa-user',2),(8,'日志管理','log/logIndex.htm',2,'','','fa fa-tags',4),(12,'淘宝','',1,'','isParent','fa fa-desktop',1),(13,'商品列表','goods/goodsIndex.htm',12,'',NULL,'fa fa-users',4);

/*Table structure for table `operation` */

DROP TABLE IF EXISTS `operation`;

CREATE TABLE `operation` (
  `operationId` int(11) NOT NULL AUTO_INCREMENT COMMENT '具体的方法',
  `operationName` varchar(100) DEFAULT NULL COMMENT '方法名',
  `menuId` int(11) DEFAULT NULL COMMENT '所属菜单',
  `menuName` varchar(50) NOT NULL,
  `operationCode` varchar(50) DEFAULT NULL,
  `iconCls` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`operationId`),
  KEY `menuId` (`menuId`),
  CONSTRAINT `operation_ibfk_1` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=10021 DEFAULT CHARSET=utf8 COMMENT='具体的页面按钮上的方法\r\n（此自增ID至少从10000开始）';

/*Data for the table `operation` */

insert  into `operation`(`operationId`,`operationName`,`menuId`,`menuName`,`operationCode`,`iconCls`) values (10000,'添加',5,'菜单管理','add',''),(10001,'修改',5,'菜单管理','edit',''),(10002,'删除',5,'菜单管理','del',''),(10003,'添加',7,'用户管理','btn_add','glyphicon glyphicon-plus'),(10004,'修改',7,'用户管理','btn_edit','glyphicon glyphicon-pencil'),(10005,'删除',7,'用户管理','btn_delete','glyphicon glyphicon-remove'),(10006,'添加',6,'角色管理','btn_add','glyphicon glyphicon-plus'),(10007,'修改',6,'角色管理','btn_edit','glyphicon glyphicon-pencil'),(10008,'删除',6,'角色管理','btn_delete','glyphicon glyphicon-remove'),(10009,'授权',6,'角色管理','btn_rightCtrl','glyphicon glyphicon-eye-open'),(10010,'下载后台日志（log4j）',8,'日志管理','btn_downloadLog4j','glyphicon glyphicon-download-alt'),(10011,'手动备份（业务操作）',8,'日志管理','btn_manualBackup','glyphicon glyphicon-inbox'),(10012,'删除',8,'日志管理','btn_delete','glyphicon glyphicon-remove'),(10013,'按钮管理',5,'菜单管理','btnCtrl',''),(10014,'备份日志记录',8,'日志管理','btn_downloadLogBus','glyphicon glyphicon-download'),(10015,'添加',13,'商品列表','btn_add','glyphicon glyphicon-plus'),(10016,'修改',13,'商品列表','btn_edit','glyphicon glyphicon-pencil'),(10017,'删除',13,'商品列表','btn_delete','glyphicon glyphicon-remove	'),(10018,'导出',13,'商品列表','btn_out',''),(10019,'导入',13,'商品列表','btn_in',''),(10020,'统计',13,'商品列表','btn_echarts','');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `roleName` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `menuIds` varchar(200) DEFAULT NULL COMMENT '菜单IDs',
  `operationIds` varchar(200) DEFAULT NULL COMMENT '按钮IDS',
  `roleDescription` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`roleId`,`roleName`,`menuIds`,`operationIds`,`roleDescription`) values (1,'超级管理员','1,2,3,4,5,6,7,8,12,13','10000,10001,10002,10013,10006,10007,10008,10009,10003,10004,10005,10010,10011,10012,10014,10015,10016,10017,10018,10019,10020','拥有全部权限的超级管理员角色'),(2,'测试员','1,2,3,4,6,7,8','10006,10007,10008,10009,10003,10004,10005,10010,10011,10012,10014','拥有系统所有业务功能的角色');

/*Table structure for table `stu` */

DROP TABLE IF EXISTS `stu`;

CREATE TABLE `stu` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(32) DEFAULT NULL,
  `sex` varchar(32) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `stu` */

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `tokenId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL COMMENT '用户ID',
  `userAgent` varchar(50) DEFAULT NULL COMMENT '用户（md5）',
  `token` varchar(100) DEFAULT NULL COMMENT 'md5(username+md5(useragent))',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `expireTime` datetime DEFAULT NULL COMMENT '到期时间',
  PRIMARY KEY (`tokenId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户登录信息（用于自动登录）';

/*Data for the table `token` */

insert  into `token`(`tokenId`,`userId`,`userAgent`,`token`,`createTime`,`expireTime`) values (1,1,'0b239ed7c13c034f6b834897f0b54bba','66895df164cf660402ab453a53496cd6','2017-11-29 14:26:21','2017-12-13 14:26:21'),(2,1,'e2d50124d4720cd22a4bc83f8e6246a5','2a47b56e81d9e8d522a4c6c0da57b936','2019-09-23 15:17:14','2019-10-07 15:17:14'),(3,1,'a1f53924d92c1c5640c0d6d2d829b9de','072361eae8624e4989423540a5f7f4d5','2019-09-23 15:17:55','2019-10-07 15:17:55'),(4,1,'1d454f66aeb992b2947c9bbc5167685e','fa93163edc0c3930e40f14719cd8e5e8','2019-09-23 15:31:56','2019-10-07 15:31:56'),(5,1,'647bc0f7bfa2cf50808430521f5ca726','2c4072a2a52051ada0715a31ca7f8302','2019-09-23 16:19:08','2019-10-07 16:19:08');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `userName` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) DEFAULT NULL COMMENT '密码',
  `userType` tinyint(4) DEFAULT NULL COMMENT '用户类型',
  `roleId` int(11) DEFAULT NULL COMMENT '角色ID',
  `userDescription` varchar(200) DEFAULT NULL COMMENT '描述信息',
  PRIMARY KEY (`userId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`userName`,`password`,`userType`,`roleId`,`userDescription`) values (1,'admin','admin',NULL,1,'超级管理员，供开发方使用'),(2,'test','test',NULL,2,'测试员，供测试方使用');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
