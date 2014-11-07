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
		$cust_id =	(int)I('param.cust_id'); 	
		$cust = M('Customer');   
		$cust_list = $cust->where('status=1')->select(); //客户
		$this->assign('cust_list',$cust_list);
		
		$user = M('User');
		$user_list=$user->where('status=1')->select();  //权限人
		$this->assign('user_list',$user_list);		
		$this->display();			
	}	
	/***新增的客户接口***/
	public function insert(){		
		$data['user_id']  = (int)I('param.user_id');			
		$data['cust_id'] = (int)I('param.cust_id');		
		//$data['prod_id'] = (int)I('param.prod_id');
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
			$this->success('您没有该公司的权限！',U('Usercustprod/add'));
		}else {
			
			$list = $ucp->table('erp_customer as cr,erp_user as ur,erp_user_cust_prod as ucp')
			->where("cr.id=ucp.cust_id AND ur.id=ucp.user_id AND ucp.cust_id=$cust_id")
			->getField("ucp.cust_id as id,cr.`name` as `cname`,cr.contacts as contacts,cr.phone as phone,cr.fax as fax,cr.address as address,cr.remark as remark,ur.realname as realname,ucp.expired_time as expired_time,ucp.prod_id as prod_id");
			$this->assign('list',$list);

			$user = M('User');
			$user_list = $user->table('erp_depart as de,erp_user as ur')
			->where("de.id=ur.depart_id AND ur.id=$user_id")
			->select();
			$this->assign('user_list',$user_list);
			$this->assign('cust_id',$cust_id);
			$this->display();
		}
		
		
		
	}
	
	/**权限信息修改**/
	public function edit(){
		$cust_id =	(int)I('param.cust_id');
		
		//$user_id = UID;
		$ucp = M('User_cust_prod'); //查询登录人拥有的客户权限
		$list = $ucp->table('erp_customer as cr,erp_user as ur,erp_user_cust_prod as ucp')
		->where("cr.id=ucp.cust_id AND ur.id=ucp.user_id AND ucp.cust_id=$cust_id")
		->getField("ucp.cust_id as cust_id,cr.`name` as `cname`,cr.contacts as contacts,cr.phone as phone,cr.fax as fax,cr.address as address,cr.remark as remark,ur.realname as realname,ucp.expired_time as expired_time,ucp.prod_id as prod_id");
		$this->assign('list',$list);	
		//print_r($list);exit();
		$user = M('User');
		$user_list = $user->where('status=1')->select();
		$this->assign('user_list',$user_list);		
		$this->display();
	}
	/**权限修改提交  接口**/
	public function update(){
		$cust_id = (int)I('param.cust_id');
	    if ($cust_id <= 0) $this->error('参数非法');		
		$newdata = array();
		$newdata['user_id'] = I('param.user_id');
		$newdata['expired_time'] = strtotime(I('param.expired_time'));	
		$model = M('User_cust_prod');
		$model->where('cust_id='.$cust_id)->data($newdata)->save();		
		$this->success('更新成功',U('Customer/lists'));
	}
	/**权限删除**/
	public function del(){
		$cust_id = (int)I('param.cust_id');
		$ucp = M("User_cust_prod"); 
        $ucp->where('cust_id='.$cust_id)->delete();
		$this->success('删除成功',U('Customer/lists'));
	}
			
}