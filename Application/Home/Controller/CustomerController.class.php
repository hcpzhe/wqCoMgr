<?php
namespace Home\Controller;
use Think\Page;
use Common\Controller\HomeBaseController;
use Home\Model\CustomerModel;
use Think\Model;
use Home\Model\Order_domainModel;
use Home\Model\UserModel;
use Home\Model\DepartModel;

header("Content-Type:text/html;charset=utf-8");
class CustomerController extends HomeBaseController {
    /**客户添加***/
	public function add(){
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
		$User = new UserModel();
		$id = UID;		
		$user_list = $User->where('id='.$id)->find();
		//当前登录者
		$this->assign('user_list',$user_list);
		//所有人员
		$this->assign('users',$User->all_saller());
		$this->display();					
	}
	
	/** 新增的客户接口
	 * 1.客户表添加一条记录
	 * 2.客户产品权限所有表添加一条记录，根据当前所添加的客户的id */
	public function insert(){
		$data['user_id']  = UID;		
		$data['add_time'] = time();
		$model = new CustomerModel();	
		$data = $model->create();
		// 开始事务
		mysql_query("start transaction");
		//客户表添加一条数据		
		$res=$model->add($data);
		//员工产品权限表添加一条记录
		$arr['user_id'] =$_POST['user_id'];
		$arr['cust_id'] = $res;
		//权限过期时间
		$arr['expired_time'] = time()+30*24*60*60;
// 		echo date("Y-m-d H:i:s", time());echo "<br/>";
// 		echo date("Y-m-d H:i:s",$arr['expired_time']);exit();
		$ucp = M('User_cust_prod');
		$res1=$ucp->add($arr);
		if ($res && $res1) {
			mysql_query("COMMIT");
			$this->success('添加成功',U('Customer/lists'));
		}else {
			$this->error('添加失败',U('Customer/add'));
			mysql_query("ROLLBACK");
		}
	}
		
	/**客户列表     公司名称搜索**/
	public function lists() {		
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
		if (!IS_ROOT){ //非超管		
			$User = new UserModel();
			//登录人拥有权限的客户id
			$cust_id=$User->user_auto();  
			$where['id']=array('in',$cust_id);
			if (empty($cust_id)){
				$this->error('没有客户信息！',U('Index/welcome'));
			}
		}
		$where['`status`'] = array('eq',1);		
		$key = (int)I('param.key'); //选择搜索条件
		$name = I('param.name');    //输入的搜索信息
		$visit = new CustomerModel();
		if(!empty($name) && $key == 1){
			//公司名称模糊检索
			$where['name'] = array('like',"%$name%");
		}elseif (!empty($name) && $key == 2){
			//按照联系人进行模糊检索
			$where['contacts'] = array('like',"%$name%");
		}elseif (!empty($name) && $key == 3){
			//按照联系电话进行模糊检索
			$where['phone'] = array('like',"%$name%");
		}elseif (!empty($name) && $key == 4){
			//按照地址进行模糊检索
			$where['address'] = array('like',"%$name%");
		}
		
		$count=$visit->where($where)->count();       // 查询满足要求的总记录数		
		$Page       = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(10)
		$data['show']       = $Page->show();// 分页显示输出
		$list = $visit->where($where)->limit($Page->firstRow.','.$Page->listRows)->order('add_time desc')
		->getField('id,name,contacts,phone,fax,address',true);
		
        $this->assign('id',$where['id']);
		$this->assign('page',$data['show']);
		$this->assign('list',$list);

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
		$id = (int)I('id');   //被选中要进行操作的id
		if (!IS_ROOT){ //非超管
			$User = new UserModel();
			$cust_id=$User->user_auto();  //登录人拥有的客户权限id			
			if(!in_array($id,$cust_id)){
			     $this->error('您没有该公司的权限，不能进行相关操作！');
			}
		}
			$cust = M('Customer');
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
		$id = (int)I('id');   //被选中要进行操作的id
		$cust = M('Customer'); //获取客户详细信息
		if (!IS_ROOT){ //非超管
			$User = new UserModel();
			$cust_id = $User->user_auto();  //登录人拥有的客户权限id
			//print_r($cust_id);exit();
			if(!in_array($id,$cust_id)){
				$this->error('您没有该公司的权限，不能进行相关操作！');
			}
		}		
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
		$res = $cust_vi->table('erp_customer as cr,erp_customer_visit as cv,erp_user as eu')
		->where("cv.user_id=eu.id AND cr.id=cv.cust_id AND cr.id=$id")
		->getField("cv.id as v_id,eu.realname as uname,cr.`name` as cname,cr.contacts as clink,cv.visit_time as vtime,cr.phone as cphone,cr.id as cust_id");
		$this->assign('visits',$res);
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