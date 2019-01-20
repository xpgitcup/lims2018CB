/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lims2018bdb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-01-20 18:30:44
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `query_statement`
-- ----------------------------
DROP TABLE IF EXISTS `query_statement`;
CREATE TABLE `query_statement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `params_list` varchar(255) DEFAULT NULL,
  `hql` varchar(255) DEFAULT NULL,
  `key_string` varchar(255) NOT NULL,
  `view_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_iejb2adhrl11w1nanxv8r9hql` (`key_string`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of query_statement
-- ----------------------------
INSERT INTO `query_statement` VALUES ('1', '1', null, 'select count(*) from Teacher teacher', 'operation4Person.count.教师', null);
INSERT INTO `query_statement` VALUES ('2', '2', null, 'from Teacher teacher', 'operation4Person.list.教师', 'listTeacher');
INSERT INTO `query_statement` VALUES ('3', '2', null, 'from Student student', 'operation4Person.list.学生', 'listStudent');
INSERT INTO `query_statement` VALUES ('4', '1', null, 'select count(*) from Student student', 'operation4Person.count.学生', null);
INSERT INTO `query_statement` VALUES ('5', '1', null, 'from Major major', 'operation4Person.list.专业', 'listMajor');
INSERT INTO `query_statement` VALUES ('6', '1', null, 'select count(*) from Major major', 'operation4Person.count.专业', null);
INSERT INTO `query_statement` VALUES ('7', '2', null, 'from Project project', 'operation4Thing.list.科研', 'listProject');
INSERT INTO `query_statement` VALUES ('8', '1', null, 'select count(*) from Project project', 'operation4Thing.count.科研', null);
INSERT INTO `query_statement` VALUES ('9', '1', null, 'from Course course', 'operation4Thing.list.教学', 'listCourse');
INSERT INTO `query_statement` VALUES ('10', '1', null, 'select count(*) from Course course', 'operation4Thing.count.教学', null);
INSERT INTO `query_statement` VALUES ('11', '3', 'list', 'select count(*) from Thing thing where thing.thingType in :list', 'operation4TeamManageA.count.可选题目', null);
INSERT INTO `query_statement` VALUES ('12', '1', 'list', 'from Thing thing where thing.thingType in :list', 'operation4TeamManageA.list.可选题目', 'listThing');
INSERT INTO `query_statement` VALUES ('13', '1', null, 'from QueryStatement queryStatement', 'operation4QueryStatement.list.查询配置', 'listQueryStatement');
INSERT INTO `query_statement` VALUES ('14', '1', null, 'select count(*) from QueryStatement queryStatement', 'operation4QueryStatement.count.查询配置', null);
