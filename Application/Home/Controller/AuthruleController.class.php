<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Auth_ruleModel;
class AuthruleController extends HomeBaseController{
	/** 查询所有权限 */
	public function all_rule(){
// 		/*--------wcd权限判断---------*/
// 		//获取当前模块名称
// 		$contro=CONTROLLER_NAME;
// 		//获取当前操作名称
// 		$actio=ACTION_NAME;
// 		//获取当前访问规则
// 		$cd_rule="Home/".$contro."/".$actio;
// 		$uid = UID;
// 		if($this::cd_rule_check($uid,$cd_rule)!=1){
// 			$this->error('没有权限禁止操作！！！');
// 		}
// 		/*--------wcd权限判断---------*/
		if (!IS_ROOT){ //非超管
		   $this->error('您没有权限，不能进行此操作！');
		}
		$rule=new Auth_ruleModel();
		$map=" status=1";
		$ztree=$rule->ztreeArr($map);
		$this->data=json_encode($ztree);
		$this->display();
	}

}