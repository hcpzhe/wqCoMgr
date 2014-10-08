<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\DepartModel;
class DepartController extends HomeBaseController{
	/**  部门列表 */
	public function depa_list(){
		$depa=new DepartModel();
		$this->depa_list=$depa->depalist();
		$this->display();
	}	
	/** 跳转到添加部门页面 */
	public function ad_dp_form(){
		/** 查询所有部门  */
		$depa=new DepartModel();
		$this->depa_list=$depa->depalist();
		$this->display();
	}
	/** 添加部门 */
	public function add_dp(){
		$map['name']=$_POST['name'];
		$map['parent_id']=$_POST['parent_id'];
		$depart=new DepartModel();
		$flag=$depart->add($map);
		if($flag==0){	$this->success('添加失败！');
		}else{	$this->error('添加成功！');}
	}
	/** 跳转到编辑页面 */
	public function up_dp_form(){
		$id=$_GET['id'];
		/** 查询所有的部门 */
		$depa=new DepartModel();
		$this->depa_list=$depa->depalist();
		/** 查询当前操作部门的信息 */
		$this->curr=$depa->s_one($id);
		/** 查询当前部门的父级部门的名称 */
		$this->par=$depa->s_one($this->curr['parent_id']);
		$this->display();
	}
	/** 编辑部门操作 */
	public function up_dp(){
		$id=$_POST['id'];
		$map['name']=$_POST['name'];
		$map['parent_id']=$_POST['parent_id'];
		$depart=new DepartModel();
		$flag=$depart->where("id=$id")->save($map);
		if($flag==1){	$this->success('修改成功！');
		}else{	$this->error('修改失败！');}
	}
	/** 部门删除 */
	public function del_dp(){
		$id=$_GET['id'];
		$depart=new DepartModel();
		$flag=$depart->where("id=$id")->setField('status','-1');
// 		echo $depart->_sql();exit();
		if($flag==1){	$this->success('删除成功！');
		}else{	$this->error('删除失败！');}
	}
}