<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Auth_ruleModel;
class AuthruleController extends HomeBaseController{
	/** 查询所有权限 */
	public function all_rule(){
		$rule=new Auth_ruleModel();
		$map=" status=1";
		$ztree=$rule->ztreeArr($map);
		$this->data=json_encode($ztree);
		$this->display();
	}

}