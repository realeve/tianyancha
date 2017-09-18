/*
Navicat MySQL Data Transfer

Source Server         : Mysql_local
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : tianyancha

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-09-18 23:42:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for regtimeIndex
-- ----------------------------
DROP TABLE IF EXISTS `regtimeIndex`;
CREATE TABLE `regtimeIndex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of regtimeIndex
-- ----------------------------
INSERT INTO `regtimeIndex` VALUES ('1', '<1', 'oe01');
INSERT INTO `regtimeIndex` VALUES ('2', '1-5', 'oe015');
INSERT INTO `regtimeIndex` VALUES ('3', '5-10', 'oe510');
INSERT INTO `regtimeIndex` VALUES ('4', '10-15', 'oe1015');
INSERT INTO `regtimeIndex` VALUES ('5', '>15', 'oe15');
