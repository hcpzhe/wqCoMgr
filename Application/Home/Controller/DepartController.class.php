<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\DepartModel;
class DepartController extends HomeBaseController{
	/*部门列表*/
	public function depa_list(){
		$depa=new DepartModel();
		$this->depa_list=$depa->depalist();
		$this->display();
	}	
}