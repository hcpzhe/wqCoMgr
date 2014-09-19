<?php
namespace Home\Model;
use Think\Model;
class Order_payModel extends Model{
	/*订单付款记录*/
	public function op_record(){
		$op_list =$this->table('erp_order_pay as op,erp_order as oe,erp_customer as cr')
		->where("op.order_id=oe.id AND oe.cust_id=cr.id AND oe.status=1")
		->field("op.id as id,cr.name as cname,op.money as money,op.class as class,op.`check` as `check`,op.pay_time as pay_time,op.check_time as check_time")->select();
		return $op_list;
	}

}