/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : wqerp

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-08-08 18:07:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `erp_access`
-- ----------------------------
DROP TABLE IF EXISTS `erp_access`;
CREATE TABLE `erp_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erp_access
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_customer`
-- ----------------------------
DROP TABLE IF EXISTS `erp_customer`;
CREATE TABLE `erp_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '客户名称',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Records of erp_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_customer_visit`
-- ----------------------------
DROP TABLE IF EXISTS `erp_customer_visit`;
CREATE TABLE `erp_customer_visit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cust_id` int(10) unsigned NOT NULL COMMENT '客户ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '员工ID',
  `content` text COMMENT '拜访内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='拜访记录表';

-- ----------------------------
-- Records of erp_customer_visit
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_depart`
-- ----------------------------
DROP TABLE IF EXISTS `erp_depart`;
CREATE TABLE `erp_depart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属部门ID',
  `name` varchar(32) NOT NULL COMMENT '部门名称',
  `sort` tinyint(4) DEFAULT '100' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门';

-- ----------------------------
-- Records of erp_depart
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_develop_order`
-- ----------------------------
DROP TABLE IF EXISTS `erp_develop_order`;
CREATE TABLE `erp_develop_order` (
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `remark` text COMMENT '制作要求',
  `start_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `finish_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '完成时间',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单 开发池';

-- ----------------------------
-- Records of erp_develop_order
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_develop_order_comment`
-- ----------------------------
DROP TABLE IF EXISTS `erp_develop_order_comment`;
CREATE TABLE `erp_develop_order_comment` (
  `order_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `post_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '提交时间',
  `content` text COMMENT '内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开发-订单沟通记录表';

-- ----------------------------
-- Records of erp_develop_order_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_develop_user`
-- ----------------------------
DROP TABLE IF EXISTS `erp_develop_user`;
CREATE TABLE `erp_develop_user` (
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '员工ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '获得的总业绩',
  `finish_rate` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '完成率',
  `update_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '完成率更新时间',
  PRIMARY KEY (`order_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开发 人员表';

-- ----------------------------
-- Records of erp_develop_user
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_domain`
-- ----------------------------
DROP TABLE IF EXISTS `erp_domain`;
CREATE TABLE `erp_domain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cust_id` int(10) unsigned NOT NULL COMMENT '所属客户ID',
  `domain` varchar(255) NOT NULL COMMENT '域名',
  `service` varchar(255) DEFAULT NULL COMMENT '域名运营商',
  `reg_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '过期时间',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='域名库';

-- ----------------------------
-- Records of erp_domain
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_domain_renewal`
-- ----------------------------
DROP TABLE IF EXISTS `erp_domain_renewal`;
CREATE TABLE `erp_domain_renewal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(10) unsigned NOT NULL COMMENT '所属域名ID',
  `money` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '续费金额',
  `org_expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '原过期时间',
  `new_expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '新过期时间',
  `pay_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '付款时间',
  `check_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='域名续费记录表';

-- ----------------------------
-- Records of erp_domain_renewal
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_node`
-- ----------------------------
DROP TABLE IF EXISTS `erp_node`;
CREATE TABLE `erp_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT NULL COMMENT '显示名称',
  `status` tinyint(1) DEFAULT '0' COMMENT '-1删除  1正常  2禁用',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL COMMENT '序号   排序编号',
  `pid` smallint(6) unsigned NOT NULL COMMENT '所属节点ID',
  `level` tinyint(1) unsigned NOT NULL COMMENT '类型  1项目  2模块  3操作',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erp_node
-- ----------------------------
INSERT INTO `erp_node` VALUES ('1', 'Admin', '全网卫士后台管理', '1', null, '1', '0', '1');
INSERT INTO `erp_node` VALUES ('2', 'Index', '后台首页', '1', null, '2', '1', '2');
INSERT INTO `erp_node` VALUES ('3', 'index', '首页显示', '1', null, '3', '2', '3');
INSERT INTO `erp_node` VALUES ('4', '', '', '1', null, null, '2', '0');
INSERT INTO `erp_node` VALUES ('5', 'Member', '会员中心', '1', null, null, '4', '2');
INSERT INTO `erp_node` VALUES ('6', 'Site', '优化中心', '1', null, null, '5', '2');

-- ----------------------------
-- Table structure for `erp_order`
-- ----------------------------
DROP TABLE IF EXISTS `erp_order`;
CREATE TABLE `erp_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '签单员工ID',
  `cust_id` int(10) unsigned NOT NULL COMMENT '所属客户ID',
  `prod_id` int(10) unsigned NOT NULL COMMENT '所属产品ID',
  `total_fees` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总金额',
  `remark` text COMMENT '备注',
  `expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '到期时间',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of erp_order
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_order_domain`
-- ----------------------------
DROP TABLE IF EXISTS `erp_order_domain`;
CREATE TABLE `erp_order_domain` (
  `order_id` int(10) unsigned NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`order_id`,`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单 域名 关系表';

-- ----------------------------
-- Records of erp_order_domain
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_order_pay`
-- ----------------------------
DROP TABLE IF EXISTS `erp_order_pay`;
CREATE TABLE `erp_order_pay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL COMMENT '所属订单ID',
  `money` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '付款金额',
  `class` enum('2','1') NOT NULL DEFAULT '1' COMMENT '1-预付款; 2-余款',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `pay_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '付款时间',
  `check_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单付款记录(预付款,余款)';

-- ----------------------------
-- Records of erp_order_pay
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_order_renewal`
-- ----------------------------
DROP TABLE IF EXISTS `erp_order_renewal`;
CREATE TABLE `erp_order_renewal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL COMMENT '所属订单ID',
  `money` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '续费金额',
  `org_expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '原过期时间',
  `new_expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '新过期时间',
  `pay_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '付款时间',
  `check_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单续费记录表';

-- ----------------------------
-- Records of erp_order_renewal
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_product`
-- ----------------------------
DROP TABLE IF EXISTS `erp_product`;
CREATE TABLE `erp_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '产品名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品库';

-- ----------------------------
-- Records of erp_product
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_public_customer`
-- ----------------------------
DROP TABLE IF EXISTS `erp_public_customer`;
CREATE TABLE `erp_public_customer` (
  `cust_id` int(10) unsigned NOT NULL COMMENT '客户ID',
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公海客户';

-- ----------------------------
-- Records of erp_public_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_role`
-- ----------------------------
DROP TABLE IF EXISTS `erp_role`;
CREATE TABLE `erp_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) unsigned DEFAULT '0' COMMENT '所属角色ID, 暂不使用',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '-1删除  1正常  2禁用',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erp_role
-- ----------------------------
INSERT INTO `erp_role` VALUES ('1', '超级管理员', '0', '1', '');
INSERT INTO `erp_role` VALUES ('2', '管理员', '0', '1', ' ');
INSERT INTO `erp_role` VALUES ('3', '普通会员', '0', '1', '');
INSERT INTO `erp_role` VALUES ('4', '会员', '0', '1', '');
INSERT INTO `erp_role` VALUES ('5', '会员', '0', '2', ' ');
INSERT INTO `erp_role` VALUES ('6', '会员', '0', '1', 'DAD');
INSERT INTO `erp_role` VALUES ('7', '会员', '0', '1', '');

-- ----------------------------
-- Table structure for `erp_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `erp_role_user`;
CREATE TABLE `erp_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erp_role_user
-- ----------------------------
INSERT INTO `erp_role_user` VALUES ('4', '27');
INSERT INTO `erp_role_user` VALUES ('4', '26');
INSERT INTO `erp_role_user` VALUES ('4', '30');
INSERT INTO `erp_role_user` VALUES ('5', '31');
INSERT INTO `erp_role_user` VALUES ('3', '22');
INSERT INTO `erp_role_user` VALUES ('3', '1');
INSERT INTO `erp_role_user` VALUES ('1', '4');
INSERT INTO `erp_role_user` VALUES ('2', '3');
INSERT INTO `erp_role_user` VALUES ('7', '2');
INSERT INTO `erp_role_user` VALUES ('1', '5');

-- ----------------------------
-- Table structure for `erp_seo_order`
-- ----------------------------
DROP TABLE IF EXISTS `erp_seo_order`;
CREATE TABLE `erp_seo_order` (
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `remark` text COMMENT '制作要求',
  `start_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `finish_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '完成时间',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单 优化池';

-- ----------------------------
-- Records of erp_seo_order
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_seo_order_comment`
-- ----------------------------
DROP TABLE IF EXISTS `erp_seo_order_comment`;
CREATE TABLE `erp_seo_order_comment` (
  `order_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `post_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '提交时间',
  `content` text COMMENT '内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优化-订单沟通记录表';

-- ----------------------------
-- Records of erp_seo_order_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_seo_user`
-- ----------------------------
DROP TABLE IF EXISTS `erp_seo_user`;
CREATE TABLE `erp_seo_user` (
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '员工ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '获得的总业绩',
  `finish_rate` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '完成率',
  `update_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '完成率更新时间',
  PRIMARY KEY (`order_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优化 人员表';

-- ----------------------------
-- Records of erp_seo_user
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_user`
-- ----------------------------
DROP TABLE IF EXISTS `erp_user`;
CREATE TABLE `erp_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(32) NOT NULL COMMENT '帐号',
  `password` char(32) NOT NULL,
  `depart_id` int(10) unsigned NOT NULL COMMENT '所属部门ID',
  `realname` varchar(32) NOT NULL COMMENT '真实姓名',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of erp_user
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_user_depart_mgr`
-- ----------------------------
DROP TABLE IF EXISTS `erp_user_depart_mgr`;
CREATE TABLE `erp_user_depart_mgr` (
  `user_id` int(10) unsigned NOT NULL,
  `depart_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工, 管理 部门 关系表';

-- ----------------------------
-- Records of erp_user_depart_mgr
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_valadd_order`
-- ----------------------------
DROP TABLE IF EXISTS `erp_valadd_order`;
CREATE TABLE `erp_valadd_order` (
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `remark` text COMMENT '制作要求',
  `start_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `finish_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '完成时间',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单 增值服务池';

-- ----------------------------
-- Records of erp_valadd_order
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_valadd_order_comment`
-- ----------------------------
DROP TABLE IF EXISTS `erp_valadd_order_comment`;
CREATE TABLE `erp_valadd_order_comment` (
  `order_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `post_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '提交时间',
  `content` text COMMENT '内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='增值服务-订单沟通记录表';

-- ----------------------------
-- Records of erp_valadd_order_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_valadd_user`
-- ----------------------------
DROP TABLE IF EXISTS `erp_valadd_user`;
CREATE TABLE `erp_valadd_user` (
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '员工ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '获得的总业绩',
  `finish_rate` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '完成率',
  `update_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '完成率更新时间',
  PRIMARY KEY (`order_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='增值服务制作 人员表';

-- ----------------------------
-- Records of erp_valadd_user
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_visit_prod`
-- ----------------------------
DROP TABLE IF EXISTS `erp_visit_prod`;
CREATE TABLE `erp_visit_prod` (
  `visit_id` int(10) unsigned NOT NULL COMMENT '所属拜访记录ID',
  `prod_id` int(10) unsigned NOT NULL COMMENT '所属产品ID',
  `content` text COMMENT '沟通内容',
  PRIMARY KEY (`visit_id`,`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品沟通记录表';

-- ----------------------------
-- Records of erp_visit_prod
-- ----------------------------
