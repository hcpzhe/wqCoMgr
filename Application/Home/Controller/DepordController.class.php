<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Develop_orderModel;
use Home\Model\UserModel;
class DepordController extends HomeBaseController{
	/*网站开发订单*/
	public function dep_list(){
		$dep=new Develop_orderModel();
		$this->data=$dep->dor_list();
		$this->display();
	}
	/*增加一条开发记录*/
	public function add_od(){

	}
	/*跳转到分单页面*/
	public function dist(){
		/*查询技术部所有人员*/
		$user=new UserModel();
		$this->data=$user->tech_list();
		$this->id=$_GET['id'];
		$this->display();
	}	
}