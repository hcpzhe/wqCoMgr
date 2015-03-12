<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\OrderModel;
use Home\Model\Develop_orderModel;
use Home\Model\Seo_orderModel;
use Home\Model\ProductModel;
use Home\Model\CustomerModel;
use Home\Model\DepartModel;
use Home\Model\UserModel;
use Home\Model\Order_payModel;
use Home\Model\Order_renewalModel;
use Home\Model\Order_domainModel;
use Home\Model\User_depart_mgrModel;
use Home\Model\Order_departModel;
header("Content-Type:text/html;charset=utf-8");
class OrderController extends HomeBaseController{
/** 订单列表 */
	public function order_list(){		
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
		$pro = I('param.product');  
		$check = I('param.check');  //按照审核状态搜索
		$key = I('param.key');  //按照审核状态搜索
		/** 拼接where条件 */
		if(!empty($pro)){
			$where['pt.id']=$pro;
// 			$where=$where." AND pt.id=".$pro;
		}
		/*通过，待审核*/
		if(!empty($check) && $check==1){
			$where['erp_order.check']=1;
// 			$where=$where." AND oe.check=1";
		}else if(!empty($check) && $check==2){
			$where['erp_order.check']=0;
// 			$where=$where." AND oe.check=0";
		}		
		if(!empty($key)){
			$where['cr.name']=array('in',"like '%".$key."%'");
// 			$where=$where." AND ( cr.name like '%".$key."%' or ur.realname like '%".$key."%')";
		}
		$order=new OrderModel();
		$this->data=$order->orderlist($where);
		/*产品列表*/
		$product=new ProductModel();
		$this->pro_list=$product->p_list();
		$this->display();
	}
/** 待续费订单列表 (距订单到期时间三个月进入带续费期)*/
	public function renewal_order(){
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
		$pro = (int)I('param.product');
		$check = (int)I('param.check');
		$key = I('param.key');
		/** 拼接where条件 */
		if(!empty($pro)){
			$where=$where." AND pt.id=".$pro;
		}
		/*通过，待审核*/
		if(!empty($check) && $check==1){
			$where=$where." AND oe.check=1";
		}else if(!empty($check) && $check==2){
			$where=$where." AND oe.check=0";
		}		
		if(!empty($key)){
			$where=$where." AND ( cr.name like '%".$key."%' or ur.realname like '%".$key."%')";
		}
		$order=new OrderModel();
		$this->data=$order->renelist($where);
		/*产品列表*/
		$product=new ProductModel();
		$this->pro_list=$product->p_list();
		$this->display();
	}
	
/**   订单详情   */
	public function order_info(){
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
		$id = (int)I('cust_id');   //被选中要进行操作的id
		if (!IS_ROOT){ //非超管
			$User = new UserModel();
			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
			if(!in_array($id,$cust_id)){
				$this->error('您没有该公司的权限，不能进行相关操作！');
		    }
		}
			$id=$_GET['id'];
			/** 订单信息 */
			$order=new OrderModel();
			$this->orderinfo=$order->orderinfo($id);
			/** 订单续费记录 */
			$order_ren=new Order_renewalModel();
			$this->ren_list=$order_ren->o_list($id);
			/** 订单付款记录*/
			$order_pay=new Order_payModel();
			$this->pay_list=$order_pay->o_list($id);
			/** 订单所绑定域名 */
			$order_domain=new Order_domainModel();
			$this->doma=$order_domain->s_all($id);		
		    $this->display();
		
	}
/**  订单修改表单 */
	public function ord_u_form(){
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
		$id=$_GET['id'];
		/* 判断该订单权限是否在当前操作者所在的部门
		 * 1.根据订单id查询订单当前所在部门
		 * 2.根据当前登录者id查询当前登录者所在部门
		 * 3.对比两者是否一致
		 */
		$order_depart=new Order_departModel();
		$dep_id=$order_depart->field("depart_id")->where("order_id=$id and is_use=1")->find();
		
		$user=new UserModel();
		$dep_id1=$user->field("depart_id")->where("id=$uid")->find();

		if($dep_id['depart_id']!=$dep_id1["depart_id"]){
			$this->error("该订单已不再您所在的部门！");
		}
		
		/** 查询数据   */
		$order=new OrderModel();
		$this->orderinfo=$order->orderinfo($id);
		/*查询产品分类*/
		$product=new ProductModel();
		$this->p_list=$product->p_list();
		$this->display();
	}	
/**  修改订单 */
	public function up(){
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
		$id=$_GET['id'];
		$data['prod_id']=$_POST['pid'];
		$data['total_fees']=$_POST['money'];
		$data['expired_time']=strtotime($_POST['time']);
		$order=new OrderModel();
		$flag=$order->where("id=$id")->save($data);
		if($flag==1){ $this->success('保存成功！');}
		else{ $this->error('保存失败');}
	}	
/** 跳转到添加订单页面*/
	public function add_order_form(){/** 判断是否传出客户id */
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
		/** 接收客户id */
		$id = (int)I('id');	//被选中要进行操作的id
	    
		if(!empty($id)){
			if (!IS_ROOT){ //非超管
				$User = new UserModel();
				$cust_id=$User->user_auto();  //登录人拥有的客户权限id
				if(!in_array($id,$cust_id)){
					$this->error('您没有权限，不能进行此操作！');
				}
			}
			$customer=new CustomerModel();
			$this->cus=$customer->one($id);
		}
		/*查询产品分类*/
		$product=new ProductModel();
		$this->p_list=$product->p_list();
		/*查询系统 用户 */
		$user=new UserModel();
		$this->user_list=$user->alluser();
		//查询当前登录用户
		$dq_er = new UserModel();
		$id = UID;
		$dq_user = $dq_er->where('id='.$id)->find();
		$this->assign('dq_user',$dq_user);
		$this->display();
	}	
/** 添加订单   订单表添加一条记录，订单付款表添加一条预付款记录*/
	public function add_order(){
		$map['cust_id']=$_POST['cusid'];
		$map['total_fees']=$_POST['money'];
		$map['prod_id']=$_POST['proid'];
		$map['user_id']=$_POST['userid'];
 		$map['time_limit']=$_POST['time_limit'];
 		$day=$map['time_limit']*365;//获取服务年限
		$map['signed_time']=time();//获取当前日期
		$map['expired_time']=60*60*24*$day+$map['signed_time'];//获取订单到期日期
		$map['remark']=$_POST['remark'];
		// 开始事务
		mysql_query("start transaction");
		//订单表添加一条记录
		$order=new OrderModel();
		$flag=$order->add($map);
		//订单所在部门表中添加一条记录
		$order_depart=new Order_departController();
		$flag1=$order_depart->ad_reco($flag,12);
		//添加订单付款记录
		$map1['money']=$_POST['yfk'];
		$map1['order_id']=$flag;
		$map1['pay_time']=time();
		$map1['class']=1;
		$map1['user_id']= UID;
		$order_pay=new Order_payModel();
		$flag2=$order_pay->add($map1);
		if ($flag && $flag1 && $flag2){
			mysql_query("COMMIT");
			$this->redirect('Domain/add_domain',array('cust_id'=>$map['cust_id'],'order_id'=>$flag),1,'<div style="margin: 40px 0 20px;">订单添加成功，请添加域名！</div>');
		}else{
			$this->error('添加失败');
			mysql_query("ROLLBACK");
		}
	}	
/*
 * 审核订单
 * 如果为订单为网站，erp_develop_order增加一条记录
 * 如果为优化订单，erp_seo_order增加一条记录
 * 如果两者都不是不进行其他操作*/
	public function check_order(){
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
		$cid = (int)I('cust_id');   //被选中要进行操作的cust_id
		if (!IS_ROOT){ //非超管
			$User = new UserModel();
			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
			if(!in_array($cid,$cust_id)){
				$this->error('您没有该公司的权限，不能进行相关操作！');
			}
		}
		/*改变订单审核状态*/
		$id=$_GET['id'];
		/*改变审核状态操作*/
		$order=new OrderModel();
		$flag11=$order->where("id=$id")->setField("check","1");
		/*判断操作结果*/
		if($flag11==0){ $this->error('审核失败');}
		else { $this->success('审核成功');}
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
		if (!IS_ROOT){ //非超管
			$ids = (int)I('cust_id');   //被选中要进行操作的cust_id
// 			echo $ids;exit();
			$User = new UserModel();
			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
			if(!in_array($ids,$cust_id)){
				$this->error('您没有该公司的权限，不能进行相关操作！');
			}
	     }	
     	//检测订单是否已经被推送
     	$order=new OrderModel();
		$push_res=$order->field("push")->where("id=$id")->find();
		if($push_res['push']==1){
			$this->error('订单已经被推送！',U('Order/order_list'));
		}
		/** 查询订单信息  判断该订单是否通过审核 */
		$flag=$order->field('check')->where("id=$id")->find();
		if($flag['check']==0){ $this->error('订单未审核');}
		/** 查询所有 可推送的部门*/
		$depart=new DepartModel();
		$this->id=$id;
		$this->dp=$depart->alldep();
		$this->assign("cust_id",$_GET['cust_id']);
		$this->display();
		
	}
	/** 推送至下一个部门 */
	public function push($id){
		//所推送部门
		$dpid=$_POST['dp'];
		//所推送客户
		$cust_id=$_POST['cust_id'];
		//所推送订单id
		$or_id=$_POST['id'];
		//获取签单人员id
		$order=new OrderModel();
		$user_id=$order->where("id=$or_id")->getField("user_id");
		//获取签单人员所在部门
		$user=new UserModel();
		$dep_id=$user->where("id=$user_id")->getField("depart_id");
		//找到订单添加人所在部门的管理者 
		$udm=new User_depart_mgrModel();
		$userid=$udm->where("depart_id=$dep_id")->getField("user_id");
		$uid = UID;   //登陆用户				
		if ($userid != $uid){
			$this->error("没有推送权限");
		}
		/**
		 * 1.更改订单推送状态
		 * 2.根据推送的部门进行不同的操作
		 * 	 a.技术部：添加一条网站开发订单 ，更改订单所在部门
		 * 	 b.产品客服部：添加一条优化订单，更改订单所在部门
		 * 	 c.客服部：更改订单所在部门
		 */
		
		
		
		if($dpid==1){/*网站开发模型*/
			// 开始事务
			mysql_query("start transaction");
			//更改订单推送状态
			$data["push"]=1;
			$flag=$order->where("id=".$or_id)->save($data);
			//网站开发添加一条记录
			$dor=new Develop_orderModel();
			$flag1=$dor->add_do($or_id);
			//更改订单所在部门
			$order_dp=new Order_departController();
			$flag2=$order_dp->ad_reco($or_id, 1, 12);
			if ($flag && $flag1 && $flag2) {
				mysql_query("COMMIT");
				$this->success('推送成功',U('Order/order_list'));	
			}else{
				$this->error('推送失败');
				mysql_query("ROLLBACK");
			}
		}else if($dpid==10){/*优化模型*/
			// 开始事务
			mysql_query("start transaction");
			//更改订单推送状态
			$data["push"]=1;
			$flag=$order->where("id=".$or_id)->save($data);
			//添加一条优化订单
			$sor=new Seo_orderModel();
			$flag1=$sor->add_so($or_id);
			//更改订单所在部门
			$order_dp=new Order_departController();
			$flag2=$order_dp->ad_reco($or_id, 1, 12);
			if ($flag && $flag1 && $flag2) {
				mysql_query("COMMIT");
				$this->success('推送成功',U('Order/order_list'));
			}else{
				$this->error('推送失败');
				mysql_query("ROLLBACK");
			}
		}else {//网站客服
			// 开始事务
			mysql_query("start transaction");
			//更改订单推送状态
			$data["push"]=1;
			$flag=$order->where("id=".$or_id)->save($data);
			//更改订单所在部门
			$order_dp=new Order_departController();
			$flag1=$order_dp->ad_reco($or_id, 2, 12);
			if ($flag && $flag1) {
				mysql_query("COMMIT");
				$this->success('推送成功',U('Order/order_list'));
			}else{
				$this->error('推送失败');
				mysql_query("ROLLBACK");
			}
		}
	}
	/** 停止订单 */
	public function stop($id){
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
			$ids = (int)I('cust_id');   //被选中要进行操作的id
			$User = new UserModel();
			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
			if(!in_array($ids,$cust_id)){
				$this->error('您没有该公司的权限，不能进行相关操作！');
			}
		}
		$order=new OrderModel();
		$flag=$order->where("id=$id")->setField("status","0");
		if($flag==1){ $this->success('成功');}
		else{ $this->error('失败');}
	}
	/** 开始订单 */
	public function star($id){
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
			$ids = (int)I('cust_id');   //被选中要进行操作的id
			$User = new UserModel();
			$cust_id=$User->user_auto();  //登录人拥有的客户权限id
			if(!in_array($ids,$cust_id)){
				$this->error('您没有该公司的权限，不能进行相关操作！');
			}
		}
		$order=new OrderModel();
		$flag=$order->where("id=$id")->setField("status","1");
		if($flag==1){ $this->success('成功');}
		else{ $this->error('失败');}
	}
    /***订单添加 客户名称模糊检索***/
	public function search(){
		$name = I('param.name');    //输入的搜索信息
		//print_r($name);exit();
		$where['status'] = 1;
		if(!empty($name)){
			//公司名称模糊检索
			$where['name'] = array('like',"%$name%");
		}
		//获取登录者拥有的客户
		$User = new UserModel();
		$cus=$User->user_auto();
		$where['id']=array('in',$cus);
		
		$customer=new CustomerModel();
		$cus_list = $customer->where($where)->order('id desc')->select();
		$this->assign('cus_list',$cus_list);
		$this->display();
	}
	//推送至客服部订单
	function severs(){
 		$text = I('param.text');
 		$order=new OrderModel();
 		if(empty($text)){
 			$sql="SELECT eo.status as status,eo.sever_id  as sever_id,eo.id as o_id,eu.realname as realname,ec.`name` as name,eo.signed_time as stime,eo.expired_time as etime,eo.total_fees as money,ep.`name` as pro_name
FROM erp_order as eo,erp_user as eu,erp_customer as ec,erp_order_depart as eod,erp_product as ep
WHERE eo.user_id=eu.id and eo.cust_id=ec.id AND eod.order_id=eo.id AND ep.id=eo.prod_id
AND eo.status>=0 AND eod.is_use=1 AND eod.depart_id=2";
 		}else {
 			$sql="SELECT eo.status as status,eo.sever_id  as sever_id,eo.id as o_id,eu.realname as realname,ec.`name` as name,eo.signed_time as stime,eo.expired_time as etime,eo.total_fees as money,ep.`name` as pro_name
FROM erp_order as eo,erp_user as eu,erp_customer as ec,erp_order_depart as eod,erp_product as ep
WHERE eo.user_id=eu.id and eo.cust_id=ec.id AND eod.order_id=eo.id AND ep.id=eo.prod_id
AND eo.status>=0 AND eod.is_use=1 AND eod.depart_id=2 AND ec.`name` LIKE '%".$text."%'";
 		}
 		$order_severs=$order->query($sql);
 		$this->severs=$order_severs;
 		$this->display();
	}
	function distform(){
		//获取要分配订单id
		$this->order_id=$_GET['id'];
		//获取网站客服部所以人员
		$users=new UserModel();
		$sever=$users->where("depart_id=2")->select();
		$this->severs=$sever;
		$this->display();
	}
	function dist(){
		//获取订单id
		$oid=$_POST['oid'];
		$map['sever_id']=$_POST['user'];
		$order=new OrderModel();
		$flag=$order->where("id=$oid")->save($map);
		if($flag==1){
			$this->success('分配客服成功！',U('Order/severs'));
		}else {
			$this->error('分配客服失败！',U('Order/severs'));
		}
	}
}
