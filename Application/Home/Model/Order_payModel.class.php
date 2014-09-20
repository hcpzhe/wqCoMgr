<?php
namespace Home\Model;
use Think\Model;
class Order_payModel extends Model{
	/*订单付款记录*/
	public function op_record(){
		/*查询数据总条数*/
		$count =$this->table('erp_order_pay as op,erp_order as oe,erp_customer as cr,erp_user as ur')
		->where("op.order_id=oe.id AND oe.cust_id=cr.id AND oe.user_id=ur.id AND oe.status=1")
		->count();
		/*载入分页类，初始化数据*/
		$page=new \Think\Page($count,5);
		/*调用分页链接函数*/
		$data['show']=$page->show();
		/*控制数据查询条数*/
		$data['op_list'] =$this->table('erp_order_pay as op,erp_order as oe,erp_customer as cr,erp_user as ur')
		->where("op.order_id=oe.id AND oe.cust_id=cr.id AND oe.user_id=ur.id AND oe.status=1")
		->field("op.id as id,cr.name as cname,op.money as money,op.class as class,op.`check` as `check`,op.pay_time as pay_time,op.check_time as check_time,ur.realname as uname")
		->limit($page->firstRow.','.$page->listRows)->select();
		return $data;
	}

}