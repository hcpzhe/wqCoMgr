<?php
namespace Home\Model;
use Think\Model;
use Think\Page;
class OrderModel extends Model{
	/*显示订单列表*/
	Public function orderlist(){
		/*查询数据总条数*/
		$count=$this->table('erp_order as oe,erp_user as ur,erp_customer as cr,erp_product as pt')
					->where("oe.user_id=ur.id AND oe.cust_id=cr.id AND oe.prod_id=pt.id AND oe.status=1")
					->count();
		/*载入分页类，初始化数据*/
		$page=new \Think\Page($count,7);
		/*调用分页链接函数*/
		$data['show']=$page->show();
		/*控制数据查询条数*/
		$data['order_list']=$this->table('erp_order as oe,erp_user as ur,erp_customer as cr,erp_product as pt')
					->where("oe.user_id=ur.id AND oe.cust_id=cr.id AND oe.prod_id=pt.id AND oe.status=1")
					->field("oe.id as id,ur.realname as uname,cr.`name` as cname,pt.`name` as pname,pt.`id` as pid,oe.total_fees,oe.remark,oe.expired_time,oe.`check`")
					->limit($page->firstRow.','.$page->listRows)->select();	
// 		echo $this->_sql();
// 		echo "<pre>";
// 		print_r($data['order_list']);
// 		echo "</pre>";
		return $data;
	}
	/*c查询指定订单的详细内容*/	
	public function orderinfo($id){
		$order_info =$this->table('erp_order as oe,erp_user as ur,erp_customer as cr,erp_product as pt')
		->where("oe.user_id=ur.id AND oe.cust_id=cr.id AND oe.prod_id=pt.id AND oe.id=$id")
		->field("oe.id as id,cr.phone as phone,cr.fax as fx,cr.contacts as contacts,ur.realname as uname,cr.`name` as cname,pt.`name` as pname,oe.total_fees as money,oe.status as status,oe.remark,oe.expired_time extime,oe.`check`")->find();
// 		print_r($order_info);exit();
		return $order_info;
	}
	/**查询指定订单的名称*/
	public function s_cname($oid){
		$cname=$this->table('erp_order as eo,erp_customer as ec')
		->where("eo.cust_id=ec.id ANd eo.id=$oid")
		->field("ec.`name` as cname")->find();
		return $cname;
	}
}