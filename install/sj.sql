DROP TABLE IF EXISTS `ssnh_xc`;
CREATE TABLE `ssnh_xc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dz` varchar(255) NOT NULL,
  `ms` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `ssnh_lyb`;
CREATE TABLE `ssnh_lyb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qq` text,
  `user` text,
  `info` text,
  `time` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
ALTER TABLE  `ssnh_users` CHANGE  `ah`  `ah` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
ALTER TABLE  `ssnh_users` CHANGE  `zz`  `zz` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
ALTER TABLE  `ssnh_users` CHANGE  `tc`  `tc` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
ALTER TABLE  `ssnh_users` CHANGE  `sr`  `sr` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
ALTER TABLE  `ssnh_users` CHANGE  `xm`  `xm` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
ALTER TABLE  `ssnh_users` CHANGE  `ch`  `ch` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
ALTER TABLE  `ssnh_users` CHANGE  `xb`  `xb` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
ALTER TABLE  `ssnh_users` CHANGE  `xh`  `xh` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
ALTER TABLE  `ssnh_users` CHANGE  `zw`  `zw` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
ALTER TABLE  `ssnh_users` CHANGE  `ktc`  `ktc` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
ALTER TABLE  `ssnh_users` CHANGE  `gxqm`  `gxqm` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
ALTER TABLE  `ssnh_users` CHANGE  `tj`  `tj` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
ALTER TABLE  `ssnh_users` CHANGE  `xtj`  `xtj` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL