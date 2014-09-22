<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\OrderModel;
use Home\Model\Develop_orderModel;
use Home\Model\Seo_orderModel;
class OrderController extends HomeBaseController{
/*订单列表*/
	public function order_list(){
		$order=new OrderModel();
		$this->data=$order->orderlist();
		$this->display();
	}
/*订单详情*/
	public function order_info(){
		$id=$_GET['id'];
		$order=new OrderModel();
		$this->orderinfo=$order->orderinfo($id);
		$this->display();
	}
/*订单修改*/
	public function ord_u_form(){
		$id=$_GET['id'];
		$order=new OrderModel();
		$this->orderinfo=$order->orderinfo($id);
		$this->display();
	}	
/*添加订单*/
	public function add_order(){
		$this->display();
	}		
/*
 * 审核订单
 * 如果为订单为网站，erp_develop_order增加一条记录
 * 如果为优化订单，erp_seo_order增加一条记录
 * 如果两者都不是不进行其他操作*/
	public function check_order(){
		$id=$_GET['id'];
		$pid=$_GET['pid'];
		if($pid==1 || $pid==2 || $pid==3){ 
			$De_or=new Develop_orderModel();
			$De_or->add_do($id);
		}
		if($pid==6){
			$se_or=new Seo_orderModel();
			$se_or->add_so($id);
		}
	}	
}
