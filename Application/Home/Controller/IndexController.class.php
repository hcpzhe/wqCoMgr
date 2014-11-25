<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;

class IndexController extends HomeBaseController {

	public function index(){
		$this->display();
	}
	
	public function welcome() {
		$arr = session('user_auth');
		$uid=$arr['uid'];
		$User = M("User");
		$users = $User->table('erp_user as ur,erp_depart as de')
		->where('ur.depart_id=de.id AND ur.id='.$uid)->select();
	    $this->assign('users',$users);
		$this->display();
	}
}