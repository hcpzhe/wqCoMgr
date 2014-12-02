<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Think\Org\Net\IpLocation;
class IndexController extends HomeBaseController {

	public function index(){
		$this->display();
	}
	
	public function welcome() {
		$arr = session('user_auth');
		$uid=$arr['uid'];
		$User = M("User");
		$users = $User->table('erp_user as ur,erp_depart as de')
		->where('ur.depart_id=de.id AND ur.id='.$uid)
		->getField("ur.id as id,ur.account as account,ur.realname as realname,de.name as name,ur.sex as sex,ur.position as position,ur.startime as startime,ur.birthday as birthday,ur.status as status,ur.last_login_ip as last_login_ip,ur.login_times as login_times,ur.last_login_time as last_login_time");
	    $this->assign('users',$users);
		$this->display();
	}
}