/*
Navicat MySQL Data Transfer

Source Server         : LZF
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : clothing_mall

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2021-03-03 17:10:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mall_address
-- ----------------------------
DROP TABLE IF EXISTS `mall_address`;
CREATE TABLE `mall_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL DEFAULT '' COMMENT '收货人名称',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户表的用户ID',
  `province` varchar(11) NOT NULL DEFAULT '0' COMMENT '行政区域表的省ID',
  `city` varchar(11) NOT NULL DEFAULT '0' COMMENT '行政区域表的市ID',
  `area` varchar(11) NOT NULL DEFAULT '0' COMMENT '行政区域表的区县ID',
  `address` varchar(127) NOT NULL DEFAULT '' COMMENT '具体收货地址',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认地址',
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`address_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='收货地址表';

-- ----------------------------
-- Records of mall_address
-- ----------------------------
INSERT INTO `mall_address` VALUES ('76', 'test', '200', '北京市', '测试', '测试', '学校', '13735965589', '0', '2021-02-28 16:22:04', '2021-02-28 16:45:32', '0');

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
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` int(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mall_admin
-- ----------------------------
INSERT INTO `mall_admin` VALUES ('2', 'admin123', 'YWRtaW4xMjM=', 'http://localhost:8089/img/cat.jpg', '2021-02-28 21:46:49', '2021-02-19 16:36:14', '2021-02-28 21:46:49', '0');

-- ----------------------------
-- Table structure for mall_cart
-- ----------------------------
DROP TABLE IF EXISTS `mall_cart`;
CREATE TABLE `mall_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `goods_sn` varchar(255) DEFAULT NULL COMMENT '货物id',
  `goods_num` int(11) DEFAULT NULL COMMENT '数量',
  `check` tinyint(1) DEFAULT '0' COMMENT '是否确认',
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mall_cart
-- ----------------------------
INSERT INTO `mall_cart` VALUES ('1', '204', 'cs2021022804', '1', '0', '2021-03-03 10:36:32', '2021-03-03 14:47:20', '0');
INSERT INTO `mall_cart` VALUES ('2', '204', 'cs2021022801', '7', '0', '2021-03-03 14:26:31', '2021-03-03 15:22:29', '0');

-- ----------------------------
-- Table structure for mall_category
-- ----------------------------
DROP TABLE IF EXISTS `mall_category`;
CREATE TABLE `mall_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL DEFAULT '' COMMENT '类目名称',
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100101312 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='类目表';

-- ----------------------------
-- Records of mall_category
-- ----------------------------
INSERT INTO `mall_category` VALUES ('100101305', '衬衫', '2021-02-28 19:02:03', '2021-02-28 21:27:46', '0');
INSERT INTO `mall_category` VALUES ('100101306', '牛仔裤', '2021-02-28 19:02:16', '2021-02-28 21:27:53', '0');
INSERT INTO `mall_category` VALUES ('100101307', '风衣', '2021-02-28 21:28:00', '2021-02-28 21:28:00', '0');
INSERT INTO `mall_category` VALUES ('100101308', '棉衣', '2021-02-28 21:28:07', '2021-02-28 21:28:07', '0');
INSERT INTO `mall_category` VALUES ('100101309', '羽绒服', '2021-02-28 21:28:17', '2021-02-28 22:57:07', '0');
INSERT INTO `mall_category` VALUES ('100101310', '皮衣', '2021-02-28 21:28:31', '2021-02-28 21:28:31', '0');
INSERT INTO `mall_category` VALUES ('100101311', '卫裤', '2021-02-28 21:29:00', '2021-02-28 21:29:00', '0');

-- ----------------------------
-- Table structure for mall_comment
-- ----------------------------
DROP TABLE IF EXISTS `mall_comment`;
CREATE TABLE `mall_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户表的用户ID',
  `order_goods_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `star` smallint(6) DEFAULT '1' COMMENT '评分， 1-5',
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
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
  `num` int(11) DEFAULT NULL COMMENT '商品数量',
  `detail` text COMMENT '商品详细介绍，是富文本格式',
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `browse` int(11) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `sales` int(11) NOT NULL DEFAULT '0' COMMENT '已销售总量',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  `approve_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '审批状态 ：4 未提交  0 待审批  1 审批通过 2 审批拒绝',
  `approve_msg` varchar(255) DEFAULT NULL COMMENT '审批内容',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23916 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='商品基本信息表';

-- ----------------------------
-- Records of mall_goods
-- ----------------------------
INSERT INTO `mall_goods` VALUES ('23859', 'cs2021022801', '男士韩版短袖衬衫夏季潮流宽松格子衬衣潮牌休闲男装上衣服外套男', '100101305', 'http://localhost:8089/img/78876ea4a58f4dee8116caea1006c5f7.jpg,http://localhost:8089/img/d6780337d86d4e8e8dfca74a07b92e0a.jpg,http://localhost:8089/img/06b4938ccb24466182c3ad4ee7da7c21.jpg,http://localhost:8089/img/a450b3470ebe490e9233c88cea428f30.jpg', '男士韩版短袖衬衫夏季潮流宽松格子衬衣潮牌休闲男装上衣服外套男', 'http://localhost:8089/img/20c1444f785d483caec2554259d67fda.jpg', '100.00', '120', '男士韩版短袖衬衫夏季潮流宽松格子衬衣潮牌休闲男装上衣服外套男', '2021-02-28 21:45:33', '2021-02-28 22:04:14', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23861', 'cs2021022802', '极麻复古刺绣工装长袖衬衫男士日系大码休闲阿美咔叽宽松纯棉衬衣', '100101305', 'http://localhost:8089/img/5f61cd3533864a6ea4cc805d47ba6c8c.jpg,http://localhost:8089/img/b1df1815f5c8463da440e7787e6bff98.jpg,http://localhost:8089/img/70071677b31e4075a395f3a912fc3ddc.jpg,http://localhost:8089/img/7546f69b6468450db923951cddd7e714.jpg', '极麻复古刺绣工装长袖衬衫男士日系大码休闲阿美咔叽宽松纯棉衬衣', 'http://localhost:8089/img/9be14c8dde1c425c9bbfc90b32fe91b8.jpg', '150.00', '30', '极麻复古刺绣工装长袖衬衫男士日系大码休闲阿美咔叽宽松纯棉衬衣', '2021-02-28 21:53:08', '2021-02-28 22:04:27', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23862', 'cs2021022803', '长袖衬衫男士工装休闲寸衫春秋夏季韩版潮流纯棉港风日系衬衣外套', '100101305', 'http://localhost:8089/img/a0dd4f6e125e42ed84c35454ad61b1ee.jpg,http://localhost:8089/img/29e97e58a69d4eab8be206dc3837b3e0.jpg,http://localhost:8089/img/14b607fcac1c431fb90dc9f46411d539.jpg,http://localhost:8089/img/15a132631c074bbe9389851b45126644.jpg', '长袖衬衫男士工装休闲寸衫春秋夏季韩版潮流纯棉港风日系衬衣外套', 'http://localhost:8089/img/cf2a72c1f6ca4272a53855b4ccac4a90.jpg', '482.00', '35', '长袖衬衫男士工装休闲寸衫春秋夏季韩版潮流纯棉港风日系衬衣外套', '2021-02-28 21:56:48', '2021-02-28 22:04:30', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23863', 'cs2021022804', '夏季短袖衬衫男士韩版商务休闲寸衫潮流工装衣服纯棉半袖衬衣青年', '100101305', 'http://localhost:8089/img/4ef2b1fdcd834b66bb6d78a968d62c0c.jpg,http://localhost:8089/img/3d2ee0d49fad43dba437cf93155453f4.jpg,http://localhost:8089/img/b1c8ba7935834527bc82a8ea2f1bc598.jpg,http://localhost:8089/img/4e5cf2897b3d4eec86c79d001911b52a.jpg', '夏季短袖衬衫男士韩版商务休闲寸衫潮流工装衣服纯棉半袖衬衣青年', 'http://localhost:8089/img/aa6ce8c6897c4d9a8ec034089d0d2b02.jpg', '96.00', '95', '夏季短袖衬衫男士韩版商务休闲寸衫潮流工装衣服纯棉半袖衬衣青年', '2021-02-28 22:00:36', '2021-02-28 22:04:32', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23864', 'cs2021022805', '男士韩版短袖衬衫夏季潮流宽松格子衬衣潮牌休闲男装上衣服外套男', '100101305', 'http://localhost:8089/img/78876ea4a58f4dee8116caea1006c5f7.jpg,http://localhost:8089/img/d6780337d86d4e8e8dfca74a07b92e0a.jpg,http://localhost:8089/img/06b4938ccb24466182c3ad4ee7da7c21.jpg,http://localhost:8089/img/a450b3470ebe490e9233c88cea428f30.jpg', '男士韩版短袖衬衫夏季潮流宽松格子衬衣潮牌休闲男装上衣服外套男', 'http://localhost:8089/img/20c1444f785d483caec2554259d67fda.jpg', '100.00', '120', '男士韩版短袖衬衫夏季潮流宽松格子衬衣潮牌休闲男装上衣服外套男', '2021-02-28 21:45:33', '2021-02-28 22:04:34', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23865', 'cs2021022806', '长袖衬衫男士工装休闲寸衫春秋夏季韩版潮流纯棉港风日系衬衣外套', '100101305', 'http://localhost:8089/img/a0dd4f6e125e42ed84c35454ad61b1ee.jpg,http://localhost:8089/img/29e97e58a69d4eab8be206dc3837b3e0.jpg,http://localhost:8089/img/14b607fcac1c431fb90dc9f46411d539.jpg,http://localhost:8089/img/15a132631c074bbe9389851b45126644.jpg', '长袖衬衫男士工装休闲寸衫春秋夏季韩版潮流纯棉港风日系衬衣外套', 'http://localhost:8089/img/cf2a72c1f6ca4272a53855b4ccac4a90.jpg', '482.00', '35', '长袖衬衫男士工装休闲寸衫春秋夏季韩版潮流纯棉港风日系衬衣外套', '2021-02-28 21:56:48', '2021-02-28 22:04:36', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23866', 'cs2021022807', '极麻复古刺绣工装长袖衬衫男士日系大码休闲阿美咔叽宽松纯棉衬衣', '100101305', 'http://localhost:8089/img/5f61cd3533864a6ea4cc805d47ba6c8c.jpg,http://localhost:8089/img/b1df1815f5c8463da440e7787e6bff98.jpg,http://localhost:8089/img/70071677b31e4075a395f3a912fc3ddc.jpg,http://localhost:8089/img/7546f69b6468450db923951cddd7e714.jpg', '极麻复古刺绣工装长袖衬衫男士日系大码休闲阿美咔叽宽松纯棉衬衣', 'http://localhost:8089/img/9be14c8dde1c425c9bbfc90b32fe91b8.jpg', '150.00', '30', '极麻复古刺绣工装长袖衬衫男士日系大码休闲阿美咔叽宽松纯棉衬衣', '2021-02-28 21:53:08', '2021-02-28 22:04:38', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23867', 'cs2021022808', '夏季短袖衬衫男士韩版商务休闲寸衫潮流工装衣服纯棉半袖衬衣青年', '100101305', 'http://localhost:8089/img/4ef2b1fdcd834b66bb6d78a968d62c0c.jpg,http://localhost:8089/img/3d2ee0d49fad43dba437cf93155453f4.jpg,http://localhost:8089/img/b1c8ba7935834527bc82a8ea2f1bc598.jpg,http://localhost:8089/img/4e5cf2897b3d4eec86c79d001911b52a.jpg', '夏季短袖衬衫男士韩版商务休闲寸衫潮流工装衣服纯棉半袖衬衣青年', 'http://localhost:8089/img/aa6ce8c6897c4d9a8ec034089d0d2b02.jpg', '96.00', '95', '夏季短袖衬衫男士韩版商务休闲寸衫潮流工装衣服纯棉半袖衬衣青年', '2021-02-28 22:00:36', '2021-02-28 22:04:42', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23868', 'nz2021022801', '秋冬牛仔裤男士束脚宽松潮牌冬季韩版潮流春季百搭休闲长裤子痞帅', '100101306', 'http://localhost:8089/img/2e76cc23a931425fb4690b5a8e18e40c.jpg,http://localhost:8089/img/57bbad821d1a45c18db462274963db3b.jpg,http://localhost:8089/img/7152a8658851464d8123a7110573555f.jpg,http://localhost:8089/img/a771cb0b0a1744299c690c0708d56ca0.jpg', '秋冬牛仔裤男士束脚宽松潮牌冬季韩版潮流春季百搭休闲长裤子痞帅', 'http://localhost:8089/img/3680f3bc643c468e87be64a17d211613.jpg', '195.00', '96', '秋冬牛仔裤男士束脚宽松潮牌冬季韩版潮流春季百搭休闲长裤子痞帅', '2021-02-28 22:07:55', '2021-02-28 22:14:33', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23869', 'nz2021022802', '牛仔裤男2021新款春季网红长裤直筒宽松韩版潮流ins港风百搭裤子', '100101305', 'http://localhost:8089/img/b715d30220cd4269bef8dace3be5a1d0.jpg,http://localhost:8089/img/ad870d46a20843a1929c706cf3223089.jpg,http://localhost:8089/img/7152df3ab72f4c77a51df3a5f4b7c56f.jpg,http://localhost:8089/img/a5b85597b2314398924edcf46b909a10.jpg', '牛仔裤男2021新款春季网红长裤直筒宽松韩版潮流ins港风百搭裤子', 'http://localhost:8089/img/f0665c88b23b46f4b55fc64881ffa6d1.jpg', '125.00', '56', '牛仔裤男2021新款春季网红长裤直筒宽松韩版潮流ins港风百搭裤子', '2021-02-28 22:09:44', '2021-02-28 22:27:19', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23870', 'nz2021022803', '花花公子春秋季牛仔裤男士潮牌韩版修身百搭黑色休闲小脚长裤子男', '100101306', 'http://localhost:8089/img/65f7f8b51eb94f57ad8d319a5b7cac84.jpg,http://localhost:8089/img/87e456b280eb4648b81619e1f86955b9.jpg,http://localhost:8089/img/152212faf1024a9e95f8eccf5d2c19fb.jpg,http://localhost:8089/img/43f9531fa08a4a9c838d7db52e4b2329.jpg', '花花公子春秋季牛仔裤男士潮牌韩版修身百搭黑色休闲小脚长裤子男', 'http://localhost:8089/img/3b5c366c244642e996132b8a91a094dc.jpg', '78.00', '56', '花花公子春秋季牛仔裤男士潮牌韩版修身百搭黑色休闲小脚长裤子男', '2021-02-28 22:11:33', '2021-02-28 22:14:51', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23871', 'nz2021022804', '牛仔裤潮牌春秋季款韩版潮流百搭直筒宽松男士2021新款休闲长裤子', '100101306', 'http://localhost:8089/img/0ab20adb792443318293db4eb958d686.jpg,http://localhost:8089/img/a9d23da768d646078500566a5e349480.jpg,http://localhost:8089/img/5b307be66bb04e31abfff79ed7917a14.jpg,http://localhost:8089/img/794272747e4942e195a91e484d79d98b.jpg', '牛仔裤男士春秋夏季宽松直筒韩版潮流小脚百搭潮牌阔腿休闲长裤子', 'http://localhost:8089/img/efee775e0cda496db2f0bbfdced9f2eb.jpg', '119.00', '56', '牛仔裤男士春秋夏季宽松直筒韩版潮流小脚百搭潮牌阔腿休闲长裤子', '2021-02-28 22:13:40', '2021-02-28 22:14:55', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23872', 'nz2021022805', '秋冬牛仔裤男士束脚宽松潮牌冬季韩版潮流春季百搭休闲长裤子痞帅', '100101306', 'http://localhost:8089/img/2e76cc23a931425fb4690b5a8e18e40c.jpg,http://localhost:8089/img/57bbad821d1a45c18db462274963db3b.jpg,http://localhost:8089/img/7152a8658851464d8123a7110573555f.jpg,http://localhost:8089/img/a771cb0b0a1744299c690c0708d56ca0.jpg', '秋冬牛仔裤男士束脚宽松潮牌冬季韩版潮流春季百搭休闲长裤子痞帅', 'http://localhost:8089/img/3680f3bc643c468e87be64a17d211613.jpg', '195.00', '96', '秋冬牛仔裤男士束脚宽松潮牌冬季韩版潮流春季百搭休闲长裤子痞帅', '2021-02-28 22:07:55', '2021-02-28 22:16:31', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23873', 'nz2021022806', '牛仔裤男2021新款春季网红长裤直筒宽松韩版潮流ins港风百搭裤子', '100101306', 'http://localhost:8089/img/b715d30220cd4269bef8dace3be5a1d0.jpg,http://localhost:8089/img/ad870d46a20843a1929c706cf3223089.jpg,http://localhost:8089/img/7152df3ab72f4c77a51df3a5f4b7c56f.jpg,http://localhost:8089/img/a5b85597b2314398924edcf46b909a10.jpg', '牛仔裤男2021新款春季网红长裤直筒宽松韩版潮流ins港风百搭裤子', 'http://localhost:8089/img/f0665c88b23b46f4b55fc64881ffa6d1.jpg', '125.00', '56', '牛仔裤男2021新款春季网红长裤直筒宽松韩版潮流ins港风百搭裤子', '2021-02-28 22:09:44', '2021-02-28 22:27:24', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23874', 'nz2021022807', '花花公子春秋季牛仔裤男士潮牌韩版修身百搭黑色休闲小脚长裤子男', '100101306', 'http://localhost:8089/img/65f7f8b51eb94f57ad8d319a5b7cac84.jpg,http://localhost:8089/img/87e456b280eb4648b81619e1f86955b9.jpg,http://localhost:8089/img/152212faf1024a9e95f8eccf5d2c19fb.jpg,http://localhost:8089/img/43f9531fa08a4a9c838d7db52e4b2329.jpg', '花花公子春秋季牛仔裤男士潮牌韩版修身百搭黑色休闲小脚长裤子男', 'http://localhost:8089/img/3b5c366c244642e996132b8a91a094dc.jpg', '78.00', '56', '花花公子春秋季牛仔裤男士潮牌韩版修身百搭黑色休闲小脚长裤子男', '2021-02-28 22:11:33', '2021-02-28 22:16:36', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23875', 'nz2021022808', '牛仔裤潮牌春秋季款韩版潮流百搭直筒宽松男士2021新款休闲长裤子', '100101306', 'http://localhost:8089/img/0ab20adb792443318293db4eb958d686.jpg,http://localhost:8089/img/a9d23da768d646078500566a5e349480.jpg,http://localhost:8089/img/5b307be66bb04e31abfff79ed7917a14.jpg,http://localhost:8089/img/794272747e4942e195a91e484d79d98b.jpg', '牛仔裤男士春秋夏季宽松直筒韩版潮流小脚百搭潮牌阔腿休闲长裤子', 'http://localhost:8089/img/efee775e0cda496db2f0bbfdced9f2eb.jpg', '119.00', '56', '牛仔裤男士春秋夏季宽松直筒韩版潮流小脚百搭潮牌阔腿休闲长裤子', '2021-02-28 22:13:40', '2021-02-28 22:16:39', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23876', 'fy2021022801', '秋冬加棉加厚毛呢外套男韩版潮风衣男中长款英伦风过膝大衣男宽松', '100101307', 'http://localhost:8089/img/d46db7b45dc3447e9088f17d1bcea21d.jpg,http://localhost:8089/img/51f275e1f82c4fbd8bb4d1a7311b8a62.jpg,http://localhost:8089/img/ce17a4de39b6426aa682fdef04868f86.jpg,http://localhost:8089/img/a32d019d1e84489b8010d922d48a8212.jpg', '秋冬加棉加厚毛呢外套男韩版潮风衣男中长款英伦风过膝大衣男宽松', 'http://localhost:8089/img/9168bb9426c540d7b498b3c7c6a07229.jpg', '512.00', '263', '秋冬加棉加厚毛呢外套男韩版潮风衣男中长款英伦风过膝大衣男宽松', '2021-02-28 22:19:16', '2021-02-28 22:32:04', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23877', 'fy2021022802', '秋冬季双面羊绒大衣男中长款高档韩版青年加厚风衣毛呢子男士外套', '100101307', 'http://localhost:8089/img/8ce54489fb7e4eb4933bdb76146648f1.jpg,http://localhost:8089/img/2937d5a04f9c4dcf98b87aaa0468ad44.jpg,http://localhost:8089/img/3f9d1f9f86ab46108dc18ce5aa978b53.jpg,http://localhost:8089/img/a0ff89530a5f448a8db566217d79a6e4.jpg', '秋冬季双面羊绒大衣男中长款高档韩版青年加厚风衣毛呢子男士外套', 'http://localhost:8089/img/498a55fab1de41c1a4cb0b47388c0b54.jpg', '795.00', '89', '秋冬季双面羊绒大衣男中长款高档韩版青年加厚风衣毛呢子男士外套', '2021-02-28 22:21:45', '2021-02-28 22:32:14', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23878', 'fy2021022803', '100%澳毛双面羊毛大衣男中长款可拆卸桑蚕丝内胆秋冬加厚外套风衣', '100101307', 'http://localhost:8089/img/92bb69444dba4f2a9c8bdaaf8b78dd21.jpg,http://localhost:8089/img/ef90ae0938524f83957558138e66b47c.jpg,http://localhost:8089/img/854aef312ca646d2a6022f1cf0e84d62.jpg,http://localhost:8089/img/66a57cc85c40497eafedc9bcd3df16e1.jpg', '100%澳毛双面羊毛大衣男中长款可拆卸桑蚕丝内胆秋冬加厚外套风衣', 'http://localhost:8089/img/f7179cf0046e42369a3fd72b551e5eb5.jpg', '234.00', '456', '100%澳毛双面羊毛大衣男中长款可拆卸桑蚕丝内胆秋冬加厚外套风衣', '2021-02-28 22:24:32', '2021-02-28 22:32:09', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23879', 'fy2021022804', '冬季韩国英伦风毛呢男士中长款双面羊绒大衣休闲潮流风衣羊毛外套', '100101307', 'http://localhost:8089/img/904073b12289437487c1167d322cf10c.jpg,http://localhost:8089/img/69cf79c5507a4a519c107e89c956d9ef.jpg,http://localhost:8089/img/720f9dc40b1f47dfa3fe415a59d91418.jpg,http://localhost:8089/img/a562c05046324ebcb774c19dfa0c1fc4.jpg', '冬季韩国英伦风毛呢男士中长款双面羊绒大衣休闲潮流风衣羊毛外套', 'http://localhost:8089/img/9c01a95be23645fcb19824dac26bad60.jpg', '895.00', '236', '冬季韩国英伦风毛呢男士中长款双面羊绒大衣休闲潮流风衣羊毛外套', '2021-02-28 22:26:11', '2021-02-28 22:32:26', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23880', 'fy2021022805', '秋冬加棉加厚毛呢外套男韩版潮风衣男中长款英伦风过膝大衣男宽松', '100101307', 'http://localhost:8089/img/d46db7b45dc3447e9088f17d1bcea21d.jpg,http://localhost:8089/img/51f275e1f82c4fbd8bb4d1a7311b8a62.jpg,http://localhost:8089/img/ce17a4de39b6426aa682fdef04868f86.jpg,http://localhost:8089/img/a32d019d1e84489b8010d922d48a8212.jpg', '秋冬加棉加厚毛呢外套男韩版潮风衣男中长款英伦风过膝大衣男宽松', 'http://localhost:8089/img/9168bb9426c540d7b498b3c7c6a07229.jpg', '512.00', '263', '秋冬加棉加厚毛呢外套男韩版潮风衣男中长款英伦风过膝大衣男宽松', '2021-02-28 22:19:16', '2021-02-28 22:32:29', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23881', 'fy2021022806', '秋冬季双面羊绒大衣男中长款高档韩版青年加厚风衣毛呢子男士外套', '100101307', 'http://localhost:8089/img/8ce54489fb7e4eb4933bdb76146648f1.jpg,http://localhost:8089/img/2937d5a04f9c4dcf98b87aaa0468ad44.jpg,http://localhost:8089/img/3f9d1f9f86ab46108dc18ce5aa978b53.jpg,http://localhost:8089/img/a0ff89530a5f448a8db566217d79a6e4.jpg', '秋冬季双面羊绒大衣男中长款高档韩版青年加厚风衣毛呢子男士外套', 'http://localhost:8089/img/498a55fab1de41c1a4cb0b47388c0b54.jpg', '795.00', '89', '秋冬季双面羊绒大衣男中长款高档韩版青年加厚风衣毛呢子男士外套', '2021-02-28 22:21:45', '2021-02-28 22:32:32', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23882', 'fy2021022807', '100%澳毛双面羊毛大衣男中长款可拆卸桑蚕丝内胆秋冬加厚外套风衣', '100101307', 'http://localhost:8089/img/92bb69444dba4f2a9c8bdaaf8b78dd21.jpg,http://localhost:8089/img/ef90ae0938524f83957558138e66b47c.jpg,http://localhost:8089/img/854aef312ca646d2a6022f1cf0e84d62.jpg,http://localhost:8089/img/66a57cc85c40497eafedc9bcd3df16e1.jpg', '100%澳毛双面羊毛大衣男中长款可拆卸桑蚕丝内胆秋冬加厚外套风衣', 'http://localhost:8089/img/f7179cf0046e42369a3fd72b551e5eb5.jpg', '234.00', '456', '100%澳毛双面羊毛大衣男中长款可拆卸桑蚕丝内胆秋冬加厚外套风衣', '2021-02-28 22:24:32', '2021-02-28 22:32:36', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23883', 'fy2021022808', '冬季韩国英伦风毛呢男士中长款双面羊绒大衣休闲潮流风衣羊毛外套', '100101307', 'http://localhost:8089/img/904073b12289437487c1167d322cf10c.jpg,http://localhost:8089/img/69cf79c5507a4a519c107e89c956d9ef.jpg,http://localhost:8089/img/720f9dc40b1f47dfa3fe415a59d91418.jpg,http://localhost:8089/img/a562c05046324ebcb774c19dfa0c1fc4.jpg', '冬季韩国英伦风毛呢男士中长款双面羊绒大衣休闲潮流风衣羊毛外套', 'http://localhost:8089/img/9c01a95be23645fcb19824dac26bad60.jpg', '895.00', '236', '冬季韩国英伦风毛呢男士中长款双面羊绒大衣休闲潮流风衣羊毛外套', '2021-02-28 22:26:11', '2021-02-28 22:32:39', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23884', 'my2021022801', '男士中长款羽绒棉服潮流2020年新款男装冬装外套棉衣冬季加厚棉袄', '100101308', 'http://localhost:8089/img/5be43c09c3044177838ffa5bd3a9f8a5.jpg,http://localhost:8089/img/2cd23da0dab948149a05aba419054425.jpg,http://localhost:8089/img/00e40453ac1c4383afbde3f4a9b212da.jpg,http://localhost:8089/img/d5502383421c43879127e78c292fbb0a.jpg', '男士中长款羽绒棉服潮流2020年新款男装冬装外套棉衣冬季加厚棉袄', 'http://localhost:8089/img/b335df4e237a44a6ac32a70b8c6b398e.jpg', '652.00', '98', '男士中长款羽绒棉服潮流2020年新款男装冬装外套棉衣冬季加厚棉袄男士中长款羽绒棉服潮流2020年新款男装冬装外套棉衣冬季加厚棉袄', '2021-02-28 22:34:47', '2021-02-28 22:41:22', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23885', 'my2021022802', 'ins棉衣男冬季加厚加绒港风宽松青少年防寒外套保暖潮流大码棉袄', '100101308', 'http://localhost:8089/img/b77e9ccbdd3f419cb86f6365bd0071be.jpg,http://localhost:8089/img/320860c07968467d96ca0d80cd109441.jpg,http://localhost:8089/img/10336e801c694c9daeef250fb643ad60.jpg,http://localhost:8089/img/cf74c5143fb4435a9513fdd63b2e982d.jpg', 'ins棉衣男冬季加厚加绒港风宽松青少年防寒外套保暖潮流大码棉袄', 'http://localhost:8089/img/e6429af0787d44b5bf793485107c2c80.jpg', '120.00', '452', 'ins棉衣男冬季加厚加绒港风宽松青少年防寒外套保暖潮流大码棉袄\nins棉衣男冬季加厚加绒港风宽松青少年防寒外套保暖潮流大码棉袄\n', '2021-02-28 22:36:07', '2021-02-28 22:41:41', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23886', 'my2021022803', '棉衣男士冬季外套2020年新款韩版潮流短款棉袄羽绒棉服潮牌冬装男', '100101308', 'http://localhost:8089/img/81cc3ddfd87545cda167eeefc80c6194.jpg,http://localhost:8089/img/c8e56f3941854aba962c752ba48ec526.jpg,http://localhost:8089/img/0adcb328b7b24fb2a4d5965ef77ad4eb.jpg,http://localhost:8089/img/6c68db1fda07432e91b17a83bffc87b2.jpg', '棉衣男士冬季外套2020年新款韩版潮流短款棉袄羽绒棉服潮牌冬装男', 'http://localhost:8089/img/e0d03f81bcc04b958ac5d99f518ddd68.jpg', '120.00', '56', '棉衣男士冬季外套2020年新款韩版潮流短款棉袄羽绒棉服潮牌冬装男\n棉衣男士冬季外套2020年新款韩版潮流短款棉袄羽绒棉服潮牌冬装男\n', '2021-02-28 22:37:15', '2021-02-28 22:41:48', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23887', 'my2021022804', '冬季棉服男ins港风棉袄韩版潮流帅气学生加厚棉衣外套宽松面包服', '100101308', 'http://localhost:8089/img/794d48b06ed548f8b6cb17948b028adc.jpg,http://localhost:8089/img/6e0d7842d6124997a89995cec4d9c087.jpg,http://localhost:8089/img/a5ebf494f1854c3b9fc2e3b98cd33338.jpg,http://localhost:8089/img/f8cdec3a0c01424e95928eff78b933f8.jpg', '冬季棉服男ins港风棉袄韩版潮流帅气学生加厚棉衣外套宽松面包服', 'http://localhost:8089/img/a7e204791a70416c87d8732c0a2005da.jpg', '568.00', '89', '冬季棉服男ins港风棉袄韩版潮流帅气学生加厚棉衣外套宽松面包服\n冬季棉服男ins港风棉袄韩版潮流帅气学生加厚棉衣外套宽松面包服\n', '2021-02-28 22:40:59', '2021-02-28 22:41:51', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23888', 'my2021022805', '男士中长款羽绒棉服潮流2020年新款男装冬装外套棉衣冬季加厚棉袄', '100101308', 'http://localhost:8089/img/5be43c09c3044177838ffa5bd3a9f8a5.jpg,http://localhost:8089/img/2cd23da0dab948149a05aba419054425.jpg,http://localhost:8089/img/00e40453ac1c4383afbde3f4a9b212da.jpg,http://localhost:8089/img/d5502383421c43879127e78c292fbb0a.jpg', '男士中长款羽绒棉服潮流2020年新款男装冬装外套棉衣冬季加厚棉袄', 'http://localhost:8089/img/b335df4e237a44a6ac32a70b8c6b398e.jpg', '652.00', '98', '男士中长款羽绒棉服潮流2020年新款男装冬装外套棉衣冬季加厚棉袄男士中长款羽绒棉服潮流2020年新款男装冬装外套棉衣冬季加厚棉袄', '2021-02-28 22:34:47', '2021-02-28 22:41:22', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23889', 'my2021022806', 'ins棉衣男冬季加厚加绒港风宽松青少年防寒外套保暖潮流大码棉袄', '100101308', 'http://localhost:8089/img/b77e9ccbdd3f419cb86f6365bd0071be.jpg,http://localhost:8089/img/320860c07968467d96ca0d80cd109441.jpg,http://localhost:8089/img/10336e801c694c9daeef250fb643ad60.jpg,http://localhost:8089/img/cf74c5143fb4435a9513fdd63b2e982d.jpg', 'ins棉衣男冬季加厚加绒港风宽松青少年防寒外套保暖潮流大码棉袄', 'http://localhost:8089/img/e6429af0787d44b5bf793485107c2c80.jpg', '120.00', '452', 'ins棉衣男冬季加厚加绒港风宽松青少年防寒外套保暖潮流大码棉袄\nins棉衣男冬季加厚加绒港风宽松青少年防寒外套保暖潮流大码棉袄\n', '2021-02-28 22:36:07', '2021-02-28 22:41:41', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23890', 'my2021022807', '棉衣男士冬季外套2020年新款韩版潮流短款棉袄羽绒棉服潮牌冬装男', '100101308', 'http://localhost:8089/img/81cc3ddfd87545cda167eeefc80c6194.jpg,http://localhost:8089/img/c8e56f3941854aba962c752ba48ec526.jpg,http://localhost:8089/img/0adcb328b7b24fb2a4d5965ef77ad4eb.jpg,http://localhost:8089/img/6c68db1fda07432e91b17a83bffc87b2.jpg', '棉衣男士冬季外套2020年新款韩版潮流短款棉袄羽绒棉服潮牌冬装男', 'http://localhost:8089/img/e0d03f81bcc04b958ac5d99f518ddd68.jpg', '120.00', '56', '棉衣男士冬季外套2020年新款韩版潮流短款棉袄羽绒棉服潮牌冬装男\n棉衣男士冬季外套2020年新款韩版潮流短款棉袄羽绒棉服潮牌冬装男\n', '2021-02-28 22:37:15', '2021-02-28 22:41:48', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23891', 'my2021022808', '冬季棉服男ins港风棉袄韩版潮流帅气学生加厚棉衣外套宽松面包服', '100101308', 'http://localhost:8089/img/794d48b06ed548f8b6cb17948b028adc.jpg,http://localhost:8089/img/6e0d7842d6124997a89995cec4d9c087.jpg,http://localhost:8089/img/a5ebf494f1854c3b9fc2e3b98cd33338.jpg,http://localhost:8089/img/f8cdec3a0c01424e95928eff78b933f8.jpg', '冬季棉服男ins港风棉袄韩版潮流帅气学生加厚棉衣外套宽松面包服', 'http://localhost:8089/img/a7e204791a70416c87d8732c0a2005da.jpg', '568.00', '89', '冬季棉服男ins港风棉袄韩版潮流帅气学生加厚棉衣外套宽松面包服\n冬季棉服男ins港风棉袄韩版潮流帅气学生加厚棉衣外套宽松面包服\n', '2021-02-28 22:40:59', '2021-02-28 22:41:51', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23892', 'py2021022801', 'VICUTU/威可多皮衣男士春季新款皮夹克真皮毛领可拆卸翻领外套男', '100101310', 'http://localhost:8089/img/2b175d4469d54747b98f506cc78a3489.jpg,http://localhost:8089/img/1e3226a823de4f699c3d2f50f4904e7c.jpg,http://localhost:8089/img/5081e2e9e0684644bd5e4e79dcd5a28d.jpg,http://localhost:8089/img/b7d4d96f285a46b382bfed9ae0b5e196.jpg', 'VICUTU/威可多皮衣男士春季新款皮夹克真皮毛领可拆卸翻领外套男', 'http://localhost:8089/img/b0e83e9e560543fb9871757420560a1b.jpg', '789.00', '23', 'VICUTU/威可多皮衣男士春季新款皮夹克真皮毛领可拆卸翻领外套男\nVICUTU/威可多皮衣男士春季新款皮夹克真皮毛领可拆卸翻领外套男\n', '2021-02-28 22:45:06', '2021-02-28 22:52:45', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23893', 'py2021022802', 'VICUTU/威可多商场同款皮衣男中长款黑色绵羊皮翻领修身风衣男', '100101310', 'http://localhost:8089/img/c558d981e1084f6db63a52e9788659c9.jpg,http://localhost:8089/img/170300330b4649b5826737bdc34faf65.jpg,http://localhost:8089/img/0ce10859d7724b5792a3eb21b6dedde1.jpg,http://localhost:8089/img/daa4e075e90d40c1a7e81a3dec02ef6c.jpg', 'VICUTU/威可多商场同款皮衣男中长款黑色绵羊皮翻领修身风衣男', 'http://localhost:8089/img/b3eb177a033042dabef0b7163e8094c9.jpg', '789.00', '56', 'VICUTU/威可多商场同款皮衣男中长款黑色绵羊皮翻领修身风衣男\nVICUTU/威可多商场同款皮衣男中长款黑色绵羊皮翻领修身风衣男\n', '2021-02-28 22:46:08', '2021-02-28 22:52:48', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23894', 'py2021022803', '真皮皮衣男春秋季新款韩版修身潮流加绒夹克男士帅气薄款机车外套', '100101310', 'http://localhost:8089/img/9f7f46b170564604bc709c17a8b1c26f.jpg,http://localhost:8089/img/95953ed8cf79480f878f65317cdb11c5.jpg,http://localhost:8089/img/cd48e4f4b2b64a18a9d9012eb1244f7d.jpg,http://localhost:8089/img/e9e51359a34c49a29f13fd2609c91f1c.jpg', '真皮皮衣男春秋季新款韩版修身潮流加绒夹克男士帅气薄款机车外套', 'http://localhost:8089/img/fa180ecc4c4744a79264629888db05a7.jpg', '456.00', '47', '真皮皮衣男春秋季新款韩版修身潮流加绒夹克男士帅气薄款机车外套\n真皮皮衣男春秋季新款韩版修身潮流加绒夹克男士帅气薄款机车外套\n', '2021-02-28 22:48:04', '2021-02-28 22:52:51', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23895', 'py2021022804', '啄木鸟海宁皮毛一体皮草翻领皮夹克真皮皮衣男青年绵羊皮修身外套', '100101310', 'http://localhost:8089/img/2d236d890c534e90b3b7b57ed882d159.jpg,http://localhost:8089/img/d75f1a9fd4394d11976c163bae96d104.jpg,http://localhost:8089/img/834d638f9a3449609cdb8b13cfb8cb27.jpg,http://localhost:8089/img/4d1d07fb3fe749a8b370b63b1df181da.jpg', '啄木鸟海宁皮毛一体皮草翻领皮夹克真皮皮衣男青年绵羊皮修身外套', 'http://localhost:8089/img/45808d9edc774404a78572157baba26f.jpg', '852.00', '85', '啄木鸟海宁皮毛一体皮草翻领皮夹克真皮皮衣男青年绵羊皮修身外套\n啄木鸟海宁皮毛一体皮草翻领皮夹克真皮皮衣男青年绵羊皮修身外套\n', '2021-02-28 22:52:17', '2021-02-28 22:52:56', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23896', 'py2021022805', 'VICUTU/威可多皮衣男士春季新款皮夹克真皮毛领可拆卸翻领外套男', '100101310', 'http://localhost:8089/img/2b175d4469d54747b98f506cc78a3489.jpg,http://localhost:8089/img/1e3226a823de4f699c3d2f50f4904e7c.jpg,http://localhost:8089/img/5081e2e9e0684644bd5e4e79dcd5a28d.jpg,http://localhost:8089/img/b7d4d96f285a46b382bfed9ae0b5e196.jpg', 'VICUTU/威可多皮衣男士春季新款皮夹克真皮毛领可拆卸翻领外套男', 'http://localhost:8089/img/b0e83e9e560543fb9871757420560a1b.jpg', '789.00', '23', 'VICUTU/威可多皮衣男士春季新款皮夹克真皮毛领可拆卸翻领外套男\nVICUTU/威可多皮衣男士春季新款皮夹克真皮毛领可拆卸翻领外套男\n', '2021-02-28 22:45:06', '2021-02-28 22:52:45', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23897', 'py2021022806', 'VICUTU/威可多商场同款皮衣男中长款黑色绵羊皮翻领修身风衣男', '100101310', 'http://localhost:8089/img/c558d981e1084f6db63a52e9788659c9.jpg,http://localhost:8089/img/170300330b4649b5826737bdc34faf65.jpg,http://localhost:8089/img/0ce10859d7724b5792a3eb21b6dedde1.jpg,http://localhost:8089/img/daa4e075e90d40c1a7e81a3dec02ef6c.jpg', 'VICUTU/威可多商场同款皮衣男中长款黑色绵羊皮翻领修身风衣男', 'http://localhost:8089/img/b3eb177a033042dabef0b7163e8094c9.jpg', '789.00', '56', 'VICUTU/威可多商场同款皮衣男中长款黑色绵羊皮翻领修身风衣男\nVICUTU/威可多商场同款皮衣男中长款黑色绵羊皮翻领修身风衣男\n', '2021-02-28 22:46:08', '2021-02-28 22:52:48', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23898', 'py2021022807', '真皮皮衣男春秋季新款韩版修身潮流加绒夹克男士帅气薄款机车外套', '100101310', 'http://localhost:8089/img/9f7f46b170564604bc709c17a8b1c26f.jpg,http://localhost:8089/img/95953ed8cf79480f878f65317cdb11c5.jpg,http://localhost:8089/img/cd48e4f4b2b64a18a9d9012eb1244f7d.jpg,http://localhost:8089/img/e9e51359a34c49a29f13fd2609c91f1c.jpg', '真皮皮衣男春秋季新款韩版修身潮流加绒夹克男士帅气薄款机车外套', 'http://localhost:8089/img/fa180ecc4c4744a79264629888db05a7.jpg', '456.00', '47', '真皮皮衣男春秋季新款韩版修身潮流加绒夹克男士帅气薄款机车外套\n真皮皮衣男春秋季新款韩版修身潮流加绒夹克男士帅气薄款机车外套\n', '2021-02-28 22:48:04', '2021-02-28 22:52:51', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23899', 'py2021022808', '啄木鸟海宁皮毛一体皮草翻领皮夹克真皮皮衣男青年绵羊皮修身外套', '100101310', 'http://localhost:8089/img/2d236d890c534e90b3b7b57ed882d159.jpg,http://localhost:8089/img/d75f1a9fd4394d11976c163bae96d104.jpg,http://localhost:8089/img/834d638f9a3449609cdb8b13cfb8cb27.jpg,http://localhost:8089/img/4d1d07fb3fe749a8b370b63b1df181da.jpg', '啄木鸟海宁皮毛一体皮草翻领皮夹克真皮皮衣男青年绵羊皮修身外套', 'http://localhost:8089/img/45808d9edc774404a78572157baba26f.jpg', '852.00', '85', '啄木鸟海宁皮毛一体皮草翻领皮夹克真皮皮衣男青年绵羊皮修身外套\n啄木鸟海宁皮毛一体皮草翻领皮夹克真皮皮衣男青年绵羊皮修身外套\n', '2021-02-28 22:52:17', '2021-02-28 22:52:56', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23900', 'yz2021022801', 'CC皮草“貂貂帽“水貂毛领帽子白鹅绒显瘦长短款年轻新款羽绒服女', '100101309', 'http://localhost:8089/img/ccd45cfe75f543eab6bf0bc163467d78.jpg,http://localhost:8089/img/5eec0fca080949e2912a8e4f4d29ba35.jpg,http://localhost:8089/img/17b7930e905e43058a119a7b00fab739.jpg,http://localhost:8089/img/1da5fb6ad3df4c67a7d987a296063274.jpg', 'CC皮草“貂貂帽“水貂毛领帽子白鹅绒显瘦长短款年轻新款羽绒服女', 'http://localhost:8089/img/03388d4fd3d043c4aa59151787782f70.jpg', '452.00', '78', 'CC皮草“貂貂帽“水貂毛领帽子白鹅绒显瘦长短款年轻新款羽绒服女\n', '2021-02-28 22:56:41', '2021-02-28 23:04:41', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23901', 'yz2021022802', '优衣库 女装 无缝羽绒大衣 429467 UNIQLO', '100101309', 'http://localhost:8089/img/c18ee1f2dc9e49d3857a6a1540cefe3b.jpg,http://localhost:8089/img/1692a21f890a4190880e1d5c7d59a044.jpg,http://localhost:8089/img/44a7105c54c744c98cae311479615845.jpg', '优衣库 女装 无缝羽绒大衣 429467 UNIQLO', 'http://localhost:8089/img/48307ca879d34c048639f8d3fe2a8baa.jpg', '699.00', '89', '优衣库 女装 无缝羽绒大衣 429467 UNIQLO\n优衣库 女装 无缝羽绒大衣 429467 UNIQLO\n', '2021-02-28 22:58:30', '2021-02-28 23:04:47', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23902', 'yz2021022803', '2020年冬季新款妈妈中长款白鸭绒爆款羽绒服女韩版加厚黑色白外套', '100101309', 'http://localhost:8089/img/34268e7094c3441f81f7c8ef5559c8f6.jpg,http://localhost:8089/img/726e7674f17646aaaea7bf5e06de5cb3.jpg,http://localhost:8089/img/ca16a8833194490bb1d6616a5a08e3f8.jpg,http://localhost:8089/img/da7fc4186acf4d7fbcb6dbd150fb62b0.jpg', '2020年冬季新款妈妈中长款白鸭绒爆款羽绒服女韩版加厚黑色白外套', 'http://localhost:8089/img/10ae9f7faf9f4d8282f453b533ebbff8.jpg', '465.00', '75', '2020年冬季新款妈妈中长款白鸭绒爆款羽绒服女韩版加厚黑色白外套\n2020年冬季新款妈妈中长款白鸭绒爆款羽绒服女韩版加厚黑色白外套\n', '2021-02-28 23:03:21', '2021-02-28 23:06:05', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23903', 'yz2021022804', 'VEEE羽绒服女中长款2020冬季新款韩版宽松显瘦过膝加厚白鸭绒外套', '100101309', 'http://localhost:8089/img/335993a53941459da67d99f1f97fc511.jpg,http://localhost:8089/img/e358b60aebfe47adad518c255969aa50.jpg,http://localhost:8089/img/929a59fa9b7d426599a723e79cdc992b.jpg,http://localhost:8089/img/9adf8312bdc741a688915ad1ed67bf14.jpg', 'VEEE羽绒服女中长款2020冬季新款韩版宽松显瘦过膝加厚白鸭绒外套', 'http://localhost:8089/img/293a69a2bff141089b6b1103ab77e048.jpg', '753.00', '95', 'VEEE羽绒服女中长款2020冬季新款韩版宽松显瘦过膝加厚白鸭绒外套\nVEEE羽绒服女中长款2020冬季新款韩版宽松显瘦过膝加厚白鸭绒外套\n', '2021-02-28 23:04:23', '2021-02-28 23:06:03', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23904', 'yz2021022805', 'CC皮草“貂貂帽“水貂毛领帽子白鹅绒显瘦长短款年轻新款羽绒服女', '100101309', 'http://localhost:8089/img/ccd45cfe75f543eab6bf0bc163467d78.jpg,http://localhost:8089/img/5eec0fca080949e2912a8e4f4d29ba35.jpg,http://localhost:8089/img/17b7930e905e43058a119a7b00fab739.jpg,http://localhost:8089/img/1da5fb6ad3df4c67a7d987a296063274.jpg', 'CC皮草“貂貂帽“水貂毛领帽子白鹅绒显瘦长短款年轻新款羽绒服女', 'http://localhost:8089/img/03388d4fd3d043c4aa59151787782f70.jpg', '452.00', '78', 'CC皮草“貂貂帽“水貂毛领帽子白鹅绒显瘦长短款年轻新款羽绒服女\n', '2021-02-28 22:56:41', '2021-02-28 23:04:41', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23905', 'yz2021022806', '优衣库 女装 无缝羽绒大衣 429467 UNIQLO', '100101309', 'http://localhost:8089/img/c18ee1f2dc9e49d3857a6a1540cefe3b.jpg,http://localhost:8089/img/1692a21f890a4190880e1d5c7d59a044.jpg,http://localhost:8089/img/44a7105c54c744c98cae311479615845.jpg', '优衣库 女装 无缝羽绒大衣 429467 UNIQLO', 'http://localhost:8089/img/48307ca879d34c048639f8d3fe2a8baa.jpg', '699.00', '89', '优衣库 女装 无缝羽绒大衣 429467 UNIQLO\n优衣库 女装 无缝羽绒大衣 429467 UNIQLO\n', '2021-02-28 22:58:30', '2021-02-28 23:04:47', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23906', 'yz2021022807', '2020年冬季新款妈妈中长款白鸭绒爆款羽绒服女韩版加厚黑色白外套', '100101309', 'http://localhost:8089/img/34268e7094c3441f81f7c8ef5559c8f6.jpg,http://localhost:8089/img/726e7674f17646aaaea7bf5e06de5cb3.jpg,http://localhost:8089/img/ca16a8833194490bb1d6616a5a08e3f8.jpg,http://localhost:8089/img/da7fc4186acf4d7fbcb6dbd150fb62b0.jpg', '2020年冬季新款妈妈中长款白鸭绒爆款羽绒服女韩版加厚黑色白外套', 'http://localhost:8089/img/10ae9f7faf9f4d8282f453b533ebbff8.jpg', '465.00', '75', '2020年冬季新款妈妈中长款白鸭绒爆款羽绒服女韩版加厚黑色白外套\n2020年冬季新款妈妈中长款白鸭绒爆款羽绒服女韩版加厚黑色白外套\n', '2021-02-28 23:03:21', '2021-02-28 23:06:00', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23907', 'yz2021022808', 'VEEE羽绒服女中长款2020冬季新款韩版宽松显瘦过膝加厚白鸭绒外套', '100101309', 'http://localhost:8089/img/335993a53941459da67d99f1f97fc511.jpg,http://localhost:8089/img/e358b60aebfe47adad518c255969aa50.jpg,http://localhost:8089/img/929a59fa9b7d426599a723e79cdc992b.jpg,http://localhost:8089/img/9adf8312bdc741a688915ad1ed67bf14.jpg', 'VEEE羽绒服女中长款2020冬季新款韩版宽松显瘦过膝加厚白鸭绒外套', 'http://localhost:8089/img/293a69a2bff141089b6b1103ab77e048.jpg', '753.00', '95', 'VEEE羽绒服女中长款2020冬季新款韩版宽松显瘦过膝加厚白鸭绒外套\nVEEE羽绒服女中长款2020冬季新款韩版宽松显瘦过膝加厚白鸭绒外套\n', '2021-02-28 23:04:23', '2021-02-28 23:06:02', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23908', 'wk2021022801', '裤子男灰色运动卫裤2021年新款宽松春秋季男士休闲长裤子春款棉裤', '100101311', 'http://localhost:8089/img/7b09d6e207f64dc59ce2c55116cebc08.jpg,http://localhost:8089/img/c15bca83102b47df9e3971df1b3ad851.jpg,http://localhost:8089/img/0443d67f3ffa4aaf851c682251c9888b.jpg', '裤子男灰色运动卫裤2021年新款宽松春秋季男士休闲长裤子春款棉裤', 'http://localhost:8089/img/3c8eb241651c43f1be51338a800fd7bd.jpg', '126.00', '85', '裤子男灰色运动卫裤2021年新款宽松春秋季男士休闲长裤子春款棉裤\n裤子男灰色运动卫裤2021年新款宽松春秋季男士休闲长裤子春款棉裤\n', '2021-02-28 23:07:21', '2021-03-01 16:09:51', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23909', 'wk2021022802', '灯芯绒裤子男士秋冬季运动卫裤潮流百搭直筒宽松阔腿加绒休闲长裤', '100101311', 'http://localhost:8089/img/11ff588525ba4c629933e44a06c40d38.jpg,http://localhost:8089/img/67c4de0e94c4455e906595cca51c355f.jpg,http://localhost:8089/img/15df42d53bad4836a0c150047e8f4611.jpg,http://localhost:8089/img/3221d5416f8f4918a61567b3ef3c6fca.jpg', '灯芯绒裤子男士秋冬季运动卫裤潮流百搭直筒宽松阔腿加绒休闲长裤', 'http://localhost:8089/img/53a27bf7c64146b9bf922a518cbe9b8a.jpg', '85.00', '96', '灯芯绒裤子男士秋冬季运动卫裤潮流百搭直筒宽松阔腿加绒休闲长裤\n灯芯绒裤子男士秋冬季运动卫裤潮流百搭直筒宽松阔腿加绒休闲长裤\n', '2021-02-28 23:08:55', '2021-03-01 16:09:53', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23910', 'wk2021022803', '运动裤春季束脚裤男士休闲宽松小脚春秋款长裤冬季加绒加厚潮卫裤', '100101311', 'http://localhost:8089/img/5185c005fed24829b72449984642a198.jpg,http://localhost:8089/img/1872b7bf10304ca3be3d9783c0559938.jpg,http://localhost:8089/img/cfbb8fdabb0e4643ab4bb2178c7fd2b4.jpg,http://localhost:8089/img/c887d49b9b364f98b4363d366595f974.jpg', '运动裤春季束脚裤男士休闲宽松小脚春秋款长裤冬季加绒加厚潮卫裤', 'http://localhost:8089/img/32d5caef8e67462cafd2bdaeb6e8e80f.jpg', '78.00', '62', '运动裤春季束脚裤男士休闲宽松小脚春秋款长裤冬季加绒加厚潮卫裤\n运动裤春季束脚裤男士休闲宽松小脚春秋款长裤冬季加绒加厚潮卫裤\n', '2021-02-28 23:09:56', '2021-03-01 16:09:55', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23911', 'wk2021022804', '裤子男春秋季韩版潮牌休闲长裤ins港风潮流三条杠直筒运动卫裤男', '100101311', 'http://localhost:8089/img/158b2b2fb3184b8b9979dd84a79f95c2.jpg,http://localhost:8089/img/302bf36966794afa82ad5d7b8ab437f7.jpg,http://localhost:8089/img/d2495fbf464343d885892a5eca2877ac.jpg,http://localhost:8089/img/6ba5033eb22b422786d114f0b85321a9.jpg', '裤子男春秋季韩版潮牌休闲长裤ins港风潮流三条杠直筒运动卫裤男', 'http://localhost:8089/img/100cd67b0efa493cb46b009e9583e5de.jpg', '85.00', '23', '裤子男春秋季韩版潮牌休闲长裤ins港风潮流三条杠直筒运动卫裤男\n裤子男春秋季韩版潮牌休闲长裤ins港风潮流三条杠直筒运动卫裤男\n', '2021-02-28 23:12:13', '2021-03-01 16:09:58', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23912', 'wk2021022805', '裤子男灰色运动卫裤2021年新款宽松春秋季男士休闲长裤子春款棉裤', '100101311', 'http://localhost:8089/img/7b09d6e207f64dc59ce2c55116cebc08.jpg,http://localhost:8089/img/c15bca83102b47df9e3971df1b3ad851.jpg,http://localhost:8089/img/0443d67f3ffa4aaf851c682251c9888b.jpg', '裤子男灰色运动卫裤2021年新款宽松春秋季男士休闲长裤子春款棉裤', 'http://localhost:8089/img/3c8eb241651c43f1be51338a800fd7bd.jpg', '126.00', '85', '裤子男灰色运动卫裤2021年新款宽松春秋季男士休闲长裤子春款棉裤\n裤子男灰色运动卫裤2021年新款宽松春秋季男士休闲长裤子春款棉裤\n', '2021-02-28 23:07:21', '2021-03-01 16:10:00', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23913', 'wk2021022806', '灯芯绒裤子男士秋冬季运动卫裤潮流百搭直筒宽松阔腿加绒休闲长裤', '100101311', 'http://localhost:8089/img/11ff588525ba4c629933e44a06c40d38.jpg,http://localhost:8089/img/67c4de0e94c4455e906595cca51c355f.jpg,http://localhost:8089/img/15df42d53bad4836a0c150047e8f4611.jpg,http://localhost:8089/img/3221d5416f8f4918a61567b3ef3c6fca.jpg', '灯芯绒裤子男士秋冬季运动卫裤潮流百搭直筒宽松阔腿加绒休闲长裤', 'http://localhost:8089/img/53a27bf7c64146b9bf922a518cbe9b8a.jpg', '85.00', '96', '灯芯绒裤子男士秋冬季运动卫裤潮流百搭直筒宽松阔腿加绒休闲长裤\n灯芯绒裤子男士秋冬季运动卫裤潮流百搭直筒宽松阔腿加绒休闲长裤\n', '2021-02-28 23:08:55', '2021-03-01 16:10:02', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23914', 'wk2021022807', '运动裤春季束脚裤男士休闲宽松小脚春秋款长裤冬季加绒加厚潮卫裤', '100101311', 'http://localhost:8089/img/5185c005fed24829b72449984642a198.jpg,http://localhost:8089/img/1872b7bf10304ca3be3d9783c0559938.jpg,http://localhost:8089/img/cfbb8fdabb0e4643ab4bb2178c7fd2b4.jpg,http://localhost:8089/img/c887d49b9b364f98b4363d366595f974.jpg', '运动裤春季束脚裤男士休闲宽松小脚春秋款长裤冬季加绒加厚潮卫裤', 'http://localhost:8089/img/32d5caef8e67462cafd2bdaeb6e8e80f.jpg', '78.00', '62', '运动裤春季束脚裤男士休闲宽松小脚春秋款长裤冬季加绒加厚潮卫裤\n运动裤春季束脚裤男士休闲宽松小脚春秋款长裤冬季加绒加厚潮卫裤\n', '2021-02-28 23:09:56', '2021-03-01 16:10:04', '0', '0', '0', '0', null);
INSERT INTO `mall_goods` VALUES ('23915', 'wk2021022808', '裤子男春秋季韩版潮牌休闲长裤ins港风潮流三条杠直筒运动卫裤男', '100101311', 'http://localhost:8089/img/158b2b2fb3184b8b9979dd84a79f95c2.jpg,http://localhost:8089/img/302bf36966794afa82ad5d7b8ab437f7.jpg,http://localhost:8089/img/d2495fbf464343d885892a5eca2877ac.jpg,http://localhost:8089/img/6ba5033eb22b422786d114f0b85321a9.jpg', '裤子男春秋季韩版潮牌休闲长裤ins港风潮流三条杠直筒运动卫裤男', 'http://localhost:8089/img/100cd67b0efa493cb46b009e9583e5de.jpg', '85.00', '23', '裤子男春秋季韩版潮牌休闲长裤ins港风潮流三条杠直筒运动卫裤男\n裤子男春秋季韩版潮牌休闲长裤ins港风潮流三条杠直筒运动卫裤男\n', '2021-02-28 23:12:13', '2021-03-01 16:10:06', '0', '0', '0', '0', null);

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
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
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
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

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
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `user_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户表';

-- ----------------------------
-- Records of mall_user
-- ----------------------------
INSERT INTO `mall_user` VALUES ('200', 'user', 'dXNlcg==', '1', '2021-02-17', null, '', 'lan', '79475816882', 'http://localhost:8089/img/cat.jpg', '0', '2021-02-27 23:42:26', '2021-02-27 23:42:26', '0');
INSERT INTO `mall_user` VALUES ('201', 'test001', 'dGVzdDAwMQ==', '2', '2021-02-12', '2021-03-02 17:08:20', '127.0.0.1', 'test', '13735906695', 'http://localhost:8089/img/cat.jpg', '0', '2021-02-27 23:41:24', '2021-03-02 17:08:20', '0');
INSERT INTO `mall_user` VALUES ('203', 'qqq', 'MTIzNDU2', '1', '2020-10-17', null, '', 's', '794642131', 'http://localhost:8089/img/678c90c3772e44f28979a755a6e979f4.jpg', '0', '2021-02-27 23:46:07', '2021-02-28 00:17:01', '1');
INSERT INTO `mall_user` VALUES ('204', 'test002', 'dGVzdDAwMg==', '0', null, '2021-03-03 09:55:13', '127.0.0.1', '', '', '', '0', '2021-03-03 09:50:21', '2021-03-03 09:55:13', '0');
