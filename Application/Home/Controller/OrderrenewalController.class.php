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
		$pro=$_REQUEST['product'];
		$check=$_REQUEST['check'];
		$key=$_REQUEST['key'];
		/** 拼接where条件 */
		if(!empty($pro)){
			$where=$where." AND pt.id=".$pro;
		}
		/*通过，待审核*/
		if(!empty($check) && $check==1){
			$where=$where." AND eor.check=1";
		}else if(!empty($check) && $check==2){
			$where=$where." AND eor.check=0";
		}		
		if(!empty($key)){
 			$where=$where." AND ( pt.name like '%".$key."%' or cr.name like '%".$key."%')";
		}
		$Ordren=new Order_renewalModel();
		$this->data=$Ordren->orlist($where);
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
		/** 当前日期*/
		$map['pay_time']=date('Y-m-d',time());//获取当前日期
		/** 原过期时间  */
		$order=new OrderModel();
		$data=$order->s_cname($id);
		$map['org_expired_time']=$data['expired_time'];//原到期时间
		/** 现过期时间  */
		$map['ren_time']=$_POST['time_limit'];
		$day=$map['ren_time']*365;//获取服务年限
		$map['new_expired_time']=date("Y-m-d",strtotime("$day day"));//获取订单新到期日期
// 		echo "<pre>";
// 		print_r($map);
// 		echo "</pre>";exit();
		$flag=$Ordren->add($map);
		if($flag==0){	$this->error('添加失败！');
		}else{	$this->success('添加成功！');}
	}
}