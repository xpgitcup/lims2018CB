/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lims2018bdb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-01-03 11:10:56
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `person_title`
-- ----------------------------
DROP TABLE IF EXISTS `person_title`;
CREATE TABLE `person_title` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `up_title_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1so069qcrsvi8y4rqfwh0kdhu` (`name`),
  KEY `FKi6shdjfd8s0hk2fcmo37y9ou9` (`up_title_id`),
  CONSTRAINT `FKi6shdjfd8s0hk2fcmo37y9ou9` FOREIGN KEY (`up_title_id`) REFERENCES `person_title` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person_title
-- ----------------------------
INSERT INTO `person_title` VALUES ('1', '0', null, '教师');
INSERT INTO `person_title` VALUES ('2', '0', null, '学生');
INSERT INTO `person_title` VALUES ('3', '0', '1', '教授');
INSERT INTO `person_title` VALUES ('4', '0', '1', '副教授');
INSERT INTO `person_title` VALUES ('5', '0', '1', '讲师');
INSERT INTO `person_title` VALUES ('6', '0', '1', '助教');
INSERT INTO `person_title` VALUES ('7', '0', '1', '教授级高工');
INSERT INTO `person_title` VALUES ('8', '0', '1', '高工');
INSERT INTO `person_title` VALUES ('9', '0', '1', '工程师');
INSERT INTO `person_title` VALUES ('10', '0', '1', '助理工程师');
INSERT INTO `person_title` VALUES ('11', '0', '1', '技术员');
INSERT INTO `person_title` VALUES ('12', '1', '2', '研究生');
INSERT INTO `person_title` VALUES ('13', '0', '2', '本科生');
INSERT INTO `person_title` VALUES ('14', '0', '12', '博士');
INSERT INTO `person_title` VALUES ('15', '0', '12', '硕士');
INSERT INTO `person_title` VALUES ('16', '0', '13', '本科');
