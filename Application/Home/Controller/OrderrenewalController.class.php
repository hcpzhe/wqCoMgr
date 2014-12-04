<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Order_renewalModel;
use Home\Model\OrderModel;
use Home\Model\UserModel;
use Home\Model\ProductModel;
use Home\Model\Order_payModel;
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
		if (!IS_ROOT){ //非超管
			$ids = (int)I('cust_id');   //被选中要进行操作的id
			$User = new UserModel();
			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
			if(!in_array($ids,$cust_id)){
				$this->error('您没有该公司的权限，不能进行相关操作！');
			}
		}
		$order=new OrderModel();
		$this->data=$order->orderinfo($id);
		/*查询订单续费申请表中是否已经有记录*/
		$orderren=new Order_renewalModel();
		$flag=$orderren->s_one($id);
		if($flag!=0){ $this->error("续费申请已提交！");}
		$this->display();
	}
	/** 添加续费申请 */
	public function ap_re($id){
		$Ordren=new Order_renewalModel();
		$map['order_id']=$id;
		$map['money']=$_POST['money'];
		$map['remark']=$_POST['remark'];
		/** 当前日期*/
		$map['pay_time']=time();//获取当前日期
		/** 原过期时间  */
		$order=new OrderModel();
		$data=$order->s_cname($id);
		$map['org_expired_time']=$data['expired_time'];//原到期时间
		/** 现过期时间  */
		$map['ren_time']=$_POST['time_limit'];
		$day=$map['ren_time']*365;//获取服务年限
		$map['new_expired_time']=$map['org_expired_time']+$day*60*60*24;//获取订单新到期日期
// 		echo "<pre>";
// 		print_r($map);
// 		echo "</pre>";exit();
		/* 订单续费记录表添加续费记录**/
		$flag=$Ordren->add($map);
		if($flag==0){	$this->error('申请失败！');
		}else{	
			$this->success('申请成功');
		}
	}
	/** 申请订单续费申请 */
	public function checked($id){
		if (!IS_ROOT){ //非超管
			$ids = (int)I('cust_id');   //被选中要进行操作的id
			$User = new UserModel();
			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
			if(!in_array($ids,$cust_id)){
				$this->error('您没有该公司的权限，不能进行相关操作！');
			}
		}
		$orderren=new Order_renewalModel();
		$map['check']=1;
		$map['check_time']=time();
		$flag=$orderren->where("order_id=$id")->save($map);
		if($flag==0){$this->error('审核失败1');}
		else{ 
			$order=new Order_payModel();
			/* 修改订单表订单过期时间**/
			$info=$orderren->info($id);
			$map1['expired_time']=$info['new_expired_time'];
			$order=new OrderModel();
			$flag1=$order->where("id=$id")->save($map1);
			if($flag1==1){ $this->success('审核成功');}
			else{$this->error('审核失败');}
		}
	}
}