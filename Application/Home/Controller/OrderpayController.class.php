<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Order_payModel;
use Home\Model\OrderModel;
class OrderpayController extends HomeBaseController{
	/*订单付款记录*/
	public function order_pay_record(){
		/*获取搜索条件*/
		$class = (int)I('param.class');
		$check = (int)I('param.check');  
		$key = I('param.key');
		/** 拼接where条件 */
		if(!empty($class)){
			$where=$where." AND op.class=".$class;
		}
		/*通过，待审核*/
		if(!empty($check) && $check==1){
			$where=$where." AND op.check=1";
		}else if(!empty($check) && $check==2){
			$where=$where." AND op.check=0";
		}		
		if(!empty($key)){
			$where=$where." AND ( cr.name like '%".$key."%' or ur.realname like '%".$key."%')";
		}
		$orderpay=new Order_payModel();
		$this->data=$orderpay->op_record($where);
		$this->display();
	}
	/*订单付款详情*/
	public function op_info(){
		$id=$_GET['id'];
		$orderpay=new Order_payModel();
		$this->opinfo=$orderpay->opinfo($id);
		$this->display();
	}	
	/*修改订单付款记录*/
	public function up(){
		$id=$_GET['id'];
		$data['money']=$_POST['money'];
		$data['pay_time']=strtotime($_POST['pay_time']);
		$orderpay=new Order_payModel();
		$flag=$orderpay->where("id=$id")->save($data);
		if($flag==1){ $this->success('提交成功');}
		else{ $this->error('提交成功');};
	}
	/** 添加订单付款记录 */
	public function ad_form(){
		$id=$_GET['id'];
		$order=new OrderModel();
		$this->orderlinfo=$order->orderinfo($id);
		$this->display();
	}
	/** 添加记录  */
	public function ad_record(){
		$map["order_id"]=$_GET["id"];
		$map["money"]=$_POST["money"];
		$map["class"]=2;
		$map["pay_time"]=strtotime($_POST["pay_time"]);
		$orderpay=new Order_payModel();
		$flay=$orderpay->add($map);
		if($flay==0){$this->error("添加失败");	}
		else{ $this->success("添加成功");}
	}
}