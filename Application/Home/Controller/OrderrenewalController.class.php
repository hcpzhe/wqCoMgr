<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Order_renewalModel;
use Home\Model\OrderModel;
use Home\Model\ProductModel;
class OrderrenewalController extends HomeBaseController{
	/** 订单续费申请列表 */
	public function or_list(){
		/*获取搜索条件*/
		$pro=$_POST['product'];
		$check=$_POST['check'];
		$key=$_POST['key'];
		/** 拼接where条件 */
		if(!empty($pro)){
			$where=$where." AND pt.id=".$pro;
		}
		/*通过，待审核*/
		if($check==1){
			$where=$where." AND eor.check=1";
		}else if($check==2){
			$where=$where." AND eor.check=0";
		}else{ $where=$where." AND eor.check>=0";}
		
		if(!empty($key)){
 			$where=$where." AND ( pt.name like '%".$key."%' or cr.name like '%".$key."%')";
		}
		$Ordren=new Order_renewalModel();
		$this->or=$Ordren->orlist($where);
		/*产品列表*/
		$product=new ProductModel();
		$this->pro_list=$product->p_list();
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