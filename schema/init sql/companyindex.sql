/*
Navicat MySQL Data Transfer

Source Server         : Mysql_local
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : tianyancha

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-09-19 02:01:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for companyindex
-- ----------------------------
DROP TABLE IF EXISTS `companyindex`;
CREATE TABLE `companyindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `company_status` varchar(255) DEFAULT NULL,
  `leader` varchar(255) DEFAULT NULL,
  `reg_date` varchar(255) DEFAULT NULL,
  `reg_captial` varchar(255) DEFAULT NULL,
  `score` int(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` int(255) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company_name` (`company_name`,`province_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业名录列表';
