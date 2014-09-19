<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Order_payModel;
class OrderpayController extends HomeBaseController{
	/*订单付款记录*/
	public function order_pay_record(){
		$orderpay=new Order_payModel();
		$this->op_list=$orderpay->op_record();
		$this->display();
	}
	/*订单付款*/
	public function op_info(){
	
	}	
}