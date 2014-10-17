<?php
namespace Home\Controller;
use Think\Page;
use Common\Controller\HomeBaseController;
use Home\Model\CustomerModel;
use Think\Model;

class CustomerController extends HomeBaseController {
    /**客户添加***/
	public function add(){
		$User = M("User");
		$user_list = $User->where('status=1')->select();
		$this->assign('user_list',$user_list);  //录入人
		$this->display();					
	}
	
	/***新增的客户接口***/
	public function insert(){		
		//$data['user_id']  = UID;		
		$data['add_time'] = time();
		$model = new CustomerModel();	
		$data = $model->create();
		$model->add($data);
		$this->success('添加成功',U('Customer/lists'));
	}
		
	/**客户列表     公司名称搜索**/
	public function lists() {				
		$key = (int)I('param.key'); //选择搜索条件
		$name = I('param.name');    //输入的搜索信息
		$visit = new CustomerModel();
		if($key == 1){
			$where=$where." AND ( cr.name like '%".$name."%')"; //公司名称模糊检索
		}elseif ($key == 2){
			$where=$where." AND ( ur.realname like '%".$name."%')"; //按照录入人进行模糊检索
		}
	    $this->data=$visit->customer_lists($where);
		$this->display();		
	}
	
	/***客户名称模糊检索***/
	public function search($name=null){	
		$name = I('name');
		if(!empty($name)){
			$Form = M("Customer");
			$where = "cr.user_id=ur.id AND cr.status=1";  //多表查询条件
			$where=$where." AND ( cr.name like '%".$name."%')"; //公司名称模糊检索
			//$map['name']   =   array('like', '%'.$name.'%');		
			$count  = $Form->table('erp_user as ur,erp_customer as cr')
			->where($where)->count();// 查询满足要求的总记录数
			$Page       = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(10)
			$show       = $Page->show();// 分页显示输出			
			$list = $Form->table('erp_user as ur,erp_customer as cr')->where($where)
			->field("cr.id as id,ur.realname as uname,cr.`name` as cname,cr.contacts,cr.phone,cr.check")
		    ->limit($Page->firstRow.','.$Page->listRows)->order('cr.id desc')->select();
			if (!empty($list)){
				$this->assign('page',$show);// 赋值分页输出
				$this->assign('list',$list);					
				$this->display();
			}else{				
				echo "用户名不存在，可以添加！";
			}
		}						
	}
	/**公司信息修改**/
	public function edit(){
		$cust = M('Customer');
		$id = (int)I('id');
		$list = $cust->where('id='.$id)->find();
		$this->assign('list',$list);
        $this->display();
	}
	/**公司信息修改提交  接口**/
	public function update(){
		$id = (int)I('param.id');
		if ($id <= 0) $this->error('参数非法');		
		$newdata = array();
		$newdata['id'] = I('param.id');
		$newdata['name'] = I('param.name');
		$newdata['contacts'] = I('param.contacts');
		$newdata['phone'] = I('param.phone');
		$newdata['fax'] = I('param.fax');
		$newdata['address'] = I('param.address');	
		$model = M('Customer');
		if (false === $model->create($newdata)) $this->error($model->getError());
		if (false === $model->where('id='.$id)->save()) $this->error('更新失败');
		$this->success('更新成功',U('Customer/lists'));
	}
	/*查看公司详情*/
	public function detailed(){		
		$id = (int)I('id');     
        $cust = M('Customer'); //获取客户详细信息
		$list = $cust->table('erp_customer as cr,erp_user as ur')
		->where('cr.user_id=ur.id AND cr.id='.$id)
		->getField("cr.id as id,cr.`name` as `name`,cr.contacts as contacts,cr.phone as phone,cr.fax as fax,cr.address as address,cr.add_time as add_time,cr.`check` as `check`,cr.check_time as check_time,cr.remark as remark,ur.realname as realname");
		$this->assign('list',$list);

		$order = M('Order');    //获取订单信息		
		$order_list = $order->table('erp_customer as cr,erp_order as ord,erp_product as pt,erp_user as ur')
		->where("cr.id=ord.cust_id AND pt.id=ord.prod_id AND ord.user_id=ur.id AND cr.id=$id")
		->getField("ord.id as id,ur.realname as uname,pt.name as pname,ord.total_fees as total_fees,ord.expired_time as expired_time,ord.status as status,ord.remark as remark");
		$this->assign('order_list',$order_list);
					
		$domain = M('Domain');    //获取域名信息
		$domain_list = $domain->where('cust_id='.$id)->select();
		$this->assign('domain_list',$domain_list);
		
 		//判断是否有拜访记录
		$cust_vi = M('Customer_visit');
		$res = $cust_vi->table('erp_customer as cr,erp_customer_visit as cv')
		->where("cr.id=cv.cust_id AND cr.id=$id")
		->count();
		$this->assign('res',$res);

		$this->display();
	}
	
	/**提交 待审申请**/
	public function check(){
		$id = (int)I('param.id');
		if ($id <= 0) $this->error('参数非法');		
		$newdata = array();
		$newdata['id'] = I('param.id');	
		$newdata['check'] = 1;
		$newdata['check_time'] = time();
		$model = M('Customer');
		if (false === $model->create($newdata)) $this->error($model->getError());
		if (false === $model->where('id='.$id)->save()) $this->error('审核失败');
		$this->success('审核成功',U('Customer/lists'));
	}
			
}