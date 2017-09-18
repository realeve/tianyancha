/*
Navicat MySQL Data Transfer

Source Server         : Mysql_local
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : tianyancha

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-09-19 03:02:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for regtimeindex
-- ----------------------------
DROP TABLE IF EXISTS `regtimeindex`;
CREATE TABLE `regtimeindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of regtimeindex
-- ----------------------------
INSERT INTO `regtimeindex` VALUES ('1', '<1', 'e01');
INSERT INTO `regtimeindex` VALUES ('2', '1-5', 'e015');
INSERT INTO `regtimeindex` VALUES ('3', '5-10', 'e510');
INSERT INTO `regtimeindex` VALUES ('4', '10-15', 'e1015');
INSERT INTO `regtimeindex` VALUES ('5', '>15', 'e15');
