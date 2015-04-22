CREATE TABLE `sequence` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;




delimiter $$
drop function if exists `currval` $$
create function `currval`(seq_name varchar(50)) returns int(11)
 deterministic
 begin
  declare value integer;
  set value=0;
  select id into value from sequence where name=seq_name;
  return value;
 end $$
 delimiter
 
 
 
 delimiter $$
drop FUNCTION if EXISTS `nextval` $$
CREATE FUNCTION `nextval`(seq_name VARCHAR(50)) RETURNS int(11)
DETERMINISTIC
BEGIN
DELETE from sequence where name = seq_name;
INSERT into sequence(name) values(seq_name);
return currval(seq_name);
end $$
delimiter