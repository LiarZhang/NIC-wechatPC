/*
Navicat MySQL Data Transfer

Source Server         : NIC
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : nic2

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-05-03 09:30:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for nic_article
-- ----------------------------
DROP TABLE IF EXISTS `nic_article`;
CREATE TABLE `nic_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumb_media_id` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content_source_url` varchar(255) DEFAULT NULL,
  `content` mediumtext NOT NULL,
  `digest` varchar(255) DEFAULT NULL,
  `show_cover_pic` int(11) DEFAULT NULL,
  `picurl` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nic_article
-- ----------------------------
INSERT INTO `nic_article` VALUES ('1', null, '太原工业网络与信息中心处', '关于开通网络与信息中心微信公众网络报修平台的通知', null, '关于开通网络与信息中心微信公众网络报修平台的通知关于开通网络与信息中心微信公众网络报修平台的通知关于开通网络与信息中心微信公众网络报修平台的通知', '关于开通网络与信息中心微信公众网络报修平台的通知关于开通网络与信息中心微信公众网络报修平台的通知', null, '/ec16892c-558b-4b6d-8ef4-b01fc64c8086.jpg');
INSERT INTO `nic_article` VALUES ('2', null, '太原工业网络与信息中心处', '关于2018年3月24日-25日计算机等级考试的考场规则', null, '关于2018年3月24日-25日计算机等级考试的考场规则\r\n关于2018年3月24日-25日计算机等级考试的考场规则\r\n关于2018年3月24日-25日计算机等级考试的考场规则\r\n关于2018年3月24日-25日计算机等级考试的考场规则', '关于2018年3月24日-25日计算机等级考试的考场规则\r\n关于2018年3月24日-25日计算机等级考试的考场规则', null, 'cba053a8-b699-47eb-817d-bb9b464e57a4.jpg');
INSERT INTO `nic_article` VALUES ('13', null, '太原工业网络与信息中心处', '关于领取2018年3月计算机等级考试准考证的通知', null, '关于领取2018年3月计算机等级考试准考证的通知关于领取2018年3月计算机等级考试准考证的通知关于领取2018年3月计算机等级考试准考证的通知', '关于领取2018年3月计算机等级考试准考证的通知关于领取2018年3月计算机等级考试准考证的通知', null, '90a13a52-f92a-43dd-9740-365224cb01b5.jpg');

-- ----------------------------
-- Table structure for nic_assign
-- ----------------------------
DROP TABLE IF EXISTS `nic_assign`;
CREATE TABLE `nic_assign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `managerid` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL COMMENT '0:表示未分配；1：已分配；2：正在处理;3:已完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nic_assign
-- ----------------------------
INSERT INTO `nic_assign` VALUES ('1', '2018-04-26 15:48:52', '1111', '111', '111', '4', '0');
INSERT INTO `nic_assign` VALUES ('2', '2018-04-26 17:44:44', '业务指派', '业务指派', '业务指派', '11', '1');
INSERT INTO `nic_assign` VALUES ('3', '2018-04-26 17:44:35', '电子楼', '电子楼电子楼电子楼', '电子楼电子楼电子楼电子楼', '6', '1');
INSERT INTO `nic_assign` VALUES ('4', '2018-04-26 16:50:22', '业务指派', '业务指派', '业务指派业务指派业务指派业务指派', '11', '1');
INSERT INTO `nic_assign` VALUES ('5', '2018-04-26 16:56:51', '电楼', '电楼', '电子楼', '4', '1');
INSERT INTO `nic_assign` VALUES ('6', '2018-04-26 16:58:39', '主楼', '主楼', '', '6', '1');
INSERT INTO `nic_assign` VALUES ('7', '2018-04-26 17:43:13', '教学楼', '电脑', '', '11', '0');

-- ----------------------------
-- Table structure for nic_department
-- ----------------------------
DROP TABLE IF EXISTS `nic_department`;
CREATE TABLE `nic_department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nic_department
-- ----------------------------
INSERT INTO `nic_department` VALUES ('1', '机械工程系');
INSERT INTO `nic_department` VALUES ('2', '电子系');
INSERT INTO `nic_department` VALUES ('3', '自动化系');
INSERT INTO `nic_department` VALUES ('4', '化工系');
INSERT INTO `nic_department` VALUES ('5', '计算机工程系');
INSERT INTO `nic_department` VALUES ('6', '环境与安全工程系');
INSERT INTO `nic_department` VALUES ('7', '材料工程系');
INSERT INTO `nic_department` VALUES ('8', '理学系');
INSERT INTO `nic_department` VALUES ('9', '经济与管理系');
INSERT INTO `nic_department` VALUES ('10', '外语系');
INSERT INTO `nic_department` VALUES ('11', '设计艺术系');
INSERT INTO `nic_department` VALUES ('12', '思政部与法学系');
INSERT INTO `nic_department` VALUES ('13', '体育系');
INSERT INTO `nic_department` VALUES ('14', '党政办公室');
INSERT INTO `nic_department` VALUES ('15', '宣传部');
INSERT INTO `nic_department` VALUES ('16', '人事处');
INSERT INTO `nic_department` VALUES ('17', '审计处');
INSERT INTO `nic_department` VALUES ('18', '保卫处');
INSERT INTO `nic_department` VALUES ('19', '工会');
INSERT INTO `nic_department` VALUES ('20', '教育研究与教学评建处');
INSERT INTO `nic_department` VALUES ('21', '工程训练中心');
INSERT INTO `nic_department` VALUES ('22', '网络与信息中心');
INSERT INTO `nic_department` VALUES ('23', '后勤保障处');
INSERT INTO `nic_department` VALUES ('24', '离退休职工管理处');
INSERT INTO `nic_department` VALUES ('25', '档案馆');
INSERT INTO `nic_department` VALUES ('26', '教师工作处');
INSERT INTO `nic_department` VALUES ('27', '组织部');
INSERT INTO `nic_department` VALUES ('28', '纪检监察');
INSERT INTO `nic_department` VALUES ('29', '财务处');
INSERT INTO `nic_department` VALUES ('30', '学生处');
INSERT INTO `nic_department` VALUES ('31', '团委');
INSERT INTO `nic_department` VALUES ('32', '教务处');
INSERT INTO `nic_department` VALUES ('33', '科技处');
INSERT INTO `nic_department` VALUES ('34', '国有资产管理处');
INSERT INTO `nic_department` VALUES ('35', '图书馆');
INSERT INTO `nic_department` VALUES ('36', '校园规划与建设处');
INSERT INTO `nic_department` VALUES ('37', '发展与规划处');
INSERT INTO `nic_department` VALUES ('38', '国际交流合作处');
INSERT INTO `nic_department` VALUES ('39', '就业指导中心');

-- ----------------------------
-- Table structure for nic_manager
-- ----------------------------
DROP TABLE IF EXISTS `nic_manager`;
CREATE TABLE `nic_manager` (
  `manager_id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `manager_telephone` varchar(255) CHARACTER SET utf8 NOT NULL,
  `manager_duty` varchar(255) CHARACTER SET utf8 NOT NULL,
  `manager_typ` int(11) NOT NULL,
  `manager_password` varchar(255) NOT NULL,
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of nic_manager
-- ----------------------------
INSERT INTO `nic_manager` VALUES ('4', 'admin', '18434366995', '12222', '0', '123456');
INSERT INTO `nic_manager` VALUES ('6', '张三', '18827364957', '维修人员', '1', '123456');
INSERT INTO `nic_manager` VALUES ('11', '里斯', '13345675678', '133566', '0', '123456');

-- ----------------------------
-- Table structure for nic_share
-- ----------------------------
DROP TABLE IF EXISTS `nic_share`;
CREATE TABLE `nic_share` (
  `shid` int(11) NOT NULL AUTO_INCREMENT,
  `shareType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nic_share
-- ----------------------------
INSERT INTO `nic_share` VALUES ('1', '不共享');
INSERT INTO `nic_share` VALUES ('2', '本部共享');
INSERT INTO `nic_share` VALUES ('3', '本院共享');

-- ----------------------------
-- Table structure for nic_status
-- ----------------------------
DROP TABLE IF EXISTS `nic_status`;
CREATE TABLE `nic_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of nic_status
-- ----------------------------
INSERT INTO `nic_status` VALUES ('1', '已提交');
INSERT INTO `nic_status` VALUES ('2', '已接收');
INSERT INTO `nic_status` VALUES ('3', '已排班');
INSERT INTO `nic_status` VALUES ('4', '正在处理');
INSERT INTO `nic_status` VALUES ('5', '已完成');

-- ----------------------------
-- Table structure for nic_suggest
-- ----------------------------
DROP TABLE IF EXISTS `nic_suggest`;
CREATE TABLE `nic_suggest` (
  `suggest_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `suggest_title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `suggest_content` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `suggest_time` datetime NOT NULL,
  PRIMARY KEY (`suggest_id`),
  KEY `sug_user` (`user_id`),
  CONSTRAINT `sug_user` FOREIGN KEY (`user_id`) REFERENCES `nic_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of nic_suggest
-- ----------------------------
INSERT INTO `nic_suggest` VALUES ('3', '20', '计算机', '工程系', '2017-10-14 17:54:03');
INSERT INTO `nic_suggest` VALUES ('4', '20', '计算机', '工程系', '2017-10-14 17:54:03');
INSERT INTO `nic_suggest` VALUES ('5', '20', '计算机', '工程系', '2017-10-14 17:54:03');
INSERT INTO `nic_suggest` VALUES ('6', '20', '计算机', '工程系', '2017-10-14 17:54:03');
INSERT INTO `nic_suggest` VALUES ('7', '20', '计算机', '工程系', '2017-10-14 17:54:03');
INSERT INTO `nic_suggest` VALUES ('8', '20', '计算机', '工程系', '2017-10-14 17:54:03');
INSERT INTO `nic_suggest` VALUES ('9', '20', '计算机', '工程系', '2017-10-14 17:54:03');

-- ----------------------------
-- Table structure for nic_techsupport
-- ----------------------------
DROP TABLE IF EXISTS `nic_techsupport`;
CREATE TABLE `nic_techsupport` (
  `techsupport_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `techsupport_department` varchar(255) NOT NULL,
  `techsupport_devicename` varchar(255) CHARACTER SET utf8 NOT NULL,
  `techsupport_location` varchar(255) CHARACTER SET utf8 NOT NULL,
  `techsupport_describe` varchar(255) CHARACTER SET utf8 NOT NULL,
  `techsupport_picture` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `techsupport_feedback` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `techsupport_uptime` datetime NOT NULL,
  `techsupport_endtime` datetime DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`techsupport_id`),
  KEY `user_id` (`user_id`),
  KEY `status_id` (`status_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `manager_id` FOREIGN KEY (`manager_id`) REFERENCES `nic_manager` (`manager_id`),
  CONSTRAINT `status_id` FOREIGN KEY (`status_id`) REFERENCES `nic_status` (`status_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `nic_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of nic_techsupport
-- ----------------------------
INSERT INTO `nic_techsupport` VALUES ('10', '19', '后勤保障处', '编码器6716', '18号楼', '编码器出现故障，通讯连不上。', '', '更换到设备地\r\n', '2017-03-21 09:17:00', '2017-12-29 17:13:28', '5', '4', '设备报修');
INSERT INTO `nic_techsupport` VALUES ('11', '19', '后勤保障处', '编码器6708', '19号楼', '编码器出现故障，疑似元件损坏', '', '更换到设备地\r\n', '2017-03-21 09:17:00', '2017-12-30 17:13:28', '5', '4', '设备报修');
INSERT INTO `nic_techsupport` VALUES ('12', '21', '计算机工程系', '摄像头', '电子楼五层东', '无法摄像', '', '更换到设备地\r\n', '2017-03-22 09:17:00', '2017-12-30 17:13:28', '5', '4', '设备报修');
INSERT INTO `nic_techsupport` VALUES ('13', '19', '后勤保障处', '编码器6708', '24号楼', '编码器出现故障，上位机和伺服之间连线不正确。', '', '更换到设备地\r\n', '2017-03-24 09:17:00', '2018-04-15 22:42:02', '5', '6', '设备报修');
INSERT INTO `nic_techsupport` VALUES ('57', '19', '后勤保障处', '摄像头', '主楼三层过道东', '视频有回放现象', '/ec16892c-558b-4b6d-8ef4-b01fc64c8086.jpg', '暂时预约在星期五下午两点半去维修', '2017-06-22 09:17:00', '2018-04-15 22:42:02', '5', '6', '设备报修');
INSERT INTO `nic_techsupport` VALUES ('58', '21', '计算机工程系', '摄像头', '图书馆六层南阅览室西南', '无图像输出', '/ec16892c-558b-4b6d-8ef4-b01fc64c8086.jpg', '安顺发', '2017-06-24 09:17:00', '2018-04-15 22:41:44', '2', '4', '设备报修');
INSERT INTO `nic_techsupport` VALUES ('59', '20', '计算机工程系', '摄像头', '家属区97号楼单元门前东', '不现实视频', '/ec16892c-558b-4b6d-8ef4-b01fc64c8086.jpg', '12121', '2017-06-24 09:17:00', '2017-06-28 15:39:00', '4', '6', '日常运维');
INSERT INTO `nic_techsupport` VALUES ('60', '19', '后勤保障处', '摄像头', '3号公寓', '视频线有回放', '', '更换到设备地\r\n', '2017-06-26 09:17:00', '2018-04-09 19:32:43', '5', '4', '设备报修');
INSERT INTO `nic_techsupport` VALUES ('61', '19', '后勤保障处', '摄像头', '21号公寓楼', '有回放', '', '安顺发', '2017-06-27 09:17:00', '2017-06-28 15:39:00', '2', '4', '设备报修');
INSERT INTO `nic_techsupport` VALUES ('62', '20', '计算机工程系', '摄像头', '家属区52号楼', '电源存在问题', '', '安顺发', '2017-06-29 09:17:00', '2017-07-02 16:10:00', '4', '6', '日常运维');
INSERT INTO `nic_techsupport` VALUES ('63', '21', '计算机工程系', '摄像头', '图书馆三层南阅览室西南', '图像不清晰', '', '安顺发', '2017-07-02 14:30:00', '2017-07-07 15:39:00', '4', '6', '日常运维');
INSERT INTO `nic_techsupport` VALUES ('64', '19', '后勤保障处', '摄像头', '23号楼宿舍西侧', '视频有浮影', '', '安顺发', '2017-07-03 14:30:00', '2017-07-07 15:39:00', '2', '4', '设备报修');
INSERT INTO `nic_techsupport` VALUES ('65', '20', '计算机工程系', '摄像头', '75号楼东北房西墙', '接触不良', '', '安顺发', '2017-07-03 14:30:00', '2017-07-07 15:39:00', '4', '6', '日常运维');
INSERT INTO `nic_techsupport` VALUES ('66', '19', '后勤保障处', '摄像头', '教学副楼六层', '视频模糊', '', '安顺发', '2017-07-03 14:30:00', '2017-07-07 15:39:00', '2', '4', '设备报修');
INSERT INTO `nic_techsupport` VALUES ('67', '19', '后勤保障处', '摄像头', '3号教学楼西北枪机', '图像不稳', '', '安顺发', '2017-07-05 14:30:00', '2017-07-07 15:39:00', '2', '4', '设备报修');
INSERT INTO `nic_techsupport` VALUES ('68', '21', '计算机工程系', '摄像头', '图书馆四层南阅览室西北', '色调失真', '', '安顺发', '2017-07-06 14:30:00', '2017-07-07 15:39:00', '4', '6', '日常运维');
INSERT INTO `nic_techsupport` VALUES ('69', '20', '计算机工程系', '摄像头', '104公寓楼西北角', '接触不良', '', '更换到设备地\r\n', '2017-07-07 14:30:00', '2017-07-07 15:39:00', '4', '4', '设备报修');
INSERT INTO `nic_techsupport` VALUES ('70', '19', '后勤保障处', '摄像头', '西区大门球机', '光线比较暗', '', '张政带到售后维修,请耐心等待维修\r\n', '2017-07-09 14:30:00', '2018-04-10 13:51:58', '5', '4', '设备报修');
INSERT INTO `nic_techsupport` VALUES ('89', '21', '教师工作处', '枪机', '21号宿舍南侧中高清枪机', '画面黑屏', '', '更换到设备地\r\n', '2017-07-03 14:30:00', '2017-07-07 15:39:00', '5', '4', '设备报修');

-- ----------------------------
-- Table structure for nic_type
-- ----------------------------
DROP TABLE IF EXISTS `nic_type`;
CREATE TABLE `nic_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of nic_type
-- ----------------------------
INSERT INTO `nic_type` VALUES ('1', '技术支持');
INSERT INTO `nic_type` VALUES ('2', '设备维修');
INSERT INTO `nic_type` VALUES ('3', '日常运维');

-- ----------------------------
-- Table structure for nic_user
-- ----------------------------
DROP TABLE IF EXISTS `nic_user`;
CREATE TABLE `nic_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `user_telephone` varchar(255) CHARACTER SET utf8 NOT NULL,
  `user_department` varchar(255) CHARACTER SET utf8 NOT NULL,
  `user_openid` varchar(255) NOT NULL,
  `user_subscribe` int(11) DEFAULT NULL,
  `user_subscribeTime` datetime DEFAULT NULL,
  `user_nickname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `user_sex` int(11) DEFAULT NULL,
  `user_country` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `user_province` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `user_city` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `user_language` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `user_headImgUrl` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `user_shareType` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`),
  KEY `user_shareType` (`user_shareType`),
  CONSTRAINT `nic_user_ibfk_1` FOREIGN KEY (`user_shareType`) REFERENCES `nic_share` (`shid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of nic_user
-- ----------------------------
INSERT INTO `nic_user` VALUES ('19', '王伟', '18434367181', '后勤保障处', 'oR1Tmwd4hAWdiSZU3R8zQkS4mYTk', '1', '2018-04-15 23:20:43', '落雪倾城', '2', '中国', '山西', '太原', 'zh_CN', 'http://wx.qlogo.cn/mmopen/qq9zEib2qtBol5C1IpgwpQxuAzdj3f5ZQaNYSz1Dkxb0QbCicCNYpNE1Vvzfo4z172RztHSv7NOzDw9GlYgCEuDMsgicNtNicGt5/0', '1');
INSERT INTO `nic_user` VALUES ('20', '张峰', '18434355665', '计算机工程系', 'oR1TmwYxfr0q5eXX9u9pGXXsIS6g', '1', '2018-04-15 23:20:41', 'Liar', '1', '哥斯达黎加', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/UYicv3exy3vyR1IrCDWuSXsRCgxP83IfOxGD7GRiaqDUzpUXkywfOibwVmObrpOQ3iaVslowMzL73pTLBpjkFibobuLVAnicrnLiaib6/0', '1');
INSERT INTO `nic_user` VALUES ('21', '杨凯', '18434365848', '计算机工程系', 'oR1TmwdXQrsbGgibiJ60CMlAPv-c', '1', '2018-04-15 23:20:37', 'S', '2', '中国', '山西', '太原', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RrqEAC5JYTI394pJctyZakbVgNhkAXJFnItiahjwnBbHYJkRJmI5YFFy8PTmGSQTCgTaqwQicJ1aWBXXHAh9wr9xUkW9c8Kk24/0', '1');
INSERT INTO `nic_user` VALUES ('22', '周虹', '18434367357', '图书馆', 'oR1Tmwd4hAWdiSZU3R8zQkS4mYdd', '1', '2017-10-02 15:48:52', '落雪倾城', '2', '中国', '山西', '太原', 'zh_CN', 'http://wx.qlogo.cn/mmopen/qq9zEib2qtBol5C1IpgwpQxuAzdj3f5ZQaNYSz1Dkxb0QbCicCNYpNE1Vvzfo4z172RztHSv7NOzDw9GlYgCEuDMsgicNtNicGt5/0', '1');
INSERT INTO `nic_user` VALUES ('23', '杨利君', '15383468671', '保卫处', 'oR1Tmwd0yfxECE-jV7Wgi5jFaH7g', '1', '2018-04-15 23:20:47', '小狐狸', '1', '中国', '山西', '太原', 'zh_CN', '', '1');
INSERT INTO `nic_user` VALUES ('24', '郑启航', '18434355665', '科技处', 'oR1TmwYxfr0qdeXX9u8pGXXsIS6g', '1', '2017-10-02 16:52:47', 'Liar', '1', '哥斯达黎加', '', '', 'zh_CN', 'http://wx.qlogo.cn/mmopen/UYicv3exy3vyR1IrCDWuSXsRCgxP83IfOxGD7GRiaqDUzpUXkywfOibwVmObrpOQ3iaVslowMzL73pTLBpjkFibobuLVAnicrnLiaib6/0', '1');
INSERT INTO `nic_user` VALUES ('25', '李明', '15234560837', '教师工作处', 'oR1TmwdXqrtdhgibiJ60CMlAPv-c', '1', '2017-09-26 16:54:03', 'S', '2', '中国', '山西', '太原', 'zh_CN', 'http://wx.qlogo.cn/mmopen/RrqEAC5JYTI394pJctyZakbVgNhkAXJFnItiahjwnBbHYJkRJmI5YFFy8PTmGSQTCgTaqwQicJ1aWBXXHAh9wr9xUkW9c8Kk24/0', '1');
INSERT INTO `nic_user` VALUES ('26', '黄浩然', '12536883865', '环境与安全工程系', 'oq3avv48yL_tUVkWmQyFQWgAO2Lo', '1', '2018-04-15 23:20:50', '落雪倾城', '2', '中国', '山西', '太原', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Hwic76oHlIricsul10ArL4wAQazBr8pYEuzKAwF2D70wuicKqsYaNAMmSSI8dnv3j5kiacPTsh27BDUggHzgelAImTNo11FTBKWL/0', '1');
INSERT INTO `nic_user` VALUES ('58', '嗯嗯嗯', '456789', '环境与安全工程系', 'opCIT0mainGgF_7zcEuaCUHifEbs', '1', '2018-04-15 23:20:52', 'coolICE', '0', '', '', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/CiaNSfrX9nkdbSMC3SxV9zQZ2kCQibLsvYMNVXUrtelrhiap9ibFcoAe1WEP1S5lZOU2ibm4iabf1sNW8WAEYj70PiclyPKjFxNiaSC3/132', '1');
INSERT INTO `nic_user` VALUES ('59', '不同', '1478956', '理学系', 'opCIT0i9FQHcpsP4bcYP1mIbcABQ', '1', '2018-04-15 23:20:55', 'Mr. Lonely', '1', '澳大利亚', '维多利亚', '墨尔本', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/jfibLbIaRNxBQc7ibIGOydibE20cngR18VDQibtUgLmY4Go2pgwebDicwPN9iaFTQQqPkSCLwmceHmyfIrPKy9699DHfaYZmMs8jia6/132', '1');

-- ----------------------------
-- Table structure for nic_worklog
-- ----------------------------
DROP TABLE IF EXISTS `nic_worklog`;
CREATE TABLE `nic_worklog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `managerid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nic_worklog
-- ----------------------------
INSERT INTO `nic_worklog` VALUES ('1', '2018-04-25 16:59:03', 'sad', '1111', '111', '4');
INSERT INTO `nic_worklog` VALUES ('2', '2018-04-26 12:18:08', '12212', '张三', '123333', '4');
INSERT INTO `nic_worklog` VALUES ('3', '2018-04-26 12:25:46', '23#楼', '笔记本', '电能', '4');
INSERT INTO `nic_worklog` VALUES ('4', '2018-04-26 14:19:45', '西区机房', '西区机房西区机房', '', '4');
INSERT INTO `nic_worklog` VALUES ('9', '2018-04-26 12:22:16', '张三', '张三', '张三', '4');
INSERT INTO `nic_worklog` VALUES ('10', '2018-04-26 11:33:11', '萨达啥', '说的都是发生', '发生的发', null);
INSERT INTO `nic_worklog` VALUES ('11', '2018-04-26 11:39:46', '说的是多少分担分担', '东方时尚', 'xvcxv', '4');
INSERT INTO `nic_worklog` VALUES ('12', '2018-04-26 12:03:39', '东区主楼', '摄像头', '摄像头有问题', '4');
INSERT INTO `nic_worklog` VALUES ('14', '2018-04-26 12:22:16', '里斯', '里斯', '里斯里斯', '4');
INSERT INTO `nic_worklog` VALUES ('15', '2018-04-26 12:25:46', '计算机系办', '计算机', '计算机', '4');
INSERT INTO `nic_worklog` VALUES ('16', '2018-04-26 12:25:46', '主楼', '电脑电脑', '投影仪坏了', '4');
