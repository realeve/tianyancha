/*
Navicat MySQL Data Transfer

Source Server         : Mysql_local
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : tianyancha

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-09-18 23:36:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for industryindex
-- ----------------------------
DROP TABLE IF EXISTS `industryindex`;
CREATE TABLE `industryindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main` varchar(255) DEFAULT NULL,
  `sub` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `ids_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='行业列表';
