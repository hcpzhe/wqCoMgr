<?php
namespace Home\Model;
use Think\Model;
class Seo_userModel extends Model{
	/*往订单参与表添加数据*/
	public function add_du($oid,$uid){
		$map['order_id']=$oid;
		$map['user_id']=$uid;
		/*查询订单信息*/
		$order=new OrderModel();
		$res=$order->orderinfo($oid);
		/*订单金额*/
		$map['money']=$res['money'];
		return $this->add($map);
	}
	/*查询指定条件的数据是否存在*/
	public function s_isset($oid,$uid){
		$map['order_id']=$oid;
		$map['user_id']=$uid;
		return $this->where($map)->count();
	}
	/*按条件查询某订单所分配的人员*/
	public function s_dist($oid){
		$data=$this->table('erp_seo_user as esu,erp_user as eu,erp_order as eo,erp_customer as ec')
		->where("esu.user_id=eu.id AND esu.order_id=eo.id AND eo.cust_id=ec.id ANd esu.order_id=$oid")
		->field("eu.realname as realname,ec.`name` as cname")->select();
		return  $data;
	}
}