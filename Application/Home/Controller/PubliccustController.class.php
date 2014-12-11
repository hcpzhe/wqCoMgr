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
		$pub_cust = M("Public_customer");
		$list = $pub_cust->table('erp_customer as cr,erp_public_customer as epc')
		->where('cr.id=epc.cust_id')
		->getField("cr.id as id,cr.`name` as `name`,cr.contacts as contacts,cr.phone as phone,epc.public_time as public_time");
		$this->assign("list",$list);
		$this->display();		
	}
	//公海客户权限申请
	public function apply(){
		$cust_id = (int)I('cust_id');
		$user_id = (int)I('user_id'); 
		$cust=new CustomerModel();
		$cname=$cust->where("id=$cust_id")->getField("name"); 		
		$this->assign("cname",$cname);   //申请的公司名称
		$user=new UserModel();
		if ($user_id){	//从权限分配里申请  延期		
			$realname=$user->where("id=$user_id")->getField("realname");
			$this->assign("user_id",$user_id);
			$this->assign("realname",$realname);   //权限人
			$class="delay";
			$this->assign("class",$class);
			//print_r($realname);exit();
		}else {
			//从公海客户列表中申请  新申请
			$class="new";
			$this->assign("class",$class);
		}
		$user_list=$user->select();
		$this->assign("user_list",$user_list);
		$this->assign("cust_id",$cust_id);  //公司id
		
		$this->display();
	}
	public function apply_insert(){
		$data["cust_id"] = (int)I('cust_id');
		$data["user_id"] = (int)I('user_id');
		$class = I('param.class');
		if ($class == "new"){  //新申请
			$data["class"] = $class;
			$data["org_expired_time"] = time();
		}else {  //延期客户
			$data["class"] = $class;
			$ucp=new User_cust_prodModel();
			$data["org_expired_time"] = $ucp->where("cust_id=".$data["cust_id"])->getField("expired_time");   //原权限过期时间
		}				
		$data["apply_days"] = (int)I('param.apply_days');
		$data["new_expired_time"] = $data["org_expired_time"] + $data["apply_days"] * 24 * 60 * 60;  //新过期时间
		$data["apply_time"] = time(); //申请时间
		$uca = M("User_cust_apply");
		$flag=$uca->add($data);
		if ($flag){
			if ($class == "new"){
				//新申请且申请成功，公海客户删除
				$pub=M('Public_customer');					
				$pub->where("cust_id=".$data["cust_id"])->delete();
			}
			$this->success('申请成功，等待审核',U('Publiccust/uca_lists'));
		}else {
			$this->error('申请失败');
		}
		
	}
	//员工客户权限申请列表   需审核
	public function uca_lists() {
		if (!IS_ROOT){ //非超管
			$this->error('您没有权限，不能进行此操作！');
		}
		$uca = M("User_cust_apply");
		$list = $uca->table("erp_customer as ec,erp_user as eu,erp_user_cust_apply as ea")
		->where("ea.user_id=eu.id AND ea.cust_id=ec.id AND ea.check=0")
		->getField("ea.id as id,ea.cust_id as cust_id,ea.user_id as user_id,ec.name as cname,eu.realname as realname,ea.apply_time as apply_time,ea.`check` as `check`,ea.new_expired_time as new_expired_time,ea.class as class");
		$this->assign("list",$list);
		$this->display();
	}
	//权限审核
	public function check(){
		$id = (int)I('id');
		$cust_id = (int)I('cust_id');
		$user_id = (int)I('user_id');
		$class = I('class');          //权限申请类型
		$uca = M("User_cust_apply");
		$new_expired_time=$uca->where("id=$id")->getField("new_expired_time");  //新过期时间
		$ucp = M("User_cust_prod");
		if ($class == "delay"){
			//申请延期						
			$ucp-> where("cust_id=$cust_id")->setField('expired_time',$new_expired_time);
		}else {
			//新申请
            $arr['user_id'] = $user_id;
            $arr['cust_id'] = $cust_id;
            $arr['expired_time'] = $new_expired_time;
			$ucp->add($arr);
		}
		$data['check_time']=time();  //审核时间
		$data['check_user']= UID;
		$data['check']=1;
		$uca->where("id=$id")->save($data);
		if (false === $uca->create($data)) $this->error($uca->getError());
		if (false === $uca->where('id='.$id)->save()) $this->error('审核失败');
		$this->success('审核成功',U('Publiccust/uca_lists'));		
	}		
}