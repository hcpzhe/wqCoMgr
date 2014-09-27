<?php
namespace Home\Model;
use Think\Model;
class Develop_userModel extends Model{
	/*往订单参与表添加数据*/
	public function add_du($oid,$uid){
		$map['oid']=$oid;
		$map['uid']=$uid;
// 		/*查询订单信息*/
// 		$order=new OrderModel();
// 		$res=$order->orderinfo($oid);
// 		/*订单金额*/
// 		$map['money']=$res['money'];
// 		print_r($map);		
		return $this->add($map);
	}
}