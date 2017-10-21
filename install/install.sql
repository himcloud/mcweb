set names 'utf8';
DROP TABLE IF EXISTS `ssnh_users`;
CREATE TABLE `ssnh_users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `daili` tinyint(1) DEFAULT '0',
  `vip` tinyint(1) DEFAULT '0',
  `vipstart` date DEFAULT NULL,
  `vipend` date DEFAULT NULL,
  `rmb` int(5) DEFAULT '0',
  `peie` tinyint(2) DEFAULT '1',
  `pwd` varchar(40) NOT NULL,
  `sid` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `fuzhan` tinyint(1) DEFAULT '0',
  `login` tinyint(255) DEFAULT '1',
  `mail` varchar(100) DEFAULT NULL,
  `qq` varchar(255) DEFAULT '0',
  `phone` varchar(255) DEFAULT '0',
  `city` varchar(50) DEFAULT NULL,
  `regip` varchar(50) DEFAULT NULL,
  `lastip` varchar(50) DEFAULT NULL,
  `regtime` datetime DEFAULT NULL,
  `lasttime` datetime DEFAULT NULL,
  `ah` text,
  `zz` varchar(255) NOT NULL,
  `lxdh` varchar(255) NOT NULL,
   `tc` varchar(255) NOT NULL,
   `xz` varchar(255) NOT NULL,
   `sr` varchar(255) NOT NULL,
   `xm` varchar(255) NOT NULL,
   `ch` varchar(255) NOT NULL,
   `xb` varchar(255) NOT NULL,
   `xh` varchar(255) NOT NULL,
   `zw` varchar(255) NOT NULL,
   `ktc` varchar(255) NOT NULL,
   `gxqm` varchar(255) NOT NULL,
   `tj` varchar(255) NOT NULL,
   `xtj` varchar(255) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `ssnh_webconfigs`;
CREATE TABLE `ssnh_webconfigs` (
  `vkey` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`vkey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `ssnh_users` (`uid`, `user`, `daili`, `vip`, `vipstart`, `vipend`, `rmb`, `peie`, `pwd`, `sid`, `active`, `fuzhan`, `login`, `mail`, `qq`, `phone`, `city`, `regip`, `lastip`, `regtime`, `lasttime`, `ah`, `zz`, `lxdh`, `tc`, `xz`, `sr`, `xm`, `ch`, `xb`, `xh`, `zw`, `ktc`, `gxqm`, `tj`, `xtj`) VALUES
(1, 'admin', 0, 1, NULL, '2020-12-30', 9999, 127, '4d3ea8f0d1aa6fa07b6c0a5375645c48', '0b484609853c70cd87c8d1e3b2f5f34a', 9, 1, 1, '2635435377@qq.com', '2635435377', '15051619380', NULL, NULL, '111.121.85.149', NULL, '2016-05-02 20:21:47', '动漫', '贵州省贵阳市', '15051619380', 'IT', '狮子座', '3月31日', 'greaty' , 'greaty', '1', '11', '无', '下次一定比你强', '梦想是要有的，万一实现了呢？' , '全网最帅', '1');
INSERT INTO `ssnh_webconfigs` VALUES ('cronrand', '1234');
INSERT INTO `ssnh_webconfigs` VALUES ('regpeie', '1');
INSERT INTO `ssnh_webconfigs` VALUES ('zannet', '3');
INSERT INTO `ssnh_webconfigs` VALUES ('netnum', '200');
INSERT INTO `ssnh_webconfigs` VALUES ('mail_email', '');
INSERT INTO `ssnh_webconfigs` VALUES ('mail_pwd', '');
INSERT INTO `ssnh_webconfigs` VALUES ('mail_host', '');
INSERT INTO `ssnh_webconfigs` VALUES ('mail_port', '');
INSERT INTO `ssnh_webconfigs` VALUES ('do', 'set');
INSERT INTO `ssnh_webconfigs` VALUES ('price_1vip', '8');
INSERT INTO `ssnh_webconfigs` VALUES ('price_3vip', '20');
INSERT INTO `ssnh_webconfigs` VALUES ('price_6vip', '30');
INSERT INTO `ssnh_webconfigs` VALUES ('price_12vip', '50');
INSERT INTO `ssnh_webconfigs` VALUES ('price_1peie', '20');
INSERT INTO `ssnh_webconfigs` VALUES ('price_3peie', '40');
INSERT INTO `ssnh_webconfigs` VALUES ('price_5peie', '50');
INSERT INTO `ssnh_webconfigs` VALUES ('price_10peie', '66');
INSERT INTO `ssnh_webconfigs` VALUES ('submit', '确认修改');
INSERT INTO `ssnh_webconfigs` VALUES ('webfoot', 'All Right Reserved');
INSERT INTO `ssnh_webconfigs` VALUES ('webkey', '');
INSERT INTO `ssnh_webconfigs` VALUES ('web_quanquanjk', '');
INSERT INTO `ssnh_webconfigs` VALUES ('webname', 'MC玩家网-全新UI界面！');
INSERT INTO `ssnh_webconfigs` VALUES ('webdomain', 'sq.34ban.top');
INSERT INTO `ssnh_webconfigs` VALUES ('webqq', '351244716');
INSERT INTO `ssnh_webconfigs` VALUES ('symb', '1');
INSERT INTO `ssnh_webconfigs` VALUES ('web_index_gg', '');
INSERT INTO `ssnh_webconfigs` VALUES ('web_control_gg', '');
INSERT INTO `ssnh_webconfigs` VALUES ('web_shop_gg', '');
INSERT INTO `ssnh_webconfigs` VALUES ('webfree', '1');
INSERT INTO `ssnh_webconfigs` VALUES ('price_1dvip', '1');
INSERT INTO `ssnh_webconfigs` VALUES ('regrmb', '1');
INSERT INTO `ssnh_webconfigs` VALUES ('web_rmb_gg', '');
INSERT INTO `ssnh_webconfigs` VALUES ('name', 'greaty');
INSERT INTO `ssnh_webconfigs` VALUES ('syyy', '2635435377');
INSERT INTO `ssnh_webconfigs` VALUES ('bjys', 'MC玩家网');
INSERT INTO `ssnh_webconfigs` VALUES ('bjzy', 'MC玩家网');
INSERT INTO `ssnh_webconfigs` VALUES ('bjss', 'MC玩家网');
INSERT INTO `ssnh_webconfigs` VALUES ('wzgg', 'MC玩家网');
INSERT INTO `ssnh_webconfigs` VALUES ('bjgg', 'MC玩家网');
INSERT INTO `ssnh_webconfigs` VALUES ('jhhd', 'MC玩家网');
INSERT INTO `ssnh_webconfigs` VALUES ('bjhd', 'MC玩家网');
INSERT INTO `ssnh_webconfigs` VALUES ('webmail', '2635435377@qq.com');
INSERT INTO `ssnh_webconfigs` VALUES ('sfbfq', '1');
INSERT INTO `ssnh_webconfigs` VALUES ('bjmm', '26');
INSERT INTO `ssnh_webconfigs` VALUES ('zc', '1');
INSERT INTO `ssnh_webconfigs` VALUES ('qqjk', 'http://lqq.25ak.com/quan.php?jx=');
INSERT INTO `ssnh_webconfigs` VALUES ('zxyy', '7f0741ebc8ff331f5fa5c336a09e559e');
INSERT INTO `ssnh_webconfigs` VALUES ('gfqq', 'http://shang.qq.com/wpa/qunwpa?idkey=41d6d5601d5f929ccd7fb7f0a159e3c92de9364cb6d4a0a850a720a0de9e08f5');
INSERT INTO `ssnh_webconfigs` (`vkey`, `value`) VALUES ('web_ifreg', '1');
INSERT INTO `ssnh_webconfigs` (`vkey`, `value`) VALUES ('web_iflogin', '1');
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
