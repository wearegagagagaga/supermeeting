/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50638
Source Host           : localhost:3306
Source Database       : boardroom

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-04-02 19:48:13
*/

SET FOREIGN_KEY_CHECKS=0;

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
