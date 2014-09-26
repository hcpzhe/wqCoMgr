<?php
namespace Home\Controller;
use Think\Page;
use Common\Controller\HomeBaseController;
use Home\Model\Customer_visitModel;

class CustomervisitController extends HomeBaseController {

	/**拜访记录列表**/
	public function visitlists(){
// 		$visit = M('customer_visit');		
// 		$count      = $visit->count();// 查询满足要求的总记录数
// 		$Page       = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(10)
// 		$show       = $Page->show();// 分页显示输出
// 		$visit_list = $visit->limit($Page->firstRow.','.$Page->listRows)->order('visit_time desc')->select();				
// 		$this->assign('visit_lisit',$visit_list);
// 		$this->display();

		$visit=new Customer_visitModel();
		$this->data=$visit->visitlist();
		
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
		$model = new Customer_visitModel();			
		$data = $model->data($data)->add();

	//	$this->redirect('Customervisit/add_visit_prod/visit_id/'.$data,'页面跳转中~');
		$this->success('添加成功',U('Customervisit/add_visit_prod?visit_id'.$data));  
			
	}
	
	/**查看拜访记录的详细信息**/
	public function visit_detailed(){
		$id = (int)I('id');
		$model = new Customer_visitModel();  //拜访的详细信息
		$data = $model->table('erp_customer_visit as cu,erp_user as ur,erp_customer as cr')
		->where("cu.user_id=ur.id AND cu.cust_id=cr.id AND cu.id=$id")
		->getField("cu.id as id,ur.realname as uname,cr.`name` as cname,cu.visit_time,cu.`content`");		
		$this->assign('data',$data);
		
		
		//$visit_prod = M('visit_prod');   //沟通记录
		//$visit_prod_list = $visit_prod->where('visit_id='.$id)->select();
		$visit_prod_list = $model->table('erp_customer_visit as cu,erp_product as pt,erp_visit_prod as vd')
		->where("cu.id=vd.visit_id AND pt.id=vd.prod_id AND cu.id=$id")
		->getField("pt.name as pname,vd.content as content");
// 		print_r($visit_prod_list);
// 		exit();
		
		$this->assign('visit_prod_list',$visit_prod_list);
		$this->display();

	}
	
	public function add_visit_prod(){
		$visit_id = (int)I('visit_id');
		print_r($visit_id);
		exit();
	}
	
	
}