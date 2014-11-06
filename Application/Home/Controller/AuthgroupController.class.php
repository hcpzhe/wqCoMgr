<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Auth_groupModel;
use Home\Model\Auth_ruleModel;
class AuthgroupController extends HomeBaseController{
	/** 用户组列表 */
	public function user_group(){
		$auth_group=new Auth_groupModel();
		$this->list=$auth_group->lists();
		$this->display();
	}
	/**用户组详情  */
	public function info($id){
		/*用户组信息*/
		$auth_group=new Auth_groupModel();
		$ginfo=$auth_group->where("id=$id")->find();
		$this->group_info=$ginfo;
		/*用户组权限信息*/
		$rule=new Auth_ruleModel();
		$rules=array();
		$arr=explode(',',$ginfo['rules']);
		foreach ($arr as $list){
			$rules[]=$rule->info($list);
		}
		/** 权限表所有信息*/
		$this->all_rule=$rule->all();
		
		$this->rules=$rules;
		$this->display();
	}
}