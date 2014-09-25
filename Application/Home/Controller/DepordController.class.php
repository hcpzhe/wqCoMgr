<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Develop_orderModel;
class DepordController extends HomeBaseController{
	/*网站开发订单*/
	public function dep_list(){
		$this->display();
	}
	/*增加一条开发记录*/
	public function add_od(){
		$depord=new Develop_orderModel();
		$depord->add_do($_REQUEST['id']);
		
		
	}
}