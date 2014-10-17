<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\OrderModel;
use Home\Model\ProductModel;
class ResultsController extends HomeBaseController{
	/**业绩列表 */
	public  function reslist(){
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
}