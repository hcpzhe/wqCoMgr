<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\OrderModel;
use Home\Model\Develop_orderModel;
use Home\Model\Seo_orderModel;
use Home\Model\ProductModel;
use Home\Model\CustomerModel;
use Home\Model\DepartModel;
use Home\Model\UserModel;
class OrderController extends HomeBaseController{
/** 订单列表 */
	public function order_list(){
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
			$where=$where." AND oe.check=1";
		}else if($check==2){
			$where=$where." AND oe.check=0";
		}else{ $where=$where." AND oe.check>=0";}
		
		if(!empty($key)){
			$where=$where." AND ( pt.name like '%".$key."%' or cr.name like '%".$key."%' or ur.realname like '%".$key."%')";
		}
		$order=new OrderModel();
		$this->data=$order->orderlist($where);
		/*产品列表*/
		$product=new ProductModel();
		$this->pro_list=$product->p_list();
		$this->display();
	}
/** 待续费订单列表 (距订单到期时间三个月进入带续费期)*/
	public function renewal_order(){
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
			$where=$where." AND oe.check=1";
		}else if($check==2){
			$where=$where." AND oe.check=0";
		}else{ $where=$where." AND oe.check>=0";}
		
		if(!empty($key)){
			$where=$where." AND ( pt.name like '%".$key."%' or cr.name like '%".$key."%' or ur.realname like '%".$key."%')";
		}
		$order=new OrderModel();
		$this->rene=$order->renelist($where);
		/*产品列表*/
		$product=new ProductModel();
		$this->pro_list=$product->p_list();
		$this->display();
	}
	
/**   订单详情   */
	public function order_info(){
		$id=$_GET['id'];
		$order=new OrderModel();
		$this->orderinfo=$order->orderinfo($id);
		$this->display();
	}
/**  订单修改表单 */
	public function ord_u_form(){
		$id=$_GET['id'];
		/** 查询数据   */
		$order=new OrderModel();
		$this->orderinfo=$order->orderinfo($id);
		/*查询产品分类*/
		$product=new ProductModel();
		$this->p_list=$product->p_list();
		$this->display();
	}	
/**  修改订单 */
	public function up(){
		$id=$_GET['id'];
		$p=$_POST['pid'];
		$data['total_fees']=$_POST['money'];
		$data['expired_time']=$_POST['time'];
		if(!empty($p)){
			/*产品改变*/
			$data['prod_id']=$p;
		}
		$order=new OrderModel();
		$flag=$order->where("id=$id")->save($data);
		if($flag==1){ $this->success('保存成功！');}
		else{ $this->error('保存失败');}
	}	
/** 跳转到添加订单页面*/
	public function add_order_form(){/** 判断是否传出客户id */
		/** 接收客户id */
		$id=$_GET['id'];
		if(!empty($id)){
			$customer=new CustomerModel();
			$this->cus=$customer->one($id);
		}
		/*查询产品分类*/
		$product=new ProductModel();
		$this->p_list=$product->p_list();
		/** 查询系统 用户 */
		$user=new UserModel();
		$this->user_list=$user->alluser();
		/*查询所有客户*/
		$customer=new CustomerModel();
		$this->cus_list=$customer->cus_list();
		$this->display();
	}		
/** 添加订单 */
	public function add_order(){
		$map['cust_id']=$_POST['cusid'];
		$map['total_fees']=$_POST['money'];
		$map['prod_id']=$_POST['proid'];
		$map['user_id']=$_POST['userid'];
 		$map['time_limit']=$_POST['time_limit'];$day=$map['time_limit']*365;//获取服务年限
// 		$map['domain']=$_POST['domain'];
		$map['signed_time']=date('Y-m-d',time());//获取当前日期
		$map['expired_time']=date("Y-m-d",strtotime("$day day"));//获取订单到期日期
		$map['remark']=$_POST['remark'];
		$order=new OrderModel();
		$flag=$order->add($map);
		if($flag==0){	$this->error('添加失败！');
		}else{	$this->success('添加成功！');}
	}	
/*
 * 审核订单
 * 如果为订单为网站，erp_develop_order增加一条记录
 * 如果为优化订单，erp_seo_order增加一条记录
 * 如果两者都不是不进行其他操作*/
	public function check_order(){
		/*改变订单审核状态*/
		$id=$_GET['id'];
		/*改变审核状态操作*/
		$order=new OrderModel();
		$flag11=$order->where("id=$id")->setField("check","1");
		/*判断操作结果*/
		if($flag11==0){ $this->error('审核失败');}
		else { $this->success('审核成功');}
		
		
// 		$pid=$_GET['pid'];
		
// 		/*判断是否为网站开发订单*/
// 		if($pid==1 || $pid==2 || $pid==3){
// 			/*网站开发模型*/
// 			$dor=new Develop_orderModel();
// 			$flag1=$dor->add_do($id);
// 			/*如果是否重复审核审核失败*/
// 			if($flag1==0){ $this->error('审核重复');}
// 			else {/*否则审核继续*/ 
				
// 			}
// 		}elseif ($pid==6){/*判断是否为优化开发*/
// 			/*优化模型*/
// 			$sor=new Seo_orderModel();
// 			$flag2=$sor->add_so($id);
// 			/*如果审核重复则审核失败*/
// 			if($flag2==0){ $this->error('审核重复');}
// 			else {/*审核继续*/
// 				/*之心审核操作*/
// 				$flag22=$order->where("id=$id")->setField("check","1");
// 				/*判断审核结果*/
// 				if($flag22==0){ $this->error('审核失败');}
// 				else { $this->success('审核成功');}
// 			}
// 		}else{/*其他类型产品*/
// 			$flag3=$order->where("id=$id")->setField("check","1");
// 			if($flag3==0){ $this->error('审核失败');}
// 			else { $this->success('审核成功');}
// 		}
	}	
	/** 推送订单至下一个部门      表单 */
	public function push_form($id){
		/** 查询订单信息  判断该订单是否通过审核 */
		$order=new OrderModel();
		$flag=$order->field('check')->where("id=$id")->find();
		if($flag['check']==0){ $this->error('订单未审核');}
		/** 查询所有部门 */
		$depart=new DepartModel();
		$this->id=$id;
		$this->dp=$depart->alldepart();
		$this->display();
	}
	/** 推送至下一个部门 */
	public function push($id){
		$dp_id=$_POST['dp'];
		/**技术 */
		if($dp_id==1){
			/*网站开发模型*/
			$dor=new Develop_orderModel();
			$flag1=$dor->add_do($id);
			if($flag1==1){ 	$this->success('推送成功');}
			else{ $this->error('推送失败');}
		}else if($dp_id==2){/** 优化 */
			/*优化模型*/
			$sor=new Seo_orderModel();
			$flag2=$sor->add_so($id);
			if($flag2==1){ $this->success('推送成功');}
			else{ $this->error('推送失败');}
		}else if($dp_id==11){/** 客服 */
			
		}else{ $this->error('禁止向该部门推送');}
	}
	/** 停止订单 */
	public function stop($id){
		$order=new OrderModel();
		$flag=$order->where("id=$id")->setField("status","0");
		if($flag==1){ $this->success('成功');}
		else{ $this->error('失败');}
	}
	/** 开始订单 */
	public function star($id){
		$order=new OrderModel();
		$flag=$order->where("id=$id")->setField("status","1");
		if($flag==1){ $this->success('成功');}
		else{ $this->error('失败');}
	}

}
