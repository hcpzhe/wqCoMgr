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
	public function dor_list($where){
		$where="edo.order_id=eo.id AND eo.cust_id=ec.id AND eo.user_id=eu.id AND edo.status=1".$where;
		/*查询数据总条数*/
		$count=$this->table('erp_develop_order as edo,erp_order as eo,erp_customer as ec,erp_user as eu')
		->where($where)
		->count();
		/*载入分页类，初始化数据*/
		$page=new \Think\Page($count,10);
		/*调用分页链接函数*/
		$data['show']=$page->show();
		/*控制数据查询条数*/
		$data['dep_list']=$this->table('erp_develop_order as edo,erp_order as eo,erp_customer as ec,erp_user as eu')
		->where($where)
		->field("eo.id as id,eo.total_fees as money,ec.id as cust_id,ec.name as cname,ec.contacts as contacts,eu.realname as rname,ec.phone as phone,edo.remark as remark,edo.check as checks,edo.push as push")
		->limit($page->firstRow.','.$page->listRows)->order('eo.id desc')->select();
// 				echo $this->_sql();
// 				echo "<pre>";
// 				print_r($data['order_list']);
// 				echo "</pre>";
		return $data;
	}
	/*修改网站开发订单的状态*/
	public function up_check($oid){
		$flag=$this->where("order_id=$oid")->setField('check');
		if($flag==1){ return 1;}
		else {
			$map['check']=1;
			$flag1=$this->where("order_id=$oid")->save($map);
			return $flag1;
		}
	}
	/*查询指定订单的详细信息*/
	public function depinfo($oid){
		$data=$this->table('erp_develop_order as edo,erp_order as eo,erp_customer as ec,erp_user as eu')
		->where("edo.order_id=eo.id AND eo.cust_id=ec.id AND eo.user_id=eu.id AND edo.status=1 AND edo.order_id=$oid")
		->field("eo.id as id,eo.total_fees as money,ec.name as cname,ec.contacts as contacts,eu.realname as rname,ec.phone as phone,edo.remark as remark,edo.check as checks,edo.start_time as start_time,edo.end_time as end_time,edo.status as status")
		->find();
		return $data;
	}
}