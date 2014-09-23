<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
class SeoordController extends HomeBaseController{
	/*优化订单*/
	public function seo_list(){
		$this->display();
	}
	/*增加一条开发记录*/
	public function add_od(){
		echo "优化开发订单";
	}	
}