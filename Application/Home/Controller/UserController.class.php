<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\UserModel;
use Home\Model\DepartModel;
class  UserController extends HomeBaseController{
	/*按条件查询系统用户*/
	public  function search_list(){
		/*获取搜索条件*/
		$depart=$_POST['depart'];
		$status=$_POST['status'];
		$key=$_POST['key'];
		/** 拼接where条件 */
		if(!empty($depart)){
			$where=" AND user.depart_id=".$depart;
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
	/** 禁用 */
	public function stop($id){
		$user=new UserModel();
		$flag=$user->where("id=$id")->setField("status","0");
		if($flag==1){ $this->success('成功');}
		else{ $this->error('失败');}
	}
	/** 启用 */
	public function star($id){
		$user=new UserModel();
		$flag=$user->where("id=$id")->setField("status","1");
		if($flag==1){ $this->success('成功');}
		else{ $this->error('失败');}
	}	
}