<?php
namespace Home\Model;
use Think\Model;
class Order_renewalModel extends  Model{
	/** 订单续费申请列表 */
	public function orlist(){
		/*查询数据总条数*/
		$count=$this->table('erp_order as oe,erp_customer as cr,erp_product as pt,erp_order_renewal as eor')
		->where("oe.cust_id=cr.id AND oe.prod_id=pt.id AND oe.status=1 AND eor.order_id=oe.id")
		->count();
		/*载入分页类，初始化数据*/
		$page=new \Think\Page($count,7);
		/*调用分页链接函数*/
		$data['show']=$page->show();
		/*控制数据查询条数*/
		$data['order_list']=$this->table('erp_order as oe,erp_customer as cr,erp_product as pt,erp_order_renewal as eor')
		->where("oe.cust_id=cr.id AND oe.prod_id=pt.id AND oe.status=1 AND eor.order_id=oe.id")
		->field("oe.id as id,cr.`name` as cname,pt.`name` as pname,pt.`id` as pid,oe.total_fees,oe.expired_time as expired_time,oe.`check`")
		->limit($page->firstRow.','.$page->listRows)->select();
// 				echo $this->_sql();exit();
// 				echo "<pre>";
// 				print_r($data['order_list']);
// 				echo "</pre>";
		return $data;
	}
}