<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
class DomrenController extends HomeBaseController{
	/*域名续费申请*/
	public function dom_ren_app(){
		$domain_id = (int)I('id');
// 		print_r($domain_id);
// 		exit();
		$this->display();
	}
}