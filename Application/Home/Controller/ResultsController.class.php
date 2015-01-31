<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\OrderModel;
use Home\Model\ProductModel;
class ResultsController extends HomeBaseController{
	/**部门任务列表 */
	public  function reslist(){
		/*获取搜索条件*/
		$pro=$_POST['product'];
		$check=$_POST['check'];
		$key=$_POST['key'];
		/** 拼接where条件 */
		if(!empty($pro)){
			$where=$where." AND pt.id=".$pro;
		}

			$where=$where." AND oe.check=1";
	
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

	/***业绩排行***/
	public function show_res(){
		$order=new OrderModel();
		$this->showres=$order->result();
		$this->display();
	}
}