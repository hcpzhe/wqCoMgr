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
		$id =	(int)I('param.cust_id'); 		
		if (!IS_ROOT){ //非超管
			$User = new UserModel();
			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
			if(!in_array($id,$cust_id)){
				$this->error('您没有该公司的权限，不能进行相关操作！');
			}
		}
		$cust = M('Customer');   
		$cust_list = $cust->where("status=1 AND id=$id")->find(); //客户
		$user_id = $cust_list['user_id']; //客户信息录入者id
		$this->assign('user_id',$cust_list['user_id']);  
		
		$this->assign('cust_list',$cust_list);		
		$user = M('User');
		$realname = $user->where("status=1 AND id=$user_id")->getField('realname');   //权限人优先选择 客户信息录入者
		$this->assign('realname',$realname);
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
		if (empty($data['expired_time'])){
			$data['expired_time'] = 0;			
		}
		$model = M('User_cust_prod');			
		$model->add($data);
		$this->success('添加成功',U('Customer/lists'));
	}
		
	/**客户权限列表     **/
	public function lists() {	
		$id = (int)I('cust_id');   //被选中要进行操作的id		
		if (!IS_ROOT){ //非超管
			$User = new UserModel();
			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
			if(!in_array($id,$cust_id)){
				$this->error('您没有该公司的权限，不能进行相关操作！');
			}
		}
		    $customer = M('Customer');   //客户信息
		    $custlist = $customer->table('erp_customer as cr,erp_user as ur')
		    ->where("cr.user_id=ur.id AND cr.id=$id")
		    ->getField("cr.id as id,cr.`name` as `cname`,cr.contacts as contacts,cr.phone as phone,cr.fax as fax,cr.address as address,cr.remark as remark,ur.realname as realname,cr.status as status,cr.add_time as add_time");
		    $this->assign('custlist',$custlist);
		    
			$ucp = M('User_cust_prod');  //权限信息
			$user_id = UID;		
			$list = $ucp->table('erp_customer as cr,erp_user as ur,erp_user_cust_prod as ucp')
			->where("cr.id=ucp.cust_id AND ur.id=ucp.user_id AND ucp.cust_id=$id")
			->getField("ucp.cust_id as id,ur.id as uid,ur.realname as realname,ucp.expired_time as expired_time,ucp.prod_id as prod_id");
			$time=time();			
			$this->assign("user_id",$list[$id]['uid']);   //权限拥有者id
			$this->assign('time',$time);
			$this->assign('list',$list);	
			$this->assign('cust_id',$id);
			
			$is=$ucp->where("cust_id=$id AND (expired_time>$time OR expired_time=0)")->select();
			$this->assign("is",$is);  //判断权限是否过期
			$this->display();		
	}
	
	/**权限信息修改**/
	public function edit(){
		$id =	(int)I('param.cust_id');	//要进行操作的客户id
	    if (!IS_ROOT){ //非超管
			$User = new UserModel();
			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
			if(!in_array($id,$cust_id)){
				$this->error('您没有该公司的权限，不能进行相关操作！');
			}
		}
		$ucp = M('User_cust_prod'); //查询登录人拥有的客户权限
		$list = $ucp->table('erp_customer as cr,erp_user as ur,erp_user_cust_prod as ucp')
		->where("cr.id=ucp.cust_id AND ur.id=ucp.user_id AND ucp.cust_id=$id")
		->getField("ucp.cust_id as cust_id,cr.`name` as `cname`,cr.contacts as contacts,cr.phone as phone,cr.fax as fax,cr.address as address,cr.remark as remark,ur.id as uid,ur.realname as realname,ucp.expired_time as expired_time,ucp.prod_id as prod_id");
		$this->assign('list',$list);	
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
		if (empty($newdata['expired_time'])){
			$newdata['expired_time'] = 0;
		}
		$model = M('User_cust_prod');
		$flag=$model->where('cust_id='.$cust_id)->data($newdata)->save();		
		if ($flag==1){
			$this->success('修改成功',U('Customer/lists'));
		}else {
			$this->error('修改失败');
		}
	}
	/**客户权限放入公海**/
	public function del(){
		$id = (int)I('param.cust_id');
		if (!IS_ROOT){ //非超管
			$User = new UserModel();
			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
			if(!in_array($id,$cust_id)){
				$this->error('您没有该公司的权限，不能进行相关操作！');
			}
		}
		$ucp = M("User_cust_prod"); 
        $ucp->where('cust_id='.$id)->delete();  //删除客户权限

        $pcu = M("Public_customer"); //把删除客户权限的客户放入公海
        $data['cust_id'] = $id;
        $data['public_time']=time();
        $pcu->add($data);
        $this->success('删除成功',U('Customer/lists'));
		
	}
			
}