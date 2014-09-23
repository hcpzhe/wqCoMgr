<?php
namespace Home\Controller;
use Think\Page;
use Common\Controller\HomeBaseController;
use Home\Model\CustomerModel;

class CustomerController extends HomeBaseController {
    /**客户添加***/
	public function add(){
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
	public function lists($name=null, $status=1, $tpl=null) {				
		$map=array();
		$cust = M('Customer');
		$map['status'] = $status;
		$id = (int)I('param.id');
		if ($id>0) $map['id'] = $id;		
		if(isset($name)){
			$map['name']   =   array('like', '%'.$name.'%');
		}			
		$count      = $cust->where($map)->count();// 查询满足要求的总记录数
		$Page       = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show       = $Page->show();// 分页显示输出// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$list = $cust->where($map)->limit($Page->firstRow.','.$Page->listRows)->select();
		$this->assign('list',$list);// 赋值数据集
		$this->assign('page',$show);// 赋值分页输出
		$this->assign('status', $map['status']); //用于搜索条件的显示
		$this->assign('name', $name);           //用于搜索条件的显示
		if (isset($tpl)) $this->display($tpl);
        else $this->display();
	}
	
	/***客户名称模糊检索***/
	public function search($name=''){
		$name = I('name');
// 		print_r($name);
// 		exit();
// 		if (!empty($name)) {
// 			$Form = M("Customer");
// 			if ($Form->getByName($name)) {
// 				$this->error('名称已经存在');
// 			} else {
// 				$this->success('名称可以使用!');
// 			}
// 			} else {
// 				$this->error('名称必须');
// 			}
				$this->display();		
		
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
	/*查看详情*/
	public function detailed(){
		
		//$id = (int)I('id');
     $id=1;
     
        $cust = M('Customer'); //获取客户详细信息
		$list = $cust->where('id='.$id)->find();
		$this->assign('list',$list);
		
		$order = M('Order');    //获取订单信息
		$order_list = $order->where('cust_id='.$id)->select();
		$this->assign('order_list',$order_list);
		
		$domain = M('Domain');    //获取域名信息
		$domain_list = $domain->where('cust_id='.$id)->select();
		$this->assign('domain_list',$domain_list);
// 		print_r($order_list);
// 		exit();
		$this->display();
	}
	
}