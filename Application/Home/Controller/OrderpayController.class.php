<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Order_payModel;
use Home\Model\OrderModel;
use Home\Model\UserModel;

class OrderpayController extends HomeBaseController{
	/*订单付款记录*/
	public function order_pay_record(){
		/*--------wcd权限判断---------*/
		//获取当前模块名称
		$contro=CONTROLLER_NAME;
		//获取当前操作名称
		$actio=ACTION_NAME;
		//获取当前访问规则
		$cd_rule="Home/".$contro."/".$actio;
		$uid = UID;
		if($this::cd_rule_check($uid,$cd_rule)!=1){
			$this->error('没有权限禁止操作！！！');
		}
		/*--------wcd权限判断---------*/
		/*获取搜索条件*/
		$class = (int)I('param.class');
		$check = (int)I('param.check');  
		$key = I('param.key');
		/** 拼接where条件 */
		if(!empty($class)){
			$where['erp_order_pay.class']=$class;
// 			$where=$where." AND op.class=".$class;
		}
		/*通过，待审核*/
		if(!empty($check) && $check==1){
			$where['erp_order_pay.check']=1;
// 			$where=$where." AND op.check=1";
		}else if(!empty($check) && $check==2){
			$where['erp_order_pay.check']=0;
// 			$where=$where." AND op.check=0";
		}		
		if(!empty($key)){
			$where['cr.name']=array('like',"'%".$key."%'");
// 			$where=$where." AND ( cr.name like '%".$key."%' or ur.realname like '%".$key."%')";
		}
		$orderpay=new Order_payModel();
		$this->data=$orderpay->op_record($where);	
		$this->display();
	}
	/*订单付款详情*/
	public function op_info(){
		/*--------wcd权限判断---------*/
		//获取当前模块名称
		$contro=CONTROLLER_NAME;
		//获取当前操作名称
		$actio=ACTION_NAME;
		//获取当前访问规则
		$cd_rule="Home/".$contro."/".$actio;
		$uid = UID;
		if($this::cd_rule_check($uid,$cd_rule)!=1){
			$this->error('没有权限禁止操作！！！');
		}
		/*--------wcd权限判断---------*/
		$id=$_GET['id'];		
		if (!IS_ROOT){ //非超管
			$ids=$_GET['cust_id'];   //选择的客户id
			$User = new UserModel();
			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
			if(!in_array($ids,$cust_id)){
				$this->error('您没有该公司的权限，不能进行相关操作！');
			}
		}
		$orderpay=new Order_payModel();
		$this->opinfo=$orderpay->opinfo($id);
		$this->display();
	}	
	/*修改订单付款记录*/
	public function up(){
// 		/*--------wcd权限判断---------*/
// 		//获取当前模块名称
// 		$contro=CONTROLLER_NAME;
// 		//获取当前操作名称
// 		$actio=ACTION_NAME;
// 		//获取当前访问规则
// 		$cd_rule="Home/".$contro."/".$actio;
// 		$uid = UID;
// 		if($this::cd_rule_check($uid,$cd_rule)!=1){
// 			$this->error('没有权限禁止操作！！！');
// 		}
// 		/*--------wcd权限判断---------*/
		$id=$_GET['id'];
		$data['money']=$_POST['money'];
		$data['pay_time']=strtotime($_POST['pay_time']);
		$data['class']=$_POST['type'];
		$orderpay=new Order_payModel();
		$flag=$orderpay->where("id=$id")->save($data);
		if($flag==1){ $this->success('提交成功');}
		else{ $this->error('提交成功');};
	}
	/** 添加订单付款记录 */
	public function ad_form(){
		/*--------wcd权限判断---------*/
		//获取当前模块名称
		$contro=CONTROLLER_NAME;
		//获取当前操作名称
		$actio=ACTION_NAME;
		//获取当前访问规则
		$cd_rule="Home/".$contro."/".$actio;
		$uid = UID;
		if($this::cd_rule_check($uid,$cd_rule)!=1){
			$this->error('没有权限禁止操作！！！');
		}
		/*--------wcd权限判断---------*/
		$id=$_GET['id'];
		//print_r($id);
		//exit();
		if (!IS_ROOT){ //非超管
			$ids=$_GET['cust_id'];   //选择的客户id
			$User = new UserModel();
			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
			if(!in_array($ids,$cust_id)){				
				$this->error('您没有该公司的权限，不能进行相关操作！');
			}
		}
		$order=new Order_payModel();
		$this->orderlinfo=$order->opinfo($id);
		//查询该订单所有的付款记录
		$this->op_lists=$order->op_list($id);
// 		echo "<pre>";
// 		print_r($op_lists);
// 		echo "</pre>";exit();		
		$this->display();
	}
	/** 添加记录  */
	public function ad_record(){

		$map["order_id"]=$_GET["id"];
		$map["money"]=$_POST["money"];
		$map["class"]=2;
		$map["pay_time"]=strtotime($_POST["pay_time"]);
		$map['user_id']=UID;
		$orderpay=new Order_payModel();
		$flay=$orderpay->add($map);
		if($flay==0){$this->error("添加失败");	}
		else{ $this->success("添加成功");}
	}
	/**
	 * 审核订单付款记录   **/
	public function check_order(){
		/*--------wcd权限判断---------*/
		//获取当前模块名称
		$contro=CONTROLLER_NAME;
		//获取当前操作名称
		$actio=ACTION_NAME;
		//获取当前访问规则
		$cd_rule="Home/".$contro."/".$actio;
		$uid = UID;
		if($this::cd_rule_check($uid,$cd_rule)!=1){
			$this->error('没有权限禁止操作！！！');
		}
		/*--------wcd权限判断---------*/
		
		$cid = (int)I('cust_id');   //被选中要进行操作的cust_id
// 		if (!IS_ROOT){ //非超管
// 			$User = new UserModel();
// 			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
// 			if(!in_array($cid,$cust_id)){
// 				$this->error('您没有该公司的权限，不能进行相关操作！');
// 			}
// 		}
		/*改变订单审核状态*/
		$pid=$_GET['pay_id'];
		/*改变审核状态操作*/
		$order_pay=new Order_payModel();
		$map['check']=1;
		$map['check_time']=time();
		$flag11=$order_pay->where("id=$pid")->save($map);
		/*判断操作结果*/
		if($flag11==0){ $this->error('审核失败');}
		else { $this->success('审核成功');}
	}	
}