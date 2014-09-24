<?php
namespace Home\Controller;
use Think\Page;
use Common\Controller\HomeBaseController;
use Home\Model\Customer_visitModel;

class CustomervisitController extends HomeBaseController {

	/**拜访记录列表**/
	public function visitlists(){
		$visit = M('customer_visit');		
		$count      = $visit->count();// 查询满足要求的总记录数
		$Page       = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(10)
		$show       = $Page->show();// 分页显示输出
		$visit_list = $visit->limit($Page->firstRow.','.$Page->listRows)->select();				
		$this->assign('visit_lisit',$visit_list);
		$this->display();
	}
	
	/**拜访记录添加**/
	public function addvisit(){
		$cust_id = (int)I('cust_id');
		$cust = M('customer');
		$cust_name = $cust->where('id='.$cust_id)->getField('name');
		$this->assign('cust_id',$cust_id);
		$this->assign('cust_name',$cust_name);
// 		print_r($cust_name);
// 		exit();
		$this->display();
		
	}
	
	/**拜访记录添加  提交接口**/
	public function addvisit_insert(){
		$cust_id = (int)I('cust_id');
		$data['cust_id'] = $cust_id;
		$data['user_id']  = UID;
		$data['content'] =  I('param.content');
		$data['visit_time'] = time();	
		print_r($data['visit_time']);
		exit();	
		$model = new Customer_visitModel();			
		$data = $model->data($data)->add();
		$this->success('添加成功',U('Customervisit/visitlists'));  
			
	}
	
	
}