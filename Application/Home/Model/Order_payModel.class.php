<?php
namespace Home\Model;
use Think\Model;
class Order_payModel extends Model{
	/*订单付款记录*/
	public function op_record($where){
		$where="op.order_id=oe.id AND oe.cust_id=cr.id AND oe.user_id=ur.id AND op.status=1 ".$where;
		/*查询数据总条数*/
		$count =$this->table('erp_order_pay as op,erp_order as oe,erp_customer as cr,erp_user as ur')
		->where($where)
		->count();
		/*载入分页类，初始化数据*/
		$page=new \Think\Page($count,10);
		/*调用分页链接函数*/
		$data['show']=$page->show();
		/*控制数据查询条数*/
		$data['op_list'] =$this->table('erp_order_pay as op,erp_order as oe,erp_customer as cr,erp_user as ur')
		->where($where)
		->field("op.id as id,cr.id as cust_id,cr.name as cname,op.money as money,op.class as class,op.`check` as `check`,op.pay_time as pay_time,op.check_time as check_time,ur.realname as uname")
		->limit($page->firstRow.','.$page->listRows)->order('op.id desc')->select();
		return $data;
	}
	/*订单付款详情*/
	public function opinfo($id){
		$op_list=$this->table('erp_order_pay as op,erp_order as oe,erp_customer as cr,erp_user as ur,erp_product as pr')
		->where("op.order_id=oe.id AND oe.prod_id=pr.id AND oe.cust_id=cr.id AND oe.user_id=ur.id AND oe.status=1 AND op.id=$id")
		->field("op.id as op_id,oe.status as oe_status,oe.id as id,cr.name as cname,cr.contacts as contacts,cr.phone as phone,cr.fax as fax,op.money as money,op.class as class,op.`check` as `check`,op.pay_time as pay_time,op.check_time as check_time,ur.realname as uname,oe.signed_time as signed_time,oe.expired_time as expired_time,pr.name as pname,oe.time_limit as time_limit")
		->find();	
//	print_r($op_list);exit();
// 		echo $this->_sql();exit();
		return $op_list;
	}
	/** 查询指定订单的付款记录 */
	public function o_list($id){
		$olist=$this->where("order_id=$id AND status=1")->select();
		return $olist;
	}
	/**
	 * 以员工为分组求每个员工的业绩和
	 */
	public function group_sum($sta_time,$end_time){
		$sql="SELECT SUM(money) as money ,ed.id,eu.id as uid,realname FROM wqerp.erp_order_pay as eop INNER JOIN wqerp.erp_user as eu ON eu.id=eop.user_id INNER JOIN erp_depart as ed ON ed.id=eu.depart_id where pay_time>='".$sta_time."' and pay_time<='".$end_time."'  GROUP BY user_id";
// 		echo $sql;
		return $this->query($sql);
	}
	/**
	 * 以部门名称分组求各个部门的总业绩
	 */
	public function depart_resu($sta_time,$end_time){
		$sql="SELECT ed.id,ed.`name`,SUM(eop.money) as money FROM erp_order_pay as eop INNER JOIN erp_user as eu ON eop.user_id=eu.id INNER JOIN erp_depart as ed ON eu.depart_id=ed.id where pay_time>='".$sta_time."' and pay_time<='".$end_time."'  GROUP BY ed.`name`";
		return $this->query($sql);
	}
	/** 总业绩 */
	public function all_yj($sta_time,$end_time){
		$sql="select sum(money) as smoney from erp_order_pay where status=1 and pay_time>='".$sta_time."' and pay_time<='".$end_time."'";
		return $this->query($sql);
	}
	/** 指定订单付款记录 */
	public function op_list($id){
		$sql="SELECT * from erp_order_pay WHERE order_id=(SELECT order_id FROM erp_order_pay WHERE id=".$id.") order by pay_time";
		return  $this->query($sql);
	}
}