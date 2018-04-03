/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50638
Source Host           : localhost:3306
Source Database       : boardroom

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-04-02 19:48:07
*/

SET FOREIGN_KEY_CHECKS=0;

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
