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

 Date: 20/09/2020 09:03:47
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
  `agent_level` int(255) NULL DEFAULT NULL COMMENT '代理商级别',
  `settle_target` int(255) NULL DEFAULT NULL COMMENT '结算对象（不可修改）',
  `shareprofit` int(255) NULL DEFAULT 0 COMMENT '实时分润',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代理商' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of agent
-- ----------------------------
INSERT INTO `agent` VALUES (1, NULL, '开宗源泉', '', 3, NULL, NULL, NULL, NULL, 4, 1, 0, '2020-08-30 11:54:59');
INSERT INTO `agent` VALUES (2, 1, '腾讯', 'tx', 1, '马化腾', '110', NULL, NULL, 1, 1, 0, '2020-08-22 17:29:26');
INSERT INTO `agent` VALUES (3, 2, '腾讯游戏', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-09-19 23:27:32');

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务号码',
  `assign_status` int(11) NULL DEFAULT 0 COMMENT '划拨状态 0 未划拨 1 已划拨',
  `card_status` int(11) NULL DEFAULT 0 COMMENT '激活状态',
  `real_name_auth` int(11) NULL DEFAULT 0 COMMENT '实名状态',
  `first_active_time` timestamp(0) NULL DEFAULT NULL COMMENT '激活时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '到期时间',
  `used_flow_size` float(11, 2) NULL DEFAULT 0.00 COMMENT '已用流量，单位MB',
  `agent` int(11) NULL DEFAULT NULL COMMENT '归属代理商',
  `operator` int(11) NULL DEFAULT NULL COMMENT '运营商',
  `region_operator` int(11) NULL DEFAULT NULL COMMENT '地区运营商',
  `region_operator_api` int(11) NULL DEFAULT NULL COMMENT '运营商接口文档',
  `card_type` int(11) NULL DEFAULT NULL COMMENT '卡类型',
  `use_scene` int(11) NULL DEFAULT NULL COMMENT '应用场景',
  `card_standard` int(11) NULL DEFAULT NULL COMMENT '卡规格',
  `package` int(11) NULL DEFAULT NULL COMMENT '上游套餐',
  `batch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卡批次',
  `iccid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'iccid',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `iccid`(`iccid`) USING BTREE,
  UNIQUE INDEX `business_code`(`business_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of card
-- ----------------------------
INSERT INTO `card` VALUES (117, '321', 0, 0, 0, '2020-09-19 21:53:22', NULL, 0.00, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '20200823-0001', '89860400000000000000', '123123', '', '2020-08-23 16:08:35');
INSERT INTO `card` VALUES (118, '1440030000001', 1, 0, 0, '2020-08-30 13:05:59', NULL, 0.00, 3, 1, 2, 2, 2, 1, 1, 1, '20200830-0002', '89860400000000000001', '123123', '', '2020-08-30 12:27:28');
INSERT INTO `card` VALUES (119, '1440030000002', 1, 0, 0, NULL, NULL, 0.00, 3, 1, 2, 2, 2, 1, 1, 1, '20200830-0002', '89860400000000000002', '123123', '', '2020-08-30 12:27:28');
INSERT INTO `card` VALUES (120, '1440030000003', 1, 0, 0, NULL, NULL, 0.00, 3, 1, 2, 2, 2, 1, 1, 1, '20200830-0002', '89860400000000000003', '123123', '', '2020-08-30 12:27:28');

-- ----------------------------
-- Table structure for card_meal
-- ----------------------------
DROP TABLE IF EXISTS `card_meal`;
CREATE TABLE `card_meal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) NOT NULL,
  `meal_id` int(11) NOT NULL,
  `time_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐时长',
  `tier` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卡片绑定的套餐' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of card_meal
-- ----------------------------
INSERT INTO `card_meal` VALUES (13, 118, 3, 'year', '[{\"agent_id\":2,\"cost\":\"200\"},{\"agent_id\":3,\"cost\":\"400\"}]');
INSERT INTO `card_meal` VALUES (14, 119, 3, 'year', '[{\"agent_id\":2,\"cost\":\"200\"},{\"agent_id\":3,\"cost\":\"400\"}]');
INSERT INTO `card_meal` VALUES (15, 120, 3, 'year', '[{\"agent_id\":2,\"cost\":\"200\"},{\"agent_id\":3,\"cost\":\"400\"}]');

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
-- Table structure for meal
-- ----------------------------
DROP TABLE IF EXISTS `meal`;
CREATE TABLE `meal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义套餐名称',
  `origin_price` float(10, 2) NULL DEFAULT NULL COMMENT '原价(元)',
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '套餐' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of meal
-- ----------------------------
INSERT INTO `meal` VALUES (2, '动感地带test111', 58.00, 18.00, 8.00, 2, 6, 60.00, 100.00, 100.00, 100.00, 100.00, 1000.00, 1, 1, '2020-07-05 12:37:29', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `meal` VALUES (3, '巨无霸', 998.00, 666.00, 555.00, 1, 6, 1000.00, 15.00, 15.00, 11.00, 11.00, 22.00, 1, 1, '2020-07-09 10:35:10', 2, 1.00, 222.00, 155.00, 14.00, 12.00);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id',
  `total_fee` double(16, 2) NULL DEFAULT NULL COMMENT '支付金额（元）',
  `pay_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '订单信息',
  `create_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('202009092233563408', 0.01, '20200909223409', NULL, NULL);
INSERT INTO `order` VALUES ('202009092236266887', 0.01, '20200909223631', NULL, NULL);
INSERT INTO `order` VALUES ('202009092239191466', 0.01, '20200909223924', NULL, NULL);
INSERT INTO `order` VALUES ('202009092241479313', 0.01, '20200909224152', NULL, NULL);
INSERT INTO `order` VALUES ('202009100021463356', 0.01, NULL, NULL, NULL);
INSERT INTO `order` VALUES ('202009100027191932', 0.01, '20200910002726', NULL, NULL);
INSERT INTO `order` VALUES ('202009100037562074', 0.01, NULL, NULL, NULL);
INSERT INTO `order` VALUES ('202009102153413564', 0.01, NULL, NULL, NULL);
INSERT INTO `order` VALUES ('202009111947078310', 0.01, NULL, NULL, NULL);
INSERT INTO `order` VALUES ('202009171518287063', 0.01, NULL, '{\"card_id\":\"117\",\"meal_id\":\"2\"}', '2020-09-17 15:18:28');
INSERT INTO `order` VALUES ('202009171518445635', 0.01, '20200917151856', '{\"card_id\":\"117\",\"meal_id\":\"2\"}', '2020-09-17 15:18:44');
INSERT INTO `order` VALUES ('202009192124113711', 0.01, NULL, '{\"card_id\":\"117\",\"meal_id\":\"2\"}', '2020-09-19 21:24:11');
INSERT INTO `order` VALUES ('202009192124152382', 0.01, NULL, '{\"card_id\":\"117\",\"meal_id\":\"2\"}', '2020-09-19 21:24:15');
INSERT INTO `order` VALUES ('202009192124178495', 0.01, NULL, '{\"card_id\":\"117\",\"meal_id\":\"2\"}', '2020-09-19 21:24:17');
INSERT INTO `order` VALUES ('202009192124189561', 0.01, NULL, '{\"card_id\":\"117\",\"meal_id\":\"2\"}', '2020-09-19 21:24:18');
INSERT INTO `order` VALUES ('202009192150049958', 0.01, NULL, '{\"card_id\":\"117\",\"meal_id\":\"3\"}', '2020-09-19 21:50:04');
INSERT INTO `order` VALUES ('202009192153088311', 0.01, '20200919215321', '{\"card_id\":\"117\",\"meal_id\":\"3\"}', '2020-09-19 21:53:08');

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
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '加油包' ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123', '张三', 'https://aliyun_id_photo_bucket.oss.aliyuncs.com/default_handsome.jpg?imageView2/1/w/80/h/80', '2020-06-11 21:44:44', 1, NULL, 1, 1, '2020-09-20 00:09:23');
INSERT INTO `user` VALUES (5, 'ma', '123', '马化腾', NULL, '2020-08-22 17:51:06', 1, NULL, 2, 2, '2020-09-20 00:09:58');
INSERT INTO `user` VALUES (6, 'luokai', '123123', '罗凯', NULL, '2020-08-30 12:05:58', 1, NULL, 1, 2, '2020-08-30 12:06:26');

SET FOREIGN_KEY_CHECKS = 1;
