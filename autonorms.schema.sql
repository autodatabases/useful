-- ----------------------------
-- Table structure for alltimes
-- ----------------------------
DROP TABLE IF EXISTS `alltimes`;
CREATE TABLE `alltimes` (
  `make` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `years` varchar(255) DEFAULT NULL,
  `engines` varchar(255) DEFAULT NULL,
  `workname` varchar(255) DEFAULT NULL,
  `tecdocid` int(11) DEFAULT NULL,
  `partname` varchar(255) DEFAULT NULL,
  `hours` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `tecdocid` (`tecdocid`),
  KEY `engines` (`engines`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Заполненная таблица номинальных норм времени + коды двигателей ТС';

-- ----------------------------
-- Table structure for carservice
-- ----------------------------
DROP TABLE IF EXISTS `carservice`;
CREATE TABLE `carservice` (
  `make` varchar(70) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `groupID` int(11) unsigned DEFAULT NULL,
  `workID` int(11) unsigned DEFAULT NULL,
  `price` varchar(15) DEFAULT NULL,
  `hours` varchar(15) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `years` varchar(50) DEFAULT NULL,
  `fuel` varchar(50) DEFAULT NULL,
  `newmodel` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `make` (`make`),
  KEY `make_2` (`make`,`model`),
  KEY `groupID` (`groupID`,`workID`),
  FULLTEXT KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Таблица норм времени на обслуживание автомобиля';

-- ----------------------------
-- Table structure for carservice_groups
-- ----------------------------
DROP TABLE IF EXISTS `carservice_groups`;
CREATE TABLE `carservice_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) DEFAULT NULL,
  KEY `id` (`id`) USING BTREE,
  KEY `groupname` (`groupname`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Основные узлы автомобиля / группы';

-- ----------------------------
-- Table structure for carservice_makes_models
-- ----------------------------
DROP TABLE IF EXISTS `carservice_makes_models`;
CREATE TABLE `carservice_makes_models` (
  `make` varchar(70) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `makeID` int(11) unsigned DEFAULT NULL,
  `modelID` int(11) unsigned DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `make_3` (`make`,`model`),
  KEY `make` (`make`),
  FULLTEXT KEY `make_2` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Марки и модели автомобилей';

-- ----------------------------
-- Table structure for carservice_remont
-- ----------------------------
DROP TABLE IF EXISTS `carservice_remont`;
CREATE TABLE `carservice_remont` (
  `make` varchar(70) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `uzelID` int(11) unsigned DEFAULT NULL,
  `workID` int(11) unsigned DEFAULT NULL,
  `price` varchar(15) DEFAULT NULL,
  `hours` varchar(15) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `make` (`make`),
  KEY `make_2` (`make`,`model`),
  KEY `make_3` (`make`,`model`,`uzelID`,`workID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Таблица норм времени по ремонту автомобилей';

-- ----------------------------
-- Table structure for carservice_uzel
-- ----------------------------
DROP TABLE IF EXISTS `carservice_uzel`;
CREATE TABLE `carservice_uzel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uzelname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uzelname` (`uzelname`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Список узлов автомобилей';

-- ----------------------------
-- Table structure for carservice_works
-- ----------------------------
DROP TABLE IF EXISTS `carservice_works`;
CREATE TABLE `carservice_works` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workname` varchar(255) DEFAULT NULL,
  UNIQUE KEY `workname_2` (`workname`),
  KEY `id` (`id`),
  KEY `workname` (`workname`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Список всех возможных работ';

-- ----------------------------
-- Table structure for cat
-- ----------------------------
DROP TABLE IF EXISTS `cat`;
CREATE TABLE `cat` (
  `makeName` varchar(255) DEFAULT NULL,
  `modelRow` varchar(50) DEFAULT NULL,
  `modelName` varchar(255) DEFAULT NULL,
  `modelYears` varchar(50) DEFAULT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  `typeYears` varchar(50) DEFAULT NULL,
  `modelId` int(11) unsigned NOT NULL,
  `typeId` int(11) unsigned NOT NULL,
  `fullTitle` varchar(255) DEFAULT NULL,
  KEY `makeName` (`makeName`),
  KEY `modelRow` (`modelRow`),
  KEY `typeId` (`typeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Каталог транспортных средств';

-- ----------------------------
-- Table structure for export_times
-- ----------------------------
DROP TABLE IF EXISTS `export_times`;
CREATE TABLE `export_times` (
  `worktime` varchar(15) DEFAULT NULL,
  `worktitle` varchar(255) DEFAULT NULL,
  `tecdocid` int(11) unsigned DEFAULT NULL,
  `uzel` varchar(255) DEFAULT NULL,
  `workid` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `tecdocid` (`tecdocid`),
  KEY `uzel` (`uzel`),
  KEY `worktitle` (`worktitle`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Таблица номинальных норм времени по версии TECDOC';

DROP TABLE IF EXISTS `carvolumes`;
CREATE TABLE `carvolumes` (
  `tecdocid` int(11) DEFAULT NULL,
  `TypeID` int(11) DEFAULT NULL,
  `SGRID` int(11) DEFAULT NULL,
  `SGTextStr` varchar(255) DEFAULT NULL,
  `SortNr` varchar(255) DEFAULT NULL,
  `ItemMpID` int(11) DEFAULT NULL,
  `ItemMpText` varchar(255) DEFAULT NULL,
  `QualColTextStr` varchar(255) DEFAULT NULL,
  `ValueText` varchar(255) DEFAULT NULL,
  `ADQuantityTextStr` varchar(255) DEFAULT NULL,
  `AddTextStr` varchar(255) DEFAULT NULL,
  `ItemSort` int(11) DEFAULT NULL,
  `MainGRSort` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `tecdocid` (`tecdocid`),
  KEY `TypeID` (`TypeID`),
  KEY `ItemMpID` (`ItemMpID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Заправочные объемы';
