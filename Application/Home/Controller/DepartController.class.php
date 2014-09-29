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
	/* 跳转到添加部门页面 */
	public function depa_form(){
		/**查询所有部门 */
		$depa=new DepartModel();
		$this->alldepart=$depa->depalist();
		$this->display();
	}
}