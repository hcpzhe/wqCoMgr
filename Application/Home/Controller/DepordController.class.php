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
		/*获取搜索条件*/
		$check=$_POST['check'];
		$key=$_POST['key'];
		/** 拼接where条件 */
		if($check==1){
			$where=$where." AND edo.check=1";
		}else if($check==2){ $where=$where." AND edo.check=0";}
		
		if(!empty($key)){
			$where=$where." AND ( ec.name like '%".$key."%' or ec.contacts like '%".$key."%' or eu.realname like '%".$key."%')";
		}
		$dep=new Develop_orderModel();
		$this->data=$dep->dor_list($where);
		$this->display();
	}
	/*增加一条开发记录*/
	public function add_od(){

	}
	/**网站开发订单详细页面，订单详细信息，订单参与人员，订单沟通记录 */
	public function dep_info(){
		$oid=$_GET['id'];
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
		$oid=$_GET['id'];
		/*查询技术部所有人员*/
		$user=new UserModel();
		$this->users=$user->tech_list(4);
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
		/** 查询订单信息  判断该订单是否通过审核 */
// 		$order=new OrderModel();
// 		$flag=$order->field('check')->where("id=$id")->find();
// 		if($flag['check']==0){ $this->error('订单未审核');}
		/** 查询所有部门 */
		$depart=new DepartModel();
		$this->id=$id;
		$this->dp=$depart->alldepart();
		$this->display();
	}
	/** 推送至下一个部门 */
	public function push($id){
		$dp_id=$_POST['dp'];
		/**技术 */
		if($dp_id==1){
			/*网站开发模型*/
			$dor=new Develop_orderModel();
			$flag1=$dor->add_do($id);
			if($flag1==1){ 	$this->success('推送成功');}
			else{ $this->error('推送失败');}
		}else if($dp_id==2){/** 优化 */
			/*优化模型*/
			$sor=new Seo_orderModel();
			$flag2=$sor->add_so($id);
			if($flag2==1){ $this->success('推送成功');}
			else{ $this->error('推送失败');}
		}else if($dp_id==11){/** 客服 */
				
		}else{ $this->error('禁止向该部门推送');}
	}	
}