/*
Navicat MySQL Data Transfer

Source Server         : ldwframe
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : drivingserach

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-08-13 22:36:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `k_c_info`
-- ----------------------------
DROP TABLE IF EXISTS `k_c_info`;
CREATE TABLE `k_c_info` (
  `kcid` varchar(30) NOT NULL COMMENT '主键，自增列',
  `gsid` varchar(30) DEFAULT NULL,
  `gsmc` varchar(100) DEFAULT NULL,
  `qsrq` date DEFAULT NULL,
  `zzrq` date DEFAULT NULL,
  `djlx` varchar(3) DEFAULT NULL COMMENT '代驾类型，01短程，02中程， 03远途',
  `dhhm` varchar(20) DEFAULT NULL COMMENT '电话号码',
  PRIMARY KEY (`kcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of k_c_info
-- ----------------------------
