/*
Navicat MySQL Data Transfer

Source Server         : Mysql_local
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : tianyancha

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-09-18 23:42:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for capitalindex
-- ----------------------------
DROP TABLE IF EXISTS `capitalindex`;
CREATE TABLE `capitalindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of capitalindex
-- ----------------------------
INSERT INTO `capitalindex` VALUES ('1', '0-100', 'or0100');
INSERT INTO `capitalindex` VALUES ('2', '100-200', 'or100200');
INSERT INTO `capitalindex` VALUES ('3', '200-500', 'or200500');
INSERT INTO `capitalindex` VALUES ('4', '500-1000', 'or5001000');
INSERT INTO `capitalindex` VALUES ('5', '>1000', 'or1000');
