-- ----------------------------
-- Table structure for `w_message`
-- ----------------------------
DROP TABLE IF EXISTS `w_message`;
CREATE TABLE `w_message` (
  `zjid` varchar(30) NOT NULL,
  `wxid` varchar(30) DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`zjid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;