

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "admin"
#

INSERT INTO `admin` VALUES ('a','123456');

#
# Structure for table "t_manager"
#

DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager` (
  `managerUserName` varchar(20) NOT NULL COMMENT 'managerUserName',
  `password` varchar(20) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `sex` varchar(4) NOT NULL COMMENT '性别',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  PRIMARY KEY (`managerUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_manager"
#

INSERT INTO `t_manager` VALUES ('gl001','123','王超','女','13959342344'),('wy','123456','王雅','男','110');

#
# Structure for table "t_notice"
#

DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `content` varchar(5000) NOT NULL COMMENT '公告内容',
  `publishDate` varchar(20) DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "t_notice"
#

INSERT INTO `t_notice` VALUES (1,'科研管理系统正式上线','<p>同志们，你们以后可以发布你们自己的科研项目到这里，也可以提交你们自己的论文，我们的管理员会给你专业的意见哈！</p>','2017-12-23 22:54:14');

#
# Structure for table "t_projecttype"
#

DROP TABLE IF EXISTS `t_projecttype`;
CREATE TABLE `t_projecttype` (
  `projectTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目性质id',
  `projectTypeName` varchar(20) NOT NULL COMMENT '项目性质名称',
  PRIMARY KEY (`projectTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "t_projecttype"
#

INSERT INTO `t_projecttype` VALUES (1,'自然科学'),(2,'历史文学');

#
# Structure for table "t_userinfo"
#

DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) DEFAULT NULL COMMENT '出生日期',
  `userPhoto` varchar(60) NOT NULL COMMENT '用户照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) DEFAULT NULL COMMENT '家庭地址',
  `regTime` varchar(20) DEFAULT NULL COMMENT '注册时间',
  `department` varchar(40) DEFAULT NULL COMMENT '院系',
  `takeProject` varchar(500) DEFAULT NULL COMMENT '参加的项目',
  `point` varchar(100) DEFAULT NULL COMMENT '总业绩',
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_userinfo"
#

INSERT INTO `t_userinfo` VALUES ('hzj','123456','郝子健','男','1997-01-01','upload/53f5d9c1-f1de-42c8-99ac-179724f5b4ab.JPG','18339962619','951462686@qq.com','未知','2018-04-09 09:46:22','软件学院',NULL,NULL),('user1','123','王总','男','2017-12-07','upload/84087e2d-3dce-4709-a551-16e7d1edbe2c.JPG','13589834234','syl@163.com','四川成都红星路','2017-12-23 22:28:06','新闻学院',NULL,NULL),('user2','123','李总','男','2017-12-08','upload/0e3e6ad7-95f0-47f7-830f-43d88bd64cf2.JPG','13598399834','limingfen@126.com','广东深圳','2017-12-27 02:11:46','医学院',NULL,NULL),('user3','123','花满楼','男','1997-01-01','upload/53f5d9c1-f1de-42c8-99ac-179724f5b4ab.JPG','18339962619','951462686@qq.com',NULL,'2018-04-09 09:46:22','软件学院',NULL,NULL);

#
# Structure for table "t_thesis"
#

DROP TABLE IF EXISTS `t_thesis`;
CREATE TABLE `t_thesis` (
  `thesisId` int(11) NOT NULL AUTO_INCREMENT COMMENT '论文id',
  `xkml` varchar(20) NOT NULL COMMENT '学科门类',
  `name` varchar(20) NOT NULL COMMENT '论文名称',
  `lwfm` varchar(60) NOT NULL COMMENT '论文封面图',
  `author` varchar(20) NOT NULL COMMENT '作者',
  `teacher` varchar(20) NOT NULL COMMENT '指导老师',
  `publishDate` varchar(20) DEFAULT NULL COMMENT '发布日期',
  `thesisDesc` varchar(5000) NOT NULL COMMENT '论文介绍',
  `thesisFile` varchar(60) NOT NULL COMMENT '论文文件',
  `xgyj` varchar(500) DEFAULT NULL COMMENT '修改意见',
  `userObj` varchar(30) NOT NULL COMMENT '提交用户',
  PRIMARY KEY (`thesisId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_thesis_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "t_thesis"
#

INSERT INTO `t_thesis` VALUES (1,'计算机科学','JSP企业人事工资管理','upload/04170230-2d06-4053-9cbc-565391b9f595.JPG','王忠明','李明霞','2017-12-06','<p>开发一款jsp人事工资管理系统，管理企业员工和工资信息！</p>','upload/ce3af0fd-932e-4ebc-ab6d-2d929915cec3.doc','写得不错','user1');

#
# Structure for table "t_project"
#

DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `projectId` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目id',
  `projectTypeObj` int(11) NOT NULL COMMENT '项目类型',
  `projectName` varchar(20) NOT NULL COMMENT '项目名称',
  `projectPhoto` varchar(60) NOT NULL COMMENT '项目主图',
  `mainPerson` varchar(20) NOT NULL COMMENT '负责人',
  `comeFrom` varchar(20) DEFAULT NULL COMMENT '项目来源',
  `kydh` varchar(20) NOT NULL COMMENT '科研代号',
  `startDate` varchar(20) DEFAULT NULL COMMENT '开始日期',
  `endDate` varchar(20) NOT NULL COMMENT '结束日期',
  `kyMoney` float NOT NULL COMMENT '科研资金',
  `projectDesc` varchar(5000) NOT NULL COMMENT '项目介绍',
  `userObj` varchar(30) NOT NULL COMMENT '提交用户',
  `shzt` varchar(20) NOT NULL COMMENT '审核状态',
  `shr` varchar(20) DEFAULT NULL COMMENT '审核人',
  `shsj` varchar(20) DEFAULT NULL COMMENT '审核时间',
  `otherPerson` varchar(80) DEFAULT NULL,
  `point` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`projectId`),
  KEY `projectTypeObj` (`projectTypeObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_project_ibfk_1` FOREIGN KEY (`projectTypeObj`) REFERENCES `t_projecttype` (`projectTypeId`),
  CONSTRAINT `t_project_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "t_project"
#

INSERT INTO `t_project` VALUES (5,1,'你好','upload/NoImage.jpg','王总','asd','666','2018-05-08','2018-05-09',100,'<p>求逆袭</p>','user1','待审核','--','--','李总,郝子健,100','11'),(6,1,'ccc','upload/NoImage.jpg','王总','ccc','ccc','2018-05-10','2018-05-24',6000,'<p>666</p>','user1','待审核','--','--','李总,郝子健','600'),(7,1,'aaa','upload/NoImage.jpg','王总','aaaa','aaa','2018-05-03','2018-05-03',999,'<p>aaa</p>','user1','待审核','--','--','李总,郝子健','6000');

#
# Structure for table "t_info"
#

DROP TABLE IF EXISTS `t_info`;
CREATE TABLE `t_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(50) DEFAULT NULL,
  `userObj` varchar(100) NOT NULL,
  `point` varchar(100) DEFAULT NULL,
  `createTime` varchar(100) DEFAULT NULL,
  `updateTime` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `allponit` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_w` (`userObj`),
  CONSTRAINT `t_w` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

#
# Data for table "t_info"
#

INSERT INTO `t_info` VALUES (1,'asdas12','user1','sadasd12','2018-05-11','2018-05-09','待审核',NULL),(16,'21312','user1',NULL,NULL,NULL,NULL,NULL);

#
# Structure for table "t_achievement"
#

DROP TABLE IF EXISTS `t_achievement`;
CREATE TABLE `t_achievement` (
  `ACHIEVEMENT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '业绩id',
  `ACHIEVEMENT_PONIT` varchar(100) DEFAULT NULL COMMENT '业绩点',
  `ACHIEVEMENT_DESC` varchar(500) DEFAULT NULL COMMENT '备注',
  `RESULT` varchar(100) DEFAULT NULL COMMENT '验收结果',
  `ACHIEVEMENT_TYPE` varchar(100) DEFAULT NULL COMMENT '类别',
  `userObj` varchar(100) NOT NULL COMMENT '提交人',
  `PUBLISH_DATE` varchar(100) DEFAULT NULL,
  `PROJECT_NAME` varchar(100) DEFAULT NULL,
  `ACHIEVEMENT_STATE` varchar(100) DEFAULT NULL COMMENT '审核状态',
  `oneOther` varchar(100) DEFAULT NULL,
  `Other` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ACHIEVEMENT_ID`),
  KEY `user` (`userObj`),
  CONSTRAINT `user` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "t_achievement"
#

INSERT INTO `t_achievement` VALUES (7,'678','<p>内容很好，很吸引人。</p>','427寝室出版社','自然科学类','user1','2018-05-08','人与自然','系部审核通过','王雅','郝子健');

#
# Structure for table "yeji"
#

DROP TABLE IF EXISTS `yeji`;
CREATE TABLE `yeji` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `yeji_name` varchar(255) DEFAULT NULL,
  `yeji_num` varchar(255) DEFAULT NULL,
  `dept_name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "yeji"
#

INSERT INTO `yeji` VALUES (4,'郝子健','酸的研究','13223','软件学院',0),(5,'李总','酸的研究','213','医学院',0),(6,'王总','酸的研究','2312','新闻学院',0),(7,'郝子健','酸的研究','2323','软件学院',0),(8,'李总','酸的研究','323','医学院',0),(9,'王总','酸的研究','23213','新闻学院',0),(10,'郝子健','酸的研究','232','软件学院',0),(11,'李总','酸的研究','32','医学院',0),(12,'王总','酸的研究','2323','新闻学院',0),(13,'郝子健','酸的研究','232132','软件学院',0),(14,'李总','酸的研究','32323','医学院',0),(15,'王总','酸的研究','23213123','新闻学院',0),(16,'郝子健','酸的研究','2323','软件学院',0),(17,'李总','酸的研究','2323','医学院',0),(18,'王总','酸的研究','23123','新闻学院',0),(19,'郝子健','','23','软件学院',0),(20,'李总','','23','医学院',0),(21,'王总','','23','新闻学院',0),(22,'郝子健','','2','软件学院',0),(23,'李总','','2','医学院',0),(24,'王总','','','新闻学院',0),(25,'郝子健','','1','软件学院',0),(26,'李总','','1','医学院',0),(27,'王总','','1','新闻学院',0),(28,'郝子健','','12','软件学院',0),(29,'李总','','2','医学院',0),(30,'王总','','3','新闻学院',0),(31,'郝子健','','212','软件学院',0),(32,'李总','','232','医学院',0),(33,'王总','','4124','新闻学院',0),(34,'郝子健',NULL,'123','软件学院',0),(35,'李总',NULL,'3232','医学院',0),(36,'郝子健','高校的研究','232','软件学院',0),(37,'李总','高校的研究','2312','医学院',0),(38,'郝子健','高校的研究','13','软件学院',0),(39,'李总','高校的研究','323','医学院',0),(40,'郝子健','衣服的研究','32','软件学院',0),(41,'李总','衣服的研究','423','医学院',0),(42,'王总','衣服的研究','13','新闻学院',0),(43,'郝子健','','123','软件学院',0),(44,'李总','','212','医学院',0),(45,'郝子健','','12','软件学院',0),(46,'李总','','24','医学院',0),(47,'郝子健','','23','软件学院',0),(48,'李总','','32','医学院',0),(49,'郝子健','','123','软件学院',0),(50,'李总','','32','医学院',0),(51,'郝子健','','2321','软件学院',0),(52,'李总','','121','医学院',0),(53,'王总','','21','新闻学院',0),(54,'郝子健','桑叶的研究','123','软件学院',0),(55,'李总','桑叶的研究','232','医学院',0),(56,'王总','桑叶的研究','2323','新闻学院',0),(57,'郝子健','桑叶的研究','1212','软件学院',0),(58,'花满楼','桑叶的研究','3221','软件学院',0),(59,'李总','桑叶的研究','12','医学院',0),(60,'王总','桑叶的研究','23','新闻学院',0),(61,'郝子健','我的论文','2323','软件学院',0),(62,'花满楼','我的论文','32','软件学院',0),(63,'李总','我的论文','23','医学院',0),(64,'郝子健','我的论文','123','软件学院',0),(65,'花满楼','我的论文','323','软件学院',0),(66,'李总','我的论文','323','医学院',0),(67,'王总','我的论文','231','新闻学院',0);
