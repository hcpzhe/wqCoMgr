<?php
namespace Home\Controller;
use Think\Page;
use Common\Controller\HomeBaseController;
use Home\Model\Customer_visitModel;
use Home\Model\Visit_prodModel;

class CustomervisitController extends HomeBaseController {

	/**拜访记录列表**/
	public function visitlists(){
		$key = (int)I('param.key'); //选择搜索条件
 		$name = I('param.name');    //输入的搜索信息
		$visit=new Customer_visitModel();
		$where = "cu.user_id=ur.id AND cu.cust_id=cr.id";  //多表查询条件
		if($key == 1){
			$where=$where." AND ( cr.name like '%".$name."%')"; //公司名称模糊检索
		}else{
			$where=$where." AND ( ur.realname like '%".$name."%')"; //按照拜访人员进行模糊检索
		}
        $count=$visit->table('erp_customer_visit as cu,erp_user as ur,erp_customer as cr')
		->where($where)		
		->count();       // 查询满足要求的总记录数        
		$Page       = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(10)
		$show       = $Page->show();// 分页显示输出
		$visit_list = $visit->table('erp_customer_visit as cu,erp_user as ur,erp_customer as cr')
		->where($where)
		->field("cu.id as id,ur.realname as uname,cr.`name` as cname,cu.visit_time,cu.`content`")
		->limit($Page->firstRow.','.$Page->listRows)->order('visit_time desc')->select();       
 		$this->assign('visit_lisit',$visit_list);
        $this->assign('page',$show);   //分页显示
		$this->display();		
	}	
	/**拜访记录添加**/
	public function addvisit(){
		$cust_id = (int)I('cust_id');
		$cust = M('customer');
		if(empty($cust_id)){   //未被选中指定公司  添加拜访记录
			$newdata['check'] = 1; //公司信息审核通过后 才能添加拜访记录
			$cust_list=$cust->where($newdata)->select();
			$this->assign('cust_list',$cust_list);
		}else {		
		    $check = $cust->where('id='.$cust_id)->getField('check');
		    //公司信息审核通过后 才能添加拜访记录
			if ($check == 0 || $check == -1){
				$this->redirect('Customer/lists',array('id'=>$cust_id),1,'公司信息还未经过审核,审核通过后才能添加拜访记录，请审核！');
			}else {
			$cust_name = $cust->where('id='.$cust_id)->getField('name');
			$this->assign('cust_id',$cust_id);
			$this->assign('cust_name',$cust_name);		
		    }
		}
		$User = M("User");
		$user_list = $User->where('status=1')->select();
		$this->assign('user_list',$user_list);  //拜访员工
		$this->display();		
	}
	
	/**拜访记录添加  提交接口**/
	public function addvisit_insert(){
		$cust_id = (int)I('cust_id');
		$data['cust_id'] = $cust_id;
		$data['user_id']  = (int)I('user_id');
		$data['content'] =  I('param.content');
		$data['visit_time'] = time();	
		$model = new Customer_visitModel();			
		$data = $model->data($data)->add();		       
		$this->redirect('Customervisit/add_visit_prod',array('visit_id'=>$data),1,'拜访记录添加成功，请添加沟通记录'); //拜访记录添加成功后跳转到添加沟通记录页面			
	}
	
	/**查看拜访记录的详细信息**/
	public function visit_detailed(){
		$visit_id = (int)I('id');
		$model = new Customer_visitModel();  //拜访的详细信息
		$data = $model->table('erp_customer_visit as cu,erp_user as ur,erp_customer as cr')
		->where("cu.user_id=ur.id AND cu.cust_id=cr.id AND cu.id=$visit_id")
		->getField("cu.id as id,ur.realname as uname,cr.name as cname,cu.visit_time,cu.content");	

        $this->assign('visit_id',$visit_id);   //拜访编号
        $this->assign('cname',$data[$visit_id]['cname']);   //公司名称
        $this->assign('uname',$data[$visit_id]['uname']);   //拜访员工
        $this->assign('visit_time',$data[$visit_id]['visit_time']);  //拜访时间
		$this->assign('data',$data);
		
		//与拜访记录有关的沟通信息
		$visit_prod_list = $model->table('erp_customer_visit as cu,erp_product as pt,erp_visit_prod as vd')
		->where("cu.id=vd.visit_id AND pt.id=vd.prod_id AND cu.id=$visit_id")
		->select();
		$this->assign('visit_prod_list',$visit_prod_list);
		$this->display();

	}
	/**添加沟通记录**/
	public function add_visit_prod(){
		$product = M('product');
		$product_list = $product->select();
		$this->assign('product_list',$product_list);

		$model = M('customer_visit');
		$visit_id = (int)I('visit_id');
		$visit_list = $model->table('erp_customer_visit as cv,erp_customer as cu,erp_user as us')
		->where("cv.cust_id=cu.id AND us.id=cv.user_id AND cv.id=$visit_id")
		->getField("cv.id as visit_id,us.realname as uname,cu.name as cname,cv.visit_time as visit_time");
		$this->assign('newdata',$visit_list);   //客户信息
				
		$this->display();
	}
	/**沟通记录添加   提交接口**/
	public function visit_prod_insert(){		 
		$data['visit_id'] = I('param.visit_id');
		$data['prod_id'] = I('param.prod_id');
		$data['content'] = I('param.content');
		$model = M('Visit_prod');
		$model->add($data);
		$this->success('沟通记录添加成功',U('Customervisit/visitlists'));
		
	}
	
}