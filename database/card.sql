/*
 Navicat Premium Data Transfer

 Source Server         : 腾讯云
 Source Server Type    : MySQL
 Source Server Version : 50648
 Source Host           : localhost:3306
 Source Schema         : card

 Target Server Type    : MySQL
 Target Server Version : 50648
 File Encoding         : 65001

 Date: 14/07/2020 14:29:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for agent
-- ----------------------------
DROP TABLE IF EXISTS `agent`;
CREATE TABLE `agent`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `up_agent_id` int(11) NULL DEFAULT NULL COMMENT '上级代理商ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理商名称',
  `name_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理商别名',
  `agent_type` int(255) NULL DEFAULT NULL COMMENT '代理商类型',
  `receiver_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出卡收货人姓名',
  `receiver_mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出卡收货人手机号',
  `receiver_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出卡收货地址',
  `work_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址',
  `contact_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact_job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人职务',
  `contact_mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `contact_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系邮箱',
  `agent_level` int(255) NULL DEFAULT NULL COMMENT '代理商级别',
  `settle_target` int(255) NULL DEFAULT NULL COMMENT '结算对象（不可修改）',
  `shareprofit` int(255) NULL DEFAULT NULL COMMENT '实时分润',
  `margin` float(10, 2) NULL DEFAULT NULL COMMENT '保证金（元）',
  `custom_manager` int(16) NULL DEFAULT NULL COMMENT '客户经理',
  `agent_introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理商简介',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代理商' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of agent
-- ----------------------------
INSERT INTO `agent` VALUES (1, NULL, '广州代理商', '代理商别名', 2, '出卡收货人姓名', '卡收货人手机', '收货地', '公地址', '联系人', '联系人职务', '系电话', '系邮箱', 3, 1, 1, 144444.00, 1, '2', '2020-07-06 17:38:24');
INSERT INTO `agent` VALUES (2, 1, '潮汕代理山', 'hh', 1, 'yy', 'tt', 'uu', NULL, '张三', '保姆', '1', '222@2.com', 4, 1, 2, 12.00, 1, NULL, '2020-07-08 10:39:49');

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务号码',
  `assign_status` int(11) NULL DEFAULT 0 COMMENT '划拨状态 0 未划拨 1 已划拨',
  `card_status` int(11) NULL DEFAULT 0 COMMENT '实名状态状态',
  `real_name_auth` int(11) NULL DEFAULT 0 COMMENT '实名状态',
  `first_active_time` timestamp(0) NULL DEFAULT NULL COMMENT '激活时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '到期时间',
  `used_flow_size` float(11, 2) NULL DEFAULT 0.00 COMMENT '已用流量，单位MB',
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属代理商',
  `operator` int(11) NULL DEFAULT NULL COMMENT '运营商',
  `region_operator` int(11) NULL DEFAULT NULL COMMENT '地区运营商',
  `region_operator_api` int(11) NULL DEFAULT NULL COMMENT '运营商接口文档',
  `card_type` int(11) NULL DEFAULT NULL COMMENT '卡类型',
  `use_scence` int(11) NULL DEFAULT NULL COMMENT '应用场景',
  `card_standard` int(11) NULL DEFAULT NULL COMMENT '卡规格',
  `package` int(11) NULL DEFAULT NULL COMMENT '上游套餐',
  `batch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卡批次',
  `iccid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'iccid',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `iccid`(`iccid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of card
-- ----------------------------
INSERT INTO `card` VALUES (89, '14816900005', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 1, 2, 1, 1, '20200619-0001', '89860801191980560005', '29036416', '', '2020-06-19 16:31:44');
INSERT INTO `card` VALUES (90, '14816900006', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 1, 2, 1, 1, '20200619-0001', '89860801191980560006', '36911990', '', '2020-06-19 16:31:44');
INSERT INTO `card` VALUES (91, '14816900007', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 1, 2, 1, 1, '20200619-0001', '89860801191980560007', '91324070', '', '2020-06-19 16:31:44');
INSERT INTO `card` VALUES (92, '14816900008', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 1, 2, 1, 1, '20200619-0001', '89860801191980560008', '38188085', '', '2020-06-19 16:31:44');
INSERT INTO `card` VALUES (93, '14816900009', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 1, 2, 1, 1, '20200619-0001', '89860801191980560009', '52043482', '', '2020-06-19 16:31:44');
INSERT INTO `card` VALUES (94, '14816900010', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 1, 2, 1, 1, '20200619-0001', '89860801191980560010', '37261849', '', '2020-06-19 16:31:44');
INSERT INTO `card` VALUES (95, '14816900011', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 1, 2, 1, 1, '20200619-0001', '89860801191980560011', '32277371', '', '2020-06-19 16:31:44');
INSERT INTO `card` VALUES (96, '14816900012', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 1, 2, 1, 1, '20200619-0001', '89860801191980560012', '75138262', '', '2020-06-19 16:31:44');
INSERT INTO `card` VALUES (97, '14816900013', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 1, 2, 1, 1, '20200619-0001', '89860801191980560013', '97202826', '', '2020-06-19 16:31:44');
INSERT INTO `card` VALUES (98, '14816900014', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 1, 2, 1, 1, '20200619-0001', '89860801191980560014', '58883862', '', '2020-06-19 16:31:44');
INSERT INTO `card` VALUES (100, '14816900015', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 2, 1, 1, 1, '20200619-0002', '89860801191980560015', '12506367', '', '2020-06-19 19:27:45');
INSERT INTO `card` VALUES (101, '14816900016', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 2, 1, 1, 1, '20200619-0002', '89860801191980560016', '88038570', '', '2020-06-19 19:27:45');
INSERT INTO `card` VALUES (102, '14816900017', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 2, 1, 1, 1, '20200619-0002', '89860801191980560017', '69028769', '', '2020-06-19 19:27:45');
INSERT INTO `card` VALUES (103, '14816900018', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 2, 1, 1, 1, '20200619-0002', '89860801191980560018', '69836759', '', '2020-06-19 19:27:45');
INSERT INTO `card` VALUES (104, '14816900019', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 2, 1, 1, 1, '20200619-0002', '89860801191980560019', '51214380', '', '2020-06-19 19:27:45');
INSERT INTO `card` VALUES (105, '14816900020', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 2, 1, 1, 1, '20200619-0002', '89860801191980560020', '98338064', '', '2020-06-19 19:27:45');
INSERT INTO `card` VALUES (106, '14816900021', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 2, 1, 1, 1, '20200619-0002', '89860801191980560021', '51692595', '', '2020-06-19 19:27:45');
INSERT INTO `card` VALUES (107, '14816900022', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 2, 1, 1, 1, '20200619-0002', '89860801191980560022', '55379443', '', '2020-06-19 19:27:45');
INSERT INTO `card` VALUES (108, '14816900023', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 2, 1, 1, 1, '20200619-0002', '89860801191980560023', '55593643', '', '2020-06-19 19:27:45');
INSERT INTO `card` VALUES (109, '14816900024', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 2, 1, 1, 1, '20200619-0002', '89860801191980560024', '19528372', '', '2020-06-19 19:27:45');
INSERT INTO `card` VALUES (111, '1440030000000', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 1, 1, 1, 1, '20200623-0003', '89860400000000000000', '1231235', '', '2020-06-23 11:38:23');
INSERT INTO `card` VALUES (113, '1440030000000', 0, 0, 0, NULL, NULL, 0.00, NULL, 1, 1, 1, 1, 1, 1, 1, '20200623-0004', '89860400000100051000', '123123', '', '2020-06-23 11:57:04');

-- ----------------------------
-- Table structure for cfg
-- ----------------------------
DROP TABLE IF EXISTS `cfg`;
CREATE TABLE `cfg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cfg_operator
-- ----------------------------
DROP TABLE IF EXISTS `cfg_operator`;
CREATE TABLE `cfg_operator`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置-运营商' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cfg_operator
-- ----------------------------
INSERT INTO `cfg_operator` VALUES (1, '中国移动');
INSERT INTO `cfg_operator` VALUES (2, '中国联通');
INSERT INTO `cfg_operator` VALUES (3, '中国电信');

-- ----------------------------
-- Table structure for cfg_region_operator
-- ----------------------------
DROP TABLE IF EXISTS `cfg_region_operator`;
CREATE TABLE `cfg_region_operator`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `operator_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operator_id`(`operator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置-地区运营商' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cfg_region_operator
-- ----------------------------
INSERT INTO `cfg_region_operator` VALUES (1, 'CMCC-GDSGKZYQ', 1);
INSERT INTO `cfg_region_operator` VALUES (2, 'CUCC-GDSGKZYQ', 2);
INSERT INTO `cfg_region_operator` VALUES (3, 'CTCC-GDSGKZYQ', 3);
INSERT INTO `cfg_region_operator` VALUES (4, 'CMCC-GDGZKZYQ', 1);

-- ----------------------------
-- Table structure for meal
-- ----------------------------
DROP TABLE IF EXISTS `meal`;
CREATE TABLE `meal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义套餐名称',
  `orign_price` float(10, 2) NULL DEFAULT NULL COMMENT '原价(元)',
  `meal_price` float(10, 2) NULL DEFAULT NULL COMMENT '套餐售价(元)',
  `meal_cost` float(10, 2) NULL DEFAULT NULL COMMENT '套餐成本(元)',
  `meal_type` int(11) NULL DEFAULT NULL COMMENT '套餐类型',
  `meal_period` int(11) NULL DEFAULT NULL COMMENT '套餐周期(月)',
  `call_mins` float(10, 2) NULL DEFAULT NULL COMMENT '通话分钟(分)',
  `flow` float(10, 2) NULL DEFAULT NULL COMMENT '流量包大小(MB)',
  `laina_voice` float(10, 2) NULL DEFAULT NULL COMMENT '徕纳语音停用阀值(分)',
  `laina_flow_base` float(10, 2) NULL DEFAULT NULL COMMENT '徕纳流量停用基础阀值(MB)',
  `laina_flow_advance` float(10, 2) NULL DEFAULT NULL COMMENT '徕纳流量停用进阶阀值(MB)',
  `laina_flow_top` float(10, 2) NULL DEFAULT NULL COMMENT '徕纳流量停用顶峰阀值(MB)',
  `settle_type` int(11) NULL DEFAULT NULL COMMENT '结算类型',
  `buy_limit` int(11) NULL DEFAULT NULL COMMENT '购买限制',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `down_agent_id` int(11) NULL DEFAULT NULL COMMENT '下级代理商',
  `down_cost` float(10, 2) NULL DEFAULT NULL COMMENT '下级成本价格',
  `down_voice` float(10, 2) NULL DEFAULT NULL COMMENT '下级语音阀值(分钟)',
  `down_flow_base` float(10, 2) NULL DEFAULT NULL COMMENT '下级流量基础阀值(MB)',
  `down_flow_advance` float(10, 2) NULL DEFAULT NULL COMMENT '下级流量进阶阀值(MB)',
  `down_flow_top` float(10, 2) NULL DEFAULT NULL COMMENT '下级流量顶峰阀值(MB)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of meal
-- ----------------------------
INSERT INTO `meal` VALUES (2, '动感地带test111', 58.00, 18.00, 8.00, 2, 6, 60.00, 100.00, 100.00, 100.00, 100.00, 1000.00, 1, 1, '2020-07-05 12:37:29', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `meal` VALUES (3, '巨无霸', 998.00, 666.00, 555.00, 1, 6, 1000.00, 15.00, 15.00, 11.00, 11.00, 22.00, 1, 1, '2020-07-09 10:35:10', 2, 1.00, 222.00, 155.00, 14.00, 12.00);

-- ----------------------------
-- Table structure for package
-- ----------------------------
DROP TABLE IF EXISTS `package`;
CREATE TABLE `package`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator` int(11) NULL DEFAULT NULL COMMENT '运营商',
  `region_operator` int(11) NULL DEFAULT NULL COMMENT '地区运营商',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '套餐名字',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '套餐别名(显示在微信公众号购买套餐)',
  `price` float(11, 2) NULL DEFAULT NULL COMMENT '套餐价格(元)',
  `period` int(255) NULL DEFAULT NULL COMMENT '套餐周期(月)',
  `mins` float(11, 2) NULL DEFAULT NULL COMMENT '通话分钟(分)',
  `msg_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短信条数(条)',
  `is_added` tinyint(4) NULL DEFAULT NULL COMMENT '是否上架',
  `recommend` tinyint(4) NULL DEFAULT NULL COMMENT '是否推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of package
-- ----------------------------
INSERT INTO `package` VALUES (114, 1, 1, '2020-07-14 11:21:27', 'jiayoubao 1号', '1', 2.00, 3, 4.00, '111', 1, 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `realname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `gender` int(255) NULL DEFAULT NULL COMMENT '性别',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `agent` int(11) NULL DEFAULT NULL COMMENT '所属代理商',
  `role` int(11) NULL DEFAULT NULL COMMENT '角色',
  `least_login` timestamp(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123', '张三', 'https://aliyun_id_photo_bucket.oss.aliyuncs.com/default_handsome.jpg?imageView2/1/w/80/h/80', '2020-06-11 21:44:44', 1, NULL, 1, 1, '2020-07-14 09:48:25');
INSERT INTO `user` VALUES (2, 'adddd', '1', 'jack', NULL, '2020-07-07 10:45:45', 1, '2@2.com', 1, 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
