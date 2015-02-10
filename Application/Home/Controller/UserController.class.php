<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\UserModel;
use Home\Model\DepartModel;
use Home\Model\Auth_groupModel;
use Home\Model\Auth_group_accessModel;
class  UserController extends HomeBaseController{
	/*按条件查询系统用户*/
	public  function search_list(){
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
		/*获取搜索条件*/
		$depart = (int)I('param.depart');
		$key = I('param.key');
		/** 拼接where条件 */
		if(!empty($depart)){
			$where=$where." AND user.depart_id=".$depart;
		}	
		if(!empty($key)){
			$where=$where." AND ( depart.name like '%".$key."%' or `user`.account like '%".$key."%' or `user`.realname like '%".$key."%')";
		}
		$user=new UserModel();
		$this->data=$user->sealist($where);
		/** 查询所有部门  */
		$dp=new DepartModel();
		$this->depa_list=$dp->alldepart();
		$this->display();
	}
	/** 跳转到添加系统用户页面 */
	public function ad_user_form(){
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
<<<<<<< HEAD
=======
		}
		/*--------wcd权限判断---------*/
		if (!IS_ROOT){ //非超管
		   $this->error('您没有权限，不能进行此操作！');
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75
		}
		/*--------wcd权限判断---------*/
// 		if (!IS_ROOT){ //非超管
// 		   $this->error('您没有权限，不能进行此操作！');
// 		}
		/** 查询所有部门  */
		$depart=new DepartModel();
		$this->depa_list=$depart->depalist();
		/* 查询所有用户组*/
		$auth_group=new Auth_groupModel();
		$this->groups=$auth_group->lists();
		$this->display();
	} 
	/** 添加系统用户 */
	public function ad_user(){
		/*用户表添加一条数据*/
		$data['account']=$_POST['uname'];
		$data['password']=pwd_hash($_POST['upwd']);
		$data['realname']=$_POST['name'];
		$data['sex']=$_POST['sex'];
		$data['depart_id']=$_POST['dp'];
		$data['position']=$_POST['position'];  //职位
		$data['startime']=strtotime($_POST['startime']);  //入职时间
		$data['birthday']=strtotime($_POST['birthday']);
		$user=new UserModel();
		$flag=$user->add($data);
		if($flag==0){	$this->error('添加失败！');
		}else{	
			/**用户 用户组关系表添加一条数据*/
			$map["group_id"]=$_POST['auth_group'];
			$map["uid"]=$flag;
			$auth_group_access=new Auth_group_accessModel();
			$flag1=$auth_group_access->add($map);
			if($flag1==0){
				$this->error('添加失败');
			}
			$this->success('添加成功！');}
	}
	/** 查询某个用户的详细信息  */
	public function user_info(){	
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
<<<<<<< HEAD
=======
		}
		/*--------wcd权限判断---------*/
		if (!IS_ROOT){ //非超管			
		   $this->error('您没有权限，不能进行此操作！');
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75
		}
		/*--------wcd权限判断---------*/
// 		if (!IS_ROOT){ //非超管			
// 		   $this->error('您没有权限，不能进行此操作！');
// 		}
		/** 获取用户id	 */
		$id=$_GET['id'];
		$user=new UserModel();
		$this->info=$user->userinfo($id);
		/*获取所有部门*/
		$dp=new DepartModel();
		$this->departs=$dp->alldepart();
		/*查询所有用户组*/
		$auth_group=new Auth_groupModel();
		$this->groups=$auth_group->lists();
		$this->display();
	}
	/** 删除某个用户*/
	public function del_user($id){
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
// 		if (!IS_ROOT){ //非超管
// 		   $this->error('您没有权限，不能进行此操作！');
// 		}
		$user=new UserModel();
		$flag=$user->where("id=$id")->setField('status','-1');
		if($flag==1){	$this->success('删除成功！');
		}else{	$this->error('删除失败！');}
	}
	/** 禁用 */
	public function stop($id){
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
		if (!IS_ROOT){ //非超管
		   $this->error('您没有权限，不能进行此操作！');
		}
		$user=new UserModel();
		$flag=$user->where("id=$id")->setField("status","0");
		if($flag==1){ $this->success('成功');}
		else{ $this->error('失败');}
	}
	/** 启用 */
	public function star($id){
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
		if (!IS_ROOT){ //非超管
		   $this->error('您没有权限，不能进行此操作！');
		}
		$user=new UserModel();
		$flag=$user->where("id=$id")->setField("status","1");
		if($flag==1){ $this->success('成功');}
		else{ $this->error('失败');}
	}	
	/** 系统用户信息更改 */
	public function up(){
		$id=$_POST['id'];
		$group_id=$_POST['auth_group'];
		$data['account']=$_POST['uname'];
// 		$data['password']=$_POST['upwd'];
		$data['realname']=$_POST['name'];
		$data['sex']=$_POST['sex'];
		$data['depart_id']=$_POST['dp'];
		$data['position']=$_POST['position'];  //职位
		$data['startime']=strtotime($_POST['startime']);  //入职时间
		$data['birthday']=strtotime($_POST['birthday']);
		$user=new UserModel();
		$flag=$user->where("id=$id")->save($data);
		$auth_group_access=new Auth_group_accessModel();
		$flag1=$auth_group_access->up($id,$group_id);
		if($flag==1 or $flag1==1){	$this->success('修改成功！');
		}else{	
			$this->error('修改失败！');
		}
	}
	/***修改登录用户信息form***/
	public function user_update(){
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
		/** 获取用户id	 */
		$id= UID;
		$user=new UserModel();
		$this->info=$user->userinfo($id);
		/*获取所有部门*/
		$dp=new DepartModel();
		$this->departs=$dp->alldepart();
		/*查询所有用户组*/
		$auth_group=new Auth_groupModel();
		$this->groups=$auth_group->lists();
		$this->display();
		
	}
	public function pwd(){
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
		$this->display();
		}
	/***密码修改***/
	public function pwdupdate(){
<<<<<<< HEAD
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
=======
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
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75
		$User = M("User"); 
		$password = $_POST['pwd1c'];
	    $id = UID;
        $userpassword=pwd_hash($password);
		$flag = $User->where('id='.$id)->setField('password',$userpassword); // 根据条件更新记录
		if($flag == 0){
				$this->error('修改失败');
			}else{
				$this->success('修改成功！',U('User/search_list'));
			}
	}
		
}