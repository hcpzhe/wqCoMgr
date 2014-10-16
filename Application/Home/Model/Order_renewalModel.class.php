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
// 		echo $this->_sql();exit();
		/*载入分页类，初始化数据*/
		$page=new \Think\Page($count,7);
		/*调用分页链接函数*/
		$data['show']=$page->show();
		/*控制数据查询条数*/
		$data['order_list']=$this->table('erp_order as oe,erp_customer as cr,erp_product as pt,erp_order_renewal as eor')
		->where($where)
		->field("oe.id as id,cr.`name` as cname,pt.`name` as pname,pt.`id` as pid,eor.money as money,eor.check")
		->limit($page->firstRow.','.$page->listRows)->select();
//  				echo $this->_sql();
// 				echo "<pre>";
// 				print_r($data['order_list']);
// 				echo "</pre>";
		return $data;
	}
	/** 订单续费列表 */
	public function o_list($id){
		$olist=$this->where("order_id=$id AND status=1")->select();
		return $olist;
	}
}