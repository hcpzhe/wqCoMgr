<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Auth_groupModel;
use Home\Model\Auth_ruleModel;
class AuthgroupController extends HomeBaseController{
	/** 用户组列表 */
	public function user_group(){
// 		if (!IS_ROOT){ //非超管
// 			$this->error('您没有权限，不能进行此操作！');
// 		}		
		/*--------wcd权限判断---------*/
		//获取当前模块名称
		$contro=CONTROLLER_NAME;
		//获取当前操作名称
		$actio=ACTION_NAME;
		//获取当前访问规则
		$cd_rule="Home/".$contro."/".$actio;
		$uid = UID;
		if($this::cd_rule_check($uid,$cd_rule)!=1){
			$this->error('没有权限禁止操作！！！');
		}
		/*--------wcd权限判断---------*/
		$auth_group=new Auth_groupModel();
		$this->list=$auth_group->lists();
		$this->display();
	}
	/**用户组详情  */
	public function info($id){
// 		if (!IS_ROOT){ //非超管
// 		   $this->error('您没有权限，不能进行此操作！');
// 		}
		/*--------wcd权限判断---------*/
		//获取当前模块名称
		$contro=CONTROLLER_NAME;
		//获取当前操作名称
		$actio=ACTION_NAME;
		//获取当前访问规则
		$cd_rule="Home/".$contro."/".$actio;
		$uid = UID;
		if($this::cd_rule_check($uid,$cd_rule)!=1){
			$this->error('没有权限禁止操作！！！');
		}
		/*--------wcd权限判断---------*/
		/*用户组权限信息*/
		$auth_group=new Auth_groupModel();
		$map=" status=1";
		$ztree=$auth_group->ztreeArr($map,$id);
		$this->data=json_encode($ztree);
		
		/*用户组信息*/
		$auth_group=new Auth_groupModel();
		$ginfo=$auth_group->where("id=$id")->find();
		$this->group_info=$ginfo;
		$this->display();
	}
	/*修改用户组信息*/
	public function up(){
// 		if (!IS_ROOT){ //非超管
// 			$this->error('您没有权限，不能进行此操作！');
// 		}
		/*--------wcd权限判断---------*/
		//获取当前模块名称
		$contro=CONTROLLER_NAME;
		//获取当前操作名称
		$actio=ACTION_NAME;
		//获取当前访问规则
		$cd_rule="Home/".$contro."/".$actio;
		$uid = UID;
		if($this::cd_rule_check($uid,$cd_rule)!=1){
			$this->error('没有权限禁止操作！！！');
		}
		/*--------wcd权限判断---------*/
		$id=$_POST['id'];
		$map['title']=$_POST['gp_tit'];
		$map['description']=$_POST['gp_des'];
		$map['rules']=implode(',', $_POST['rules']);
		$authgroup=new Auth_groupModel();
		$flag=$authgroup->where("id=$id")->save($map);
		if($flag==0){ $this->error('更新失败'); }
		else{$this->success('更新成功');}

	}
}