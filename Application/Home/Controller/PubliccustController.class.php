<?php
namespace Home\Controller;
use Think\Page;
use Common\Controller\HomeBaseController;
use Home\Model\CustomerModel;
use Think\Model;
use Home\Model\UserModel;
use Home\Model\User_cust_prodModel;

header("Content-Type:text/html;charset=utf-8");
class PubliccustController extends HomeBaseController {
   
		
	/**公海客户列表**/
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
		$pub_cust = M("Public_customer");
		$list = $pub_cust->table('erp_customer as cr,erp_public_customer as epc')
		->where('cr.id=epc.cust_id and epc.status=1')
		->getField("cr.id as id,cr.`name` as `name`,cr.contacts as contacts,cr.phone as phone,epc.public_time as public_time");
		$this->assign("list",$list);
		$this->display();		
	}
	//公海客户权限申请
	public function apply(){
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
		//客户id
		$cust_id = (int)I('cust_id');
		//系统用户
		$user_id = $uid;
		//根据客户id获取客户名称
		$cust=new CustomerModel();
		$cname=$cust->where("id=$cust_id")->getField("name"); 		
		//客户名称赋值
		$this->assign("cname",$cname);   //申请的公司名称
		//获取当前操作用户名称
		$user=new UserModel();
		$realname=$user->where("id=$user_id")->getField("realname");
		//当前操作用户id名称赋值
		$this->assign("user_id",$user_id);
		$this->assign("realname",$realname);  
		//获取申请类型
		$this->class=$_GET['type'];
		//所有签单人员
		$this->assign("user_list",$user->all_saller());
		//公司id
		$this->assign("cust_id",$cust_id);  
		$this->display();
	}
	public function apply_insert(){
		/*--------wcd权限判断---------*/
		//获取当前模块名称
		$contro=CONTROLLER_NAME;
		//获取当前操作名称
		$actio=ACTION_NAME;
		//获取当前访问规则
		$cd_rule="Home/".$contro."/".$actio;//echo $cd_rule;exit();
		$uid = UID;
		if($this::cd_rule_check($uid,$cd_rule)!=1){
			$this->error('没有权限禁止操作！！！');
		}
		/*--------wcd权限判断---------*/		
		$data["cust_id"] = (int)I('cust_id');
		$data["user_id"] = (int)I('user_id');
		$class = I('param.class');
		$data['class']=$class;
		//根据申请类型获取原过期时间
		if ($class == "new"){  //新申请
			$data["org_expired_time"] = time();
		}else {  //延期客户
			$ucp=new User_cust_prodModel();
			$data["org_expired_time"] = $ucp->where("cust_id=".$data["cust_id"])->getField("expired_time");   //原权限过期时间
		}				
		//获取新的过期时间
		$data["apply_days"] = (int)I('param.apply_days');
		$data["new_expired_time"] = $data["org_expired_time"] + $data["apply_days"] * 24 * 60 * 60;  
		//申请时间
		$data["apply_time"] = time(); 
		if ($class == "new"){					
			// 开始事务
			mysql_query("start transaction");
			//公海客户权限申请表添加数据
			$uca = M("User_cust_apply");
			$flag=$uca->add($data);
			//更改公海客户状态为已申请
			$pub=M('Public_customer');					
			$flag1=$pub->where("cust_id=".$data["cust_id"])->setField("status",0);
			if ($flag && $flag1) {
				mysql_query("COMMIT");
				$this->success('申请成功，等待审核',U('Publiccust/lists'));
			}else{
				$this->error('申请失败');
				mysql_query("ROLLBACK");
			}
		}else {
			//公海客户权限申请表添加数据
			$uca = M("User_cust_apply");
			$flag=$uca->add($data);
			if ($flag) {
				$this->success('申请成功，等待审核',U('Publiccust/lists'));
			}else{
				$this->error('申请失败');
			}
		}
	}
	//员工客户权限申请列表   需审核
	public function uca_lists() {
// 		if (!IS_ROOT){ //非超管
// 			$this->error('您没有权限，不能进行此操作！');
// 		}
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
		$uca = M("User_cust_apply");
		$list = $uca->table("erp_customer as ec,erp_user as eu,erp_user_cust_apply as ea")
		->where("ea.user_id=eu.id AND ea.cust_id=ec.id AND ea.check=0")
		->getField("ea.id as id,ea.cust_id as cust_id,ea.user_id as user_id,ec.name as cname,eu.realname as realname,ea.apply_time as apply_time,ea.`check` as `check`,ea.new_expired_time as new_expired_time,ea.class as class");
		$this->assign("list",$list);
		$this->display();
	}
	//同意审核
	public function agree(){
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
		//申请id
		$id = (int)I('id');
		//客户id
		$cust_id = (int)I('cust_id');
		//申请者id
		$user_id = (int)I('user_id');
		//申请了类型
		$class = I('class');       
		//获取新的权限过期时间
		$uca = M("User_cust_apply");
		$new_expired_time=$uca->where("id=$id")->getField("new_expired_time");  //新过期时间
		//根据不同的申请类型
		if($class='new'){
			// 开始事务
			mysql_query("start transaction");
			//更改公海客户申请列表该条记录的状态
			//审核时间
			$data['check_time']=time();
			//审核人
			$data['check_user']= UID;
			//需要更改的审核状态
			$data['check']=1;
			$uca = M("User_cust_apply");
			$res=$uca->where("id=$id")->save($data);
			//删除公海里面这条客户信息
			$public=M('Public_customer');
			$res1=$public->where("cust_id=$cust_id")->delete();
			//在用户产品权限表中添加一条记录
			$map['user_id']=$user_id;
			$map['cust_id']=$cust_id;
			$map['expired_time']=$new_expired_time;
			$ucp=M('User_cust_prod');
			$res2=$ucp->add($map);
			if ($res && $res1 && $res2) {
				mysql_query("COMMIT");
				$this->success('审核成功！',U('publiccust/lists'));
			}else{
				$this->error('审核失败！',U('publiccust/lists'));
				mysql_query("ROLLBACK");
			}	
		}else {
			// 开始事务
			mysql_query("start transaction");
			//更改公海客户申请列表该条记录的状态
			//审核时间
			$data['check_time']=time();
			//审核人
			$data['check_user']= UID;
			//需要更改的审核状态
			$data['check']=1;
			$uca = M("User_cust_apply");
			$res=$uca->where("id=$id")->save($data);
			//删除公海里面这条客户信息
			$public=M('Public_customer');
			$res1=$public->where("cust_id=$cust_id")->delete();
			//在用户产品权限表中添加一条记录
			$map['expired_time']=$new_expired_time;
			$ucp=M('User_cust_prod');
			$res2=$ucp->where("user_id=$user_id and cust_id=$cust_id")->save($map);
			if ($res && $res1 && $res2) {
				mysql_query("COMMIT");
				$this->success('审核成功！',U('publiccust/lists'));
			}else{
				$this->error('审核失败！',U('publiccust/lists'));
				mysql_query("ROLLBACK");
			}
		}
	}		
	//拒绝申请
	function refuse(){
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
		//申请id
		$id = (int)I('id');
		//客户id
		$cust_id = (int)I('cust_id');
		//申请者id
		$user_id = (int)I('user_id');
		// 开始事务
		mysql_query("start transaction");
		//更改公海客户申请列表该条记录的状态
		//审核时间
		$data['check_time']=time(); 
		//审核人
		$data['check_user']= UID;
		//需要更改的审核状态
		$data['check']=-1;
		$uca = M("User_cust_apply");
		$res=$uca->where("id=$id")->save($data);
		//更改公海里面该条客户信息为显示
		$public=M('Public_customer');
		$res1=$public->where("cust_id=$cust_id")->setField('status',1);
		if ($res && $res1) {
			mysql_query("COMMIT");
			$this->success('审核成功！',U('publiccust/lists'));
		}else{
			$this->error('审核失败！',U('publiccust/lists'));
			mysql_query("ROLLBACK");
		}
	}
}