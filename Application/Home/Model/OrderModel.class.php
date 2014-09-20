<?php
namespace Home\Model;
use Think\Model;
use Think\Page;
class OrderModel extends Model{
	/*显示订单列表*/
	Public function orderlist(){
		$count=$this->table('erp_order as oe,erp_user as ur,erp_customer as cr,erp_product as pt')
					->where("oe.user_id=ur.id AND oe.cust_id=cr.id AND oe.prod_id=pt.id AND oe.status=1")
					->count();
		$page=new \Think\Page($count,5);
		$data['show']=$page->show();
		$data['order_list']=$this->table('erp_order as oe,erp_user as ur,erp_customer as cr,erp_product as pt')
					->where("oe.user_id=ur.id AND oe.cust_id=cr.id AND oe.prod_id=pt.id AND oe.status=1")
					->field("oe.id as id,ur.realname as uname,cr.`name` as cname,pt.`name` as pname,oe.total_fees,oe.remark,oe.expired_time,oe.`check`")
					->limit($page->firstRow.','.$page->listRows)->select();	
// 		echo $this->_sql();
// 		echo "<pre>";
// 		print_r($data['order_list']);
// 		echo "</pre>";
		return $data;
	} 
	public function orderinfo($id){
		$order_info =$this->table('erp_order as oe,erp_user as ur,erp_customer as cr,erp_product as pt')
		->where("oe.user_id=ur.id AND oe.cust_id=cr.id AND oe.prod_id=pt.id AND oe.id=$id")
		->field("oe.id as id,ur.realname as uname,cr.`name` as cname,pt.`name` as pname,oe.total_fees as money,oe.remark,oe.expired_time extime,oe.`check`")->find();
// 		print_r($order_info);exit();
		return $order_info;
	}
}