/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lims2018bdb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-01-10 20:54:32
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `thing_type`
-- ----------------------------
DROP TABLE IF EXISTS `thing_type`;
CREATE TABLE `thing_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `related_person_title_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `up_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_gdcrc8efclj9bf72ek4grj09u` (`name`),
  KEY `FKk1u1o8xde5yyue9mbsuhjthnv` (`related_person_title_id`),
  KEY `FKpnengadsd69u0k59x286mr04` (`up_type_id`),
  CONSTRAINT `FKk1u1o8xde5yyue9mbsuhjthnv` FOREIGN KEY (`related_person_title_id`) REFERENCES `person_title` (`id`),
  CONSTRAINT `FKpnengadsd69u0k59x286mr04` FOREIGN KEY (`up_type_id`) REFERENCES `thing_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thing_type
-- ----------------------------
INSERT INTO `thing_type` VALUES ('1', '0', null, '全部任务', null);
INSERT INTO `thing_type` VALUES ('2', '0', null, '科研项目', '1');
INSERT INTO `thing_type` VALUES ('3', '0', null, '教学任务', '1');
