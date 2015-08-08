/*
Navicat MySQL Data Transfer

Source Server         : ldwframe
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : drivingserach

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-08-08 11:06:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `w_scene`
-- ----------------------------
DROP TABLE IF EXISTS `w_scene`;
CREATE TABLE `w_scene` (
  `qdid` varchar(30) NOT NULL,
  `scene` varchar(200) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `month` varchar(2) DEFAULT NULL,
  `day` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`qdid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_scene
-- ----------------------------
