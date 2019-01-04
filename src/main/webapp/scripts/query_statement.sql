/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lims2018bdb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-01-04 09:40:03
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `query_statement`
-- ----------------------------
DROP TABLE IF EXISTS `query_statement`;
CREATE TABLE `query_statement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `hql` varchar(255) DEFAULT NULL,
  `key_string` varchar(255) NOT NULL,
  `view_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_iejb2adhrl11w1nanxv8r9hql` (`key_string`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of query_statement
-- ----------------------------
INSERT INTO `query_statement` VALUES ('1', '2', 'select count(*) from Teacher teacher', 'operation4Person.count.teacher', null);
INSERT INTO `query_statement` VALUES ('2', '1', 'from Teacher teacher', 'operation4Person.list.teacher', 'listTeacher');
INSERT INTO `query_statement` VALUES ('3', '1', 'from Student student', 'operation4Person.list.student', 'listStudent');
INSERT INTO `query_statement` VALUES ('4', '1', 'select count(*) from Student student', 'operation4Person.count.student', null);
INSERT INTO `query_statement` VALUES ('5', '2', 'from Project project', 'operation4Thing.list.科研', 'listProject');
INSERT INTO `query_statement` VALUES ('6', '1', 'select count(*) from Project project', 'operation4Thing.count.科研', null);
INSERT INTO `query_statement` VALUES ('7', '2', 'from Course course', 'operation4Thing.list.教学', 'listCourse');
INSERT INTO `query_statement` VALUES ('8', '2', 'select count(*) from Course course', 'operation4Thing.count.教学', null);
INSERT INTO `query_statement` VALUES ('9', '1', 'from Teacher teacher', 'operation4Person.list.教师', 'listTeacher');
INSERT INTO `query_statement` VALUES ('10', '1', 'select count(*) from Teacher teacher', 'operation4Person.count.教师', null);
INSERT INTO `query_statement` VALUES ('11', '1', 'from Major major', 'operation4Person.list.专业', 'listMajor');
INSERT INTO `query_statement` VALUES ('12', '1', 'select count(*) from Major major', 'operation4Person.count.专业', null);
INSERT INTO `query_statement` VALUES ('13', '1', 'from Student student', 'operation4Person.list.学生', 'listStudent');
INSERT INTO `query_statement` VALUES ('14', '1', 'select count(*) from Student student', 'operation4Person.count.学生', null);
