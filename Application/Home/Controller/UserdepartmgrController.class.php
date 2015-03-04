<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\UserModel;
use Home\Model\DepartModel;
use Home\Model\User_depart_mgrModel;
class UserdepartmgrController extends HomeBaseController{
	/*查询所有部门的管理人员*/
	public function lis(){
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
		$mgr=new User_depart_mgrModel();
		$this->ugs=$mgr->table('erp_user_depart_mgr as eudm,erp_user as eu,erp_depart as ed')->where("eudm.user_id=eu.id AND eudm.depart_id=ed.id")->field("eu.realname as uname,ed.name as dname,eudm.user_id as uid,eudm.depart_id as did")->select();
		$this->display();
	}
	/*跳转到添加部门管理人员页面*/
	public function ad_form(){
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
// 		if (!IS_ROOT){ //非超管
// 		   $this->error('您没有权限，不能进行此操作！');
// 		}
		/**查询所有系统用户*/
		$user=new UserModel();
		$this->users=$user->alluser();
// 		echo $user->_sql();exit();
		/**查询所有部门*/
		$dp=new DepartModel();
		$this->dps=$dp->alldepart();
		$this->display();
	}
	/*取消指定管理人员管理权*/
	public function del($uid,$did){
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
// 		if (!IS_ROOT){ //非超管
// 		   $this->error('您没有权限，不能进行此操作！');
// 		}
		$map['user_id']=$_GET['uid'];
		$map['depart_id']=$did;
		$mgr=new User_depart_mgrModel();
		$flag=$mgr->where($map)->delete();
		if($flag==0){
			$this->error('取消失败');
		}else{ $this->success('取消成功');}
	}
	/**添加管理者*/
	public function ad(){
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
		/*--------wcd权限判断---------*/
		$userdepartmgr=new User_depart_mgrModel();
		$map['user_id']=$_POST['uid'];
		$map['depart_id']=$_POST['did'];
		/*查询是否重复添加*/
		$flag=$userdepartmgr->s_one($map['user_id'], $map['depart_id']);
		if(!$flag){
			$flag=$userdepartmgr->add($map);
			if($flag==0){
				$this->error('添加失败');
			}else{ $this->success('添加成功');}	
		}else {
			$this->error('重复添加');
		}
	}
}