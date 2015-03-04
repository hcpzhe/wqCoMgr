<?php
namespace Home\Controller;
use Think\Page;
use Common\Controller\HomeBaseController;
use Home\Model\Customer_visitModel;
use Home\Model\Visit_prodModel;
use Home\Model\UserModel;
use Home\Model\CustomerModel;

header("Content-Type:text/html;charset=utf-8");
class CustomervisitController extends HomeBaseController {

	/**拜访记录列表**/
	public function visitlists(){
		/*--------wcd权限判断---------*/
		//获取当前模块名称
		$contro=CONTROLLER_NAME;
		//获取当前操作名称
		$actio=ACTION_NAME;
		//获取当前访问规则
		$cd_rule="Home/".$contro."/".$actio;
		$uid = UID;
		if($this::cd_rule_check($uid,$cd_rule)!=1){
			$this->error('没有权限禁止操作！！！');
		}
		/*--------wcd权限判断---------*/
		//用户名
		$user=M('User');
		$user_list=$user->where('status=1')->select();
		$this->assign('user_list',$user_list);
		
		$user_id = (int)I('param.user_id');  //用户名
		$kstime = strtotime(I('param.kstime'));  //开始时间
		$jztime = strtotime(I('param.jztime'));  //截止时间
		$key = (int)I('param.key'); //公司信息
		$name = I('param.name');    //输入的搜索信息
		$visit=new Customer_visitModel();
		$where = "cu.user_id=ur.id AND cu.cust_id=cr.id";  //多表查询条件
		if (!empty($user_id)){
			$where=$where." AND ( ur.id = $user_id)";
		}
		if (!empty($kstime)){
			$where=$where." AND ( cu.visit_time >= $kstime)";
		}
		if (!empty($jztime)){
		$where=$where." AND ( cu.visit_time <= $jztime)";
		}
		if($key == 1){
		$where=$where." AND ( cr.name like '%".$name."%')"; //公司名称模糊检索
		}elseif ($key == 2){
		$where=$where." AND ( cr.contacts like '%".$name."%')"; //按照联系人进行模糊检索
		}else {
		$where=$where." AND ( cr.phone like '%".$name."%')";  //按照联系电话查询
		}
		$count=$visit->table('erp_customer_visit as cu,erp_user as ur,erp_customer as cr')
		->where($where)
		->count();       // 查询满足要求的总记录数
		$Page       = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(10)
		$show       = $Page->show();// 分页显示输出
		$visit_list = $visit->table('erp_customer_visit as cu,erp_user as ur,erp_customer as cr')
		->where($where)
		->field("cu.id as id,ur.realname as uname,cr.id as cust_id,cr.`name` as cname,cr.contacts as contacts,cr.phone as phone,cu.visit_time,cu.`content`")
		->limit($Page->firstRow.','.$Page->listRows)->order('visit_time desc')->select();
		$this->assign('visit_lisit',$visit_list);
		$this->assign('page',$show);   //分页显示
		$this->display();		
	}	
	/**拜访记录添加**/
	public function addvisit(){
		/*--------wcd权限判断---------*/
		//获取当前模块名称
		$contro=CONTROLLER_NAME;
		//获取当前操作名称
		$actio=ACTION_NAME;
		//获取当前访问规则
		$cd_rule="Home/".$contro."/".$actio;
		$uid = UID;//echo $this::cd_rule_check($uid,$cd_rule);exit();
		if($this::cd_rule_check($uid,$cd_rule)!=1){
			$this->error('没有权限禁止操作！！！');
		}
		/*--------wcd权限判断---------*/
		$id = (int)I('cust_id');   //被选中要进行操作的id
		$cust = M('customer');
		if(empty($id)){   //未被选中指定公司  添加拜访记录
			$newdata['status'] = 1; //公司信息审核通过后 才能添加拜访记录
			$cust_list=$cust->where($newdata)->select();
			$this->assign('cust_list',$cust_list);
		}else{
			if (!IS_ROOT){ //非超管
				$User = new UserModel();
				$cust_id=$User->user_auto();  //登录人拥有的客户权限id
				if(!in_array($id,$cust_id)){
					$this->error('您没有该公司的权限，不能进行相关操作！');
				}
			}
		}
		$visit_time = time();
		$this->assign('visit_time',$visit_time);
	    $check = $cust->where('id='.$id)->getField('check');
		$cust_name = $cust->where('id='.$id)->getField('name');
		$this->assign('cust_id',$id);
		$this->assign('cust_name',$cust_name);							
		
		$User = M("User");
		$user_list = $User->where('status=1')->select();
		$this->assign('user_list',$user_list);  //拜访员工
		$this->display();
			
	}
	
	/**拜访记录添加  提交接口**/
	public function addvisit_insert(){
		$cust_id = (int)I('cust_id');
		$data['cust_id'] = $cust_id;
		$data['user_id']  = UID;
		$data['content'] =  I('param.content');
		$data['visit_time'] = strtotime(I('param.visit_time'));	
		$model = new Customer_visitModel();			
		$result = $model->data($data)->add();	
		if ($result){ 
			$visit_id = $result; //获取新添数据id
			$this->redirect('Customervisit/add_visit_prod',array('cust_id'=>$cust_id,'visit_id'=>$visit_id),1,'<div style="margin: 40px 0 20px;">拜访记录添加成功，请添加沟通记录</div>'); //拜访记录添加成功后跳转到添加沟通记录页面
		}else{ 
			$this->error('拜访记录添加失败！');
		}	       
	}
	
	/**查看拜访记录的详细信息**/
	public function visit_detailed(){
		/*--------wcd权限判断---------*/
		//获取当前模块名称
		$contro=CONTROLLER_NAME;
		//获取当前操作名称
		$actio=ACTION_NAME;
		//获取当前访问规则
		$cd_rule="Home/".$contro."/".$actio;
		$uid = UID;
		if($this::cd_rule_check($uid,$cd_rule)!=1){
			$this->error('没有权限禁止操作！！！');
		}
		/*--------wcd权限判断---------*/
		$id = (int)I('cust_id');   //被选中要进行操作的id
		if (!IS_ROOT){ //非超管
			$User = new UserModel();
			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
			if(!in_array($id,$cust_id)){
				$this->error('您没有该公司的权限，不能进行相关操作！');
			}
		}
			$visit_id = (int)I('id');
			$model = new Customer_visitModel();  //拜访的详细信息
			$data = $model->table('erp_customer_visit as cu,erp_user as ur,erp_customer as cr')
			->where("cu.user_id=ur.id AND cu.cust_id=cr.id AND cu.id=$visit_id")
			->getField("cu.id as id,cr.id as cust_id,ur.realname as uname,cr.name as cname,cu.visit_time,cu.content");	
			$this->assign('cust_id',$id);   //客户编号
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
		/*--------wcd权限判断---------*/
		//获取当前模块名称
		$contro=CONTROLLER_NAME;
		//获取当前操作名称
		$actio=ACTION_NAME;
		//获取当前访问规则
		$cd_rule="Home/".$contro."/".$actio;
		$uid = UID;
		if($this::cd_rule_check($uid,$cd_rule)!=1){
			$this->error('没有权限禁止操作！！！');
		}
		/*--------wcd权限判断---------*/
		$id = (int)I('cust_id');   //被选中要进行操作的id
		if (!IS_ROOT){ //非超管
			$User = new UserModel();
			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
			if(!in_array($id,$cust_id)){
				$this->error('您没有该公司的权限，不能进行相关操作！');
			}
		}
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
	/***拜访记录添加 客户名称模糊检索***/
	public function search(){
		$name = I('param.name');    //输入的搜索信息
		//print_r($name);exit();
		$where['status'] = 1;
		if(!empty($name)){
			//公司名称模糊检索
			$where['name'] = array('like',"%$name%");
		}
		$customer=new CustomerModel();
		$cus_list = $customer->where($where)
		->order('id desc')->select();
		$this->assign('cus_list',$cus_list);
		$this->display();
	}
}