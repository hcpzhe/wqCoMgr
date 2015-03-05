<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Develop_orderModel;
use Home\Model\UserModel;
use Home\Model\Develop_userModel;
use Home\Model\OrderModel;
use Home\Model\Develop_order_commentModel;
use Home\Model\DepartModel;
class DepordController extends HomeBaseController{
	/*网站开发订单列表*/
	public function dep_list(){
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
		/*获取搜索条件*/
		$check = (int)I('param.check'); 
		$key = I('param.key');
		/** 拼接where条件 */
		if(!empty($check) && $check==1){
			$where=$where." AND edo.check=1";
		}else if(!empty($check) && $check==2){ $where=$where." AND edo.check=0";}		
		if(!empty($key)){
			$where=$where." AND ( ec.name like '%".$key."%' or ec.contacts like '%".$key."%' or eu.realname like '%".$key."%')";
		}
		$dep=new Develop_orderModel();
		$this->data=$dep->dor_list($where);
		$this->display();
	}
	/*增加一条开发沟通记录*/
	public function ad_record(){
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
		$map['order_id']=$_POST['oid'];
 		$map['user_id']=UID;
		$map['post_time']=time();
		$map['content']=$_POST['content'];
		$map['pace']=$_POST['pace'];
		$develop_order_comment=new Develop_order_commentModel();
		$flag=$develop_order_comment->add($map);
		if($flag==0){
			$this->error('添加失败');
		}else{ $this->success('添加成功');}
	}
	/**网站开发订单详细页面，订单详细信息，订单参与人员，订单沟通记录 */
	public function dep_info(){
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
		$oid=$_GET['id'];
// 		if (!IS_ROOT){ //非超管
// 			$id=$_GET['cust_id'];  //选中的客户id
// 			$User = new UserModel();
// 			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
// 			if(!in_array($id,$cust_id)){
// 				$this->error('您没有该公司的权限，不能进行相关操作！');
// 			}
// 		}
		/** 详细信息 */
		$dep=new Develop_orderModel();
		$this->data=$dep->depinfo($oid);	
		/*开发人员*/
		$dep_user=new Develop_userModel();
		$this->users=$dep_user->s_dist($oid);
		/*订单沟通记录*/
		$doc=new Develop_order_commentModel();
		$this->conments=$doc->doc_list($oid);
		$this->display();
	}
	/*跳转到分单页面*/
	public function dist(){
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
		$oid=$_GET['id'];
// 		if (!IS_ROOT){ //非超管
// 			$id=$_GET['cust_id'];  //选中的客户id
// 			$User = new UserModel();
// 		    $cust_id=$User->user_auto();  //登录人拥有的客户权限id
// 			if(!in_array($id,$cust_id)){
// 				$this->error('您没有该公司的权限，不能进行相关操作！');
// 			}
// 		}
		/*查询技术部所有人员*/
		$depart = M('Depart');
		$dep_id = $depart->where("name='技术部'")->getField('id'); //技术部所在id	
		$user=new UserModel();
		$this->users=$user->tech_list($dep_id);
		/*查询该订单已经分配的人员*/
		$de_user=new Develop_userModel();
		$this->data=$de_user->s_dist($oid);
		/*查询订单名称*/
		$order=new OrderModel();
		$this->cname=$order->s_cname($oid);
		
		$this->id=$oid;
		$this->display();
	}	
	/** 推送订单至下一个部门      表单 */
	public function push_form($id){
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
		/** 查询订单信息  判断该订单是否通过审核 */
		$order=new OrderModel();
		$flag=$order->field('check')->where("id=$id")->find();
		if($flag['check']==0){ $this->error('订单未审核');}
	
// 		if (!IS_ROOT){ //非超管
// 			$id=$_GET['cust_id'];  //选中的客户id
// 			$User = new UserModel();
// 		    $cust_id=$User->user_auto();  //登录人拥有的客户权限id
// 			if(!in_array($id,$cust_id)){
// 				$this->error('您没有该公司的权限，不能进行相关操作！');
// 			}
// 		}
		//检测订单是否已经被推送
		$order_dev=new Develop_orderModel();
		$push_res=$order_dev->field("push")->where("order_id=$id")->find();
		if($push_res['push']==1){
			$this->error('订单已经被推送！',U('Depord/dep_list'));
		}
		/** 查询所有部门 */
		$depart=new DepartModel();
		$this->id=$id;
		$this->dp=$depart->alldep();
		$this->assign("cust_id",$_GET['cust_id']);
		$this->display();
	}
	/** 推送至下一个部门 */
	public function push($id){
		$dp_id=$_POST['dp'];
		$order_dev=new Develop_orderModel();
		//更改订单推送状态
		$data["push"]=1;
		$order_dev->where("id=".$id)->save($data);
		/**技术 */
		if($dp_id==1){
			/*网站开发模型*/
			$dor=new Develop_orderModel();
			$flag1=$dor->add_do($id);
			if($flag1==1){ 	
				$order_dp=new Order_departController();
				$order_dp->ad_reco($or_id, 1, 2);
				$this->success('推送成功');
			}
			else{ $this->error('推送失败');}
		}else if($dp_id==10){/** 优化 */
			/*优化模型*/
			$sor=new Seo_orderModel();
			$flag2=$sor->add_so($id);
			if($flag2==1){ $this->success('推送成功');}
			else{ $this->error('推送失败');}
		}else if($dp_id==11){/** 客服 */
				
		}else{ $this->error('禁止向该部门推送');}
	}	
}