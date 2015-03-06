<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Seo_orderModel;
use Home\Model\Seo_userModel;
use Home\Model\UserModel;
use Home\Model\OrderModel;
use Home\Model\Seo_order_commentModel;
use Home\Model\DepartModel;
class SeoordController extends HomeBaseController{
	/*优化订单*/
	public function seo_list(){
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
			$where=$where." AND eso.check=1";
		}else if(!empty($check) && $check==2){ $where=$where." AND eso.check=0";}		
		if(!empty($key)){
			$where=$where." AND ( ec.name like '%".$key."%' or ec.contacts like '%".$key."%' or eu.realname like '%".$key."%')";
		}
		$dep=new Seo_orderModel();
		$this->data=$dep->seo_list($where);
		$this->display();
	}
	/**网站开发订单详细页面，订单详细信息，订单参与人员，订单沟通记录 */
	public function seo_info(){
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
// 			$id=$_GET['cust_id'];  //选中的公司id
// 			$User = new UserModel();
// 			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
// 			if(!in_array($id,$cust_id)){
// 				$this->error('您没有该公司的权限，不能进行相关操作！');
// 			}
// 		}
		/** 详细信息 */
		$seo=new Seo_orderModel();
		$this->data=$seo->seoinfo($oid);
		/*开发人员*/
		$dep_user=new Seo_userModel();
		$this->users=$dep_user->s_dist($oid);
		/*订单沟通记录*/
		$doc=new Seo_order_commentModel();
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
// 			$id=$_GET['cust_id'];  //选中的公司id
// 			$User = new UserModel();
// 			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
// 			if(!in_array($id,$cust_id)){
// 				$this->error('您没有该公司的权限，不能进行相关操作！');
// 			}
// 		}
		/*查询所有优化人员*/
		$depart = M('Depart');
		$dep_id = $depart->where("name='产品客服部'")->getField('id'); //产品客服部所在id
		$user=new UserModel();
		$this->users=$user->tech_list($dep_id);
		/*查询该订单已经分配的人员*/
		$se_user=new Seo_userModel();
		$this->data=$se_user->s_dist($oid);
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
// 			$ids=$_GET['cust_id'];  //选中的公司id
// 			$User = new UserModel();
// 			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
// 			if(!in_array($ids,$cust_id)){
// 				$this->error('您没有该公司的权限，不能进行相关操作！');
// 			}
// 		}
		//检测订单是否已经被推送
		$seo_dev=new  Seo_orderModel();
		$push_res=$seo_dev->field("push")->where("order_id=$id")->find();
		if($push_res['push']==1){
			$this->error('订单已经被推送！',U('seoord/seo_list'));
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
		//所要推送到的部门
		$dp_id=$_POST['dp'];
		//所要推送的订单id
		$id=$_POST['id'];
		
		$seoer_dev=new Seo_orderModel();
		//更改订单推送状态
		$data["push"]=1;
		$flag=$seoer_dev->where("order_id=".$id)->save($data);
		if($flag==1){
			$order_dp=new Order_departController();
			$order_dp->ad_reco($id, $dp_id, 10);
			$this->success("推送成功！",U('seoord/seo_list'));
		}else { $this->error('推送失败！');}
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
		$map['order_id']=$_POST['o_id'];
		$map['user_id']=UID;
		$map['post_time']=time();
		$map['content']=$_POST['content'];
		$seo_order_comment=new Seo_order_commentModel();
		$flag=$seo_order_comment->add($map);
		if($flag==0){
			$this->error('添加失败');
		}else{ $this->success('添加成功');}
	}	
}