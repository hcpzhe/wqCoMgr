<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\DomainModel;
use Think\Page;
use Home\Model\Order_domainModel;
use Home\Model\UserModel;

header("Content-Type:text/html;charset=utf-8");
class DomainController extends HomeBaseController{
	/*域名庫*/
	public function domain_list($domain=null, $tpl=null){
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
		$map=array();
		$model=new DomainModel();
		$id = (int)I('param.id');
		$check = (int)I('param.check');  //按照审核状态搜索
		$status = (int)I('param.status');  //按照域名状态搜索
		//$domain = (int)I('param.domain');
		if (!empty($check) && $check == 1){
			$map['check'] = 1; //审核通过
		}elseif (!empty($check) && $check == 2){
			$map['check'] = 0; //待审
		}
		if (!empty($status) && $status == 2){
			$map['status'] = 0; //域名禁用
		}elseif (!empty($status) && $status == 3){
			$map['status'] = -1; //域名删除
		}else{
			$map['status'] = 1; //域名正常
		}
		
		if ($id>0) $map['id'] = $id;
		if(isset($domain)){
			$map['domain']   =   array('like', '%'.$domain.'%');
		}
		$count=$model->where($map)->count();       // 查询满足要求的总记录数
		$Page       = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(10)
		$show       = $Page->show();// 分页显示输出
		$domain_list = $model->where($map)->limit($Page->firstRow.','.$Page->listRows)->order('expired_time')->select();
		$this->assign('domain_list',$domain_list);
		$this->assign('page',$show);   //分页显示
		$this->assign('domain', $domain);           //用于搜索条件的显示
		if (isset($tpl)) $this->display($tpl);
		else $this->display();
	}
	/*添加域名*/
	public function add_domain(){
		$id = (int)I('param.cust_id');  //被选中要进行操作的id
		$order_id = I('param.order_id');
		$domain = M('Customer');		
		//查询客户信息的审核状态
		//客户id
		$this->assign('cust_id',$id);
		//订单id
		$this->assign('order_id',$order_id);
		$this->display();			
	}	
	/***添加域名时 域名的模糊检索***/
	public function search($domain=null){
		$domain = I('domain');
		if(!empty($domain)){
			$Form = M("Domain");
			$map['domain']   =   array('like', '%'.$domain.'%');
			$count      = $Form->where($map)->count();// 查询满足要求的总记录数
			$Page       = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(10)
			$show       = $Page->show();// 分页显示输出
			$list = $Form->where($map)->order('id desc')->select();
			if (!empty($list)){
				$this->assign('page',$show);// 赋值分页输出
				$this->assign('list',$list);
				$this->display();
			}else{
				echo "域名不存在，可以添加！";
			}
		}	
	}
	
	/**域名添加   提交接口**/
	public function insert(){	
		//客户id
		$data['cust_id'] = (int)I('cust_id');
		//域名名称
		$data['domain'] =  I('param.domain');
		//服务商
		$data['service'] =  I('param.service');
		//域名拥有者
		$data['doamin_user'] =  I('param.doamin_user');
		//注册时间
		$data['reg_time'] = time();
		//使用年限
		$data['year_num'] = I('param.year');   
		//域名到期时间计算
		$data['expired_time'] = $data['reg_time'] + $data['year_num']*60*60*24*365; 
		//订单id
		$or_id=I('param.order_id');
		$model = new DomainModel();
		//根据添加域名的类型操作1.根据客户直接添加，2，根据订单添加
		if($or_id){
			// 开始事务
			mysql_query("start transaction");
// 			域名库添加一条记录，标注属于那个客户
			$flag = $model->data($data)->add();
// 			订单域名关系表添加一条数据
			$map['order_id']=$or_id;
			$map['domain_id']= $flag;
			$Order_domain=new Order_domainModel();
			$flag1=$Order_domain->add($map);
			if($flag && $flag1) {
				mysql_query("COMMIT");
				$this->success('添加成功！',U('Domain/domain_list'));
			}else{
				$this->error('添加失败');
				mysql_query("ROLLBACK");
			}
		}else {		
// 			域名库添加一条记录，标注属于那个客户
			$flag = $model->data($data)->add();
			if($flag==0){ $this->error('添加失败');}
			else { $this->success('添加成功！',U('Domain/domain_list'));}
		}
	}
	/**域名详细信息**/
	public function domain_detailed(){
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
		$id = (int)I('id');
		$domain = M('Domain');
		//查询域名过期时间		
		$expired_time = $domain->where('id='.$id)->getField('expired_time');
		if ($expired_time < time()){
			$domain->where('id='.$id)->setField('status','0');     // 过期域名的状态为 禁用
		}else {
			$domain->where('id='.$id)->setField('status','1');
		}		
		 //获取域名详细信息
		$domain_list = $domain->table('erp_customer as cr,erp_domain as dom')
		->where("cr.id=dom.cust_id AND dom.id=$id")
		->getField("dom.id as id,cr.id as cust_id,cr.`name` as `name`,dom.domain as domain,dom.service as service,dom.reg_time as reg_time,dom.expired_time as expired_time,dom.`check` as `check`,dom.check_time as check_time,dom.`status` as `status`,dom.doamin_user");
       
        $this->assign('cust_id',$domain_list[$id]['cust_id']);  //公司id
        $this->assign('id',$domain_list[$id]['id']);  //公司域名所对应的id
		$this->assign('domain_list',$domain_list);
		$this->display();
	}
	
	/**域名信息修改**/
	public function domain_edit(){
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
		$domain = M('Domain');
		$id = (int)I('id');
		$list = $domain->where('id='.$id)->find();
		$this->assign('list',$list);
		$this->display();
	}
	/**域名信息修改提交  接口**/
	public function update(){
		$id = (int)I('param.id');
		if ($id <= 0) $this->error('参数非法');
		$newdata = array();
		$newdata['id'] = I('param.id');
		$newdata['domain'] = I('param.domain');
		$newdata['service'] = I('param.service');
		$newdata['reg_time'] = I('param.reg_time');
		$newdata['expired_time'] = I('param.expired_time');
		$newdata['address'] = I('param.address');
		$newdata['check'] = I('param.check');
		$newdata['status'] = I('param.status');
		$model = M('Domain');
		if (false === $model->create($newdata)) $this->error($model->getError());
		if (false === $model->where('id='.$id)->save()) $this->error('更新失败');
		$this->success('更新成功',U('Domain/domain_list'));
	}
	
	/**提交 待审申请**/
	public function check(){
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
		$id = (int)I('param.id');
		if ($id <= 0) $this->error('参数非法');
		$newdata = array();
		$newdata['id'] = I('param.id');
		$newdata['check'] = 1;
		$newdata['check_time'] = time();
		$model = M('Domain');
		if (false === $model->create($newdata)) $this->error($model->getError());
		if (false === $model->where('id='.$id)->save()) $this->error('审核失败');
		$this->success('审核成功',U('Domain/domain_list'));
	}
	/***域名删除**/
	public function domain_del(){	
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
		$id = (int)I('param.id');
		$model = M('Domain');
		$model-> where('id='.$id)->setField('status','-1');
		$this->success('域名删除成功',U('Domain/domain_list'));
	}
	/***域名禁用**/
	public function disable(){
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
		$id = (int)I('param.id');
		$model = M('Domain');
		$model-> where('id='.$id)->setField('status','0');
		$this->success('域名禁用成功',U('Domain/domain_list'));
	}
	/***域名恢复正常**/
	public function Recovery(){
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
		$id = (int)I('param.id');
		$model = M('Domain');
		$model-> where('id='.$id)->setField('status','1');
		$this->success('域名恢复成功',U('Domain/domain_list'));
	}
		
}     