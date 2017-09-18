/*
Navicat MySQL Data Transfer

Source Server         : Mysql_local
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : tianyancha

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-09-19 03:01:48
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
INSERT INTO `capitalindex` VALUES ('1', '0-100', 'r0100');
INSERT INTO `capitalindex` VALUES ('2', '100-200', 'r100200');
INSERT INTO `capitalindex` VALUES ('3', '200-500', 'r200500');
INSERT INTO `capitalindex` VALUES ('4', '500-1000', 'r5001000');
INSERT INTO `capitalindex` VALUES ('5', '>1000', 'r1000');
