<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\DomainModel;
use Think\Page;

header("Content-Type:text/html;charset=utf-8");
class DomainController extends HomeBaseController{
	/*域名庫*/
	public function domain_list($domain=null, $tpl=null){
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
		if (!empty($status) && $status == 1){
			$map['status'] = 1; //域名正常
		}elseif (!empty($status) && $status == 2){
			$map['status'] = 0; //域名专题为禁用
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
		$cust_id = (int)I('param.cust_id');
		$domain = M('Customer');
		//查询客户信息的审核状态
		$check = $domain->where('id='.$cust_id)->getField('check');
		if ($check == 0 || $check == -1){
			$this->error('公司信息通过审核后才能添加域名！');
		}else {		
		$this->assign('cust_id',$cust_id);
		$this->display();
		}
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
		$data['cust_id'] = (int)I('cust_id');
		$data['domain'] =  I('param.domain');
		$data['service'] =  I('param.service');
		$data['doamin_user'] =  I('param.doamin_user');
		$data['reg_time'] = time();
		$data['year_num'] = I('param.year');   //新注域名使用年限
		$data['expired_time'] = $data['reg_time'] + $data['year_num']*60*60*24*365;  //域名到期时间计算
		$model = new DomainModel();
		$data = $model->data($data)->add();		
		$this->success('添加成功',U('Domain/domain_list'));
	}
	/**域名详细信息**/
	public function domain_detailed(){
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
		$id = (int)I('param.id');
		$model = M('Domain');
		$model-> where('id='.$id)->setField('status','-1');
		$this->success('域名删除成功',U('Domain/domain_list'));
	}
		
}     