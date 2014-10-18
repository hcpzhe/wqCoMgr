/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : wqerp

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-10-18 09:29:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `erp_article`
-- ----------------------------
DROP TABLE IF EXISTS `erp_article`;
CREATE TABLE `erp_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '员工id',
  `class` int(11) NOT NULL DEFAULT '2' COMMENT '1:公司通知 2：文章杂谈',
  `Belong` int(11) NOT NULL DEFAULT '0' COMMENT '0：文章，非0：评论所属文章id',
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of erp_article
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `erp_auth_group`;
CREATE TABLE `erp_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erp_auth_group
-- ----------------------------
INSERT INTO `erp_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106');
INSERT INTO `erp_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- ----------------------------
-- Table structure for `erp_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `erp_auth_group_access`;
CREATE TABLE `erp_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erp_auth_group_access
-- ----------------------------
INSERT INTO `erp_auth_group_access` VALUES ('2', '1');

-- ----------------------------
-- Table structure for `erp_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `erp_auth_rule`;
CREATE TABLE `erp_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erp_auth_rule
-- ----------------------------
INSERT INTO `erp_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '内容', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('17', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `erp_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `erp_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');

-- ----------------------------
-- Table structure for `erp_config`
-- ----------------------------
DROP TABLE IF EXISTS `erp_config`;
CREATE TABLE `erp_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erp_config
-- ----------------------------
INSERT INTO `erp_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', 'OneThink内容管理框架', '0');
INSERT INTO `erp_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', 'OneThink内容管理框架', '1');
INSERT INTO `erp_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'ThinkPHP,OneThink', '8');
INSERT INTO `erp_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `erp_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `erp_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9');
INSERT INTO `erp_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '3');
INSERT INTO `erp_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `erp_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '10');
INSERT INTO `erp_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '4');
INSERT INTO `erp_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `erp_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `erp_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `erp_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '10');
INSERT INTO `erp_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `erp_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `erp_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `erp_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `erp_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `erp_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `erp_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `erp_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `erp_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `erp_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '0');
INSERT INTO `erp_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `erp_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '1', '1');

-- ----------------------------
-- Table structure for `erp_customer`
-- ----------------------------
DROP TABLE IF EXISTS `erp_customer`;
CREATE TABLE `erp_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '客户名称',
  `contacts` varchar(255) NOT NULL COMMENT '联系人',
  `phone` varchar(15) NOT NULL COMMENT '联系电话',
  `fax` varchar(15) DEFAULT NULL COMMENT '传真',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `add_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '添加日期',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  `check_time` varchar(32) DEFAULT '0' COMMENT '审核时间',
  `user_id` int(10) DEFAULT NULL COMMENT '提交人id',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Records of erp_customer
-- ----------------------------
INSERT INTO `erp_customer` VALUES ('1', '洛阳万谦网络科技有限公司', '张三种', '0379-63233333', '0379-63260019', '紫金城', '1411021523', '1', '1', '1413428532', '1', '1111111111');
INSERT INTO `erp_customer` VALUES ('2', '智慧云', '李', '0379-63233333', null, '西工区', '1411022133', '1', '1', '1413428538', '2', '1111111111');
INSERT INTO `erp_customer` VALUES ('3', 'zhang', '张', '0379-63233333', '0379-63260014', '西工区', '1411092302', '0', '1', '0', '3', '1111111111');
INSERT INTO `erp_customer` VALUES ('4', '网易', '网', '15867925589', '0379-63596521', '北京', '1411352953', '1', '1', '1413428545', '4', '1111111111');
INSERT INTO `erp_customer` VALUES ('5', '邙山苗圃', '孙经理', '0379-63233333', null, '涧西区', '1411443090', '1', '1', '1413438283', '5', '1111111111');
INSERT INTO `erp_customer` VALUES ('6', '花都服饰', '张总', '15736975858', null, '洛阳栾川', '1411443256', '1', '1', '1413441857', '6', '1111111111');
INSERT INTO `erp_customer` VALUES ('7', '锦城布艺', '赵经理', '0379-63260019', null, '伊川', '1411443372', '1', '1', '1413442117', '7', '1111111111');
INSERT INTO `erp_customer` VALUES ('8', '北京庆丰弹簧', '钱总', '0379-63233333', null, '北京朝阳区', '1411443461', '1', '1', '1413442476', '8', '1111111111');
INSERT INTO `erp_customer` VALUES ('9', '三门峡隆鑫商贸', '何女士', '13154968792', null, '三门峡', '1411443590', '1', '1', '1413515662', '9', '1111111111');
INSERT INTO `erp_customer` VALUES ('10', '刘波门业', '刘经理', '17958964525', '0379-63260014', '王城大道', '1411443670', '1', '1', '1413443113', '10', '1111111111');
INSERT INTO `erp_customer` VALUES ('11', '吉源商城', '李驰', '0379-63233333', '0379-63260014', '西工区', '1411443768', '1', '1', '1413429772', '11', '1111111111');
INSERT INTO `erp_customer` VALUES ('12', '三门峡机床', '李', '17958964525', '0379-63260014', '三门峡', '1411455803', '0', '1', '0', '12', '1111111111');
INSERT INTO `erp_customer` VALUES ('14', '是是是', '刘经理', '17958964525', '0379-63260019', '涧西区', '1411551423', '0', '1', '0', '14', '1111111111');
INSERT INTO `erp_customer` VALUES ('15', 'ewrqwerqwerq', '2435451345', '0379-63233333', '4', '洛阳市涧西区', '1411979027', '1', '1', '1413445691', '16', '1111111111');
INSERT INTO `erp_customer` VALUES ('16', '洛阳炘源晶光伏科技有限公司', '小夏', '14589657845', '0345-69856236', '王城大道', '1413335090', '0', '1', '0', '17', '1111111111');
INSERT INTO `erp_customer` VALUES ('17', '三门峡鑫旺铝业有限公司', '贺总', '15739854652', '0379-69865523', '紫金城', '1413336834', '0', '1', '1413423434', '15', '1111111111');
INSERT INTO `erp_customer` VALUES ('18', '洛阳九旭办公家具', '张总', '14589657845', '0345-69856236', '涧西区', '1413344044', '0', '1', '1413351597', '13', '1111111111');
INSERT INTO `erp_customer` VALUES ('19', '洛阳万谦网络科技有限公司三门峡分公司', '王总', '17958964525', '0345-69856236', '西工区', '1413356420', '1', '1', '1413423538', '1', '测试');

-- ----------------------------
-- Table structure for `erp_customer_visit`
-- ----------------------------
DROP TABLE IF EXISTS `erp_customer_visit`;
CREATE TABLE `erp_customer_visit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cust_id` int(10) unsigned NOT NULL COMMENT '客户ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '员工ID',
  `content` text COMMENT '拜访内容',
  `visit_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='拜访记录表';

-- ----------------------------
-- Records of erp_customer_visit
-- ----------------------------
INSERT INTO `erp_customer_visit` VALUES ('1', '1', '0', '洛阳万谦网络科技有限公司', null);
INSERT INTO `erp_customer_visit` VALUES ('2', '1', '0', '洛阳万谦网络科技有限公司洛阳万谦网络科技有限公司', null);
INSERT INTO `erp_customer_visit` VALUES ('3', '1', '0', '测试数据', null);
INSERT INTO `erp_customer_visit` VALUES ('4', '1', '1', '', null);
INSERT INTO `erp_customer_visit` VALUES ('5', '1', '1', 'ceshi', null);
INSERT INTO `erp_customer_visit` VALUES ('6', '1', '1', '测试', null);
INSERT INTO `erp_customer_visit` VALUES ('7', '4', '1', '网易拜访情况', null);
INSERT INTO `erp_customer_visit` VALUES ('8', '16', '1', '洛阳炘源晶光伏科技有限公司', '1413342627');
INSERT INTO `erp_customer_visit` VALUES ('9', '18', '17', '测试拜访', '1413353068');
INSERT INTO `erp_customer_visit` VALUES ('10', '2', '1', '智慧云', '1413355398');
INSERT INTO `erp_customer_visit` VALUES ('11', '5', '1', '网站已做', '1413355464');
INSERT INTO `erp_customer_visit` VALUES ('12', '7', '12', '锦城布艺', '1413355546');
INSERT INTO `erp_customer_visit` VALUES ('13', '6', '10', '花都服饰', '1413355595');
INSERT INTO `erp_customer_visit` VALUES ('14', '4', '7', '网易拜访', '1413355662');
INSERT INTO `erp_customer_visit` VALUES ('15', '19', '1', '洛阳万谦网络科技有限公司三门峡分公司', '1413356774');
INSERT INTO `erp_customer_visit` VALUES ('16', '5', '10', '邙山苗圃', '1413357787');
INSERT INTO `erp_customer_visit` VALUES ('17', '19', '1', '测试', '1413361394');
INSERT INTO `erp_customer_visit` VALUES ('18', '5', '9', '惆怅长岑长', '1413361431');
INSERT INTO `erp_customer_visit` VALUES ('19', '11', '7', 'ceshi ', '1413438939');
INSERT INTO `erp_customer_visit` VALUES ('20', '8', '11', '北京庆丰弹簧', '1413442571');
INSERT INTO `erp_customer_visit` VALUES ('21', '10', '9', 'liubo', '1413443228');
INSERT INTO `erp_customer_visit` VALUES ('22', '15', '1', 'dd', '1413445721');

-- ----------------------------
-- Table structure for `erp_depart`
-- ----------------------------
DROP TABLE IF EXISTS `erp_depart`;
CREATE TABLE `erp_depart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属部门ID',
  `class` tinyint(1) NOT NULL DEFAULT '0' COMMENT '部门类型 1-销售 2-客服 3-产品客服 4-技术部',
  `name` varchar(32) NOT NULL COMMENT '部门名称',
  `sort` tinyint(4) DEFAULT '100' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='部门; 通过class来区别不同类型的部门, 不同类型的部门, 管理的数据表不同';

-- ----------------------------
-- Records of erp_depart
-- ----------------------------
INSERT INTO `erp_depart` VALUES ('1', '0', '4', '技术部', '100', '1');
INSERT INTO `erp_depart` VALUES ('2', '1', '3', '优化1', '100', '1');
INSERT INTO `erp_depart` VALUES ('3', '4', '8', '程序', '100', '1');
INSERT INTO `erp_depart` VALUES ('5', '1', '0', '网页设计', '100', '0');
INSERT INTO `erp_depart` VALUES ('6', '0', '0', '综合部', '100', '1');
INSERT INTO `erp_depart` VALUES ('7', '0', '0', '行政部', '100', '1');
INSERT INTO `erp_depart` VALUES ('8', '0', '0', '后勤部', '100', '0');
INSERT INTO `erp_depart` VALUES ('9', '1', '0', '美工组', '100', '1');
INSERT INTO `erp_depart` VALUES ('10', '0', '0', '培训部', '100', '1');
INSERT INTO `erp_depart` VALUES ('11', '0', '0', '客服部', '100', '1');

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
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开发-订单池; 由技术部来管理 , 分配制作人员';

-- ----------------------------
-- Records of erp_develop_order
-- ----------------------------
INSERT INTO `erp_develop_order` VALUES ('3', null, '0', '0', '0', '1', '1');
INSERT INTO `erp_develop_order` VALUES ('4', null, '0', '0', '0', '0', '1');
INSERT INTO `erp_develop_order` VALUES ('5', null, '0', '0', '0', '0', '1');

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
INSERT INTO `erp_develop_order_comment` VALUES ('1', '5', '0', '开发准备中');
INSERT INTO `erp_develop_order_comment` VALUES ('1', '7', '0', '开发准备中');
INSERT INTO `erp_develop_order_comment` VALUES ('1', '8', '0', '开发准备中');
INSERT INTO `erp_develop_order_comment` VALUES ('1', '5', '0', '开发中');
INSERT INTO `erp_develop_order_comment` VALUES ('1', '6', '0', '开发准备中');
INSERT INTO `erp_develop_order_comment` VALUES ('1', '8', '0', '结束');

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
INSERT INTO `erp_develop_user` VALUES ('1', '5', '5002.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('1', '7', '5002.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('2', '5', '10000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('2', '6', '10000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('2', '7', '10000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('2', '8', '10000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('2', '9', '10000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('2', '10', '10000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('3', '5', '4000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('3', '15', '4000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('4', '5', '5000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('4', '6', '5000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('4', '7', '5000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('4', '8', '5000.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('5', '5', '24135.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('5', '6', '24135.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('5', '7', '24135.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('5', '8', '24135.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('8', '5', '41524.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('10', '5', '6.00', '0', '0');
INSERT INTO `erp_develop_user` VALUES ('10', '7', '6.00', '0', '0');

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
  `check_time` varchar(32) DEFAULT '0' COMMENT '审核通过时间',
  `doamin_user` tinyint(4) DEFAULT '0' COMMENT '0域名属于公司，1域名属于客户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='域名库';

-- ----------------------------
-- Records of erp_domain
-- ----------------------------
INSERT INTO `erp_domain` VALUES ('1', '15', 'wanqian.net', '新网互联', '1413273127', '1476345127', '1', '1', '1413273140', '0');
INSERT INTO `erp_domain` VALUES ('2', '18', 'jiuxu.com', '新网互联', '1413353363', '1476425363', '1', '1', '1413363270', '0');
INSERT INTO `erp_domain` VALUES ('3', '19', 'wanqian.com', '新网互联', '1413356899', '1444892899', '1', '1', '1413363634', '0');
INSERT INTO `erp_domain` VALUES ('4', '2', 'zhihuiyun.com', '新网互联', '1413357747', '1444893747', '0', '1', '0', '0');
INSERT INTO `erp_domain` VALUES ('5', '5', 'mangshan.com', '新网互联', '1413357860', '1444893860', '1', '1', '1413532376', '0');
INSERT INTO `erp_domain` VALUES ('6', '4', 'wangyi.com', '新网互联', '1413357882', '1476429882', '1', '-1', '1413362983', '0');
INSERT INTO `erp_domain` VALUES ('7', '11', 'jiyuan.com', '中资源', '1413439007', '1444975007', '1', '1', '1413439911', '1');
INSERT INTO `erp_domain` VALUES ('8', '6', 'huadu.com', '新网互联', '1413441899', '1444977899', '0', '1', '0', '0');
INSERT INTO `erp_domain` VALUES ('9', '8', 'qingfeng.com', '新网互联', '1413442891', '1444978891', '0', '1', '0', '0');
INSERT INTO `erp_domain` VALUES ('10', '7', 'jinchengbuyi.com', '新网互联', '1413443047', '1444979047', '0', '1', '0', '0');
INSERT INTO `erp_domain` VALUES ('11', '10', 'liubo.net', '中资源', '1413443347', '1444979347', '0', '1', '0', '1');

-- ----------------------------
-- Table structure for `erp_domain_renewal`
-- ----------------------------
DROP TABLE IF EXISTS `erp_domain_renewal`;
CREATE TABLE `erp_domain_renewal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(10) unsigned NOT NULL COMMENT '所属域名ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '续费金额',
  `org_expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '原过期时间',
  `new_expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '新过期时间',
  `pay_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '付款时间',
  `check_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  `user_id` int(10) DEFAULT NULL COMMENT '续费申请人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='域名续费记录表';

-- ----------------------------
-- Records of erp_domain_renewal
-- ----------------------------
INSERT INTO `erp_domain_renewal` VALUES ('1', '1', '600.00', '1444809127', '1476345127', '2014.9.19', '1413363028', '1', '1', '0');
INSERT INTO `erp_domain_renewal` VALUES ('2', '6', '600.00', '1444893882', '1476429882', '2014.9.19', '1413443447', '1', '1', '0');
INSERT INTO `erp_domain_renewal` VALUES ('3', '2', '600.00', '1444889363', '1476425363', '2014.9.19', '1413443663', '1', '1', '16');
INSERT INTO `erp_domain_renewal` VALUES ('4', '2', '600.00', '1444889363', '1476425363', '2014.10.16', '1413443659', '1', '1', '16');
INSERT INTO `erp_domain_renewal` VALUES ('5', '3', '600.00', '1444892899', '1476428899', '2014.10.16', '0', '0', '1', '17');

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
  `signed_time` varchar(10) NOT NULL COMMENT '签单日期',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  `time_limit` int(10) DEFAULT NULL COMMENT '订单期限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='订单表; 财务审核后, 由签单人员和签单部门来 决定 此订单分配至 哪个订单户池';

-- ----------------------------
-- Records of erp_order
-- ----------------------------
INSERT INTO `erp_order` VALUES ('1', '2', '1', '6', '5002.00', '无', '2015-1-1', '2014-1-1', '1', '1', null);
INSERT INTO `erp_order` VALUES ('2', '2', '1', '6', '10000.00', '无', '2015-1-1', '2014-1-1', '0', '1', null);
INSERT INTO `erp_order` VALUES ('3', '4', '2', '6', '4000.00', '无', '2015-1-1', '2014-1-1', '1', '1', null);
INSERT INTO `erp_order` VALUES ('4', '4', '3', '6', '5000.00', '无', '2015-1-1', '2014-1-1', '1', '1', null);
INSERT INTO `erp_order` VALUES ('5', '4', '4', '6', '24135.00', '无', '2015-1-1', '2014-1-1', '1', '1', null);
INSERT INTO `erp_order` VALUES ('8', '4', '1', '6', '41524.00', '无', '2015-1-1', '2014-1-1', '0', '1', null);
INSERT INTO `erp_order` VALUES ('9', '4', '2', '3', '54545.00', '无', '2015-1-1', '2014-1-1', '1', '1', null);
INSERT INTO `erp_order` VALUES ('10', '4', '2', '6', '6.00', '无', '2015-1-1', '2014-1-1', '0', '1', null);
INSERT INTO `erp_order` VALUES ('11', '4', '3', '6', '3252.00', '无', '2015-1-1', '2014-1-1', '0', '1', null);
INSERT INTO `erp_order` VALUES ('13', '12', '14', '1', '5000.00', 's', '2015-1-1', '2014-1-1', '0', '1', null);
INSERT INTO `erp_order` VALUES ('14', '12', '14', '1', '5000.00', 's', '2015-1-1', '2014-1-1', '0', '1', null);
INSERT INTO `erp_order` VALUES ('15', '12', '15', '3', '5000.00', 'afgafgqrgqerg', '2015-1-1', '2014-1-1', '0', '1', null);
INSERT INTO `erp_order` VALUES ('16', '0', '0', '0', '0.00', null, '2015-1-1', '2014-1-1', '0', '1', null);
INSERT INTO `erp_order` VALUES ('17', '0', '0', '0', '0.00', null, '2015-1-1', '2014-1-1', '0', '1', null);
INSERT INTO `erp_order` VALUES ('18', '12', '18', '1', '1000.00', '域名未注册', '2015-1-1', '2014-1-1', '0', '1', null);
INSERT INTO `erp_order` VALUES ('19', '12', '19', '1', '1000.00', '', '2015-1-1', '2014-1-1', '0', '1', null);
INSERT INTO `erp_order` VALUES ('20', '12', '1', '1', '1000.00', '', '2015-1-1', '2014-1-1', '0', '1', null);
INSERT INTO `erp_order` VALUES ('21', '12', '10', '1', '5000.00', '组织者', '0', '', '0', '1', '1');
INSERT INTO `erp_order` VALUES ('22', '12', '1', '1', '0.00', '', '0', '2014-10-15', '0', '1', '1');
INSERT INTO `erp_order` VALUES ('23', '12', '1', '1', '0.00', '', '0', '2014-10-15', '0', '1', '1');
INSERT INTO `erp_order` VALUES ('24', '12', '1', '1', '0.00', '', '2015-10-15', '2014-10-15', '0', '1', '1');
INSERT INTO `erp_order` VALUES ('25', '12', '6', '4', '5000.00', '111', '2019-10-14', '2014-10-15', '0', '1', '5');
INSERT INTO `erp_order` VALUES ('26', '12', '12', '1', '5000.00', '当当当', '2016-10-14', '2014-10-15', '0', '1', '2');
INSERT INTO `erp_order` VALUES ('27', '0', '3', '2', '5000.00', '', '2017-10-14', '2014-10-15', '0', '1', '3');
INSERT INTO `erp_order` VALUES ('28', '1', '11', '1', '1000.00', '', '2015-10-16', '2014-10-16', '0', '1', '1');
INSERT INTO `erp_order` VALUES ('29', '1', '7', '1', '1000.00', '', '2015-10-16', '2014-10-16', '0', '1', '1');
INSERT INTO `erp_order` VALUES ('30', '11', '8', '2', '1000.00', '', '2015-10-16', '2014-10-16', '0', '1', '1');

-- ----------------------------
-- Table structure for `erp_order_depart`
-- ----------------------------
DROP TABLE IF EXISTS `erp_order_depart`;
CREATE TABLE `erp_order_depart` (
  `order_id` int(10) unsigned NOT NULL,
  `depart_id` int(10) unsigned NOT NULL,
  `last_depart_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上一个经手的部门',
  `is_use` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否应用中 0否 1是; 每个order只能有一条记录为1',
  `create_time` varchar(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`,`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单-部门 关系表; 记录订单现在处于哪个部门的工作流程中';

-- ----------------------------
-- Records of erp_order_depart
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
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '付款金额',
  `class` enum('2','1') NOT NULL DEFAULT '1' COMMENT '1-预付款; 2-余款',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `pay_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '付款时间',
  `check_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='订单付款记录(预付款,余款)';

-- ----------------------------
-- Records of erp_order_pay
-- ----------------------------
INSERT INTO `erp_order_pay` VALUES ('1', '1', '1001.00', '1', '1', '2014.9.20', '2014.9.19', '1');
INSERT INTO `erp_order_pay` VALUES ('2', '2', '2000.00', '2', '1', '2014.9.18', '2014.9.19', '1');
INSERT INTO `erp_order_pay` VALUES ('3', '3', '56456700.00', '1', '1', '2014.9.18', '2014.9.18', '1');
INSERT INTO `erp_order_pay` VALUES ('4', '4', '1324.00', '2', '1', '2014.9.18', '2014.9.18', '1');
INSERT INTO `erp_order_pay` VALUES ('5', '5', '34.00', '2', '1', '2014.9.18', '2014.9.18', '1');
INSERT INTO `erp_order_pay` VALUES ('6', '6', '23415.00', '1', '1', '2014.9.18', '2014.9.18', '1');
INSERT INTO `erp_order_pay` VALUES ('7', '7', '4123.00', '1', '1', '2014.9.18', '2014.9.18', '1');
INSERT INTO `erp_order_pay` VALUES ('8', '8', '300.00', '2', '1', '2014.9.20', '2014.9.18', '1');
INSERT INTO `erp_order_pay` VALUES ('9', '9', '343.00', '1', '1', '2014.9.18', '2014.9.18', '1');
INSERT INTO `erp_order_pay` VALUES ('10', '10', '34.00', '2', '1', '2014.9.18', '2014.9.18', '1');

-- ----------------------------
-- Table structure for `erp_order_renewal`
-- ----------------------------
DROP TABLE IF EXISTS `erp_order_renewal`;
CREATE TABLE `erp_order_renewal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL COMMENT '所属订单ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '续费金额',
  `org_expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '原过期时间',
  `new_expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '新过期时间',
  `pay_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '付款时间',
  `check_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  `remark` varchar(225) DEFAULT NULL COMMENT '备注',
  `ren_time` int(10) DEFAULT NULL COMMENT '续费年限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='订单续费记录表';

-- ----------------------------
-- Records of erp_order_renewal
-- ----------------------------
INSERT INTO `erp_order_renewal` VALUES ('1', '2', '300.00', '2015-1-1', '0', '0', '0', '0', '1', null, null);
INSERT INTO `erp_order_renewal` VALUES ('2', '3', '5000.00', '2015-1-1', '0', '0', '0', '0', '1', null, null);
INSERT INTO `erp_order_renewal` VALUES ('3', '3', '5000.00', '2015-1-1', '2017-10-15', '2014-10-16', '0', '0', '1', 'ty', '3');

-- ----------------------------
-- Table structure for `erp_product`
-- ----------------------------
DROP TABLE IF EXISTS `erp_product`;
CREATE TABLE `erp_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '产品名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='产品库';

-- ----------------------------
-- Records of erp_product
-- ----------------------------
INSERT INTO `erp_product` VALUES ('1', '手工网站', '1');
INSERT INTO `erp_product` VALUES ('2', '生意宝', '0');
INSERT INTO `erp_product` VALUES ('3', '智能建站11', '1');
INSERT INTO `erp_product` VALUES ('4', '慧聪', '0');
INSERT INTO `erp_product` VALUES ('5', '搜狗', '1');
INSERT INTO `erp_product` VALUES ('6', '关键词优化', '0');
INSERT INTO `erp_product` VALUES ('7', 'ewrqwerqwerq', '1');
INSERT INTO `erp_product` VALUES ('8', 'ewrqwerqwerq', '0');
INSERT INTO `erp_product` VALUES ('9', '苹果', '1');
INSERT INTO `erp_product` VALUES ('10', '优化1；', '-1');

-- ----------------------------
-- Table structure for `erp_public_customer`
-- ----------------------------
DROP TABLE IF EXISTS `erp_public_customer`;
CREATE TABLE `erp_public_customer` (
  `cust_id` int(10) unsigned NOT NULL COMMENT '客户ID',
  `public_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '公开的时间',
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公海客户';

-- ----------------------------
-- Records of erp_public_customer
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优化-订单池;  由产品客服部来管理 , 分配制作人员';

-- ----------------------------
-- Records of erp_seo_order
-- ----------------------------
INSERT INTO `erp_seo_order` VALUES ('3', null, '0', '0', '0', '0', '1');

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
INSERT INTO `erp_seo_order_comment` VALUES ('1', '9', '2014', '正在进行中');
INSERT INTO `erp_seo_order_comment` VALUES ('1', '10', '2014', '正在进行中');
INSERT INTO `erp_seo_order_comment` VALUES ('1', '11', '2014', '正在进行中');
INSERT INTO `erp_seo_order_comment` VALUES ('1', '12', '2014', '正在进行中');

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
INSERT INTO `erp_seo_user` VALUES ('1', '9', '5002.00', '0', '0');
INSERT INTO `erp_seo_user` VALUES ('2', '9', '10000.00', '0', '0');
INSERT INTO `erp_seo_user` VALUES ('2', '10', '10000.00', '0', '0');
INSERT INTO `erp_seo_user` VALUES ('2', '11', '10000.00', '0', '0');
INSERT INTO `erp_seo_user` VALUES ('2', '12', '10000.00', '0', '0');
INSERT INTO `erp_seo_user` VALUES ('3', '9', '4000.00', '0', '0');
INSERT INTO `erp_seo_user` VALUES ('4', '9', '5000.00', '0', '0');
INSERT INTO `erp_seo_user` VALUES ('5', '9', '24135.00', '0', '0');
INSERT INTO `erp_seo_user` VALUES ('8', '9', '41524.00', '0', '0');

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
  `sex` enum('0','1') NOT NULL DEFAULT '1' COMMENT '1男 0女',
  `birthday` varchar(32) DEFAULT '0' COMMENT '生日',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `last_login_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '上次登录时间',
  `last_login_ip` varchar(32) NOT NULL DEFAULT '0' COMMENT '上次登录IP',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of erp_user
-- ----------------------------
INSERT INTO `erp_user` VALUES ('1', 'admin', '6fa0446fa9335c25c3cf97b241210b35', '0', '超管', '1', '0', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('2', 'administrator', '6fa0446fa9335c25c3cf97b241210b35', '0', '超管', '1', '0', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('4', 'test', '6fa0446fa9335c25c3cf97b241210b35', '1', '测试人员', '0', '1990.4.5', '3', '20149.18', '192.168.1.48', '-1');
INSERT INTO `erp_user` VALUES ('5', 'zhao', '', '2', '赵', '1', '0', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('6', 'qian', '', '3', '钱', '1', '0', '0', '0', '0', '0');
INSERT INTO `erp_user` VALUES ('7', 'sun', '', '4', '孙', '1', '0', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('8', 'li', '', '5', '李', '1', '0', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('9', 'zhou', '', '6', '周', '1', '0', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('10', 'wu', '', '7', '吴', '1', '0', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('11', 'zheng', '', '8', '郑', '1', '0', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('12', 'wang', '', '1', '王', '1', '0', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('13', 'baidu', '', '2', '百度', '1', '0', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('14', 'wcd', 'aerwe', '3', '', '1', '342423', '0', '0', '0', '0');
INSERT INTO `erp_user` VALUES ('15', 'ccd', 'dada', '4', '愁肠断', '1', '3423423', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('16', 'asdas', '123456', '11', '张三', '1', '1991.12.12', '0', '0', '0', '1');
INSERT INTO `erp_user` VALUES ('17', 'lisi', 'lisi', '11', '李四', '1', '1991.12.12', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `erp_user_cust_apply`
-- ----------------------------
DROP TABLE IF EXISTS `erp_user_cust_apply`;
CREATE TABLE `erp_user_cust_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '申请人ID',
  `cust_id` int(10) unsigned NOT NULL COMMENT '客户ID',
  `class` enum('delay','new') DEFAULT 'new' COMMENT 'new-新申请 delay-延期',
  `apply_days` tinyint(4) NOT NULL COMMENT '申请天数',
  `agree_days` tinyint(4) NOT NULL DEFAULT '0' COMMENT '批准天数',
  `org_expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '原过期时间 0:永久',
  `new_expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '新过期时间 0:永久',
  `apply_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '申请的时间',
  `check_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '审核的时间',
  `check_user` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审核人ID',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工-客户 权限申请记录';

-- ----------------------------
-- Records of erp_user_cust_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_user_cust_prod`
-- ----------------------------
DROP TABLE IF EXISTS `erp_user_cust_prod`;
CREATE TABLE `erp_user_cust_prod` (
  `user_id` int(10) unsigned NOT NULL,
  `cust_id` int(10) unsigned NOT NULL,
  `prod_id` int(10) unsigned NOT NULL COMMENT '0:所有产品的权限',
  `expired_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '权限过期时间 0:永不过期',
  PRIMARY KEY (`user_id`,`cust_id`,`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工-客户-产品 权限表; 用于销售,客服 拜访';

-- ----------------------------
-- Records of erp_user_cust_prod
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
-- Table structure for `erp_valadd_comment`
-- ----------------------------
DROP TABLE IF EXISTS `erp_valadd_comment`;
CREATE TABLE `erp_valadd_comment` (
  `valadd_id` int(10) unsigned NOT NULL COMMENT '所属增值服务ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '评论用户ID',
  `post_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '提交时间',
  `content` text COMMENT '内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='增值服务-沟通记录表';

-- ----------------------------
-- Records of erp_valadd_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_valadd_order`
-- ----------------------------
DROP TABLE IF EXISTS `erp_valadd_order`;
CREATE TABLE `erp_valadd_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '增值服务主键ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '销售人员ID',
  `cust_id` int(10) unsigned NOT NULL COMMENT '所属客户ID',
  `fees` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '费用',
  `remark` text COMMENT '制作要求',
  `start_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `finish_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '完成时间',
  `is_paid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未付款  1:已付款',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1:拒绝 0:待审 >1:通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '-1:删除 0:禁用 1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户 增值服务池';

-- ----------------------------
-- Records of erp_valadd_order
-- ----------------------------

-- ----------------------------
-- Table structure for `erp_valadd_user`
-- ----------------------------
DROP TABLE IF EXISTS `erp_valadd_user`;
CREATE TABLE `erp_valadd_user` (
  `valadd_id` int(10) unsigned NOT NULL COMMENT '增值服务ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '员工ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '获得的总业绩',
  `finish_rate` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '完成率',
  `update_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '完成率更新时间',
  PRIMARY KEY (`valadd_id`,`user_id`)
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
INSERT INTO `erp_visit_prod` VALUES ('4', '1', '测试 添加沟通记录');
INSERT INTO `erp_visit_prod` VALUES ('5', '5', '');
INSERT INTO `erp_visit_prod` VALUES ('8', '1', '洛阳炘源晶光伏科技有限公司');
INSERT INTO `erp_visit_prod` VALUES ('9', '1', '测试测试');
INSERT INTO `erp_visit_prod` VALUES ('9', '2', '测试');
INSERT INTO `erp_visit_prod` VALUES ('10', '1', '智慧云');
INSERT INTO `erp_visit_prod` VALUES ('11', '1', '	邙山苗圃');
INSERT INTO `erp_visit_prod` VALUES ('12', '1', '有意向');
INSERT INTO `erp_visit_prod` VALUES ('13', '1', '有意向，需时间');
INSERT INTO `erp_visit_prod` VALUES ('14', '1', '有意向');
INSERT INTO `erp_visit_prod` VALUES ('15', '1', '洛阳万谦网络科技有限公司三门峡分公司');
INSERT INTO `erp_visit_prod` VALUES ('16', '1', '邙山苗圃');
INSERT INTO `erp_visit_prod` VALUES ('17', '1', '洛阳万谦网络科技有限公司三门峡分公司');
INSERT INTO `erp_visit_prod` VALUES ('18', '1', '才踩踩踩踩踩踩');
INSERT INTO `erp_visit_prod` VALUES ('19', '1', 'yiqian');
INSERT INTO `erp_visit_prod` VALUES ('20', '1', '有意向');
INSERT INTO `erp_visit_prod` VALUES ('21', '1', 'll');
INSERT INTO `erp_visit_prod` VALUES ('22', '1', 'dd');

-- ----------------------------
-- Event structure for `test`
-- ----------------------------
DROP EVENT IF EXISTS `test`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `test` ON SCHEDULE EVERY 1 DAY STARTS '2014-08-12 00:00:01' ON COMPLETION PRESERVE DISABLE DO INSERT INTO `erp_user_cust_prod` VALUES (1,2,3,4)
;;
DELIMITER ;
