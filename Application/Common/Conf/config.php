<?php
return array(
// 	'AUTOLOAD_NAMESPACE' => array('Addons' => ADDON_PATH), //扩展模块列表
	'DEFAULT_TIMEZONE'			=>	'PRC', //时区
	'URL_PATHINFO_DEPR'			=>	'-', //参数之间的分割符号  默认是'/'
	'URL_CASE_INSENSITIVE' => true, //默认false 表示URL区分大小写 true则表示不区分大小写
    'URL_MODEL'                 =>  2, // 1:PATHINFO  2:rewrite 如果你的环境不支持PATHINFO 请设置为3
    'SHOW_PAGE_TRACE'           =>  false,//显示调试信息
    
    'DB_TYPE'                   =>  'mysqli',
    'DB_HOST'                   =>  'localhost',
    'DB_NAME'                   =>  'wqerp',
    'DB_USER'                   =>  'root',
    'DB_PWD'                    =>  '',
    'DB_PORT'                   =>  '3306',
    'DB_PREFIX'                 =>  'erp_',
	
//	'TOKEN_ON'					=>	TRUE,
//	'TOKEN_NAME'				=>	'__hash__',

//	'TMPL_ACTION_ERROR'			=>	TMPL_PATH.'dispatch_jump.tpl', // 错误跳转对应的模板文件
//	'TMPL_ACTION_SUCCESS'		=>	TMPL_PATH.'dispatch_jump.tpl', // 成功跳转对应的模板文件
	'PW_PREFIX'					=>	'ksdd378', //用户密码前缀
	'LIST_ROWS'					=>	20,	//每页的条数
);
