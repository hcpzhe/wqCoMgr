<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\UserModel;
class  UserController extends HomeBaseController{
	/*获取系统用户列表*/
	public  function user_list(){
		$user=new UserModel();
		$this->user_list=$user->userlist();
		$this->display();
	}
}