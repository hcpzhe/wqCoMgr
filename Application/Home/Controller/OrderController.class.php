<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\OrderModel;
class OrderController extends HomeBaseController{
/*订单列表*/
	public function order_list(){
		$order=new OrderModel();
		$this->orderlist=$order->orderlist();
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
}
