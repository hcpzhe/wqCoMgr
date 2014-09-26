<?php
namespace Home\Model;
use Think\Model;
echo "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>";
class Develop_orderModel extends Model{
	/*添加一条网站开发记录*/
	public function add_do($id){
		/*检查是否重复操作*/
		$count=$this->where("order_id=$id")->count();
		/*如果存在id为$id的记录返回0*/
		if($count>=1){ return 0;}
		else{ /*添加一条记录*/
			$data['order_id']=$id;
			$this->add($data);
			return 1;}			
	}
	/*网站开发订单列表*/
	public function dor_list(){
		/*查询数据总条数*/
		$count=$this->table('erp_develop_order as edo,erp_order as eo')
		->where("edo.order_id=eo.id")
		->count();
		/*载入分页类，初始化数据*/
		$page=new \Think\Page($count,7);
		/*调用分页链接函数*/
		$data['show']=$page->show();
		/*控制数据查询条数*/
		$data['dep_list']=$this->table('erp_develop_order as edo,erp_order as eo,erp_customer as ec,erp_user as eu')
		->where("edo.order_id=eo.id AND eo.cust_id=ec.id AND eo.user_id=eu.id AND edo.status=1")
		->field("eo.id as id,eo.total_fees as money,ec.name as cname,ec.contacts as contacts,eu.realname as rname,ec.phone as phone,edo.remark as remark,edo.check as checks")
		->limit($page->firstRow.','.$page->listRows)->select();
// 				echo $this->_sql();
// 				echo "<pre>";
// 				print_r($data['order_list']);
// 				echo "</pre>";
		return $data;
	}
}