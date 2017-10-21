ALTER TABLE  `ssnh_user` ADD  `tj` text NOT NULL;
ALTER TABLE  `ssnh_user` ADD  `xtj` text NOT NULL;
ALTER TABLE  `ssnh_user` ADD  `gxqm` text NOT NULL;
ALTER TABLE  `ssnh_user` ADD  `ktc` text NOT NULL;
INSERT INTO `ssnh_webconfigs` VALUES ('sfbfq', '1');
INSERT INTO `ssnh_webconfigs` VALUES ('bjmm', '26');
INSERT INTO `ssnh_webconfigs` VALUES ('zc', '1');
INSERT INTO `ssnh_webconfigs` VALUES ('zxyy', '73dd6516175680c629d20901e8e1c97f');
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
