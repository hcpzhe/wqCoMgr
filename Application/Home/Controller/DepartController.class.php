<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\DepartModel;
use Home\Model\UserModel;
class DepartController extends HomeBaseController{
	/**  部门列表 */
	public function depa_list(){
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
		$depa=new DepartModel();
		$this->depa_list=$depa->depalists();
		$this->display();
	}	
	/** 跳转到添加部门页面 */
	public function ad_dp_form(){
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
		/** 查询所有部门  */
		$depa=new DepartModel();
		$this->depa_list=$depa->depalist();
		
		$User = M("User");		
		$user_list = $User->where('status=1')->select();  ////所有用户
		$this->assign('user_list',$user_list);  
		
		$this->display();
	}
	/** 添加部门 */
	public function add_dp(){
		$map['name']=$_POST['name'];
		$map['parent_id']=$_POST['parent_id'];		
		$depart=new DepartModel();
		if ($map['parent_id'] == 0){
			$flag=$depart->add($map);			
			$map['parent_id']=$flag;			
			$dep=M('Depart');
			$dep->where('id='.$map['parent_id'])->setField('parent_id',$map['parent_id']);
		}else {
			$flag=$depart->add($map);
		}
		$udm=M('User_depart_mgr');
		$maps['user_id']=$_POST['user_id'];
		$maps['depart_id']=$flag;
		$data = $udm->create();
		$udm->add($maps);
		$this->success('添加成功！',U('Depart/depa_list'));
		
	}
	/** 跳转到编辑页面 */
	public function up_dp_form(){
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
		$id=$_GET['id'];
		$user_id=$_GET['user_id'];
		/** 查询所有的部门 */
		$depa=new DepartModel();
		$this->depa_list=$depa->depalist();
		/** 查询当前操作部门的信息 */
		$this->curr=$depa->s_one($id);
		/** 查询当前部门的父级部门的名称 */
		$this->par=$depa->s_one($this->curr['parent_id']);
		
		$User = M("User");
		$realname = $User->where('id='.$user_id)->getField('realname'); //原来拥有权限的用户
		$user_list = $User->where('status=1')->select();  //所有用户
		$this->assign('user_list',$user_list);
		$this->assign('realname',$realname);
		$this->assign('user_id',$user_id);
		$this->display();
	}
	/** 编辑部门操作 */
	public function up_dp(){
		$id=$_POST['id'];
		
		$map['name']=$_POST['name'];
		$map['parent_id']=$_POST['parent_id'];
		$depart=new DepartModel();
		$depart->where("id=$id")->save($map);
		
		$udm=M('User_depart_mgr');
		$maps['user_id']=$_POST['user_id'];
		$udm->where("depart_id=$id")->save($maps);
		$this->success('修改成功！');

	}
	/** 部门删除 */
	public function del_dp(){
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
		$id=$_GET['id'];
		$depart=new DepartModel();
		$flag=$depart->where("id=$id")->setField('status','-1');
// 		echo $depart->_sql();exit();
		$udm=M('User_depart_mgr');
		$udm->where('depart_id='.$id)->delete(); 
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
		$depart=new DepartModel();
		$flag=$depart->where("id=$id")->setField("status","0");
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
		$depart=new DepartModel();
		$flag=$depart->where("id=$id")->setField("status","1");
		if($flag==1){ $this->success('成功');}
		else{ $this->error('失败');}
	}	
}