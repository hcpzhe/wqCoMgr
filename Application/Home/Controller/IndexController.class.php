<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;

class IndexController extends HomeBaseController {

	public function index(){
		$this->display();
	}
	
	public function welcome() {
		$this->display();
	}
}