<?php
namespace Home\Model;
use Think\Model;
use Think\Page;
class OrderModel extends Model{
	/*显示订单列表*/
	Public function orderlist($where){
 		$where['erp_order.status']=1;
 		//获取登录者所有拥有权限的客户
 		$User = new UserModel();
 		$cust_id=$User->user_auto(); 
 		if (!empty($cust_id)){
 			$where['cr.id']=array('in',$cust_id);
 		}else{ return false;}
//  	$where['ur.id']=UID;
 		$count=$this->join("erp_user as ur on erp_order.user_id=ur.id")->join("erp_customer as cr on erp_order.cust_id=cr.id")->join("erp_product as pt on erp_order.prod_id=pt.id")->where($where)->count();
// 		echo "<pre>";echo $count;echo "</pre>";exit();
		/*载入分页类，初始化数据*/
		$page=new \Think\Page($count,10);
		/*调用分页链接函数*/
		$data['show']=$page->show();
		/*控制数据查询条数*/
		$data['order_list']=$this->join("erp_user as ur on erp_order.user_id=ur.id")->join("erp_customer as cr on erp_order.cust_id=cr.id")->join("erp_product as pt on erp_order.prod_id=pt.id")->where($where)->field("erp_order.id as id,ur.realname as uname,cr.id as cust_id,cr.`name` as cname,pt.`name` as pname,pt.`id` as pid,erp_order.total_fees,erp_order.signed_time as signed_time,erp_order.`check`,erp_order.push as push")->limit($page->firstRow.','.$page->listRows)->order('erp_order.id desc')->select();
		return $data;
	}
	/*c查询指定订单的详细内容*/	
	public function orderinfo($id){
		$order_info =$this->table('erp_order as oe,erp_user as ur,erp_customer as cr,erp_product as pt')
		->where("oe.user_id=ur.id AND oe.cust_id=cr.id AND oe.prod_id=pt.id AND oe.id=$id")
		->field("oe.id as id,oe.prod_id as pid,cr.phone as phone,cr.fax as fx,cr.contacts as contacts,ur.realname as uname,cr.`name` as cname,pt.`name` as pname,oe.total_fees as money,oe.status as status,oe.remark,oe.expired_time extime,signed_time as signed_time,oe.`check`,oe.time_limit as limitime")->find();
// 		print_r($order_info);exit();
		return $order_info;
	}
	/**查询指定订单的名称*/
	public function s_cname($oid){
		$cname=$this->table('erp_order as eo,erp_customer as ec')
		->where("eo.cust_id=ec.id ANd eo.id=$oid")
		->field("ec.`name` as cname,eo.expired_time as expired_time")->find();
		return $cname;
	}
	/*显示带续费订单列表（三个月）*/
	Public function renelist($where){
		/**当前日期加三个月 */$today=time();$time=$today+7776000;
		$where="oe.expired_time<=".$time." AND oe.user_id=ur.id AND oe.cust_id=cr.id AND oe.prod_id=pt.id AND oe.status>=0 ".$where;
		/*查询数据总条数*/
		$count=$this->table('erp_order as oe,erp_user as ur,erp_customer as cr,erp_product as pt')
					->where($where)
					->count();
		/*载入分页类，初始化数据*/
		$page=new \Think\Page($count,10);
		/*调用分页链接函数*/
		$data['show']=$page->show();
		/*控制数据查询条数*/
		$data['order_list']=$this->table('erp_order as oe,erp_user as ur,erp_customer as cr,erp_product as pt')
					->where($where)
					->field("oe.id as id,ur.realname as uname,cr.id as cust_id,cr.`name` as cname,cr.contacts as contacts,cr.phone as phone,pt.`name` as pname,pt.`id` as pid,oe.total_fees,oe.expired_time as expired_time,oe.`check`,oe.status as status")
					->limit($page->firstRow.','.$page->listRows)->select();	
		return $data;
	}	
	/** 业绩排行 */
	public function result(){
		$data=$this->table('erp_order AS eo,erp_user as eu')
		->where("eo.user_id=eu.id AND eo.`check`=1")
		->field("eu.realname as uname,SUM(eo.total_fees) as money")
		->group('eu.realname')->select();
		return $data;
	}
}