<?php
namespace Home\Model;
use Think\Model;
use Home\Controller\DepartController;
class Seo_orderModel extends Model{
	/*添加一条优化记录*/
	public function add_so($id){
	/*检查是否重复操作*/
		$count=$this->where("order_id=$id")->count();
		/*如果存在id为$id的记录返回0*/
		if($count>=1){ return 0;}
		else{ /*添加一条记录*/
			$data['order_id']=$id;
			$this->add($data);
			return 1;}	
	}
	/*优化开发订单列表*/
	public function seo_list($where){
		$where="eso.order_id=eo.id AND eo.cust_id=ec.id AND eo.user_id=eu.id AND eso.status=1 ".$where;
		/*查询数据总条数*/
		$count=$this->table('erp_seo_order as eso,erp_order as eo,erp_customer as ec,erp_user as eu')
		->where($where)
		->count();
		/*载入分页类，初始化数据*/
		$page=new \Think\Page($count,10);
		/*调用分页链接函数*/
		$data['show']=$page->show();
		/*控制数据查询条数*/
		$data['dep_list']=$this->table('erp_seo_order as eso,erp_order as eo,erp_customer as ec,erp_user as eu')
		->where($where)
		->field("eo.id as id,eo.total_fees as money,ec.id as cust_id,ec.name as cname,ec.contacts as contacts,eu.realname as rname,ec.phone as phone,eso.remark as remark,eso.check as checks,eso.push as push")
		->limit($page->firstRow.','.$page->listRows)->order('eo.id desc')->select();
		return $data;
	}	
	/*查询指定订单的详细信息*/
	public function seoinfo($oid){
		$data=$this->table('erp_seo_order as eso,erp_order as eo,erp_customer as ec,erp_user as eu')
		->where("eso.order_id=eo.id AND eo.cust_id=ec.id AND eo.user_id=eu.id AND eso.status=1 AND eso.order_id=$oid")
		->field("eo.id as id,eo.total_fees as money,ec.name as cname,ec.contacts as contacts,eu.realname as rname,ec.phone as phone,eso.remark as remark,eso.check as checks,eso.start_time as start_time,eso.end_time as end_time,eso.status as status")
		->find();
		return $data;
	}	
	/*修改网站开发订单的状态*/
	public function up_check($oid){
		$map['check']=1;
		$this->where("order_id=$oid")->save($map);
	}		
}