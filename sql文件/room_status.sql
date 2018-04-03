/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50638
Source Host           : localhost:3306
Source Database       : boardroom

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-04-02 19:48:01
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

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
