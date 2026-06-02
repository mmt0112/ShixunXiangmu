/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80020 (8.0.20)
 Source Host           : localhost:3306
 Source Schema         : dingcan

 Target Server Type    : MySQL
 Target Server Version : 80020 (8.0.20)
 File Encoding         : 65001

 Date: 27/03/2026 19:56:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '奶茶专区');
INSERT INTO `category` VALUES (2, '甜品/蛋糕');
INSERT INTO `category` VALUES (3, '包子/早点');
INSERT INTO `category` VALUES (4, '午饭套餐');
INSERT INTO `category` VALUES (5, '肉类炒菜');
INSERT INTO `category` VALUES (6, '素菜专区');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家地址',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家联系方式',
  `status` int NULL DEFAULT 0 COMMENT '状态，0：普通用户，1：会员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'byh', '12345', '5A124', '123456', 1);
INSERT INTO `customer` VALUES (6, 'li4', '123', '1234a', '123456789', 1);
INSERT INTO `customer` VALUES (8, 'wang5', '123', 'wode dizhi ', '1112424212', 1);
INSERT INTO `customer` VALUES (11, '1', '1', 'admin', 'admin', 1);
INSERT INTO `customer` VALUES (12, '11', '11', 'admin', 'admin', 0);
INSERT INTO `customer` VALUES (13, '1111', '1111', 'admin', 'admin', 0);
INSERT INTO `customer` VALUES (14, 'hxy', '0424', '广软', '15260525428', 0);
INSERT INTO `customer` VALUES (15, '520', '5201314', '11', '11', 0);

-- ----------------------------
-- Table structure for order_
-- ----------------------------
DROP TABLE IF EXISTS `order_`;
CREATE TABLE `order_`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家地址',
  `status` int NULL DEFAULT 0 COMMENT '支付状态，0：未支付，1：正在发货，2：已发货，3：已收货',
  `cstid` int NULL DEFAULT NULL COMMENT '买家id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cstid`(`cstid` ASC) USING BTREE,
  CONSTRAINT `order__ibfk_1` FOREIGN KEY (`cstid`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_
-- ----------------------------
INSERT INTO `order_` VALUES (1, '201811021055177112826', '5a124', 2, 1);
INSERT INTO `order_` VALUES (2, '201811021055179112826', '我是地址', 2, 1);
INSERT INTO `order_` VALUES (18, '201811251731209717398', '姓名：byh,邮箱：1191741799@qq.com,配送地址：wodedizhi敖德萨,手机号：123456', 2, 1);
INSERT INTO `order_` VALUES (19, '201811251750178958169', '姓名：byh,邮箱：1191741799@qq.com,配送地址：dsaddddddddddddddddddddddd,手机号：123456', 1, 1);
INSERT INTO `order_` VALUES (20, '202505282230407774011', '姓名：11,邮箱：11,配送地址：1,手机号：11', 2, 12);
INSERT INTO `order_` VALUES (21, '20250529102315850291', '姓名：11,邮箱：11,配送地址：11,手机号：11', 2, 13);
INSERT INTO `order_` VALUES (22, '202505301009033642577', '姓名：54,邮箱：1720068784@qq.com,配送地址：58768877,手机号：45', 1, 14);
INSERT INTO `order_` VALUES (23, '202505301011141406396', '姓名：4554654,邮箱：1720068784@qq.com,配送地址：54654354,手机号：13525463', 1, 14);
INSERT INTO `order_` VALUES (24, '202603271711089887447', '姓名：1,邮箱：1,配送地址：11,手机号：1', 1, 15);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NULL DEFAULT NULL COMMENT '商品id',
  `oid` int NULL DEFAULT NULL COMMENT '订单id',
  `cstid` int NULL DEFAULT NULL COMMENT '买家id',
  `number` int NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid` ASC) USING BTREE,
  INDEX `oid`(`oid` ASC) USING BTREE,
  INDEX `cstid`(`cstid` ASC) USING BTREE,
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `order_` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_3` FOREIGN KEY (`cstid`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (1, 4, 1, 1, 5);
INSERT INTO `orderitem` VALUES (2, 5, 1, 1, 1);
INSERT INTO `orderitem` VALUES (5, 3, 1, NULL, 1);
INSERT INTO `orderitem` VALUES (8, NULL, 1, NULL, 1);
INSERT INTO `orderitem` VALUES (13, 4, 2, 1, 3);
INSERT INTO `orderitem` VALUES (14, 5, 2, 1, 2);
INSERT INTO `orderitem` VALUES (18, 8, 19, 1, 1);
INSERT INTO `orderitem` VALUES (34, 10, 18, 1, 11);
INSERT INTO `orderitem` VALUES (41, NULL, NULL, 1, 14);
INSERT INTO `orderitem` VALUES (46, NULL, NULL, 1, 4);
INSERT INTO `orderitem` VALUES (47, 31, NULL, 6, 1);
INSERT INTO `orderitem` VALUES (48, NULL, NULL, NULL, 1);
INSERT INTO `orderitem` VALUES (49, NULL, NULL, NULL, 1);
INSERT INTO `orderitem` VALUES (50, 4, NULL, 11, 1);
INSERT INTO `orderitem` VALUES (51, NULL, 20, 12, 2);
INSERT INTO `orderitem` VALUES (52, 20, NULL, 12, 1);
INSERT INTO `orderitem` VALUES (53, 3, NULL, 12, 2);
INSERT INTO `orderitem` VALUES (54, 13, NULL, 12, 2);
INSERT INTO `orderitem` VALUES (55, 3, 21, 13, 1);
INSERT INTO `orderitem` VALUES (56, 30, 22, 14, 1);
INSERT INTO `orderitem` VALUES (57, 30, 23, 14, 1);
INSERT INTO `orderitem` VALUES (58, 3, 24, 15, 1);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc_` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '删除分类', '删除分类', '/category/delCategory');
INSERT INTO `permission` VALUES (2, '分类列表', '查看分类列表', '/category/list');
INSERT INTO `permission` VALUES (15, '修改分类页面', '修改分类页面', '/category/editCategory');
INSERT INTO `permission` VALUES (17, '添加商品分类', '添加商品分类', '/category/addCategory');
INSERT INTO `permission` VALUES (18, '查看管理员列表', '查看管理员列表', '/config/listUser');
INSERT INTO `permission` VALUES (20, '查看角色列表', '可增删改查', '/config/listRole');
INSERT INTO `permission` VALUES (21, '查看权限列表', '无', '/config/listPermission');
INSERT INTO `permission` VALUES (23, '修改管理员信息界面', '修改界面', '/config/editUser');
INSERT INTO `permission` VALUES (24, '更新管理员信息', '无', '/config/updateUser');
INSERT INTO `permission` VALUES (25, '管理员删除', '删除', '/config/deleteUser');
INSERT INTO `permission` VALUES (26, '添加管理员界面', '无', '/config/adminAdd');
INSERT INTO `permission` VALUES (27, '添加管理员', '无', '/config/addUser');
INSERT INTO `permission` VALUES (28, '商品列表', '查看商品列表', '/product/list');
INSERT INTO `permission` VALUES (29, '添加商品', '添加上线商品', '/product/addProduct');
INSERT INTO `permission` VALUES (30, '删除商品', '暂无', '/product/deleteProduct');
INSERT INTO `permission` VALUES (31, '修改商品界面', '暂无', '/product/editProduct');
INSERT INTO `permission` VALUES (32, '更新商品', '暂无', '/product/updateProduct');
INSERT INTO `permission` VALUES (33, '添加商品界面', '暂无', '/product/productAddUI');
INSERT INTO `permission` VALUES (34, '商品上线', '暂无', '/product/enableStatus');
INSERT INTO `permission` VALUES (35, '商品下线', '暂无', '/product/stopStatus');
INSERT INTO `permission` VALUES (36, '订单发货', '暂无', '/order/orderDelivery');
INSERT INTO `permission` VALUES (37, '查看订单项', '暂无', '/order/seeOrderItem');
INSERT INTO `permission` VALUES (38, '评论列表', '暂无', '/review/list');
INSERT INTO `permission` VALUES (39, '删除评论', '暂无', '/review/del');
INSERT INTO `permission` VALUES (40, '查看订单列表', '暂无', '/order/list');
INSERT INTO `permission` VALUES (41, '添加权限UI', '暂无', '/config/adminPerAddUI');
INSERT INTO `permission` VALUES (42, '添加权限', '暂无', '/config/addPermission');
INSERT INTO `permission` VALUES (43, '删除权限', '暂无', '/config/deletePermission');
INSERT INTO `permission` VALUES (44, '修改权限ui', '暂无', '/config/editPermission');
INSERT INTO `permission` VALUES (45, '更新权限', '暂无', '/config/updatePermission');
INSERT INTO `permission` VALUES (46, '查看用户列表', '暂无', '/customer/list');
INSERT INTO `permission` VALUES (47, '删除角色', '暂无', '/config/deleteRole');
INSERT INTO `permission` VALUES (48, '添加管理员UI', '暂无', '/config/adminAdd');
INSERT INTO `permission` VALUES (49, '添加管理员', '暂未', '/config/addUser');
INSERT INTO `permission` VALUES (50, '修改角色UI', '暂无', '/config/editRole');
INSERT INTO `permission` VALUES (51, '修改角色', '暂无', '/config/updateRole');
INSERT INTO `permission` VALUES (52, '添加角色UI', '暂无', '/config/addRoleUI');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `price` float(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `zan` int NULL DEFAULT NULL COMMENT '赞',
  `number` int NULL DEFAULT NULL COMMENT '销量',
  `status` int NULL DEFAULT 1 COMMENT '状态，1：上线，0：下线',
  `imageurl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片url',
  `miaoshu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商品描述',
  `cid` int NULL DEFAULT NULL COMMENT '分类id',
  `bid` bigint NULL DEFAULT NULL COMMENT '商家id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_ibfk_1`(`cid` ASC) USING BTREE,
  INDEX `product_ibfk_2`(`bid` ASC) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (3, '葡萄柚益菌多', 15.00, 45, 63, 1, 'images/product/3.jpg', '新鲜葡萄柚与优菌多相遇，酸甜的滋味在唇齿间流转，只需闭上眼用心品味这让人欲罢不能的清爽感。', 1, 28);
INSERT INTO `product` VALUES (4, '芒果布丁奶绿', 13.00, 41, 43, 1, 'images/product/4.jpg', '清香可口的海南大金煌与柔滑香的甜奶布丁，层层叠加，混搭滋味，随心选择。', 1, 28);
INSERT INTO `product` VALUES (5, '金桔柠檬茶', 18.00, 72, 168, 1, 'images/product/5.jpg', '打破传统奶盖与茶饮分离的做法，将咸奶盖与芒果冰均匀融合。芒果冰的爽滑细腻与咸奶盖的香浓完美融合，口感清甜饱满，独家特制芒砂糖将芒果本身的香甜气息发挥到极致。', 1, 29);
INSERT INTO `product` VALUES (6, '蜂蜜柚子茶', 18.00, 74, 159, 1, 'images/product/6.jpg', '不仅是味道清香可口，更是一款有美白祛斑、嫩肤养颜功效的食品。蜂蜜中含有的L－半胱氨酸具有排毒作用，具有一定的祛斑效果。', 1, 30);
INSERT INTO `product` VALUES (7, '巧克力水果蛋糕', 68.00, 75, 101, 1, 'images/product/7.jpg', '本店蛋糕现做现卖，由于蛋糕的特殊性，请顾客提前义雄安史预定。联系电话：12312345678', 2, 29);
INSERT INTO `product` VALUES (8, '心心相印', 88.00, 45, 99, 1, 'images/product/8.jpg', '为了保证蛋糕的新鲜！所有商品均为顾客下单现做！为了不耽误亲们的宝贵时间，请尽量提前一小时下单！详情致电：12312345678', 2, 29);
INSERT INTO `product` VALUES (9, '美味奶油蛋糕', 45.00, 45, 56, 1, 'images/product/9.jpg', '本店蛋糕现做现卖，请顾客朋友提前预定电话：12312345678', 2, 29);
INSERT INTO `product` VALUES (10, '至尊奶油蛋糕', 98.00, 235, 420, 1, 'images/product/10.jpg', '本店蛋糕现做现卖，由于蛋糕的特殊性，请顾客提前2小时预定。联系电话：12312345678', 2, 30);
INSERT INTO `product` VALUES (11, '丰盛果园', 133.00, 356, 2762, 1, 'images/product/11.jpg', '（15人餐）本店蛋糕现做现卖，请顾客提亲1小时预定，联系电话：12312345678', 2, 30);
INSERT INTO `product` VALUES (12, '太阳花', 166.00, 124, 369, 1, 'images/product/12.jpg', '（20人餐）本店蛋糕现做现卖，请顾客提前一小时预定。联系电话：12312345678', 2, 30);
INSERT INTO `product` VALUES (13, '初见', 105.00, 124, 234, 1, 'images/product/13.jpg', '（12餐）本店蛋糕现做现卖，请顾客提前一小时预定，联系电话：12312345678', 2, 31);
INSERT INTO `product` VALUES (14, '香辣鸡腿堡', 5.00, 124, 254, 1, 'images/product/14.jpg', '开业特惠，豪吃不贵！限时特价商品', 3, 31);
INSERT INTO `product` VALUES (15, '墨西哥肌肉卷', 19.00, 453, 454, 1, 'images/product/15.jpg', '里面用的是番茄酱哈', 3, 31);
INSERT INTO `product` VALUES (16, '爆浆鸡排', 12.00, 45, 4654, 1, 'images/product/16.jpg', '香脆可口', 3, 31);
INSERT INTO `product` VALUES (17, '椰奶芝士蛋糕', 11.00, 54, 132, 1, 'images/product/17.jpg', '该商品暂无描述', 3, 31);
INSERT INTO `product` VALUES (18, '南瓜脆皮芝士包', 8.00, 15, 232, 1, 'images/product/18.jpg', '暂无商品信息', 3, 31);
INSERT INTO `product` VALUES (19, '核桃布里奥斯', 23.00, 33, 323, 1, 'images/product/19.jpg', '定制设计', 3, 30);
INSERT INTO `product` VALUES (20, '卤肉配牛丸', 45.00, 45, 555, 1, 'images/product/20.jpg', '把简单的事情做到不简单，这就是我们存在的意义。优质猪后腿肉，在浓郁的老卤的怀抱中千回百转。30余味的精选香料与肉块的完美融合。', 4, 30);
INSERT INTO `product` VALUES (25, '雪花鸡排饭', 42.00, 444, 444, 1, 'images/product/25.jpg', '鸡腿+脆骨肠+配菜+饮料+米饭', 4, 30);
INSERT INTO `product` VALUES (26, '劲爆麻辣牛肉饭', 35.00, 23, 43, 1, 'images/product/26.jpg', '牛排+脆骨肠+配菜+饮料+米饭', 4, 30);
INSERT INTO `product` VALUES (27, '蜜汁牛排饭', 25.00, 34, 53, 1, 'images/product/27.jpg', '牛排+脆骨肠+配菜+饮料+米饭', 4, 30);
INSERT INTO `product` VALUES (28, '小熊卤肉饭', 23.00, 34, 23, 1, 'images/product/28.jpg', '卤香十足，香甜可口，回味无穷，超级好吃', 4, 30);
INSERT INTO `product` VALUES (29, '法式炸鸡饭', 23.00, 43, 65, 1, 'images/product/29.jpg', '暂无介绍', 4, 30);
INSERT INTO `product` VALUES (30, '清蒸大闸蟹', 98.00, 456, 998, 1, 'images/product/30.jpg', '3.5重的大公蟹，肉质鲜美，淘宝都卖一百四五一只，本店只卖98', 5, 31);
INSERT INTO `product` VALUES (31, '单煎牛排', 45.00, 98, 564, 1, 'images/product/31.jpg', '暂无介绍', 6, 29);
INSERT INTO `product` VALUES (32, '', NULL, NULL, NULL, 1, 'images/product/32.jpg', '', 1, NULL);

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '该用户默认给出了好评！！！' COMMENT '评论内容',
  `cstid` int NULL DEFAULT NULL COMMENT '用户id',
  `pid` int NULL DEFAULT NULL COMMENT '商品id',
  `createtime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cstid`(`cstid` ASC) USING BTREE,
  INDEX `pid`(`pid` ASC) USING BTREE,
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`cstid`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES (4, 'w is pl ', 1, 5, '2018-11-04 10:54:24');
INSERT INTO `review` VALUES (6, 'aa', 1, 4, '2018-11-05 17:15:37');
INSERT INTO `review` VALUES (7, '我是一条评论', 1, 4, '2018-11-05 17:50:33');
INSERT INTO `review` VALUES (8, 'kl0', 1, 4, '2018-11-13 20:38:35');
INSERT INTO `review` VALUES (9, NULL, 1, 4, '2018-11-26 09:36:30');
INSERT INTO `review` VALUES (10, 'pjia ', 1, 4, '2018-11-26 09:38:49');
INSERT INTO `review` VALUES (11, '我是评价', 1, NULL, '2018-11-26 09:41:12');
INSERT INTO `review` VALUES (12, '测试评价', 1, 10, '2018-11-27 16:32:08');
INSERT INTO `review` VALUES (13, '1111', 12, NULL, '2025-05-28 22:34:02');
INSERT INTO `review` VALUES (14, '11', 13, 3, '2025-05-29 10:23:37');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc_` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'admin', '超级管理员');
INSERT INTO `role` VALUES (2, 'productManager', '商品管理员');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rid` bigint NULL DEFAULT NULL,
  `pid` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 399 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (134, 3, 2);
INSERT INTO `role_permission` VALUES (135, 3, 18);
INSERT INTO `role_permission` VALUES (136, 3, 20);
INSERT INTO `role_permission` VALUES (137, 3, 21);
INSERT INTO `role_permission` VALUES (138, 3, 28);
INSERT INTO `role_permission` VALUES (139, 3, 37);
INSERT INTO `role_permission` VALUES (140, 3, 38);
INSERT INTO `role_permission` VALUES (141, 3, 40);
INSERT INTO `role_permission` VALUES (346, 1, 53);
INSERT INTO `role_permission` VALUES (347, 1, 52);
INSERT INTO `role_permission` VALUES (348, 1, 51);
INSERT INTO `role_permission` VALUES (349, 1, 50);
INSERT INTO `role_permission` VALUES (350, 1, 49);
INSERT INTO `role_permission` VALUES (351, 1, 48);
INSERT INTO `role_permission` VALUES (352, 1, 47);
INSERT INTO `role_permission` VALUES (353, 1, 46);
INSERT INTO `role_permission` VALUES (354, 1, 45);
INSERT INTO `role_permission` VALUES (355, 1, 44);
INSERT INTO `role_permission` VALUES (356, 1, 43);
INSERT INTO `role_permission` VALUES (357, 1, 42);
INSERT INTO `role_permission` VALUES (358, 1, 41);
INSERT INTO `role_permission` VALUES (359, 1, 40);
INSERT INTO `role_permission` VALUES (360, 1, 39);
INSERT INTO `role_permission` VALUES (361, 1, 38);
INSERT INTO `role_permission` VALUES (362, 1, 37);
INSERT INTO `role_permission` VALUES (363, 1, 36);
INSERT INTO `role_permission` VALUES (364, 1, 35);
INSERT INTO `role_permission` VALUES (365, 1, 34);
INSERT INTO `role_permission` VALUES (366, 1, 33);
INSERT INTO `role_permission` VALUES (367, 1, 32);
INSERT INTO `role_permission` VALUES (368, 1, 31);
INSERT INTO `role_permission` VALUES (369, 1, 30);
INSERT INTO `role_permission` VALUES (370, 1, 29);
INSERT INTO `role_permission` VALUES (371, 1, 28);
INSERT INTO `role_permission` VALUES (372, 1, 27);
INSERT INTO `role_permission` VALUES (373, 1, 26);
INSERT INTO `role_permission` VALUES (374, 1, 25);
INSERT INTO `role_permission` VALUES (375, 1, 24);
INSERT INTO `role_permission` VALUES (376, 1, 23);
INSERT INTO `role_permission` VALUES (377, 1, 21);
INSERT INTO `role_permission` VALUES (378, 1, 20);
INSERT INTO `role_permission` VALUES (379, 1, 18);
INSERT INTO `role_permission` VALUES (380, 1, 17);
INSERT INTO `role_permission` VALUES (381, 1, 15);
INSERT INTO `role_permission` VALUES (382, 1, 2);
INSERT INTO `role_permission` VALUES (383, 1, 1);
INSERT INTO `role_permission` VALUES (384, 2, 40);
INSERT INTO `role_permission` VALUES (385, 2, 38);
INSERT INTO `role_permission` VALUES (386, 2, 37);
INSERT INTO `role_permission` VALUES (387, 2, 36);
INSERT INTO `role_permission` VALUES (388, 2, 35);
INSERT INTO `role_permission` VALUES (389, 2, 34);
INSERT INTO `role_permission` VALUES (390, 2, 33);
INSERT INTO `role_permission` VALUES (391, 2, 32);
INSERT INTO `role_permission` VALUES (392, 2, 31);
INSERT INTO `role_permission` VALUES (393, 2, 30);
INSERT INTO `role_permission` VALUES (394, 2, 29);
INSERT INTO `role_permission` VALUES (395, 2, 28);
INSERT INTO `role_permission` VALUES (396, 2, 17);
INSERT INTO `role_permission` VALUES (397, 2, 15);
INSERT INTO `role_permission` VALUES (398, 2, 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员姓名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员密码',
  `salt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL COMMENT '状态，1：启用，0：停用',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '暂无' COMMENT '商家管理员地址',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lasttime` datetime NULL DEFAULT NULL COMMENT '最后登陆时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (15, 'visitor', '6367dbed6a55839758cfb67771973841', 'CKebgOQhmZkLrBYXtBOLbQ==', 1, '暂无', '12456458532', '2018-11-05 11:29:41');
INSERT INTO `user` VALUES (28, '避风港', '552b3a7761fc3a9d1f0db4472ab30d51', '2i/lq3CinJJBGKWc7oU/JQ==', 1, '龙马潭区', '18224235623', '2018-11-05 11:25:22');
INSERT INTO `user` VALUES (29, '小熊早餐店', '8612e72664be9722e41a81ac0aaa0fd6', 'mHnsr5dIoQKC2DQzvHRrRg==', 1, '商贸城', '12453265428', '2018-11-01 09:17:27');
INSERT INTO `user` VALUES (30, '美味私厨', 'a469aeda72843f96fc68bc6d63c3dcca', '4PM6lket6jMAYk3/wHLF/Q==', 1, '龙马潭区', '15684569753', '2018-11-01 09:17:27');
INSERT INTO `user` VALUES (31, '川西食府', '711fc51f8cc005bcf255805f91390e0b', '6h4fM4l6AnPKZiLQHwxZQA==', 1, '江阳区', '12452253264', '2018-11-01 09:17:27');
INSERT INTO `user` VALUES (32, '小明', '0317f6fb5a98ce21e9b2ee0622b23770', '47ZFrBQf51qdXCYdSvakXQ==', 1, '北京', '12345555554', '2025-04-19 21:01:20');
INSERT INTO `user` VALUES (88, 'ad', '123', '11', 1, '暂无', NULL, NULL);
INSERT INTO `user` VALUES (89, 'admin', '940f424f3f9baf2c2ab4bee28a94e808', 'SDOXhRofLGxFjYOZEd9bxA==', 1, '1', '1', '2026-03-27 17:09:41');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint NULL DEFAULT NULL,
  `rid` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (91, 28, 2);
INSERT INTO `user_role` VALUES (92, 29, 2);
INSERT INTO `user_role` VALUES (93, 30, 2);
INSERT INTO `user_role` VALUES (94, 31, 2);
INSERT INTO `user_role` VALUES (95, 15, 3);
INSERT INTO `user_role` VALUES (97, 89, 3);
INSERT INTO `user_role` VALUES (98, 89, 1);

-- ----------------------------
-- Table structure for zixun
-- ----------------------------
DROP TABLE IF EXISTS `zixun`;
CREATE TABLE `zixun`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资讯内容',
  `cstid` int NULL DEFAULT NULL COMMENT '客户id',
  `status` int NULL DEFAULT 0 COMMENT '审核状态，1：通过，0：未通过;',
  `fabudate` datetime NULL DEFAULT NULL COMMENT '发布时间;',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of zixun
-- ----------------------------
INSERT INTO `zixun` VALUES (7, '111', 12, 1, '2025-05-25 21:50:49');
INSERT INTO `zixun` VALUES (8, '', 12, 0, '2025-05-28 22:28:52');
INSERT INTO `zixun` VALUES (9, '1111', 13, 0, '2025-05-29 10:23:59');
INSERT INTO `zixun` VALUES (10, '答案吧', 13, 0, '2025-05-29 10:35:04');

SET FOREIGN_KEY_CHECKS = 1;
