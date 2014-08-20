<?php
return array(
	'USER_ADMINISTRATOR'	=> array(1,2),//超管用户ID
	'SESSION_OPTIONS'		=> array('name'=>'SITESESSID','path'=>SESSION_PATH),
	'SESSION_PREFIX'		=> 'wqCoMgrHm_', //session前缀, 用于区分不同模块的session
	'CURRENT_URL_NAME'		=> 'wqCoMgrHmCurtUrl',	//currentUrl的cookie名称
	
    /* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__ADDONS__' => __ROOT__ . '/Public/addons',
        '__IMG__'    => __ROOT__ . '/Public/images',
        '__CSS__'    => __ROOT__ . '/Public/css',
        '__JS__'     => __ROOT__ . '/Public/js',
    ),
	
	/* auth权限类配置 */
	'AUTH_CONFIG' => array(
        'AUTH_ON'           => false,                      // 认证开关
        'AUTH_TYPE'         => 1,                         // 认证方式，1为实时认证；2为登录认证。
        'AUTH_GROUP'        => C('DB_PREFIX').'auth_group',        // 用户组数据表名
        'AUTH_GROUP_ACCESS' => C('DB_PREFIX').'auth_group_access', // 用户-用户组关系表
        'AUTH_RULE'         => C('DB_PREFIX').'auth_rule',         // 权限规则表
        'AUTH_USER'         => C('DB_PREFIX').'user'             // 用户信息表
    ),
	
	/* 文件上传相关配置 */
	'DOWNLOAD_UPLOAD' => array(
		'mimes'    => '', //允许上传的文件MiMe类型
		'maxSize'  => 5*1024*1024, //上传的文件大小限制 (0-不做限制)
		'exts'     => 'jpg,gif,png,jpeg,zip,rar,tar,gz,7z,doc,docx,txt,xml', //允许上传的文件后缀
		'autoSub'  => true, //自动子目录保存文件
		'subName'  => array('date', 'Y-m-d'), //子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
		'rootPath' => './Uploads/Download/', //保存根路径
		'savePath' => '', //保存路径
		'saveName' => array('uniqid', ''), //上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
		'saveExt'  => '', //文件保存后缀，空则使用原后缀
		'replace'  => false, //存在同名是否覆盖
		'hash'     => true, //是否生成hash编码
		'callback' => false, //检测文件是否存在回调函数，如果存在返回文件信息数组
	), //下载模型上传配置（文件上传类配置）
	
    /* 图片上传相关配置 */
    'PICTURE_UPLOAD' => array(
		'mimes'    => '', //允许上传的文件MiMe类型
		'maxSize'  => 2*1024*1024, //上传的文件大小限制 (0-不做限制)
		'exts'     => 'jpg,gif,png,jpeg', //允许上传的文件后缀
		'autoSub'  => true, //自动子目录保存文件
		'subName'  => array('date', 'Y-m-d'), //子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
		'rootPath' => './Uploads/Picture/', //保存根路径
		'savePath' => '', //保存路径
		'saveName' => array('uniqid', ''), //上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
		'saveExt'  => '', //文件保存后缀，空则使用原后缀
		'replace'  => false, //存在同名是否覆盖
		'hash'     => true, //是否生成hash编码
		'callback' => false, //检测文件是否存在回调函数，如果存在返回文件信息数组
    ), //图片上传相关配置（文件上传类配置）
    
    /* 编辑器图片上传相关配置 */
    'EDITOR_UPLOAD' => array(
		'mimes'    => '', //允许上传的文件MiMe类型
		'maxSize'  => 2*1024*1024, //上传的文件大小限制 (0-不做限制)
		'exts'     => 'jpg,gif,png,jpeg', //允许上传的文件后缀
		'autoSub'  => true, //自动子目录保存文件
		'subName'  => array('date', 'Y-m-d'), //子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
		'rootPath' => './Uploads/Editor/', //保存根路径
		'savePath' => '', //保存路径
		'saveName' => array('uniqid', ''), //上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
		'saveExt'  => '', //文件保存后缀，空则使用原后缀
		'replace'  => false, //存在同名是否覆盖
		'hash'     => true, //是否生成hash编码
		'callback' => false, //检测文件是否存在回调函数，如果存在返回文件信息数组
    ),
	
);