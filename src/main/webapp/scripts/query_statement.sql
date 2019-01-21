/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lims2018bdb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-01-21 18:24:02
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of query_statement
-- ----------------------------
INSERT INTO `query_statement` VALUES ('1', '1', null, 'from QueryStatement queryStatement', 'list.operation4QueryStatement.查询配置', 'listQueryStatement');
INSERT INTO `query_statement` VALUES ('2', '1', null, 'select count(*) from QueryStatement queryStatement', 'count.operation4QueryStatement.查询配置', null);
INSERT INTO `query_statement` VALUES ('3', '1', null, 'from Teacher teacher', 'list.operation4Person.教师', 'listTeacher');
INSERT INTO `query_statement` VALUES ('4', '1', null, 'select count(*) from Teacher teacher', 'count.operation4Person.教师', null);
INSERT INTO `query_statement` VALUES ('5', '1', null, 'from Project project', 'list.operation4Thing.科研', 'listProject');
INSERT INTO `query_statement` VALUES ('6', '1', null, 'select count(*) from Project project', 'count.operation4Thing.科研', null);
INSERT INTO `query_statement` VALUES ('7', '1', null, 'from Course course', 'list.operation4Thing.教学', 'listCourse');
INSERT INTO `query_statement` VALUES ('8', '1', null, 'select count(*) from Course course', 'count.operation4Thing.教学', null);
INSERT INTO `query_statement` VALUES ('9', '1', null, 'from Student student', 'list.operation4Person.学生', 'listStudent');
INSERT INTO `query_statement` VALUES ('10', '1', null, 'select count(*) from Student student', 'count.operation4Person.学生', null);
INSERT INTO `query_statement` VALUES ('11', '1', null, 'from Major major', 'list.operation4Person.专业', 'listMajor');
INSERT INTO `query_statement` VALUES ('12', '1', null, 'select count(*) from Major major', 'count.operation4Person.专业', null);
INSERT INTO `query_statement` VALUES ('13', '1', 'list', 'from Thing thing where thing.thingType in :list', 'list.operation4TeamManageA.可选题目.list', 'listThing');
INSERT INTO `query_statement` VALUES ('14', '1', 'list', 'select count(*) from Thing thing where thing.thingType in :list', 'count.operation4TeamManageA.可选题目.list', null);
INSERT INTO `query_statement` VALUES ('15', '1', 'currentThing', 'select count(*) from Team team where team.thing=:currentThing', 'count.operation4TeamManageA.currentThing.相关团队.list', null);
INSERT INTO `query_statement` VALUES ('16', '1', 'currentThing', 'from Team team where team.thing=:currentThing', 'list.operation4TeamManageA.currentThing.相关团队.list', 'listTeam');
INSERT INTO `query_statement` VALUES ('17', '1', 'currentTeam', 'from Team team where team=:currentTeam', 'list.operation4TeamManageA.currentTeam.相关队员.list', 'listMember');
INSERT INTO `query_statement` VALUES ('18', '2', 'currentTeam', 'select count(*) from Team  team where team=:currentTeam', 'count.operation4TeamManageA.currentTeam.相关队员.list', null);
