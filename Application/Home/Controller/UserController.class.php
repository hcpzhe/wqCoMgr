<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\UserModel;
use Home\Model\DepartModel;
class  UserController extends HomeBaseController{
	/*获取系统用户列表*/
	public  function user_list(){
		$user=new UserModel();
		$this->user_list=$user->userlist();
		$this->display();
	}
	/** 跳转到添加系统用户页面 */
	public function ad_user_form(){
		/** 查询所有部门  */
		$depart=new DepartModel();
		$this->depa_list=$depart->depalist();
		$this->display();
	} 
	/** 添加系统用户 */
	public function ad_user(){
		$data['account']=$_POST['uname'];
		$data['password']=$_POST['upwd'];
		$data['realname']=$_POST['name'];
		$data['sex']=$_POST['sex'];
		$data['depart_id']=$_POST['dp'];
// 		$data['']=$_POST['position'];
// 		$data['']=$_POST['startime'];
		$data['birthday']=$_POST['birthday'];
		$user=new UserModel();
		$flag=$user->add($data);
		if($flag==0){	$this->error('添加失败！');
		}else{	$this->success('添加成功！');}
	}
	/** 查询某个用户的详细信息  */
	public function user_info(){
		/** 获取用户id	 */
		$id=$_GET['id'];
		$user=new UserModel();
		$this->info=$user->userinfo($id);
		$this->display();
	}
	/** 删除某个用户*/
	public function del_user($id){
		$user=new UserModel();
		$flag=$user->where("id=$id")->setField('status','-1');
		if($flag==1){	$this->success('删除成功！');
		}else{	$this->error('删除失败！');}
	}
}