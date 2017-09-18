/*
Navicat MySQL Data Transfer

Source Server         : Mysql_local
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : tianyancha

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-09-19 03:02:02
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

-- ----------------------------
-- Records of industryindex
-- ----------------------------
INSERT INTO `industryindex` VALUES ('1', '电力、热力、燃气及水生产和供应业', '电力、热力、燃气及水生产和供应业', 'https://www.tianyancha.com/search/ocD', 'ocD');
INSERT INTO `industryindex` VALUES ('2', '电力、热力、燃气及水生产和供应业', '燃气生产和供应业', 'https://www.tianyancha.com/search/oc45', 'oc45');
INSERT INTO `industryindex` VALUES ('3', '电力、热力、燃气及水生产和供应业', '电力、热力生产和供应业', 'https://www.tianyancha.com/search/oc44', 'oc44');
INSERT INTO `industryindex` VALUES ('4', '电力、热力、燃气及水生产和供应业', '水的生产和供应业', 'https://www.tianyancha.com/search/oc46', 'oc46');
INSERT INTO `industryindex` VALUES ('5', '建筑业', '建筑业', 'https://www.tianyancha.com/search/ocE', 'ocE');
INSERT INTO `industryindex` VALUES ('6', '建筑业', '建筑安装业', 'https://www.tianyancha.com/search/oc49', 'oc49');
INSERT INTO `industryindex` VALUES ('7', '建筑业', '土木工程建筑业', 'https://www.tianyancha.com/search/oc48', 'oc48');
INSERT INTO `industryindex` VALUES ('8', '建筑业', '房屋建筑业', 'https://www.tianyancha.com/search/oc47', 'oc47');
INSERT INTO `industryindex` VALUES ('9', '建筑业', '建筑装饰和其他建筑业', 'https://www.tianyancha.com/search/oc50', 'oc50');
INSERT INTO `industryindex` VALUES ('10', '批发和零售业', '批发和零售业', 'https://www.tianyancha.com/search/ocF', 'ocF');
INSERT INTO `industryindex` VALUES ('11', '批发和零售业', '批发业', 'https://www.tianyancha.com/search/oc51', 'oc51');
INSERT INTO `industryindex` VALUES ('12', '批发和零售业', '零售业', 'https://www.tianyancha.com/search/oc52', 'oc52');
INSERT INTO `industryindex` VALUES ('13', '交通运输、仓储和邮政业', '交通运输、仓储和邮政业', 'https://www.tianyancha.com/search/ocG', 'ocG');
INSERT INTO `industryindex` VALUES ('14', '交通运输、仓储和邮政业', '仓储业', 'https://www.tianyancha.com/search/oc59', 'oc59');
INSERT INTO `industryindex` VALUES ('15', '交通运输、仓储和邮政业', '装卸搬运和运输代理业', 'https://www.tianyancha.com/search/oc58', 'oc58');
INSERT INTO `industryindex` VALUES ('16', '交通运输、仓储和邮政业', '管道运输业', 'https://www.tianyancha.com/search/oc57', 'oc57');
INSERT INTO `industryindex` VALUES ('17', '交通运输、仓储和邮政业', '航空运输业', 'https://www.tianyancha.com/search/oc56', 'oc56');
INSERT INTO `industryindex` VALUES ('18', '交通运输、仓储和邮政业', '水上运输业', 'https://www.tianyancha.com/search/oc55', 'oc55');
INSERT INTO `industryindex` VALUES ('19', '交通运输、仓储和邮政业', '邮政业', 'https://www.tianyancha.com/search/oc60', 'oc60');
INSERT INTO `industryindex` VALUES ('20', '交通运输、仓储和邮政业', '铁路运输业', 'https://www.tianyancha.com/search/oc53', 'oc53');
INSERT INTO `industryindex` VALUES ('21', '交通运输、仓储和邮政业', '道路运输业', 'https://www.tianyancha.com/search/oc54', 'oc54');
INSERT INTO `industryindex` VALUES ('22', '农、林、牧、渔业', '农、林、牧、渔业', 'https://www.tianyancha.com/search/ocA', 'ocA');
INSERT INTO `industryindex` VALUES ('23', '农、林、牧、渔业', '渔业', 'https://www.tianyancha.com/search/oc04', 'oc04');
INSERT INTO `industryindex` VALUES ('24', '农、林、牧、渔业', '农、林、牧、渔服务业', 'https://www.tianyancha.com/search/oc05', 'oc05');
INSERT INTO `industryindex` VALUES ('25', '农、林、牧、渔业', '农业', 'https://www.tianyancha.com/search/oc01', 'oc01');
INSERT INTO `industryindex` VALUES ('26', '农、林、牧、渔业', '林业', 'https://www.tianyancha.com/search/oc02', 'oc02');
INSERT INTO `industryindex` VALUES ('27', '农、林、牧、渔业', '畜牧业', 'https://www.tianyancha.com/search/oc03', 'oc03');
INSERT INTO `industryindex` VALUES ('28', '制造业', '制造业', 'https://www.tianyancha.com/search/ocC', 'ocC');
INSERT INTO `industryindex` VALUES ('29', '制造业', '专用设备制造业', 'https://www.tianyancha.com/search/oc35', 'oc35');
INSERT INTO `industryindex` VALUES ('30', '制造业', '汽车制造业', 'https://www.tianyancha.com/search/oc36', 'oc36');
INSERT INTO `industryindex` VALUES ('31', '制造业', '金属制品业', 'https://www.tianyancha.com/search/oc33', 'oc33');
INSERT INTO `industryindex` VALUES ('32', '制造业', '通用设备制造业', 'https://www.tianyancha.com/search/oc34', 'oc34');
INSERT INTO `industryindex` VALUES ('33', '制造业', '计算机、通信和其他电子设备制造业', 'https://www.tianyancha.com/search/oc39', 'oc39');
INSERT INTO `industryindex` VALUES ('34', '制造业', '铁路、船舶、航空航天和其他运输设备制造业', 'https://www.tianyancha.com/search/oc37', 'oc37');
INSERT INTO `industryindex` VALUES ('35', '制造业', '电气机械和器材制造业', 'https://www.tianyancha.com/search/oc38', 'oc38');
INSERT INTO `industryindex` VALUES ('36', '制造业', '金属制品、机械和设备修理业', 'https://www.tianyancha.com/search/oc43', 'oc43');
INSERT INTO `industryindex` VALUES ('37', '制造业', '废弃资源综合利用业', 'https://www.tianyancha.com/search/oc42', 'oc42');
INSERT INTO `industryindex` VALUES ('38', '制造业', '其他制造业', 'https://www.tianyancha.com/search/oc41', 'oc41');
INSERT INTO `industryindex` VALUES ('39', '制造业', '仪器仪表制造业', 'https://www.tianyancha.com/search/oc40', 'oc40');
INSERT INTO `industryindex` VALUES ('40', '制造业', '造纸和纸制品业', 'https://www.tianyancha.com/search/oc22', 'oc22');
INSERT INTO `industryindex` VALUES ('41', '制造业', '印刷和记录媒介复制业', 'https://www.tianyancha.com/search/oc23', 'oc23');
INSERT INTO `industryindex` VALUES ('42', '制造业', '文教、工美、体育和娱乐用品制造业', 'https://www.tianyancha.com/search/oc24', 'oc24');
INSERT INTO `industryindex` VALUES ('43', '制造业', '石油加工、炼焦和核燃料加工业', 'https://www.tianyancha.com/search/oc25', 'oc25');
INSERT INTO `industryindex` VALUES ('44', '制造业', '化学原料和化学制品制造业', 'https://www.tianyancha.com/search/oc26', 'oc26');
INSERT INTO `industryindex` VALUES ('45', '制造业', '医药制造业', 'https://www.tianyancha.com/search/oc27', 'oc27');
INSERT INTO `industryindex` VALUES ('46', '制造业', '化学纤维制造业', 'https://www.tianyancha.com/search/oc28', 'oc28');
INSERT INTO `industryindex` VALUES ('47', '制造业', '橡胶和塑料制品业', 'https://www.tianyancha.com/search/oc29', 'oc29');
INSERT INTO `industryindex` VALUES ('48', '制造业', '非金属矿物制品业', 'https://www.tianyancha.com/search/oc30', 'oc30');
INSERT INTO `industryindex` VALUES ('49', '制造业', '有色金属冶炼和压延加工业', 'https://www.tianyancha.com/search/oc32', 'oc32');
INSERT INTO `industryindex` VALUES ('50', '制造业', '黑色金属冶炼和压延加工业', 'https://www.tianyancha.com/search/oc31', 'oc31');
INSERT INTO `industryindex` VALUES ('51', '制造业', '皮革、毛皮、羽毛及其制品和制鞋业', 'https://www.tianyancha.com/search/oc19', 'oc19');
INSERT INTO `industryindex` VALUES ('52', '制造业', '纺织业', 'https://www.tianyancha.com/search/oc17', 'oc17');
INSERT INTO `industryindex` VALUES ('53', '制造业', '纺织服装、服饰业', 'https://www.tianyancha.com/search/oc18', 'oc18');
INSERT INTO `industryindex` VALUES ('54', '制造业', '酒、饮料和精制茶制造业', 'https://www.tianyancha.com/search/oc15', 'oc15');
INSERT INTO `industryindex` VALUES ('55', '制造业', '烟草制品业', 'https://www.tianyancha.com/search/oc16', 'oc16');
INSERT INTO `industryindex` VALUES ('56', '制造业', '农副食品加工业', 'https://www.tianyancha.com/search/oc13', 'oc13');
INSERT INTO `industryindex` VALUES ('57', '制造业', '食品制造业', 'https://www.tianyancha.com/search/oc14', 'oc14');
INSERT INTO `industryindex` VALUES ('58', '制造业', '家具制造业', 'https://www.tianyancha.com/search/oc21', 'oc21');
INSERT INTO `industryindex` VALUES ('59', '制造业', '木材加工和木、竹、藤、棕、草制品业', 'https://www.tianyancha.com/search/oc20', 'oc20');
INSERT INTO `industryindex` VALUES ('60', '租赁和商务服务业', '租赁和商务服务业', 'https://www.tianyancha.com/search/ocL', 'ocL');
INSERT INTO `industryindex` VALUES ('61', '租赁和商务服务业', '租赁业', 'https://www.tianyancha.com/search/oc71', 'oc71');
INSERT INTO `industryindex` VALUES ('62', '租赁和商务服务业', '商务服务业', 'https://www.tianyancha.com/search/oc72', 'oc72');
INSERT INTO `industryindex` VALUES ('63', '科学研究和技术服务业', '科学研究和技术服务业', 'https://www.tianyancha.com/search/ocM', 'ocM');
INSERT INTO `industryindex` VALUES ('64', '科学研究和技术服务业', '研究和试验发展', 'https://www.tianyancha.com/search/oc73', 'oc73');
INSERT INTO `industryindex` VALUES ('65', '科学研究和技术服务业', '专业技术服务业', 'https://www.tianyancha.com/search/oc74', 'oc74');
INSERT INTO `industryindex` VALUES ('66', '科学研究和技术服务业', '科技推广和应用服务业', 'https://www.tianyancha.com/search/oc75', 'oc75');
INSERT INTO `industryindex` VALUES ('67', '水利、环境和公共设施管理业', '水利、环境和公共设施管理业', 'https://www.tianyancha.com/search/ocN', 'ocN');
INSERT INTO `industryindex` VALUES ('68', '水利、环境和公共设施管理业', '公共设施管理业', 'https://www.tianyancha.com/search/oc78', 'oc78');
INSERT INTO `industryindex` VALUES ('69', '水利、环境和公共设施管理业', '生态保护和环境治理业', 'https://www.tianyancha.com/search/oc77', 'oc77');
INSERT INTO `industryindex` VALUES ('70', '水利、环境和公共设施管理业', '水利管理业', 'https://www.tianyancha.com/search/oc76', 'oc76');
INSERT INTO `industryindex` VALUES ('71', '居民服务、修理和其他服务业', '居民服务、修理和其他服务业', 'https://www.tianyancha.com/search/ocO', 'ocO');
INSERT INTO `industryindex` VALUES ('72', '居民服务、修理和其他服务业', '居民服务业', 'https://www.tianyancha.com/search/oc79', 'oc79');
INSERT INTO `industryindex` VALUES ('73', '居民服务、修理和其他服务业', '机动车、电子产品和日用产品修理业', 'https://www.tianyancha.com/search/oc80', 'oc80');
INSERT INTO `industryindex` VALUES ('74', '居民服务、修理和其他服务业', '其他服务业', 'https://www.tianyancha.com/search/oc81', 'oc81');
INSERT INTO `industryindex` VALUES ('75', '住宿和餐饮业', '住宿和餐饮业', 'https://www.tianyancha.com/search/ocH', 'ocH');
INSERT INTO `industryindex` VALUES ('76', '住宿和餐饮业', '餐饮业', 'https://www.tianyancha.com/search/oc62', 'oc62');
INSERT INTO `industryindex` VALUES ('77', '住宿和餐饮业', '住宿业', 'https://www.tianyancha.com/search/oc61', 'oc61');
INSERT INTO `industryindex` VALUES ('78', '信息传输、软件和信息技术服务业', '信息传输、软件和信息技术服务业', 'https://www.tianyancha.com/search/ocI', 'ocI');
INSERT INTO `industryindex` VALUES ('79', '信息传输、软件和信息技术服务业', '互联网和相关服务', 'https://www.tianyancha.com/search/oc64', 'oc64');
INSERT INTO `industryindex` VALUES ('80', '信息传输、软件和信息技术服务业', '软件和信息技术服务业', 'https://www.tianyancha.com/search/oc65', 'oc65');
INSERT INTO `industryindex` VALUES ('81', '信息传输、软件和信息技术服务业', '电信、广播电视和卫星传输服务', 'https://www.tianyancha.com/search/oc63', 'oc63');
INSERT INTO `industryindex` VALUES ('82', '金融业', '金融业', 'https://www.tianyancha.com/search/ocJ', 'ocJ');
INSERT INTO `industryindex` VALUES ('83', '金融业', '资本市场服务', 'https://www.tianyancha.com/search/oc67', 'oc67');
INSERT INTO `industryindex` VALUES ('84', '金融业', '货币金融服务', 'https://www.tianyancha.com/search/oc66', 'oc66');
INSERT INTO `industryindex` VALUES ('85', '金融业', '其他金融业', 'https://www.tianyancha.com/search/oc69', 'oc69');
INSERT INTO `industryindex` VALUES ('86', '金融业', '保险业', 'https://www.tianyancha.com/search/oc68', 'oc68');
INSERT INTO `industryindex` VALUES ('87', '采矿业', '采矿业', 'https://www.tianyancha.com/search/ocB', 'ocB');
INSERT INTO `industryindex` VALUES ('88', '采矿业', '开采辅助活动', 'https://www.tianyancha.com/search/oc11', 'oc11');
INSERT INTO `industryindex` VALUES ('89', '采矿业', '其他采矿业', 'https://www.tianyancha.com/search/oc12', 'oc12');
INSERT INTO `industryindex` VALUES ('90', '采矿业', '黑色金属矿采选业', 'https://www.tianyancha.com/search/oc08', 'oc08');
INSERT INTO `industryindex` VALUES ('91', '采矿业', '有色金属矿采选业', 'https://www.tianyancha.com/search/oc09', 'oc09');
INSERT INTO `industryindex` VALUES ('92', '采矿业', '煤炭开采和洗选业', 'https://www.tianyancha.com/search/oc06', 'oc06');
INSERT INTO `industryindex` VALUES ('93', '采矿业', '石油和天然气开采业', 'https://www.tianyancha.com/search/oc07', 'oc07');
INSERT INTO `industryindex` VALUES ('94', '采矿业', '非金属矿采选业', 'https://www.tianyancha.com/search/oc10', 'oc10');
INSERT INTO `industryindex` VALUES ('95', '房地产业', '房地产业', 'https://www.tianyancha.com/search/ocK', 'ocK');
INSERT INTO `industryindex` VALUES ('96', '房地产业', '房地产业', 'https://www.tianyancha.com/search/oc70', 'oc70');
INSERT INTO `industryindex` VALUES ('97', '国际组织', '国际组织', 'https://www.tianyancha.com/search/ocT', 'ocT');
INSERT INTO `industryindex` VALUES ('98', '国际组织', '国际组织', 'https://www.tianyancha.com/search/oc96', 'oc96');
INSERT INTO `industryindex` VALUES ('99', '卫生和社会工作', '卫生和社会工作', 'https://www.tianyancha.com/search/ocQ', 'ocQ');
INSERT INTO `industryindex` VALUES ('100', '卫生和社会工作', '卫生', 'https://www.tianyancha.com/search/oc83', 'oc83');
INSERT INTO `industryindex` VALUES ('101', '卫生和社会工作', '社会工作', 'https://www.tianyancha.com/search/oc84', 'oc84');
INSERT INTO `industryindex` VALUES ('102', '教育', '教育', 'https://www.tianyancha.com/search/ocP', 'ocP');
INSERT INTO `industryindex` VALUES ('103', '教育', '教育', 'https://www.tianyancha.com/search/oc82', 'oc82');
INSERT INTO `industryindex` VALUES ('104', '公共管理、社会保障和社会组织', '公共管理、社会保障和社会组织', 'https://www.tianyancha.com/search/ocS', 'ocS');
INSERT INTO `industryindex` VALUES ('105', '公共管理、社会保障和社会组织', '基层群众自治组织', 'https://www.tianyancha.com/search/oc95', 'oc95');
INSERT INTO `industryindex` VALUES ('106', '公共管理、社会保障和社会组织', '群众团体、社会团体和其他成员组织', 'https://www.tianyancha.com/search/oc94', 'oc94');
INSERT INTO `industryindex` VALUES ('107', '公共管理、社会保障和社会组织', '社会保障', 'https://www.tianyancha.com/search/oc93', 'oc93');
INSERT INTO `industryindex` VALUES ('108', '公共管理、社会保障和社会组织', '人民政协、民主党派', 'https://www.tianyancha.com/search/oc92', 'oc92');
INSERT INTO `industryindex` VALUES ('109', '公共管理、社会保障和社会组织', '国家机构', 'https://www.tianyancha.com/search/oc91', 'oc91');
INSERT INTO `industryindex` VALUES ('110', '公共管理、社会保障和社会组织', '中国共产党机关', 'https://www.tianyancha.com/search/oc90', 'oc90');
INSERT INTO `industryindex` VALUES ('111', '文化、体育和娱乐业', '文化、体育和娱乐业', 'https://www.tianyancha.com/search/ocR', 'ocR');
INSERT INTO `industryindex` VALUES ('112', '文化、体育和娱乐业', '体育', 'https://www.tianyancha.com/search/oc88', 'oc88');
INSERT INTO `industryindex` VALUES ('113', '文化、体育和娱乐业', '娱乐业', 'https://www.tianyancha.com/search/oc89', 'oc89');
INSERT INTO `industryindex` VALUES ('114', '文化、体育和娱乐业', '广播、电视、电影和影视录音制作业', 'https://www.tianyancha.com/search/oc86', 'oc86');
INSERT INTO `industryindex` VALUES ('115', '文化、体育和娱乐业', '文化艺术业', 'https://www.tianyancha.com/search/oc87', 'oc87');
INSERT INTO `industryindex` VALUES ('116', '文化、体育和娱乐业', '新闻和出版业', 'https://www.tianyancha.com/search/oc85', 'oc85');
