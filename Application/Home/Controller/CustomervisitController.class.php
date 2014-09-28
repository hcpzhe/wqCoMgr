<?php
namespace Home\Controller;
use Think\Page;
use Common\Controller\HomeBaseController;
use Home\Model\Customer_visitModel;
use Home\Model\Visit_prodModel;

class CustomervisitController extends HomeBaseController {

	/**拜访记录列表**/
	public function visitlists(){
		$visit=new Customer_visitModel();				
        $count=$visit->table('erp_customer_visit as cu,erp_user as ur,erp_customer as cr')
		->where("cu.user_id=ur.id AND cu.cust_id=cr.id")		
		->count();       // 查询满足要求的总记录数        
		$Page       = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(10)
		$show       = $Page->show();// 分页显示输出
		$visit_list = $visit->table('erp_customer_visit as cu,erp_user as ur,erp_customer as cr')
		->where("cu.user_id=ur.id AND cu.cust_id=cr.id")
		->field("cu.id as id,ur.realname as uname,cr.`name` as cname,cu.visit_time,cu.`content`")
		->limit($Page->firstRow.','.$Page->listRows)->order('visit_time desc')->select();       
 		$this->assign('visit_lisit',$visit_list);
        $this->assign('show',$show);   //分页显示
		$this->display();
		
	}
	
	/**拜访记录添加**/
	public function addvisit(){
		$cust_id = (int)I('cust_id');
		$cust = M('customer');
		$cust_name = $cust->where('id='.$cust_id)->getField('name');
		$this->assign('cust_id',$cust_id);
		$this->assign('cust_name',$cust_name);
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

		$this->success('添加成功',U('Customervisit/visitlists'));  
			
	}
	
	/**查看拜访记录的详细信息**/
	public function visit_detailed(){
		$visit_id = (int)I('id');
		$model = new Customer_visitModel();  //拜访的详细信息
		$data = $model->table('erp_customer_visit as cu,erp_user as ur,erp_customer as cr')
		->where("cu.user_id=ur.id AND cu.cust_id=cr.id AND cu.id=$visit_id")
		->getField("cu.id as id,ur.realname as uname,cr.name as cname,cu.visit_time,cu.content");	
// 		print_r($data);
// 		exit();	
		$this->assign('data',$data);
		
		//与拜访记录有关的沟通信息
		$visit_prod_list = $model->table('erp_customer_visit as cu,erp_product as pt,erp_visit_prod as vd')
		->where("cu.id=vd.visit_id AND pt.id=vd.prod_id AND cu.id=$visit_id")
		->select();
// 		print_r($visit_prod_list);
// 		exit();

		$this->assign('visit_prod_list',$visit_prod_list);
		$this->display();

	}
	/**添加沟通记录**/
	public function add_visit_prod(){
		$product = M('product');
		$product_list = $product->select();
		$this->assign('product_list',$product_list);
// 		print_r($product_name);
// 		exit();
		
		$visit_id = (int)I('visit_id');
		$newdata = array();
		$newdata['visit_id'] = I('param.visit_id');
		$newdata['uname'] = I('param.uname');
		$newdata['cname'] = I('param.cname');
		$newdata['visit_time'] = I('param.visit_time');
		$this->assign('newdata',$newdata);
		
		
		$this->display();
	}
	/**沟通记录添加   提交接口**/
	public function visit_prod_insert(){
		$model = new Visit_prodModel(); 
		$data = $model->create();
		$model->add($data);
		$this->success('添加成功',U('Customervisit/visitlists'));
		
	}
	
}