<?php
namespace Home\Model;
use Think\Model;
class OrderModel extends Model{
	/*显示订单列表*/
	Public function orderlist(){
		$order_list=$this->table('erp_order as oe,erp_user as ur,erp_customer as cr,erp_product as pt')
					->where("oe.user_id=ur.id AND oe.cust_id=cr.id AND oe.prod_id=pt.id AND oe.status=1")
					->field("oe.id as id,ur.realname as uname,cr.`name` as cname,pt.`name` as pname,oe.total_fees,oe.remark,oe.expired_time,oe.`check`")->select();	
		return $order_list;
	} 
	public function orderinfo($id){
		$order_info =$this->table('erp_order as oe,erp_user as ur,erp_customer as cr,erp_product as pt')
		->where("oe.user_id=ur.id AND oe.cust_id=cr.id AND oe.prod_id=pt.id AND oe.id=$id")
		->field("oe.id as id,ur.realname as uname,cr.`name` as cname,pt.`name` as pname,oe.total_fees as money,oe.remark,oe.expired_time extime,oe.`check`")->find();
// 		print_r($order_info);exit();
		return $order_info;
	}
}