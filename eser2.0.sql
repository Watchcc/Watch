/*
Navicat MySQL Data Transfer

Source Server         : hbb
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : eser2.0

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2019-03-28 01:13:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `addressID` int(11) NOT NULL AUTO_INCREMENT,
  `consignee` varchar(30) COLLATE utf8_bin NOT NULL,
  `province` varchar(20) COLLATE utf8_bin NOT NULL,
  `city` varchar(20) COLLATE utf8_bin NOT NULL,
  `district` varchar(20) COLLATE utf8_bin NOT NULL,
  `address` varchar(40) COLLATE utf8_bin NOT NULL,
  `phone` varchar(11) COLLATE utf8_bin NOT NULL,
  `openId` varchar(100) COLLATE utf8_bin NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0是 非0是被删除',
  PRIMARY KEY (`addressID`),
  KEY `openId_address_user` (`openId`),
  CONSTRAINT `openId_address_user` FOREIGN KEY (`openId`) REFERENCES `user` (`openId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '黄碧波', '广东省', '河源市', '源城区', '新宝路', '15019171730', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', '0');
INSERT INTO `address` VALUES ('2', '黄碧波1', '广东省', '东莞市', '寮步镇', '东莞理工学院城市学院123', '15019171730', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', '1');
INSERT INTO `address` VALUES ('3', '黄碧波', '广东省', '东莞市', '寮步镇', '东莞理工学院城市学院3d113', '15019171730', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', '0');
INSERT INTO `address` VALUES ('14', '黄碧波', '广东省', '东莞市', '寮步镇', '凯悦街1', '15019171730', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', '0');

-- ----------------------------
-- Table structure for `back_repair`
-- ----------------------------
DROP TABLE IF EXISTS `back_repair`;
CREATE TABLE `back_repair` (
  `back_repairId` int(11) NOT NULL AUTO_INCREMENT,
  `addressID` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `repairWay` int(3) NOT NULL,
  `orderTime` varchar(60) NOT NULL,
  `userUploadImgs` text,
  `backrepair_desc` varchar(255) DEFAULT NULL,
  `couponID` int(11) DEFAULT NULL,
  `engineerID` int(11) NOT NULL,
  `repair_detailID` int(11) NOT NULL,
  PRIMARY KEY (`back_repairId`),
  KEY `addressID_backrepair` (`addressID`),
  KEY `orderid_backrepair` (`order_id`),
  KEY `couponID_backrepair` (`couponID`),
  KEY `engineerID_backrepair` (`engineerID`),
  KEY `repair_detailID_backrepair` (`repair_detailID`),
  CONSTRAINT `addressID_backrepair` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`),
  CONSTRAINT `couponID_backrepair` FOREIGN KEY (`couponID`) REFERENCES `coupon` (`couponID`),
  CONSTRAINT `engineerID_backrepair` FOREIGN KEY (`engineerID`) REFERENCES `engineer` (`engineerID`),
  CONSTRAINT `orderid_backrepair` FOREIGN KEY (`order_id`) REFERENCES `eser_order` (`order_id`),
  CONSTRAINT `repair_detailID_backrepair` FOREIGN KEY (`repair_detailID`) REFERENCES `repair_detail` (`repair_detailID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of back_repair
-- ----------------------------
INSERT INTO `back_repair` VALUES ('8', '1', '15', '0', '2019-03-24 20:00', 'http://localhost:8080/Eser2.0/upload/repair/wx0c535c98e8e28dc2.o6zAJs45AmumrI34YtwL634E7aiY.7thKk8PV6WHca601cb04632de766b1919b877c6fcc22.png,http://localhost:8080/Eser2.0/upload/repair/wx0c535c98e8e28dc2.o6zAJs45AmumrI34YtwL634E7aiY.1oOriQ271LWN2296bbc984cee6a531e5296008955cc6.png,http://localhost:8080/Eser2.0/upload/repair/wx0c535c98e8e28dc2.o6zAJs45AmumrI34YtwL634E7aiY.wfo0f3ieYvhZdc9aedc990e736c26a3a0aa0c84cf8c3.jpg', '还是上不了网', '1', '1', '1');
INSERT INTO `back_repair` VALUES ('9', '3', '16', '0', '2019-03-25 18:00', 'http://localhost:8080/Eser2.0/upload/repair/wx0c535c98e8e28dc2.o6zAJs45AmumrI34YtwL634E7aiY.yoqLLck1zYIT44425b7533a91a6821051926625f821e.jpg', '没变化', '1', '1', '47');
INSERT INTO `back_repair` VALUES ('10', '14', '6', '0', '2019-03-25 11:00', '', 'dasd', '1', '1', '1');
INSERT INTO `back_repair` VALUES ('11', '14', '6', '0', '2019-03-25 11:00', '', 'dasd', '1', '1', '1');
INSERT INTO `back_repair` VALUES ('12', '3', '7', '0', '2019-03-25 17:00', '', 'huaile', '1', '1', '3');
INSERT INTO `back_repair` VALUES ('13', '3', '7', '0', '2019-03-25 17:00', '', 'huaile', '1', '1', '3');
INSERT INTO `back_repair` VALUES ('14', '1', '6', '0', '2019-03-25 18:00', '', 'dsad', '1', '1', '1');
INSERT INTO `back_repair` VALUES ('15', '1', '15', '0', '2019-03-25 20:00', '', 'sddas', '1', '1', '1');
INSERT INTO `back_repair` VALUES ('16', '3', '14', '0', '2019-03-25 20:00', 'http://localhost:8080/Eser2.0/upload/repair/wx0c535c98e8e28dc2.o6zAJs45AmumrI34YtwL634E7aiY.KdP4LEi98htu44425b7533a91a6821051926625f821e.jpg', 'huaile', '1', '1', '1');
INSERT INTO `back_repair` VALUES ('17', '1', '5', '0', '2019-03-27 20:00', '', 'sdad', '1', '1', '1');
INSERT INTO `back_repair` VALUES ('18', '1', '5', '0', '2019-03-27 20:00', '', 'sdad', '1', '1', '1');
INSERT INTO `back_repair` VALUES ('19', '1', '11', '0', '2019-03-27 20:00', '', 'asdsa', '1', '1', '3');
INSERT INTO `back_repair` VALUES ('20', '1', '23', '0', '2019-03-27 20:00', '', 'dasd', null, '1', '1');
INSERT INTO `back_repair` VALUES ('21', '1', '17', '0', '2019-03-27 21:00', '', 'dasd', null, '1', '1');
INSERT INTO `back_repair` VALUES ('22', '1', '19', '0', '2019-03-27 20:00', '', 'dasd', null, '1', '1');

-- ----------------------------
-- Table structure for `carousel`
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uploadFiles` varchar(255) COLLATE utf8_bin NOT NULL,
  `titleUrl` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES ('1', 'http://192.168.3.7:8080/Eser2.0/upload/carouselImg/222.jpg', null);
INSERT INTO `carousel` VALUES ('2', 'http://192.168.3.7:8080/Eser2.0/upload/carouselImg/444.jpg', null);
INSERT INTO `carousel` VALUES ('26', 'http://192.168.3.7:8080/Eser2.0/upload/carouselImg/333.jpg', null);

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `stars` int(2) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `CommentTitle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`commentID`),
  KEY `comment` (`order_id`),
  CONSTRAINT `comment` FOREIGN KEY (`order_id`) REFERENCES `eser_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('3', '4', '3', 'dasd', '态度一般');
INSERT INTO `comment` VALUES ('4', '7', '4', '', '细心专业');
INSERT INTO `comment` VALUES ('5', '5', '3', '好', '态度一般');
INSERT INTO `comment` VALUES ('6', '15', '3', '修的不错', '态度一般,到达不及时');
INSERT INTO `comment` VALUES ('7', '16', '5', '哈哈哈真的没有迟到耶', '到达及时,细心专业');

-- ----------------------------
-- Table structure for `coupon`
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `couponID` int(11) NOT NULL AUTO_INCREMENT,
  `couponName` varchar(39) NOT NULL,
  `money` float(11,2) NOT NULL,
  `use_money` float(11,2) NOT NULL,
  `openId` varchar(100) NOT NULL,
  `useEndTime` datetime NOT NULL,
  PRIMARY KEY (`couponID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon
-- ----------------------------
INSERT INTO `coupon` VALUES ('1', '新用户', '5.00', '0.00', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', '2019-03-30 16:22:13');
INSERT INTO `coupon` VALUES ('2', '新用户维修劵', '10.00', '0.00', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', '2019-04-04 22:56:04');
INSERT INTO `coupon` VALUES ('3', '新用户', '10.00', '0.00', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', '2019-04-04 22:57:35');

-- ----------------------------
-- Table structure for `coupon_user`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_user`;
CREATE TABLE `coupon_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `couponID` int(11) NOT NULL,
  `openId` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `useEndTime` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `couponID_coupon_user` (`couponID`),
  KEY `openId_coupon_user` (`openId`),
  CONSTRAINT `couponID_coupon_user` FOREIGN KEY (`couponID`) REFERENCES `coupon` (`couponID`),
  CONSTRAINT `openId_coupon_user` FOREIGN KEY (`openId`) REFERENCES `user` (`openId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon_user
-- ----------------------------

-- ----------------------------
-- Table structure for `engineer`
-- ----------------------------
DROP TABLE IF EXISTS `engineer`;
CREATE TABLE `engineer` (
  `engineerID` int(11) NOT NULL,
  `openId` varchar(255) NOT NULL,
  `name` varchar(11) NOT NULL,
  `orderNum` int(11) NOT NULL,
  `phone` char(11) NOT NULL,
  `headImg` varchar(255) NOT NULL,
  `money` float(11,0) NOT NULL DEFAULT '0',
  `coverage` varchar(60) NOT NULL COMMENT '服务范围',
  ` frozen_assets` float(11,0) NOT NULL DEFAULT '0' COMMENT '冻结金额',
  PRIMARY KEY (`engineerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of engineer
-- ----------------------------
INSERT INTO `engineer` VALUES ('1', 'oO63m5a5KLtAUZxInm6Ga1sGW1mg', '黄碧波', '27', '15019171730', 'http://192.168.3.7:8080/Eser2.0/upload/headImg/avatar.jpg', '150', '广东省东莞市寮步镇', '0');
INSERT INTO `engineer` VALUES ('2', 'fsdfsdfsd', '莫斌后', '20', '15019137281', 'http://192.168.3.7:8080/Eser2.0/upload/headImg/avatar.jpg', '280', '广东省东莞市南城区', '0');
INSERT INTO `engineer` VALUES ('3', 'dasdas', '莫容深', '19', '15039183810', 'http://192.168.3.7:8080/Eser2.0/upload/headImg/avatar.jpg', '600', '广东省东莞市寮步镇', '0');
INSERT INTO `engineer` VALUES ('4', '3123123', '叶振谈', '35', '18138418138', 'http://192.168.3.7:8080/Eser2.0/upload/headImg/avatar.jpg', '90', '广东省河源市源城区', '0');
INSERT INTO `engineer` VALUES ('5', 'sdsdfszf', '黄山', '27', '18138239130', 'http://192.168.3.7:8080/Eser2.0/upload/headImg/avatar.jpg', '1000', '广东省河源市源城区', '0');
INSERT INTO `engineer` VALUES ('6', '4234dasdasd', '黄河', '45', '15019138183', 'http://192.168.3.7:8080/Eser2.0/upload/headImg/avatar.jpg', '2423', '广东省河源市源城区', '0');

-- ----------------------------
-- Table structure for `eser_order`
-- ----------------------------
DROP TABLE IF EXISTS `eser_order`;
CREATE TABLE `eser_order` (
  `order_id` int(5) NOT NULL AUTO_INCREMENT,
  `brandID` int(5) NOT NULL,
  `repair_detailID` int(5) NOT NULL,
  `addressID` int(11) NOT NULL,
  `orderTime` varchar(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `repairWay` int(2) NOT NULL COMMENT '维修方式',
  `openId` varchar(100) COLLATE utf8_bin NOT NULL,
  `order_describe` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `couponID` int(11) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '2是完成0是未接单5是返修',
  `addTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `tips` varchar(20) COLLATE utf8_bin DEFAULT '未有工程师接单' COMMENT '订单状态',
  `engineerID` int(11) DEFAULT NULL,
  `isComment` int(1) NOT NULL DEFAULT '0' COMMENT '是否评价（0是未评价 ）',
  `dealTime` datetime DEFAULT NULL COMMENT '订单完成时间',
  `userUploadImgs` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `backrepair_desc` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `topay` float(11,0) NOT NULL,
  `version` int(5) NOT NULL DEFAULT '1' COMMENT '乐观锁，版本号',
  PRIMARY KEY (`order_id`),
  KEY `order_brandid` (`brandID`),
  KEY `order_detailID` (`repair_detailID`),
  KEY `order_tel` (`openId`),
  KEY `order_address` (`addressID`),
  KEY `order_engineer` (`engineerID`),
  CONSTRAINT `eser_order_ibfk_1` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`),
  CONSTRAINT `order_engineer` FOREIGN KEY (`engineerID`) REFERENCES `engineer` (`engineerID`),
  CONSTRAINT `order_openId` FOREIGN KEY (`openId`) REFERENCES `user` (`openId`),
  CONSTRAINT `repair_detailid_order_repair_detail` FOREIGN KEY (`repair_detailID`) REFERENCES `repair_detail` (`repair_detailID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of eser_order
-- ----------------------------
INSERT INTO `eser_order` VALUES ('4', '11', '1', '1', '2019-03-23 11:00', '0', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', '要修好', '1', '2', '2019-03-06 03:50:32', '已完成', '1', '1', '2019-03-11 00:00:00', 'http://localhost:8080/Eser2.0/upload/repair/wx0c535c98e8e28dc2.o6zAJs45AmumrI34YtwL634E7aiY.lenYOVIjYml89db12fbbd8242630bc270430f69807c6.jpg', '坏了啦', '30', '1');
INSERT INTO `eser_order` VALUES ('5', '11', '1', '1', '2019-03-07 09:28:11', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', '要修好', '1', '5', '2019-03-06 09:28:46', '返修中', '1', '1', '2019-03-24 00:00:00', null, null, '0', '1');
INSERT INTO `eser_order` VALUES ('6', '11', '1', '1', '2019-03-06 10:14:30', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', '要修好', '1', '5', '2019-03-06 10:14:42', '返修中', '1', '0', '2019-03-25 03:56:15', null, null, '10', '1');
INSERT INTO `eser_order` VALUES ('7', '11', '3', '1', '2019-03-10 19:00', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', '要修好', '1', '5', '2019-03-10 16:46:08', '返修中', '1', '1', '2019-03-24 23:11:33', null, null, '0', '1');
INSERT INTO `eser_order` VALUES ('9', '11', '1', '1', '2019-03-10 22:00', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', '要修好', null, '2', '2019-03-10 18:19:38', '已完成', '1', '0', '2019-03-24 23:11:31', null, null, '0', '1');
INSERT INTO `eser_order` VALUES ('11', '11', '3', '1', '2019-03-11 11:00', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', '要修好', null, '5', '2019-03-11 03:19:58', '返修中', '1', '0', '2019-03-24 23:11:29', null, null, '0', '1');
INSERT INTO `eser_order` VALUES ('12', '11', '1', '1', '2019-03-14 10:00', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', '要修好', null, '2', '2019-03-14 08:03:06', '已完成', '1', '0', '2019-03-24 23:11:27', null, null, '0', '1');
INSERT INTO `eser_order` VALUES ('13', '15', '5', '1', '2019-03-14 14:00', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', 'undefined', '1', '2', '2019-03-14 11:04:00', '已完成', '1', '0', '2019-03-25 03:49:09', null, null, '0', '1');
INSERT INTO `eser_order` VALUES ('14', '11', '1', '1', '2019-03-22 09:00', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', 'undefined', '1', '5', '2019-03-22 06:25:16', '返修中', '1', '0', '2019-03-24 23:11:19', null, null, '0', '1');
INSERT INTO `eser_order` VALUES ('15', '11', '1', '1', '2019-03-24 19:00', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', '上不了网', '1', '5', '2019-03-24 17:18:39', '返修中', '1', '1', '2019-03-24 23:10:37', null, null, '0', '1');
INSERT INTO `eser_order` VALUES ('16', '12', '47', '3', '2019-03-25 10:00', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', '明天别迟到哇', '1', '2', '2019-03-24 20:55:09', '已完成', '1', '1', '2019-03-25 03:54:49', null, null, '10', '1');
INSERT INTO `eser_order` VALUES ('17', '11', '1', '2', '2019-03-26 10:00', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', 'undefined', null, '5', '2019-03-24 22:09:30', '返修中', '1', '0', '2019-03-27 17:30:15', null, null, '0', '1');
INSERT INTO `eser_order` VALUES ('18', '11', '1', '1', '2019-03-25 10:00', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', '大声道', '1', '2', '2019-03-24 23:23:08', '已完成', '1', '0', '2019-03-25 16:19:51', null, null, '0', '1');
INSERT INTO `eser_order` VALUES ('19', '11', '1', '2', '2019-03-25 10:00', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', 'undefined', null, '5', '2019-03-24 23:30:40', '返修中', '1', '0', '2019-03-27 17:39:52', null, null, '0', '1');
INSERT INTO `eser_order` VALUES ('20', '11', '1', '1', '2019-03-25 10:00', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', 'undefined', null, '0', '2019-03-24 23:32:47', '未有工程师接单', null, '0', null, null, null, '0', '1');
INSERT INTO `eser_order` VALUES ('21', '11', '1', '1', '2019-03-25 09:00', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', 'undefined', null, '0', '2019-03-24 23:34:55', '未有工程师接单', null, '0', null, null, null, '0', '1');
INSERT INTO `eser_order` VALUES ('22', '11', '1', '2', '2019-03-26 11:00', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', 'undefined', null, '1', '2019-03-24 23:35:48', '维修中', '1', '0', null, null, null, '0', '2');
INSERT INTO `eser_order` VALUES ('23', '11', '1', '1', '2019-03-25 10:00', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', 'undefined', null, '5', '2019-03-24 23:39:03', '返修中', '1', '0', '2019-03-27 17:25:47', null, null, '0', '1');
INSERT INTO `eser_order` VALUES ('24', '11', '1', '1', '2019-03-25 09:00', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', 'undefined', null, '2', '2019-03-24 23:41:20', '已完成', '1', '0', '2019-03-24 23:42:02', null, null, '0', '1');
INSERT INTO `eser_order` VALUES ('25', '11', '1', '1', '2019-03-25 12:00', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', 'undefined', '1', '2', '2019-03-25 03:42:35', '已完成', '1', '0', '2019-03-25 03:51:00', null, null, '25', '1');
INSERT INTO `eser_order` VALUES ('26', '16', '78', '14', '2019-03-25 20:00', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', 'undefined', '1', '0', '2019-03-25 16:15:25', '未有工程师接单', null, '0', null, null, null, '55', '1');
INSERT INTO `eser_order` VALUES ('27', '11', '1', '1', '2019-03-28 10:00', '72', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', 'undefined', '1', '0', '2019-03-27 22:55:14', '未有工程师接单', null, '0', null, null, null, '25', '1');

-- ----------------------------
-- Table structure for `feedback`
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `feedbackId` int(11) NOT NULL AUTO_INCREMENT,
  `phone` char(11) NOT NULL,
  `cont` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`feedbackId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('1', '15019171730', '做的不错哦', 'http://localhost:8080/Eser/upload/feedbackImg/wx0c535c98e8e28dc2.o6zAJs45AmumrI34YtwL634E7aiY.srun1BWE9hzj1905e9c227a9e4c6c317b2029231d5a3.jpg');

-- ----------------------------
-- Table structure for `operator`
-- ----------------------------
DROP TABLE IF EXISTS `operator`;
CREATE TABLE `operator` (
  `username` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '登录账号',
  `password` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `email` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `level` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of operator
-- ----------------------------
INSERT INTO `operator` VALUES ('admin', '21232f297a57a5a743894a0e4a801fc3', '925402015@qq.com', '1');

-- ----------------------------
-- Table structure for `repairhot`
-- ----------------------------
DROP TABLE IF EXISTS `repairhot`;
CREATE TABLE `repairhot` (
  `brandID` int(5) NOT NULL AUTO_INCREMENT,
  `brandName` varchar(50) COLLATE utf8_bin NOT NULL,
  `imageUrl` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`brandID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of repairhot
-- ----------------------------
INSERT INTO `repairhot` VALUES ('11', '网络', 'http://192.168.3.7:8080/Eser2.0/upload/repairhotImg/wangluo.png');
INSERT INTO `repairhot` VALUES ('12', '电脑', 'http://192.168.3.7:8080/Eser2.0/upload/repairhotImg/diannao.png');
INSERT INTO `repairhot` VALUES ('13', '打印机', 'http://192.168.3.7:8080/Eser2.0/upload/repairhotImg/dayingji.png');
INSERT INTO `repairhot` VALUES ('14', '复印机', '');
INSERT INTO `repairhot` VALUES ('15', '电视', null);
INSERT INTO `repairhot` VALUES ('16', '空调', null);
INSERT INTO `repairhot` VALUES ('17', '洗衣机', null);
INSERT INTO `repairhot` VALUES ('18', '冰箱', null);
INSERT INTO `repairhot` VALUES ('19', '电热水器', null);
INSERT INTO `repairhot` VALUES ('20', '燃气热水器', null);
INSERT INTO `repairhot` VALUES ('21', '投影仪', null);
INSERT INTO `repairhot` VALUES ('22', '碎纸机', null);
INSERT INTO `repairhot` VALUES ('23', '音箱', null);
INSERT INTO `repairhot` VALUES ('25', '消毒柜', null);
INSERT INTO `repairhot` VALUES ('26', '洗碗机', null);
INSERT INTO `repairhot` VALUES ('27', '烤箱', null);
INSERT INTO `repairhot` VALUES ('28', '电饭煲', null);
INSERT INTO `repairhot` VALUES ('30', '传真机', null);
INSERT INTO `repairhot` VALUES ('31', '平板电脑', null);
INSERT INTO `repairhot` VALUES ('32', '电磁炉', null);
INSERT INTO `repairhot` VALUES ('33', '微波炉', null);
INSERT INTO `repairhot` VALUES ('34', '油烟机', null);
INSERT INTO `repairhot` VALUES ('35', '电压力锅', null);

-- ----------------------------
-- Table structure for `repair_detail`
-- ----------------------------
DROP TABLE IF EXISTS `repair_detail`;
CREATE TABLE `repair_detail` (
  `repair_detailID` int(5) NOT NULL AUTO_INCREMENT,
  `repair_detailName` varchar(255) COLLATE utf8_bin NOT NULL,
  `brandID` int(5) NOT NULL,
  `price` double(11,2) NOT NULL,
  PRIMARY KEY (`repair_detailID`),
  KEY `brandID` (`brandID`),
  CONSTRAINT `brandID_repair_detail` FOREIGN KEY (`brandID`) REFERENCES `repairhot` (`brandID`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of repair_detail
-- ----------------------------
INSERT INTO `repair_detail` VALUES ('1', '网络连接出现黄色叹号', '11', '30.00');
INSERT INTO `repair_detail` VALUES ('3', '网络连接正常但无法打开网页', '11', '30.00');
INSERT INTO `repair_detail` VALUES ('4', '网络连接提示没有连接', '11', '70.00');
INSERT INTO `repair_detail` VALUES ('5', '电视机没信号', '15', '80.00');
INSERT INTO `repair_detail` VALUES ('6', '电视机画面闪', '15', '80.00');
INSERT INTO `repair_detail` VALUES ('7', '电视机无字符', '15', '80.00');
INSERT INTO `repair_detail` VALUES ('8', '电视机重影', '15', '80.00');
INSERT INTO `repair_detail` VALUES ('9', '电视机花屏', '15', '80.00');
INSERT INTO `repair_detail` VALUES ('13', '电视机偏色', '15', '55.00');
INSERT INTO `repair_detail` VALUES ('14', 'Modem指示灯不闪', '11', '100.00');
INSERT INTO `repair_detail` VALUES ('15', '系统检测不到Modem', '11', '100.00');
INSERT INTO `repair_detail` VALUES ('16', '访问网络卡顿', '11', '30.00');
INSERT INTO `repair_detail` VALUES ('17', '无法连接网络打印机', '11', '30.00');
INSERT INTO `repair_detail` VALUES ('18', '无法访问域共享文件夹', '11', '30.00');
INSERT INTO `repair_detail` VALUES ('19', '无法连接其他电脑的共享打印机', '11', '30.00');
INSERT INTO `repair_detail` VALUES ('20', '提示IP冲突', '11', '30.00');
INSERT INTO `repair_detail` VALUES ('21', '巡检', '11', '30.00');
INSERT INTO `repair_detail` VALUES ('22', '维护', '11', '30.00');
INSERT INTO `repair_detail` VALUES ('23', '变更', '11', '30.00');
INSERT INTO `repair_detail` VALUES ('24', '应急', '11', '30.00');
INSERT INTO `repair_detail` VALUES ('25', '其他', '11', '30.00');
INSERT INTO `repair_detail` VALUES ('26', '开机出现无像无音', '15', '80.00');
INSERT INTO `repair_detail` VALUES ('27', '灯闪不能开机', '15', '80.00');
INSERT INTO `repair_detail` VALUES ('28', '开不了机', '15', '80.00');
INSERT INTO `repair_detail` VALUES ('29', '有声音没有图像', '15', '80.00');
INSERT INTO `repair_detail` VALUES ('30', '电视机整机没有电', '15', '80.00');
INSERT INTO `repair_detail` VALUES ('31', '电视机挂壁安装', '15', '80.00');
INSERT INTO `repair_detail` VALUES ('32', '消磁', '15', '80.00');
INSERT INTO `repair_detail` VALUES ('33', '除尘', '15', '80.00');
INSERT INTO `repair_detail` VALUES ('34', '调整频道', '15', '60.00');
INSERT INTO `repair_detail` VALUES ('35', '其他', '15', '80.00');
INSERT INTO `repair_detail` VALUES ('36', '系统优化', '12', '100.00');
INSERT INTO `repair_detail` VALUES ('37', '操作系统更换', '12', '30.00');
INSERT INTO `repair_detail` VALUES ('38', '电脑反应慢', '12', '30.00');
INSERT INTO `repair_detail` VALUES ('39', '更换电脑配件', '12', '120.00');
INSERT INTO `repair_detail` VALUES ('40', '开机无反应', '12', '50.00');
INSERT INTO `repair_detail` VALUES ('41', '开机自动重启', '12', '30.00');
INSERT INTO `repair_detail` VALUES ('42', '电脑上不了网', '12', '30.00');
INSERT INTO `repair_detail` VALUES ('43', '开机界面卡停', '12', '30.00');
INSERT INTO `repair_detail` VALUES ('44', '显示器变颜色', '12', '80.00');
INSERT INTO `repair_detail` VALUES ('45', '电脑组装', '12', '50.00');
INSERT INTO `repair_detail` VALUES ('46', '更换或添加内存条', '12', '150.00');
INSERT INTO `repair_detail` VALUES ('47', '更换主板', '12', '290.00');
INSERT INTO `repair_detail` VALUES ('48', '更换电源', '12', '120.00');
INSERT INTO `repair_detail` VALUES ('49', '更换CPU', '12', '488.00');
INSERT INTO `repair_detail` VALUES ('50', '更换或添加硬盘', '12', '330.00');
INSERT INTO `repair_detail` VALUES ('51', '其他', '12', '30.00');
INSERT INTO `repair_detail` VALUES ('52', '打印不清晰', '13', '30.00');
INSERT INTO `repair_detail` VALUES ('53', '打印出现黑线', '13', '30.00');
INSERT INTO `repair_detail` VALUES ('54', '打印卡纸', '13', '30.00');
INSERT INTO `repair_detail` VALUES ('55', '打印出现乱码', '13', '30.00');
INSERT INTO `repair_detail` VALUES ('56', '硒鼓加粉', '13', '30.00');
INSERT INTO `repair_detail` VALUES ('57', '其他', '13', '30.00');
INSERT INTO `repair_detail` VALUES ('58', '复印后出现底灰', '14', '100.00');
INSERT INTO `repair_detail` VALUES ('59', '复印图像清晰度低', '14', '100.00');
INSERT INTO `repair_detail` VALUES ('60', '复印件有污迹', '14', '100.00');
INSERT INTO `repair_detail` VALUES ('61', '复印件上有黑线', '14', '100.00');
INSERT INTO `repair_detail` VALUES ('62', '复印机卡纸报错', '14', '100.00');
INSERT INTO `repair_detail` VALUES ('63', '复印件全黑', '14', '100.00');
INSERT INTO `repair_detail` VALUES ('64', '复印件全白', '14', '100.00');
INSERT INTO `repair_detail` VALUES ('65', '其他', '14', '100.00');
INSERT INTO `repair_detail` VALUES ('66', '自动关机', '21', '50.00');
INSERT INTO `repair_detail` VALUES ('67', '图像无信号画面无显示', '21', '80.00');
INSERT INTO `repair_detail` VALUES ('68', '开不了机', '21', '80.00');
INSERT INTO `repair_detail` VALUES ('69', '画面图像偏色', '21', '80.00');
INSERT INTO `repair_detail` VALUES ('70', '自动熄灯', '21', '80.00');
INSERT INTO `repair_detail` VALUES ('71', '投影画面出现竖条或横条', '21', '80.00');
INSERT INTO `repair_detail` VALUES ('72', '画面出现色彩失真', '21', '80.00');
INSERT INTO `repair_detail` VALUES ('73', '画面出现色斑', '21', '80.00');
INSERT INTO `repair_detail` VALUES ('74', '安装', '21', '80.00');
INSERT INTO `repair_detail` VALUES ('75', '其他', '21', '80.00');
INSERT INTO `repair_detail` VALUES ('76', '功放、音响', '23', '80.00');
INSERT INTO `repair_detail` VALUES ('77', '空调只吹风不制冷', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('78', '空调不开机', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('79', '空调外机不启动', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('80', '空调室外风机不工作', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('81', '空调清洁', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('82', '空调移位', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('83', '空调安装', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('84', '空调加雪种', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('85', '空调外机工作压缩机不启动', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('86', '空调不够冷', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('87', '空调手动能开机遥控不开机', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('88', '空调遥控能开机手动不能开机', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('89', '空调能通电不开机', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('90', '室内风机不启动', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('91', '室内机风小', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('92', '空调不能摆风', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('93', '空调灯闪不能开机', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('94', '空调插电跳闸', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('95', '空调室内机有噪音', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('96', '空调不能制热', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('97', '空调室内机漏水', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('98', '室内机左右或出风口滴水', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('99', '空调室外机有噪音', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('101', '补漏', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('102', '打压', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('103', '排空', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('104', '其他', '16', '60.00');
INSERT INTO `repair_detail` VALUES ('105', '程序板的按钮失灵', '17', '60.00');
INSERT INTO `repair_detail` VALUES ('106', '洗衣机进水不止', '17', '60.00');
INSERT INTO `repair_detail` VALUES ('107', '洗衣机不能进水', '17', '60.00');
INSERT INTO `repair_detail` VALUES ('108', '排水的速度变慢', '17', '60.00');
INSERT INTO `repair_detail` VALUES ('109', '洗衣机不接水', '17', '60.00');
INSERT INTO `repair_detail` VALUES ('110', '洗衣机漏水', '17', '60.00');
INSERT INTO `repair_detail` VALUES ('111', '洗衣机清洁', '17', '60.00');
INSERT INTO `repair_detail` VALUES ('112', '洗衣机不脱水', '17', '60.00');
INSERT INTO `repair_detail` VALUES ('113', '波转不转', '17', '60.00');
INSERT INTO `repair_detail` VALUES ('114', '波轮单向转动', '17', '60.00');
INSERT INTO `repair_detail` VALUES ('115', '脱水的转速过低', '17', '60.00');
INSERT INTO `repair_detail` VALUES ('116', '洗衣机漏电', '17', '60.00');
INSERT INTO `repair_detail` VALUES ('117', '洗衣机噪声异常', '17', '60.00');
INSERT INTO `repair_detail` VALUES ('118', '其他', '17', '60.00');
INSERT INTO `repair_detail` VALUES ('119', '补焊外漏', '18', '70.00');
INSERT INTO `repair_detail` VALUES ('120', '冷冻室除霜', '18', '70.00');
INSERT INTO `repair_detail` VALUES ('121', '更换门轴', '18', '70.00');
INSERT INTO `repair_detail` VALUES ('122', '更换门封条', '18', '70.00');
INSERT INTO `repair_detail` VALUES ('123', '维修漏水', '18', '70.00');
INSERT INTO `repair_detail` VALUES ('124', '打压', '18', '70.00');
INSERT INTO `repair_detail` VALUES ('125', '抽空', '18', '70.00');
INSERT INTO `repair_detail` VALUES ('126', '加制冷剂', '18', '70.00');
INSERT INTO `repair_detail` VALUES ('127', '更换照明灯', '18', '70.00');
INSERT INTO `repair_detail` VALUES ('128', '不制冷', '18', '70.00');
INSERT INTO `repair_detail` VALUES ('129', '漏电', '18', '70.00');
INSERT INTO `repair_detail` VALUES ('130', '其他', '18', '70.00');
INSERT INTO `repair_detail` VALUES ('131', '电热水器不出水', '19', '70.00');
INSERT INTO `repair_detail` VALUES ('132', '电热水器漏水', '19', '70.00');
INSERT INTO `repair_detail` VALUES ('133', '在正常加热下突然跳闸', '19', '70.00');
INSERT INTO `repair_detail` VALUES ('134', '加热时间过长', '19', '70.00');
INSERT INTO `repair_detail` VALUES ('135', '加热指示灯亮但不能加热', '19', '70.00');
INSERT INTO `repair_detail` VALUES ('136', '电热水器安装', '19', '70.00');
INSERT INTO `repair_detail` VALUES ('137', '加热指示灯不亮且不能加热', '19', '70.00');
INSERT INTO `repair_detail` VALUES ('138', '拆机', '19', '70.00');
INSERT INTO `repair_detail` VALUES ('139', '管路改造', '19', '70.00');
INSERT INTO `repair_detail` VALUES ('140', '出水过热', '20', '60.00');
INSERT INTO `repair_detail` VALUES ('141', '出水量小', '20', '60.00');
INSERT INTO `repair_detail` VALUES ('142', '水不热', '20', '60.00');
INSERT INTO `repair_detail` VALUES ('143', '有异响', '20', '60.00');
INSERT INTO `repair_detail` VALUES ('144', '打不着火', '20', '60.00');
INSERT INTO `repair_detail` VALUES ('145', '拆机', '20', '60.00');
INSERT INTO `repair_detail` VALUES ('146', '安装', '20', '60.00');
INSERT INTO `repair_detail` VALUES ('147', '其他', '20', '60.00');
INSERT INTO `repair_detail` VALUES ('148', '电烤箱不热', '27', '120.00');
INSERT INTO `repair_detail` VALUES ('149', '定时器失灵', '27', '120.00');
INSERT INTO `repair_detail` VALUES ('150', '电烤箱漏电', '27', '120.00');
INSERT INTO `repair_detail` VALUES ('151', '指示灯不亮且不加热', '27', '120.00');
INSERT INTO `repair_detail` VALUES ('152', '指示灯亮但不加热', '27', '120.00');
INSERT INTO `repair_detail` VALUES ('153', '电烤箱出现异味', '27', '120.00');
INSERT INTO `repair_detail` VALUES ('154', '插上电源插头，电源保险丝马上熔断', '28', '120.00');
INSERT INTO `repair_detail` VALUES ('155', '煮好饭后不能保温', '28', '120.00');
INSERT INTO `repair_detail` VALUES ('156', '煮煳饭', '28', '120.00');
INSERT INTO `repair_detail` VALUES ('157', '煮夹生饭', '28', '120.00');
INSERT INTO `repair_detail` VALUES ('158', '不能煮饭', '28', '120.00');
INSERT INTO `repair_detail` VALUES ('159', '保温灯亮煮饭灯不亮', '28', '120.00');
INSERT INTO `repair_detail` VALUES ('160', '接通电源后，灯不亮且不发热', '35', '150.00');
INSERT INTO `repair_detail` VALUES ('161', '电源指示灯亮，但不发热', '35', '150.00');
INSERT INTO `repair_detail` VALUES ('162', '定时器不转，饭常烧焦', '35', '150.00');
INSERT INTO `repair_detail` VALUES ('163', '锅顶漏气', '35', '150.00');
INSERT INTO `repair_detail` VALUES ('164', '浮子漏气', '35', '150.00');
INSERT INTO `repair_detail` VALUES ('165', '胶圈漏气(锅盖周围)', '35', '150.00');
INSERT INTO `repair_detail` VALUES ('166', '控制和显示正常，但不加热。', '35', '150.00');
INSERT INTO `repair_detail` VALUES ('167', '显示屏中的数码字缺画', '35', '150.00');
INSERT INTO `repair_detail` VALUES ('168', '出现E1/E2故障代码', '35', '150.00');
INSERT INTO `repair_detail` VALUES ('169', '出现E3/E4故障代码', '35', '150.00');
INSERT INTO `repair_detail` VALUES ('170', '加热一会就跳保温(水未开)', '35', '150.00');
INSERT INTO `repair_detail` VALUES ('171', '合盖困难', '35', '80.00');
INSERT INTO `repair_detail` VALUES ('172', '开盖困难', '35', '80.00');
INSERT INTO `repair_detail` VALUES ('173', '浮子不能上升', '35', '80.00');
INSERT INTO `repair_detail` VALUES ('174', '浮子上升后漏气', '35', '80.00');
INSERT INTO `repair_detail` VALUES ('175', '工作过程中不能转入保温状态', '35', '120.00');
INSERT INTO `repair_detail` VALUES ('176', '烧干或烧焦食物', '35', '120.00');
INSERT INTO `repair_detail` VALUES ('177', '控制面板按键不能正常工作', '35', '120.00');
INSERT INTO `repair_detail` VALUES ('178', '工作指示灯不亮', '35', '120.00');
INSERT INTO `repair_detail` VALUES ('179', '进纸感应', '22', '75.00');
INSERT INTO `repair_detail` VALUES ('180', '过热指示灯亮，机器不工作', '22', '75.00');
INSERT INTO `repair_detail` VALUES ('181', '触摸功能失效', '22', '75.00');
INSERT INTO `repair_detail` VALUES ('182', '堵转', '22', '75.00');
INSERT INTO `repair_detail` VALUES ('183', '不启动', '22', '75.00');
INSERT INTO `repair_detail` VALUES ('184', '指示灯不亮', '22', '75.00');
INSERT INTO `repair_detail` VALUES ('185', '电磁炉不加热', '32', '65.00');
INSERT INTO `repair_detail` VALUES ('186', '电磁炉在使用过程中无法调节功率', '32', '65.00');
INSERT INTO `repair_detail` VALUES ('187', '电磁炉不开机（按电源键指示灯不亮）', '32', '65.00');
INSERT INTO `repair_detail` VALUES ('188', '电磁炉整机无反应', '32', '65.00');
INSERT INTO `repair_detail` VALUES ('189', '电磁炉开机烧保险', '32', '65.00');
INSERT INTO `repair_detail` VALUES ('190', '电磁炉蜂鸣器长鸣', '32', '65.00');
INSERT INTO `repair_detail` VALUES ('191', '出现故障代码', '32', '85.00');
INSERT INTO `repair_detail` VALUES ('192', '不加热或间断加热', '32', '100.00');
INSERT INTO `repair_detail` VALUES ('193', '照明灯不亮，不加热', '33', '100.00');
INSERT INTO `repair_detail` VALUES ('194', '照明灯不亮，但能加热', '33', '100.00');
INSERT INTO `repair_detail` VALUES ('195', '加热时，转盘不转', '33', '100.00');
INSERT INTO `repair_detail` VALUES ('196', '能加热，但不能自动断电。', '33', '100.00');
INSERT INTO `repair_detail` VALUES ('197', '漏电', '33', '100.00');
INSERT INTO `repair_detail` VALUES ('198', '通电后不能启动', '34', '150.00');
INSERT INTO `repair_detail` VALUES ('199', '运转时有异常声音或噪音大', '34', '150.00');
INSERT INTO `repair_detail` VALUES ('200', '抽油烟机振动过大', '34', '150.00');
INSERT INTO `repair_detail` VALUES ('201', '漏油', '34', '150.00');
INSERT INTO `repair_detail` VALUES ('202', '抽油烟效果差', '34', '150.00');
INSERT INTO `repair_detail` VALUES ('203', '琴键开关失灵', '34', '150.00');
INSERT INTO `repair_detail` VALUES ('204', '触摸开关不灵', '34', '150.00');
INSERT INTO `repair_detail` VALUES ('205', '抽油烟机影响炊事火源热量', '34', '150.00');
INSERT INTO `repair_detail` VALUES ('206', '抽油烟机清洁', '34', '70.00');
INSERT INTO `repair_detail` VALUES ('207', '拆机', '34', '100.00');
INSERT INTO `repair_detail` VALUES ('208', '安装', '34', '100.00');
INSERT INTO `repair_detail` VALUES ('209', '开机后屏幕不能正常显示甚至不能点亮', '31', '200.00');
INSERT INTO `repair_detail` VALUES ('210', '摄像头闪退', '31', '200.00');
INSERT INTO `repair_detail` VALUES ('211', '开不了机', '31', '200.00');
INSERT INTO `repair_detail` VALUES ('212', '开机无法进入系统', '31', '200.00');
INSERT INTO `repair_detail` VALUES ('213', '平板无法连接电脑', '31', '200.00');
INSERT INTO `repair_detail` VALUES ('214', '平板无法连接充电', '31', '200.00');
INSERT INTO `repair_detail` VALUES ('215', '无法连接WiFi', '31', '50.00');
INSERT INTO `repair_detail` VALUES ('216', '频繁死机', '31', '250.00');
INSERT INTO `repair_detail` VALUES ('217', '卡纸', '30', '30.00');
INSERT INTO `repair_detail` VALUES ('218', '传真或打印时，纸张为全白', '30', '30.00');
INSERT INTO `repair_detail` VALUES ('219', '传真或打印时，纸张出现黑线', '30', '30.00');
INSERT INTO `repair_detail` VALUES ('220', '传真或打印时，纸张出现白线', '30', '30.00');
INSERT INTO `repair_detail` VALUES ('221', '纸张无法正常馈出', '30', '30.00');
INSERT INTO `repair_detail` VALUES ('222', '电话正常使用，无法收发传真', '30', '30.00');
INSERT INTO `repair_detail` VALUES ('223', '传真机功能键无效', '30', '30.00');
INSERT INTO `repair_detail` VALUES ('224', '洗碗机不补水', '26', '50.00');
INSERT INTO `repair_detail` VALUES ('225', '碗碟不干', '26', '50.00');
INSERT INTO `repair_detail` VALUES ('226', '洗碗机不排水', '26', '50.00');
INSERT INTO `repair_detail` VALUES ('227', '洗碗机洗不干净', '26', '50.00');
INSERT INTO `repair_detail` VALUES ('228', '消毒柜漏电', '25', '90.00');
INSERT INTO `repair_detail` VALUES ('229', '通电后熔断保险丝', '25', '90.00');
INSERT INTO `repair_detail` VALUES ('230', '通电后指示灯不亮', '25', '90.00');
INSERT INTO `repair_detail` VALUES ('231', '指示灯亮但不发热', '25', '90.00');
INSERT INTO `repair_detail` VALUES ('232', '温度偏高', '25', '90.00');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `openId` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '男',
  `nickName` varchar(30) NOT NULL,
  `city` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `province` varchar(60) DEFAULT NULL,
  `country` varchar(60) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0是正常用户 非0是黑名单',
  PRIMARY KEY (`user_id`),
  KEY `openId` (`openId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('4', 'oUtEJ44ZWDtylS50OZbpgR_H_Vm4', '男', 'Mr.Robot', 'Dongguan', '', '', '0');
INSERT INTO `user` VALUES ('8', 'oUtEJ44n60tEGjMsIPg31j2qKZr4', '女', '奶喵', 'Dongguan', '', '', '0');
INSERT INTO `user` VALUES ('9', 'sdasd', '男', '张三丰', 'Dongguan', null, null, '0');
INSERT INTO `user` VALUES ('10', '撒打算大', '男', '李四', 'Dongguan', null, null, '0');
INSERT INTO `user` VALUES ('11', 'dasdasd', '男', '齐天大圣', 'Dongguan', null, null, '0');
INSERT INTO `user` VALUES ('12', '32sadfsdf', '男', '孙悟空', 'Dongguan', null, null, '0');
INSERT INTO `user` VALUES ('13', 'dsadasdqadas', '男', '张三', 'Dongguan', null, null, '2');
