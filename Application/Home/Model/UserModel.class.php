<?php
namespace Home\Model;
use Think\Model;

class UserModel extends Model {
	
	/**
	 * 登录用户
	 * @param  array $map 用户查询条件 account & password
	 * @return boolean      ture-登录成功，false-登录失败
	 */
	public function login($map) {
		if (empty($map)) {
			$this->error = '登录条件异常！';
			return false;
		}
		$password = $map['password'];
		unset($map['password']);
		
		$user = $this->where($map)->find();
		if(!$user || 1 != $user['status']) {
			$this->error = '用户不存在或已被禁用！';
			return false;
		}
		if($user['password'] != pwd_hash($password)) {
			$this->error = '密码错误！';
			return false;
		}
		
		/* 登录用户 */
		$this->autoLogin($user);
		
		// XXX 行为  用户登录
		tag('user_login');
		
		return true;
	}
	
	/**
	 * 注销当前用户
	 * @return void
	 */
	public function logout(){
		session('user_auth', null);
		session('user_auth_sign', null);
	}
	
	/**
	 * 自动登录用户
	 * @param  integer $user 用户信息数组
	 */
	private function autoLogin($user){
		/* 更新登录信息 */
		$data = array(
				'uid'             => $user['id'],
				'login_times'           => array('exp', '`login_times`+1'),
				'last_login_time' => NOW_TIME,
				'last_login_ip'   => get_client_ip(1)
		);
		$this->save($data);
	
		/* 记录登录SESSION和COOKIES */
		$auth = array(
				'uid'             => $user['id'],
				'realname'        => $user['realname'],
				'last_login_time' => $user['last_login_time'],
				'last_login_ip'   => $user['last_login_ip']
		);
	
		session('user_auth', $auth);
		session('user_auth_sign', data_auth_sign($auth));
	
	}
}