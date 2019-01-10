/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lims2018bdb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-01-10 20:57:27
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `person_title`
-- ----------------------------
DROP TABLE IF EXISTS `person_title`;
CREATE TABLE `person_title` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `related_thing_type_id` bigint(20) DEFAULT NULL,
  `up_title_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1so069qcrsvi8y4rqfwh0kdhu` (`name`),
  KEY `FKcte2i2blt1eqcr5mf1rhevoka` (`related_thing_type_id`),
  KEY `FKi6shdjfd8s0hk2fcmo37y9ou9` (`up_title_id`),
  CONSTRAINT `FKcte2i2blt1eqcr5mf1rhevoka` FOREIGN KEY (`related_thing_type_id`) REFERENCES `thing_type` (`id`),
  CONSTRAINT `FKi6shdjfd8s0hk2fcmo37y9ou9` FOREIGN KEY (`up_title_id`) REFERENCES `person_title` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person_title
-- ----------------------------
INSERT INTO `person_title` VALUES ('1', '0', null, null, '教师');
INSERT INTO `person_title` VALUES ('2', '0', null, null, '学生');
INSERT INTO `person_title` VALUES ('3', '0', null, '1', '教授');
INSERT INTO `person_title` VALUES ('4', '0', null, '2', '研究生');
INSERT INTO `person_title` VALUES ('5', '0', null, '2', '本科生');
INSERT INTO `person_title` VALUES ('6', '0', null, '4', '博士');
INSERT INTO `person_title` VALUES ('7', '0', null, '4', '硕士');
INSERT INTO `person_title` VALUES ('8', '1', '3', '5', '本科');
