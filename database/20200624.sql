/*
MySQL Backup
Source Server Version: 5.6.44
Source Database: card
Date: 2020/6/24 10:31:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `card`
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_code` varchar(255) DEFAULT NULL COMMENT '业务号码',
  `assign_status` int(11) DEFAULT '0' COMMENT '划拨状态 0 未划拨 1 已划拨',
  `card_status` int(11) DEFAULT '0' COMMENT '实名状态状态',
  `real_name_auth` int(11) DEFAULT '0' COMMENT '实名状态',
  `first_active_time` timestamp NULL DEFAULT NULL COMMENT '激活时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '到期时间',
  `used_flow_size` float(11,2) DEFAULT '0.00' COMMENT '已用流量，单位MB',
  `company_name` varchar(255) DEFAULT NULL COMMENT '归属代理商',
  `operator` int(11) DEFAULT NULL COMMENT '运营商',
  `region_operator` int(11) DEFAULT NULL COMMENT '地区运营商',
  `region_operator_api` int(11) DEFAULT NULL COMMENT '运营商接口文档',
  `card_type` int(11) DEFAULT NULL COMMENT '卡类型',
  `use_scence` int(11) DEFAULT NULL COMMENT '应用场景',
  `card_standard` int(11) DEFAULT NULL COMMENT '卡规格',
  `package` int(11) DEFAULT NULL COMMENT '上游套餐',
  `batch` varchar(255) DEFAULT NULL COMMENT '卡批次',
  `iccid` varchar(64) DEFAULT NULL COMMENT 'iccid',
  `password` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iccid` (`iccid`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `cfg`
-- ----------------------------
DROP TABLE IF EXISTS `cfg`;
CREATE TABLE `cfg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `cfg_operator`
-- ----------------------------
DROP TABLE IF EXISTS `cfg_operator`;
CREATE TABLE `cfg_operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='配置-运营商';

-- ----------------------------
--  Table structure for `cfg_region_operator`
-- ----------------------------
DROP TABLE IF EXISTS `cfg_region_operator`;
CREATE TABLE `cfg_region_operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` text,
  `operator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `operator_id` (`operator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='配置-地区运营商';

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `card` VALUES ('89','14816900005','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','1','2','1','1','20200619-0001','89860801191980560005','29036416','','2020-06-19 16:31:44'), ('90','14816900006','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','1','2','1','1','20200619-0001','89860801191980560006','36911990','','2020-06-19 16:31:44'), ('91','14816900007','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','1','2','1','1','20200619-0001','89860801191980560007','91324070','','2020-06-19 16:31:44'), ('92','14816900008','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','1','2','1','1','20200619-0001','89860801191980560008','38188085','','2020-06-19 16:31:44'), ('93','14816900009','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','1','2','1','1','20200619-0001','89860801191980560009','52043482','','2020-06-19 16:31:44'), ('94','14816900010','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','1','2','1','1','20200619-0001','89860801191980560010','37261849','','2020-06-19 16:31:44'), ('95','14816900011','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','1','2','1','1','20200619-0001','89860801191980560011','32277371','','2020-06-19 16:31:44'), ('96','14816900012','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','1','2','1','1','20200619-0001','89860801191980560012','75138262','','2020-06-19 16:31:44'), ('97','14816900013','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','1','2','1','1','20200619-0001','89860801191980560013','97202826','','2020-06-19 16:31:44'), ('98','14816900014','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','1','2','1','1','20200619-0001','89860801191980560014','58883862','','2020-06-19 16:31:44'), ('100','14816900015','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','2','1','1','1','20200619-0002','89860801191980560015','12506367','','2020-06-19 19:27:45'), ('101','14816900016','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','2','1','1','1','20200619-0002','89860801191980560016','88038570','','2020-06-19 19:27:45'), ('102','14816900017','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','2','1','1','1','20200619-0002','89860801191980560017','69028769','','2020-06-19 19:27:45'), ('103','14816900018','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','2','1','1','1','20200619-0002','89860801191980560018','69836759','','2020-06-19 19:27:45'), ('104','14816900019','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','2','1','1','1','20200619-0002','89860801191980560019','51214380','','2020-06-19 19:27:45'), ('105','14816900020','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','2','1','1','1','20200619-0002','89860801191980560020','98338064','','2020-06-19 19:27:45'), ('106','14816900021','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','2','1','1','1','20200619-0002','89860801191980560021','51692595','','2020-06-19 19:27:45'), ('107','14816900022','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','2','1','1','1','20200619-0002','89860801191980560022','55379443','','2020-06-19 19:27:45'), ('108','14816900023','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','2','1','1','1','20200619-0002','89860801191980560023','55593643','','2020-06-19 19:27:45'), ('109','14816900024','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','2','1','1','1','20200619-0002','89860801191980560024','19528372','','2020-06-19 19:27:45'), ('111','1440030000000','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','1','1','1','1','20200623-0003','89860400000000000000','1231235','','2020-06-23 11:38:23'), ('113','1440030000000','0','0','0',NULL,NULL,'0.00',NULL,'1','1','1','1','1','1','1','20200623-0004','89860400000100051000','123123','','2020-06-23 11:57:04');
INSERT INTO `cfg_operator` VALUES ('1','中国移动'), ('2','中国联通'), ('3','中国电信');
INSERT INTO `cfg_region_operator` VALUES ('1','CMCC-GDSGKZYQ','1'), ('2','CUCC-GDSGKZYQ','2'), ('3','CTCC-GDSGKZYQ','3'), ('4','CMCC-GDGZKZYQ','1');
INSERT INTO `user` VALUES ('1','admin','123','张三','https://aliyun_id_photo_bucket.oss.aliyuncs.com/default_handsome.jpg?imageView2/1/w/80/h/80','2020-06-11 21:44:44');
