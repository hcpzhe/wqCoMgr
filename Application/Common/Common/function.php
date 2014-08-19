<?php
//公共函数

/**
 * 检测用户是否登录
 * @return integer 0-未登录，大于0-当前登录用户ID
 */
function is_login(){
	$user = session('user_auth');
	if (empty($user)) {
		return 0;
	} else {
		return session('user_auth_sign') == data_auth_sign($user) ? $user['uid'] : 0;
	}
}

/**
 * 数据签名认证
 * @param  array  $data 被认证的数据
 * @return string       签名
 */
function data_auth_sign($data) {
	//数据类型检测
	if(!is_array($data)){
		$data = (array)$data;
	}
	ksort($data); //排序
	$code = http_build_query($data); //url编码并生成query字符串
	$sign = sha1($code); //生成签名
	return $sign;
}

/**
 * 检测当前用户是否为管理员
 * @param string $uid
 * @return boolean true-管理员，false-非管理员
 */
function is_administrator($uid = null){
	$uid = is_null($uid) ? is_login() : $uid;
	return $uid && (in_array(intval($uid), C('USER_ADMINISTRATOR')));
}

/**
 * 密码加密方法
 */
function pwd_hash($password, $type = 'md5') {
	return hash ( $type, C('PW_PREFIX').sha1($password) );
}

/**
 * 处理要在数据库中使用的字符串
 */
function strfordb($string) {
	return str_replace( array('%','_'), array('\%','\_'), $string );
}

/**
 * 批量ID处理
 */
function idshandle($idstr) {
//	$idstr = trim(trim($idstr,','));
	if (preg_match('/^([0-9]+(\,){0,1})+[^\,]$/',$idstr)) {
		return TRUE;
	}
	return FALSE;
}

/**
 * 站点URL匹配判断
 */
function urlmatch($url) {
	if (preg_match('/^(https?:\/\/)?([\da-z\.-])+\.([a-z\.]{2,6})\/?$/',$url)) {
		return TRUE;
	}
	return FALSE;
}

/**
 * 数据库查询前,时间区间处理
 */
function timehandle($start,$end) {
	$result = FALSE;
	$start_time = strtotime($start);//开始时间
	if ($start_time > 0) $result = array('egt',$start_time);//大于等于开始时间
	
	$end_time = strtotime($end);//截止时间
	if ($end_time > 0) {
		$tmp_end_time = getdate($end_time);
		$end_time = mktime('23','59','59',$tmp_end_time['mon'],$tmp_end_time['mday'],$tmp_end_time['year']);
		//小于等于截止时间
		if (is_array($result)) $result = array($result,array('elt',$end_time));
		else $result = array('elt',$end_time);
	}
	return $result;
}

/**
 * Enter description here ...
 * @param array $list
 * @param string/array $filed
 */
function field_unique($list, $filed) {
	$arr = array();
	if (!empty($list)) {
		if (is_array($filed)) {
			foreach ($filed as $k => $v) {
				$arr[$k] = field_unique($list,$v);
			}
		}else {
			$filedarr = explode(",", $filed);
			foreach ($list as $row) {
				foreach ($filedarr as $k => $v) {
					$arr[] = $row[$v];
				}
			}
			$arr = array_unique($arr);
		}
	}
	return $arr;
}


/**
 * 调用系统的API接口方法（静态方法）
 * api('User/getName','id=5'); 调用公共模块的User接口的getName方法
 * api('Admin/User/getName','id=5');  调用Admin模块的User接口
 * @param  string  $name 格式 [模块名]/接口名/方法名
 * @param  array|string  $vars 参数
 */
function api($name,$vars=array()){
	$array     = explode('/',$name);
	$method    = array_pop($array);
	$classname = array_pop($array);
	$module    = $array? array_pop($array) : 'Common';
	$callback  = $module.'\\Api\\'.$classname.'Api::'.$method;
	if(is_string($vars)) {
		parse_str($vars,$vars);
	}
	return call_user_func_array($callback,$vars);
}