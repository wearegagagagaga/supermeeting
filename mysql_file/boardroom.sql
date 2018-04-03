/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50638
Source Host           : localhost:3306
Source Database       : boardroom

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-04-03 12:05:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `room`
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', '春');
INSERT INTO `room` VALUES ('2', '夏');
INSERT INTO `room` VALUES ('3', '秋');
INSERT INTO `room` VALUES ('4', '冬');
INSERT INTO `room` VALUES ('5', '冷');
INSERT INTO `room` VALUES ('6', '热');
INSERT INTO `room` VALUES ('7', '酸');
INSERT INTO `room` VALUES ('8', '甜');

-- ----------------------------
-- Table structure for `room_status`
-- ----------------------------
DROP TABLE IF EXISTS `room_status`;
CREATE TABLE `room_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` date DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `choice_time` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`),
  KEY `user_id` (`user_id`),
  KEY `choice_time` (`choice_time`),
  CONSTRAINT `room_status_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  CONSTRAINT `room_status_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `room_status_ibfk_3` FOREIGN KEY (`choice_time`) REFERENCES `times` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room_status
-- ----------------------------
INSERT INTO `room_status` VALUES ('4', '2018-04-02', '6', '14', '2');
INSERT INTO `room_status` VALUES ('5', '2018-04-02', '1', '10', '3');
INSERT INTO `room_status` VALUES ('6', '2018-04-02', '1', '11', '2');
INSERT INTO `room_status` VALUES ('38', '2018-04-02', '4', '10', '4');
INSERT INTO `room_status` VALUES ('39', '2018-04-02', '7', '11', '4');
INSERT INTO `room_status` VALUES ('42', '2018-04-02', '7', '10', '4');
INSERT INTO `room_status` VALUES ('43', '2018-04-02', '7', '12', '4');
INSERT INTO `room_status` VALUES ('44', '2018-04-02', '6', '12', '4');
INSERT INTO `room_status` VALUES ('45', '2018-04-02', '5', '12', '4');
INSERT INTO `room_status` VALUES ('46', '2018-04-02', '4', '12', '4');
INSERT INTO `room_status` VALUES ('47', '2018-04-02', '4', '11', '4');
INSERT INTO `room_status` VALUES ('48', '2018-04-02', '2', '10', '4');
INSERT INTO `room_status` VALUES ('49', '2018-04-02', '1', '12', '4');
INSERT INTO `room_status` VALUES ('50', '2018-04-02', '3', '10', '4');
INSERT INTO `room_status` VALUES ('51', '2018-04-02', '1', '14', '4');
INSERT INTO `room_status` VALUES ('52', '2018-04-02', '2', '14', '4');
INSERT INTO `room_status` VALUES ('53', '2018-04-02', '3', '14', '4');
INSERT INTO `room_status` VALUES ('54', '2018-04-02', '4', '14', '4');
INSERT INTO `room_status` VALUES ('55', '2018-04-02', '5', '14', '4');
INSERT INTO `room_status` VALUES ('56', '2018-04-02', '7', '14', '4');
INSERT INTO `room_status` VALUES ('57', '2018-04-02', '7', '15', '4');
INSERT INTO `room_status` VALUES ('58', '2018-04-02', '7', '16', '4');
INSERT INTO `room_status` VALUES ('60', '2018-04-02', '4', '15', '4');
INSERT INTO `room_status` VALUES ('61', '2018-04-02', '4', '16', '4');
INSERT INTO `room_status` VALUES ('64', '2018-04-02', '1', '16', '4');
INSERT INTO `room_status` VALUES ('65', '2018-04-02', '1', '15', '4');
INSERT INTO `room_status` VALUES ('66', '2018-04-02', '5', '17', '4');
INSERT INTO `room_status` VALUES ('67', '2018-04-02', '6', '17', '4');
INSERT INTO `room_status` VALUES ('68', '2018-04-02', '2', '17', '4');
INSERT INTO `room_status` VALUES ('69', '2018-04-02', '3', '17', '4');
INSERT INTO `room_status` VALUES ('70', '2018-04-03', '1', '11', '1');
INSERT INTO `room_status` VALUES ('71', '2018-04-03', '1', '12', '1');
INSERT INTO `room_status` VALUES ('72', '2018-04-03', '1', '13', '1');
INSERT INTO `room_status` VALUES ('73', '2018-04-03', '3', '10', '1');
INSERT INTO `room_status` VALUES ('74', '2018-04-03', '3', '11', '1');
INSERT INTO `room_status` VALUES ('75', '2018-04-03', '3', '12', '1');
INSERT INTO `room_status` VALUES ('76', '2018-04-03', '3', '13', '1');
INSERT INTO `room_status` VALUES ('77', '2018-04-03', '3', '14', '1');
INSERT INTO `room_status` VALUES ('78', '2018-04-03', '2', '12', '1');
INSERT INTO `room_status` VALUES ('79', '2018-04-03', '4', '12', '1');
INSERT INTO `room_status` VALUES ('80', '2018-04-03', '5', '12', '1');
INSERT INTO `room_status` VALUES ('81', '2018-04-03', '6', '12', '1');
INSERT INTO `room_status` VALUES ('82', '2018-04-03', '7', '12', '1');
INSERT INTO `room_status` VALUES ('83', '2018-04-03', '8', '12', '1');

-- ----------------------------
-- Table structure for `times`
-- ----------------------------
DROP TABLE IF EXISTS `times`;
CREATE TABLE `times` (
  `id` int(11) NOT NULL,
  `node` time NOT NULL COMMENT '节点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of times
-- ----------------------------
INSERT INTO `times` VALUES ('8', '08:00:00');
INSERT INTO `times` VALUES ('9', '09:00:00');
INSERT INTO `times` VALUES ('10', '10:00:00');
INSERT INTO `times` VALUES ('11', '11:00:00');
INSERT INTO `times` VALUES ('12', '12:00:00');
INSERT INTO `times` VALUES ('13', '13:00:00');
INSERT INTO `times` VALUES ('14', '14:00:00');
INSERT INTO `times` VALUES ('15', '15:00:00');
INSERT INTO `times` VALUES ('16', '16:00:00');
INSERT INTO `times` VALUES ('17', '17:00:00');
INSERT INTO `times` VALUES ('18', '18:00:00');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `password` char(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'boss', 'boss');
INSERT INTO `user` VALUES ('2', '刘备', '111');
INSERT INTO `user` VALUES ('3', '张飞', '111');
INSERT INTO `user` VALUES ('4', '关羽', '111');
INSERT INTO `user` VALUES ('5', '曹操', '111');
INSERT INTO `user` VALUES ('6', '孙权', '111');
