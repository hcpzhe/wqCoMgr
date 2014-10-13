<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Develop_orderModel;
use Home\Model\UserModel;
use Home\Model\Develop_userModel;
use Home\Model\OrderModel;
use Home\Model\Develop_order_commentModel;
class DepordController extends HomeBaseController{
	/*网站开发订单列表*/
	public function dep_list(){
		/*获取搜索条件*/
		$check=$_POST['check'];
		$key=$_POST['key'];
		/** 拼接where条件 */
		if($check==1){
			$where=$where." AND edo.check=1";
		}else if($check==2){ $where=$where." AND edo.check=0";}
		
		if(!empty($key)){
			$where=$where." AND ( ec.name like '%".$key."%' or ec.contacts like '%".$key."%' or eu.realname like '%".$key."%')";
		}
		$dep=new Develop_orderModel();
		$this->data=$dep->dor_list($where);
		$this->display();
	}
	/*增加一条开发记录*/
	public function add_od(){

	}
	/**网站开发订单详细页面，订单详细信息，订单参与人员，订单沟通记录 */
	public function dep_info(){
		$oid=$_GET['id'];
		/** 详细信息 */
		$dep=new Develop_orderModel();
		$this->data=$dep->depinfo($oid);	
		/*开发人员*/
		$dep_user=new Develop_userModel();
		$this->users=$dep_user->s_dist($oid);
		/*订单沟通记录*/
		$doc=new Develop_order_commentModel();
		$this->conments=$doc->doc_list($oid);
		$this->display();
	}
	/*跳转到分单页面*/
	public function dist(){
		$oid=$_GET['id'];
		/*查询技术部所有人员*/
		$user=new UserModel();
		$this->users=$user->tech_list(4);
		/*查询该订单已经分配的人员*/
		$de_user=new Develop_userModel();
		$this->data=$de_user->s_dist($oid);
		/*查询订单名称*/
		$order=new OrderModel();
		$this->cname=$order->s_cname($oid);
		
		$this->id=$oid;
		$this->display();
	}	
}