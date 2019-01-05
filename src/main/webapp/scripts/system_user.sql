/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lims2018bdb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-01-05 11:08:12
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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('1', '0', '641d77dd5271fca28764612a028d9c8e', '1', '李晓平', '');
INSERT INTO `system_user` VALUES ('2', '0', 'ee26fc66b1369c7625333bedafbfcaf6', '1', '宫敬', '');
INSERT INTO `system_user` VALUES ('3', '0', 'f4aa0dd960521e045ae2f20621fb4ee9', '1', '吴海浩', '');
INSERT INTO `system_user` VALUES ('4', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2151', 'Teacher=2151');
INSERT INTO `system_user` VALUES ('5', '0', '25d55ad283aa400af464c76d713c07ad', '1', '1552', 'Teacher=1552');
INSERT INTO `system_user` VALUES ('6', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2152', 'Teacher=2152');
INSERT INTO `system_user` VALUES ('7', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2333', 'Teacher=2333');
INSERT INTO `system_user` VALUES ('8', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2013880073', 'Teacher=2013880073');
INSERT INTO `system_user` VALUES ('9', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2012880012', 'Teacher=2012880012');
INSERT INTO `system_user` VALUES ('57', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2014314014', 'Student=2014314014');
INSERT INTO `system_user` VALUES ('58', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2014314013', 'Student=2014314013');
INSERT INTO `system_user` VALUES ('59', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314019', 'Student=2015314019');
INSERT INTO `system_user` VALUES ('60', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314016', 'Student=2015314016');
INSERT INTO `system_user` VALUES ('61', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314022', 'Student=2015314022');
INSERT INTO `system_user` VALUES ('62', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314023', 'Student=2015314023');
INSERT INTO `system_user` VALUES ('63', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314017', 'Student=2015314017');
INSERT INTO `system_user` VALUES ('64', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015214549', 'Student=2015214549');
INSERT INTO `system_user` VALUES ('65', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015214571', 'Student=2015214571');
INSERT INTO `system_user` VALUES ('66', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015214557', 'Student=2015214557');
INSERT INTO `system_user` VALUES ('67', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2014011043', 'Student=2014011043');
INSERT INTO `system_user` VALUES ('68', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010667', 'Student=2015010667');
INSERT INTO `system_user` VALUES ('69', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010743', 'Student=2015010743');
INSERT INTO `system_user` VALUES ('70', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010854', 'Student=2015010854');
INSERT INTO `system_user` VALUES ('71', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010855', 'Student=2015010855');
INSERT INTO `system_user` VALUES ('72', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010856', 'Student=2015010856');
INSERT INTO `system_user` VALUES ('73', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010857', 'Student=2015010857');
INSERT INTO `system_user` VALUES ('74', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010858', 'Student=2015010858');
INSERT INTO `system_user` VALUES ('75', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010859', 'Student=2015010859');
INSERT INTO `system_user` VALUES ('76', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010860', 'Student=2015010860');
INSERT INTO `system_user` VALUES ('77', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010861', 'Student=2015010861');
INSERT INTO `system_user` VALUES ('78', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010862', 'Student=2015010862');
INSERT INTO `system_user` VALUES ('79', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010863', 'Student=2015010863');
INSERT INTO `system_user` VALUES ('80', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010864', 'Student=2015010864');
INSERT INTO `system_user` VALUES ('81', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010865', 'Student=2015010865');
INSERT INTO `system_user` VALUES ('82', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010866', 'Student=2015010866');
INSERT INTO `system_user` VALUES ('83', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010867', 'Student=2015010867');
INSERT INTO `system_user` VALUES ('84', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010868', 'Student=2015010868');
INSERT INTO `system_user` VALUES ('85', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010869', 'Student=2015010869');
INSERT INTO `system_user` VALUES ('86', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010870', 'Student=2015010870');
INSERT INTO `system_user` VALUES ('87', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010871', 'Student=2015010871');
INSERT INTO `system_user` VALUES ('88', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010872', 'Student=2015010872');
INSERT INTO `system_user` VALUES ('89', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010873', 'Student=2015010873');
INSERT INTO `system_user` VALUES ('90', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010875', 'Student=2015010875');
INSERT INTO `system_user` VALUES ('91', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010876', 'Student=2015010876');
INSERT INTO `system_user` VALUES ('92', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010877', 'Student=2015010877');
INSERT INTO `system_user` VALUES ('93', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010878', 'Student=2015010878');
INSERT INTO `system_user` VALUES ('94', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010879', 'Student=2015010879');
INSERT INTO `system_user` VALUES ('95', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010880', 'Student=2015010880');
INSERT INTO `system_user` VALUES ('96', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010881', 'Student=2015010881');
INSERT INTO `system_user` VALUES ('97', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010882', 'Student=2015010882');
INSERT INTO `system_user` VALUES ('98', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010883', 'Student=2015010883');
INSERT INTO `system_user` VALUES ('99', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010884', 'Student=2015010884');
INSERT INTO `system_user` VALUES ('100', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010885', 'Student=2015010885');
INSERT INTO `system_user` VALUES ('101', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010886', 'Student=2015010886');
INSERT INTO `system_user` VALUES ('102', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015010887', 'Student=2015010887');
INSERT INTO `system_user` VALUES ('103', '0', '25d55ad283aa400af464c76d713c07ad', '9', '2015011149', 'Student=2015011149');
