
INSERT INTO `b_project` VALUES ('3701BP150807134500100001', '01', 'jrjf', '节日计费', '节日期间加收**元');
commit;

CREATE TABLE `b_holiday` (
  `jrmc` varchar(50) DEFAULT NULL,
  `rq` varchar(8) NOT NULL,
  PRIMARY KEY (`rq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;