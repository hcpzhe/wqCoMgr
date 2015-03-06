<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Order_departModel;
class Order_departController extends HomeBaseController {
	/**
	 * 订单所在部门表添加记录
	 * @param unknown $or_id
	 * @param unknown $dp_id
	 */
	function ad_reco($or_id,$dp_id,$la_dp){
		$ord_pro=new Order_departModel();
		//该订单的其它记录is_use为0
		$ord_pro->where("order_id=$or_id")->setField("is_use","0");
		//添加新纪录
		$map['order_id']=$or_id;
		$map['depart_id']=$dp_id;
		$map['create_time']=time();
		$map['is_use']=1;
		$map['last_depart_id']=$la_dp;
		$flag=$ord_pro->add($map);
	}
}