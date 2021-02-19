/*
Navicat MySQL Data Transfer

Source Server         : LZF
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : clothing_mall

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2021-02-19 17:26:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mall_address
-- ----------------------------
DROP TABLE IF EXISTS `mall_address`;
CREATE TABLE `mall_address` (
  `addr_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL DEFAULT '' COMMENT '收货人名称',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户表的用户ID',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '行政区域表的省ID',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '行政区域表的市ID',
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT '行政区域表的区县ID',
  `address` varchar(127) NOT NULL DEFAULT '' COMMENT '具体收货地址',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认地址',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`addr_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='收货地址表';

-- ----------------------------
-- Records of mall_address
-- ----------------------------

-- ----------------------------
-- Table structure for mall_admin
-- ----------------------------
DROP TABLE IF EXISTS `mall_admin`;
CREATE TABLE `mall_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL COMMENT '管理员头像图片',
  `last_login_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次登录的时间',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` int(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of mall_admin
-- ----------------------------
INSERT INTO `mall_admin` VALUES ('2', 'admin123', 'YWRtaW4xMjM=', null, '2021-02-19 00:00:00', '2021-02-19 16:36:14', null, '0');

-- ----------------------------
-- Table structure for mall_cart
-- ----------------------------
DROP TABLE IF EXISTS `mall_cart`;
CREATE TABLE `mall_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `goods_id` int(11) DEFAULT NULL COMMENT '货物id',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of mall_cart
-- ----------------------------

-- ----------------------------
-- Table structure for mall_category
-- ----------------------------
DROP TABLE IF EXISTS `mall_category`;
CREATE TABLE `mall_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL DEFAULT '' COMMENT '类目名称',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100101305 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='类目表';

-- ----------------------------
-- Records of mall_category
-- ----------------------------

-- ----------------------------
-- Table structure for mall_comment
-- ----------------------------
DROP TABLE IF EXISTS `mall_comment`;
CREATE TABLE `mall_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户表的用户ID',
  `star` smallint(6) DEFAULT '1' COMMENT '评分， 1-5',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1023 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='评论表';

-- ----------------------------
-- Records of mall_comment
-- ----------------------------

-- ----------------------------
-- Table structure for mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods`;
CREATE TABLE `mall_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_sn` varchar(63) NOT NULL DEFAULT '' COMMENT '商品编号',
  `name` varchar(127) NOT NULL DEFAULT '' COMMENT '商品名称',
  `category_id` int(11) DEFAULT '0' COMMENT '商品所属类目ID',
  `gallery` varchar(1023) DEFAULT NULL COMMENT '商品宣传图片列表，采用JSON数组格式',
  `brief` varchar(255) DEFAULT '' COMMENT '商品简介',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '商品页面商品图片',
  `retail_price` decimal(10,2) DEFAULT '100000.00' COMMENT '零售价格',
  `detail` text COMMENT '商品详细介绍，是富文本格式',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `browse` int(11) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `sales` int(11) NOT NULL DEFAULT '0' COMMENT '已销售总量',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  `approve_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '审批状态 ：4 未提交  0 待审批  1 审批通过 2 审批拒绝',
  `approve_msg` varchar(255) DEFAULT NULL COMMENT '审批内容',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23857 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='商品基本信息表';

-- ----------------------------
-- Records of mall_goods
-- ----------------------------

-- ----------------------------
-- Table structure for mall_order
-- ----------------------------
DROP TABLE IF EXISTS `mall_order`;
CREATE TABLE `mall_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户表的用户ID',
  `order_sn` varchar(63) NOT NULL COMMENT '订单编号',
  `order_status` smallint(6) NOT NULL COMMENT '订单状态(0.未支付 1.已支付 2.已取消)',
  `message` varchar(512) NOT NULL DEFAULT '' COMMENT '用户订单留言',
  `order_price` decimal(10,2) NOT NULL COMMENT '订单费用',
  `ship_time` datetime DEFAULT NULL COMMENT '发货开始时间',
  `ship_sn` varchar(255) DEFAULT NULL COMMENT '物流单号',
  `confirm_time` datetime DEFAULT NULL COMMENT '用户确认收货时间',
  `end_time` datetime DEFAULT NULL COMMENT '订单关闭时间',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单表';

-- ----------------------------
-- Records of mall_order
-- ----------------------------

-- ----------------------------
-- Table structure for mall_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_order_goods`;
CREATE TABLE `mall_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(63) DEFAULT NULL COMMENT '订单编号',
  `goods_sn` varchar(63) DEFAULT NULL COMMENT '货物编号',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of mall_order_goods
-- ----------------------------

-- ----------------------------
-- Table structure for mall_user
-- ----------------------------
DROP TABLE IF EXISTS `mall_user`;
CREATE TABLE `mall_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(63) NOT NULL COMMENT '用户名称',
  `password` varchar(63) NOT NULL COMMENT '用户密码',
  `gender` tinyint(3) NOT NULL DEFAULT '0' COMMENT '性别：0 未知， 1男， 1 女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `last_login_time` datetime DEFAULT NULL COMMENT '最近一次登录时间',
  `last_login_ip` varchar(63) NOT NULL DEFAULT '' COMMENT '最近一次登录IP地址',
  `nickname` varchar(63) NOT NULL DEFAULT '' COMMENT '用户昵称或网络名称',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号码',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像图片',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0 可用, 1 禁用, 2 注销',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `user_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户表';

-- ----------------------------
-- Records of mall_user
-- ----------------------------
