/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lims2018bdb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-01-06 10:39:24
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `system_user`
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_attribute_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `append_attribute` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_204b9ercidw1baj3s3m9lnr33` (`user_name`),
  KEY `FKaiybevf5q198uok4va3p7b6wb` (`role_attribute_id`),
  CONSTRAINT `FKaiybevf5q198uok4va3p7b6wb` FOREIGN KEY (`role_attribute_id`) REFERENCES `system_attribute` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('1', '0', '641d77dd5271fca28764612a028d9c8e', '1', '李晓平', '');
INSERT INTO `system_user` VALUES ('2', '0', 'ee26fc66b1369c7625333bedafbfcaf6', '1', '宫敬', '');
INSERT INTO `system_user` VALUES ('3', '0', 'f4aa0dd960521e045ae2f20621fb4ee9', '1', '吴海浩', '');
INSERT INTO `system_user` VALUES ('4', '0', '25d55ad283aa400af464c76d713c07ad', '1', '1552', 'Teacher=1552');
INSERT INTO `system_user` VALUES ('5', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2151', 'Teacher=2151');
INSERT INTO `system_user` VALUES ('6', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2152', 'Teacher=2152');
INSERT INTO `system_user` VALUES ('7', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2333', 'Teacher=2333');
INSERT INTO `system_user` VALUES ('8', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2013880073', 'Teacher=2013880073');
INSERT INTO `system_user` VALUES ('9', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2012880012', 'Teacher=2012880012');
INSERT INTO `system_user` VALUES ('10', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2014314014', 'Student=2014314014');
INSERT INTO `system_user` VALUES ('11', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2014314013', 'Student=2014314013');
INSERT INTO `system_user` VALUES ('12', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314019', 'Student=2015314019');
INSERT INTO `system_user` VALUES ('13', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314016', 'Student=2015314016');
INSERT INTO `system_user` VALUES ('14', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314022', 'Student=2015314022');
INSERT INTO `system_user` VALUES ('15', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314023', 'Student=2015314023');
INSERT INTO `system_user` VALUES ('16', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314017', 'Student=2015314017');
INSERT INTO `system_user` VALUES ('17', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015214549', 'Student=2015214549');
INSERT INTO `system_user` VALUES ('18', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015214571', 'Student=2015214571');
INSERT INTO `system_user` VALUES ('19', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015214557', 'Student=2015214557');
INSERT INTO `system_user` VALUES ('20', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016314026', 'Student=2016314026');
INSERT INTO `system_user` VALUES ('21', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016314018', 'Student=2016314018');
INSERT INTO `system_user` VALUES ('22', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016314025', 'Student=2016314025');
INSERT INTO `system_user` VALUES ('23', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016314019', 'Student=2016314019');
INSERT INTO `system_user` VALUES ('24', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016314017', 'Student=2016314017');
INSERT INTO `system_user` VALUES ('25', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214568', 'Student=2016214568');
INSERT INTO `system_user` VALUES ('26', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214090', 'Student=2016214090');
INSERT INTO `system_user` VALUES ('27', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214554', 'Student=2016214554');
INSERT INTO `system_user` VALUES ('28', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214555', 'Student=2016214555');
INSERT INTO `system_user` VALUES ('29', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214536', 'Student=2016214536');
INSERT INTO `system_user` VALUES ('30', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214091', 'Student=2016214091');
INSERT INTO `system_user` VALUES ('31', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214537', 'Student=2016214537');
INSERT INTO `system_user` VALUES ('32', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214541', 'Student=2016214541');
INSERT INTO `system_user` VALUES ('33', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214538', 'Student=2016214538');
INSERT INTO `system_user` VALUES ('34', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214539', 'Student=2016214539');
INSERT INTO `system_user` VALUES ('35', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214086', 'Student=2016214086');
INSERT INTO `system_user` VALUES ('36', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214556', 'Student=2016214556');
INSERT INTO `system_user` VALUES ('37', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214544', 'Student=2016214544');
INSERT INTO `system_user` VALUES ('38', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214543', 'Student=2016214543');
INSERT INTO `system_user` VALUES ('39', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214060', 'Student=2016214060');
INSERT INTO `system_user` VALUES ('40', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214092', 'Student=2016214092');
INSERT INTO `system_user` VALUES ('41', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214076', 'Student=2016214076');
INSERT INTO `system_user` VALUES ('42', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214557', 'Student=2016214557');
INSERT INTO `system_user` VALUES ('43', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214558', 'Student=2016214558');
INSERT INTO `system_user` VALUES ('44', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214057', 'Student=2016214057');
INSERT INTO `system_user` VALUES ('45', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214093', 'Student=2016214093');
INSERT INTO `system_user` VALUES ('46', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214096', 'Student=2016214096');
INSERT INTO `system_user` VALUES ('47', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015214064', 'Student=2015214064');
INSERT INTO `system_user` VALUES ('48', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214063', 'Student=2016214063');
INSERT INTO `system_user` VALUES ('49', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214065', 'Student=2016214065');
INSERT INTO `system_user` VALUES ('50', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2016214560', 'Student=2016214560');
INSERT INTO `system_user` VALUES ('51', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2014011043', 'Student=2014011043');
INSERT INTO `system_user` VALUES ('52', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010667', 'Student=2015010667');
INSERT INTO `system_user` VALUES ('53', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010743', 'Student=2015010743');
INSERT INTO `system_user` VALUES ('54', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010854', 'Student=2015010854');
INSERT INTO `system_user` VALUES ('55', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010855', 'Student=2015010855');
INSERT INTO `system_user` VALUES ('56', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010856', 'Student=2015010856');
INSERT INTO `system_user` VALUES ('57', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010857', 'Student=2015010857');
INSERT INTO `system_user` VALUES ('58', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010858', 'Student=2015010858');
INSERT INTO `system_user` VALUES ('59', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010859', 'Student=2015010859');
INSERT INTO `system_user` VALUES ('60', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010860', 'Student=2015010860');
INSERT INTO `system_user` VALUES ('61', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010861', 'Student=2015010861');
INSERT INTO `system_user` VALUES ('62', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010862', 'Student=2015010862');
INSERT INTO `system_user` VALUES ('63', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010863', 'Student=2015010863');
INSERT INTO `system_user` VALUES ('64', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010864', 'Student=2015010864');
INSERT INTO `system_user` VALUES ('65', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010865', 'Student=2015010865');
INSERT INTO `system_user` VALUES ('66', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010866', 'Student=2015010866');
INSERT INTO `system_user` VALUES ('67', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010867', 'Student=2015010867');
INSERT INTO `system_user` VALUES ('68', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010868', 'Student=2015010868');
INSERT INTO `system_user` VALUES ('69', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010869', 'Student=2015010869');
INSERT INTO `system_user` VALUES ('70', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010870', 'Student=2015010870');
INSERT INTO `system_user` VALUES ('71', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010871', 'Student=2015010871');
INSERT INTO `system_user` VALUES ('72', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010872', 'Student=2015010872');
INSERT INTO `system_user` VALUES ('73', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010873', 'Student=2015010873');
INSERT INTO `system_user` VALUES ('74', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010875', 'Student=2015010875');
INSERT INTO `system_user` VALUES ('75', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010876', 'Student=2015010876');
INSERT INTO `system_user` VALUES ('76', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010877', 'Student=2015010877');
INSERT INTO `system_user` VALUES ('77', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010878', 'Student=2015010878');
INSERT INTO `system_user` VALUES ('78', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010879', 'Student=2015010879');
INSERT INTO `system_user` VALUES ('79', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010880', 'Student=2015010880');
INSERT INTO `system_user` VALUES ('80', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010881', 'Student=2015010881');
INSERT INTO `system_user` VALUES ('81', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010882', 'Student=2015010882');
INSERT INTO `system_user` VALUES ('82', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010883', 'Student=2015010883');
INSERT INTO `system_user` VALUES ('83', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010884', 'Student=2015010884');
INSERT INTO `system_user` VALUES ('84', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010885', 'Student=2015010885');
INSERT INTO `system_user` VALUES ('85', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010886', 'Student=2015010886');
INSERT INTO `system_user` VALUES ('86', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010887', 'Student=2015010887');
INSERT INTO `system_user` VALUES ('87', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015011149', 'Student=2015011149');
