<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Seo_orderModel;
class SeoordController extends HomeBaseController{
	/*优化订单*/
	public function seo_list(){
		$this->display();
	}
	/*增加一条开发记录*/
	public function add_od(){
		$seoord=new Seo_orderModel();
		$id=$_REQUEST['id'];
		echo $id;
	}	
}