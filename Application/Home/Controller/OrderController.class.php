<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\OrderModel;
use Home\Model\Develop_orderModel;
use Home\Model\Seo_orderModel;
use Home\Model\ProductModel;
class OrderController extends HomeBaseController{
/*订单列表*/
	public function order_list(){
		$order=new OrderModel();
		$this->data=$order->orderlist();
		$this->display();
	}
/*订单详情*/
	public function order_info(){
		$id=$_GET['id'];
		$order=new OrderModel();
		$this->orderinfo=$order->orderinfo($id);
		$this->display();
	}
/*订单修改表单*/
	public function ord_u_form(){
		$id=$_GET['id'];
		/*查询数据*/
		$order=new OrderModel();
		$this->orderinfo=$order->orderinfo($id);
		/*查询产品分类*/
		$product=new ProductModel();
		$this->p_list=$product->p_list();
		$this->display();
	}	
/*修改订单*/
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
/*添加订单*/
	public function add_order(){
		$this->display();
	}		
/*
 * 审核订单
 * 如果为订单为网站，erp_develop_order增加一条记录
 * 如果为优化订单，erp_seo_order增加一条记录
 * 如果两者都不是不进行其他操作*/
	public function check_order(){
		$id=$_GET['id'];
		$pid=$_GET['pid'];
		if($pid==1 || $pid==2 || $pid==3){ 
			$this->redirect('Home/Depord/add_od/', array('id' => $id));
		}
		if($pid==6){
			$this->redirect('Home/Seoord/add_od/', array('id' => $id));
		}
	}	
}
