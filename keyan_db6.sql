/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50536
Source Host           : 127.0.0.1:3306
Source Database       : keyan_db

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2018-05-11 19:10:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', '123456');

-- ----------------------------
-- Table structure for t_achievement
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_achievement
-- ----------------------------
INSERT INTO `t_achievement` VALUES ('7', '678', '<p>内容很好，很吸引人。</p>', '427寝室出版社', '自然科学类', 'user1', '2018-05-08', '人与自然', '系部审核通过', '王雅', '郝子健');
INSERT INTO `t_achievement` VALUES ('8', '1000', '<p>666</p>', 'aaa', 'aaa', 'user1', '', 'aaa', '待审核', '李总', '王总');

-- ----------------------------
-- Table structure for t_info
-- ----------------------------
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

-- ----------------------------
-- Records of t_info
-- ----------------------------
INSERT INTO `t_info` VALUES ('1', 'asdas12', 'user1', 'sadasd12', '2018-05-11', '2018-05-09', '待审核', null);
INSERT INTO `t_info` VALUES ('16', '21312', 'user1', null, null, null, null, null);

-- ----------------------------
-- Table structure for t_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager` (
  `managerUserName` varchar(20) NOT NULL COMMENT 'managerUserName',
  `password` varchar(20) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `sex` varchar(4) NOT NULL COMMENT '性别',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  PRIMARY KEY (`managerUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_manager` VALUES ('gl001', '123', '王超', '女', '13959342344');
INSERT INTO `t_manager` VALUES ('wy', '123456', '王雅', '男', '110');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `content` varchar(5000) NOT NULL COMMENT '公告内容',
  `publishDate` varchar(20) DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '科研管理系统正式上线', '<p>同志们，你们以后可以发布你们自己的科研项目到这里，也可以提交你们自己的论文，我们的管理员会给你专业的意见哈！</p>', '2017-12-23 22:54:14');

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES ('5', '1', '你好', 'upload/NoImage.jpg', '王总', 'asd', '666', '2018-05-08', '2018-05-09', '100', '<p>求逆袭</p>', 'user1', '待审核', '--', '--', '李总,郝子健,100', '11');
INSERT INTO `t_project` VALUES ('6', '1', 'ccc', 'upload/NoImage.jpg', '王总', 'ccc', 'ccc', '2018-05-10', '2018-05-24', '6000', '<p>666</p>', 'user1', '待审核', '--', '--', '李总,郝子健', '600');
INSERT INTO `t_project` VALUES ('7', '1', 'aaa', 'upload/NoImage.jpg', '王总', 'aaaa', 'aaa', '2018-05-03', '2018-05-03', '999', '<p>aaa</p>', 'user1', '待审核', '--', '--', '李总,郝子健', '6000');
INSERT INTO `t_project` VALUES ('8', '1', 'asdasd', 'upload/NoImage.jpg', '王总', 'sdasd', 'sadas', '2018-05-08', '2018-05-08', '15152', '<p>adsas</p>', 'user1', '待审核', '--', '--', '李总,郝子健,花满楼', '500');
INSERT INTO `t_project` VALUES ('9', '1', '奥术大师多', 'upload/NoImage.jpg', '王总', '阿打算', '撒大声地', '2018-05-09', '2018-05-16', '6666670000', '<p>大飒飒</p>', 'user1', '待审核', '--', '--', '李总,郝子健,花满楼', '600');
INSERT INTO `t_project` VALUES ('10', '1', '撒大声地', 'upload/NoImage.jpg', '王总', '撒大声地', '撒大声地', '2018-05-03', '2018-05-02', '700', '<p>666</p>', 'user1', '待审核', '--', '--', '郝子健,花满楼', '500');
INSERT INTO `t_project` VALUES ('11', '1', '阿达', 'upload/NoImage.jpg', '王总', '打谁', '打谁', '2018-05-09', '2018-05-16', '777', '<p>777</p>', 'user1', '待审核', '--', '--', '李总,郝子健,花满楼', '800');

-- ----------------------------
-- Table structure for t_projecttype
-- ----------------------------
DROP TABLE IF EXISTS `t_projecttype`;
CREATE TABLE `t_projecttype` (
  `projectTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目性质id',
  `projectTypeName` varchar(20) NOT NULL COMMENT '项目性质名称',
  PRIMARY KEY (`projectTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_projecttype
-- ----------------------------
INSERT INTO `t_projecttype` VALUES ('1', '自然科学');
INSERT INTO `t_projecttype` VALUES ('2', '历史文学');

-- ----------------------------
-- Table structure for t_thesis
-- ----------------------------
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

-- ----------------------------
-- Records of t_thesis
-- ----------------------------
INSERT INTO `t_thesis` VALUES ('1', '计算机科学', 'JSP企业人事工资管理', 'upload/04170230-2d06-4053-9cbc-565391b9f595.JPG', '王忠明', '李明霞', '2017-12-06', '<p>开发一款jsp人事工资管理系统，管理企业员工和工资信息！</p>', 'upload/ce3af0fd-932e-4ebc-ab6d-2d929915cec3.doc', '写得不错', 'user1');

-- ----------------------------
-- Table structure for t_userinfo
-- ----------------------------
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

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('hzj', '123456', '郝子健', '男', '1997-01-01', 'upload/53f5d9c1-f1de-42c8-99ac-179724f5b4ab.JPG', '18339962619', '951462686@qq.com', '未知', '2018-04-09 09:46:22', '软件学院', null, null);
INSERT INTO `t_userinfo` VALUES ('user1', '123', '王总', '男', '2017-12-07', 'upload/84087e2d-3dce-4709-a551-16e7d1edbe2c.JPG', '13589834234', 'syl@163.com', '四川成都红星路', '2017-12-23 22:28:06', '新闻学院', null, null);
INSERT INTO `t_userinfo` VALUES ('user2', '123', '李总', '男', '2017-12-08', 'upload/0e3e6ad7-95f0-47f7-830f-43d88bd64cf2.JPG', '13598399834', 'limingfen@126.com', '广东深圳', '2017-12-27 02:11:46', '医学院', null, null);
INSERT INTO `t_userinfo` VALUES ('user3', '123', '花满楼', '男', '1997-01-01', 'upload/53f5d9c1-f1de-42c8-99ac-179724f5b4ab.JPG', '18339962619', '951462686@qq.com', null, '2018-04-09 09:46:22', '软件学院', null, null);

-- ----------------------------
-- Table structure for yeji
-- ----------------------------
DROP TABLE IF EXISTS `yeji`;
CREATE TABLE `yeji` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `yeji_name` varchar(255) DEFAULT NULL,
  `yeji_num` varchar(255) DEFAULT NULL,
  `dept_name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `userObj` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `w_j` (`userObj`),
  CONSTRAINT `w_j` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yeji
-- ----------------------------
INSERT INTO `yeji` VALUES ('79', '花满楼', '撒大声地', '100', '软件学院', '0', 'user3');
INSERT INTO `yeji` VALUES ('80', '王总', '撒大声地', '100', '新闻学院', '0', 'user1');
INSERT INTO `yeji` VALUES ('81', '李总', '阿达', '66', '医学院', '0', 'user2');
INSERT INTO `yeji` VALUES ('82', '郝子健', '阿达', '66', '软件学院', '0', 'hzj');
INSERT INTO `yeji` VALUES ('83', '花满楼', '阿达', '66', '软件学院', '0', 'user3');
INSERT INTO `yeji` VALUES ('84', '王总', '阿达', '66', '新闻学院', '0', 'user1');
