<?php
namespace Home\Model;
use Think\Model;
class Order_renewalModel extends  Model{
	/** 订单续费申请列表 */
	public function orlist($where){
		$where="oe.cust_id=cr.id AND oe.prod_id=pt.id AND eor.order_id=oe.id ".$where;
		/*查询数据总条数*/
		$count=$this->table('erp_order as oe,erp_customer as cr,erp_product as pt,erp_order_renewal as eor')
		->where($where)
		->count();
		/*载入分页类，初始化数据*/
		$page=new \Think\Page($count,10);
		/*调用分页链接函数*/
		$data['show']=$page->show();
		/*控制数据查询条数*/
		$data['order_list']=$this->table('erp_order as oe,erp_customer as cr,erp_product as pt,erp_order_renewal as eor')
		->where($where)
		->field("oe.id as id,cr.id as cust_id,cr.`name` as cname,pt.`name` as pname,pt.`id` as pid,eor.money as money,eor.check,eor.org_expired_time as org_expired_time,eor.new_expired_time as new_expired_time,eor.pay_time as pay_time")
		->limit($page->firstRow.','.$page->listRows)->order('oe.id desc')->select();
		return $data;
	}
	/** 订单续费列表 */
	public function o_list($id){
		$olist=$this->where("order_id=$id AND status=1")->select();
		return $olist;
	}
	/* 查询是否存在某个订单的续费申请记录*/
	public function s_one($id){
		$flag=$this->where("order_id=$id and checked=0")->find();
		return $flag;
	}
	/** 按条件查询一个订单的信息  */
	public function info($id){
		$data=$this->where("order_id=$id")->find();
		return $data;
	}
}