<?php
namespace Home\Controller;
use Think\Page;
use Common\Controller\HomeBaseController;
use Home\Model\UserModel;
use Home\Model\User_cust_prodModel;
use Think\Model;
header("Content-Type:text/html;charset=utf-8");
class UsercustprodController extends HomeBaseController {
    /**权限的添加***/
	public function add(){
		//$cust_id =	(int)I('param.cust_id'); 		
		$user_id = UID;
		$cust = M('Customer');   //查询登录人的客户
		$cust_list = $cust->where('user_id='.$user_id)->select();
		$this->assign('cust_list',$cust_list);
		
		$user = M('User');
		$realname=$user->where('id='.$user_id)->getField('realname');  
		$this->assign('realname',$realname);
		
		$pro = M('Product');
		$pro_name = $pro->where('status=1')->select();  //产品
		$this->assign('pro_name',$pro_name);
		$this->display();			
	}	
	/***新增的客户接口***/
	public function insert(){		
		$data['user_id']  = UID;		
		$data['cust_id'] = (int)I('param.cust_id');		
		$data['prod_id'] = (int)I('param.prod_id');
		$data['expired_time'] = strtotime(I('param.expired_time'));
		$model = M('User_cust_prod');			
		$model->add($data);
		$this->success('添加成功',U('Customer/lists'));
	}
		
	/**客户权限列表     **/
	public function lists() {	
		$cust_id =	(int)I('param.cust_id');		
		$user_id = UID;
		$ucp = M('User_cust_prod'); //查询登录人拥有的客户权限
		$con=$ucp->where('cust_id='.$cust_id)->select();  //判断所选公司是否有权限

		if (empty($con)){
			//echo "您没有该公司的任何权限！";
			$this->success('您没有该公司的任何权限！',U('Usercustprod/add'));
		}else {
			
			$list = $ucp->table('erp_customer as cr,erp_user as ur,erp_user_cust_prod as ucp')
			->where("cr.id=ucp.cust_id AND ur.id=ucp.user_id AND ucp.cust_id=$cust_id AND ucp.user_id=$user_id")
			->getField("ucp.cust_id as id,cr.`name` as `cname`,cr.contacts as contacts,cr.phone as phone,cr.fax as fax,cr.address as address,cr.remark as remark,ur.realname as realname,ucp.expired_time as expired_time,ucp.prod_id as prod_id");
			$this->assign('list',$list);
			
			$pro = M('Product');
			$pro_name = $pro->where('id='.$list[$cust_id]['prod_id'])->getField('name');
			$this->assign('pro_name',$pro_name);

			$this->display();
		}
		
		
		
	}
	
	/**权限信息修改**/
	public function edit(){
		$cust_id =	(int)I('param.cust_id'); 		
		$user_id = UID;
		$ucp = M('User_cust_prod'); //查询登录人拥有的客户权限
		$list = $ucp->table('erp_customer as cr,erp_user as ur,erp_user_cust_prod as ucp')
		->where("cr.id=ucp.cust_id AND ur.id=ucp.user_id AND ucp.cust_id=$cust_id AND ucp.user_id=$user_id")
		->getField("ucp.cust_id as cust_id,cr.`name` as `cname`,cr.contacts as contacts,cr.phone as phone,cr.fax as fax,cr.address as address,cr.remark as remark,ur.realname as realname,ucp.expired_time as expired_time,ucp.prod_id as prod_id");
		$this->assign('list',$list);	

		$pro = M('Product');
		$pro_list = $pro->where('status=1')->select();
		$this->assign('pro_list',$pro_list);		
		$this->display();
	}
	/**权限修改提交  接口**/
	public function update(){
		$cust_id = (int)I('param.cust_id');
	    if ($cust_id <= 0) $this->error('参数非法');		
		$newdata = array();
		$newdata['prod_id'] = I('param.prod_id');
		$newdata['expired_time'] = strtotime(I('param.expired_time'));	
		$model = M('User_cust_prod');
		$model->where('cust_id='.$cust_id)->data($newdata)->save();		
		$this->success('更新成功');
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
	
	/**权限删除**/
	public function del(){
		$cust_id = (int)I('param.cust_id');
// 		print_r($id);
// 		exit();
		$ucp = M("User_cust_prod"); 
        $ucp->where('cust_id='.$cust_id)->delete();
		$this->success('删除成功',U('Customer/lists'));
	}
			
}