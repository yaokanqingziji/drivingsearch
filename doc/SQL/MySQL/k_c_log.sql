/*
Navicat MySQL Data Transfer

Source Server         : ldwframe
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : drivingserach

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-08-13 22:36:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `k_c_log`
-- ----------------------------
DROP TABLE IF EXISTS `k_c_log`;
CREATE TABLE `k_c_log` (
  `uid` varchar(100) DEFAULT NULL,
  `yysj` date DEFAULT NULL,
  `kcid` varchar(30) DEFAULT NULL,
  `gsid` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of k_c_log
-- ----------------------------
