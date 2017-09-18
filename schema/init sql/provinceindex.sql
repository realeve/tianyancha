SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `provinceindex`;
CREATE TABLE `provinceindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='省份列表_省份页主页面';