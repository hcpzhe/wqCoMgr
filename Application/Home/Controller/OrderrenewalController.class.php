<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Order_renewalModel;
use Home\Model\OrderModel;
class OrderrenewalController extends HomeBaseController{
	/** 订单续费申请列表 */
	public function or_list(){
		$Ordren=new Order_renewalModel();
		$this->orlist=$order->orlist();
		$this->display();
	}
	/** 续费申请表单rene */
	public function apy_ren($id){
		$order=new OrderModel();
		$this->data=$order->orderinfo($id);
		$this->display();
	}
	/** 添加续费申请 */
	public function ap_re($id){
		$Ordren=new Order_renewalModel();
		$map['order_id']=$id;
		$map['money']=$_POST['money'];
		$map['remark']=$_POST['remark'];
		$map['org_expired_time']=$_POST['expired_time'];
		$flag=$Ordren->add($map);
		if($flag==0){	$this->error('添加失败！');
		}else{	$this->success('添加成功！');}
	}
}