<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\OrderModel;
class OrderController extends HomeBaseController{
/*订单列表*/
	public function order_list(){
		$order=new OrderModel();
		$this->orderlist=$order->orderlist();
// 		$this->assign("orderlist",$orderlist);
		$this->display();
	}
/*订单详情*/
	public function order_info(){
		$id=$_GET['id'];
		$order=new OrderModel();
		$info=$order->where("id=$id")->find();
		print_r($info);exit();
	}
/*添加订单*/
	public function add_order(){
		echo "添加订单";
	}		
	
	
}
