/*
Navicat MySQL Data Transfer

Source Server         : Mysql_local
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : tianyancha

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-09-19 03:01:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for companystatus
-- ----------------------------
DROP TABLE IF EXISTS `companystatus`;
CREATE TABLE `companystatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of companystatus
-- ----------------------------
INSERT INTO `companystatus` VALUES ('1', '在业', 's1');
INSERT INTO `companystatus` VALUES ('2', '存续', 's2');
INSERT INTO `companystatus` VALUES ('3', '吊销', 's3');
INSERT INTO `companystatus` VALUES ('4', '注销', 's4');
INSERT INTO `companystatus` VALUES ('5', '迁出', 's5');
