<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\DomrenModel;
use Think\Page;

class DomrenController extends HomeBaseController{
	/*域名续费申请  列表*/
	public function dom_ren_app(){
		$model = M('Domain_renewal');
				
		$apply_list = $model->table('erp_domain as dn,erp_domain_renewal as dr')
		->where("dn.id=dr.domain_id AND 'status'=0 or 'status'=1")
		->getField("dr.id,dr.domain_id,dn.domain,dr.money,dr.org_expired_time,dr.new_expired_time,dr.pay_time,dr.`check`");
		
        $this->assign('apply_list',$apply_list);
		$this->display();
	}
	/**域名申请续费 **/
	public function apply_renewal(){
		$domain_id = (int)I('id');
		$domain = M('Domain');
		$domain_mess = $domain->where('id='.$domain_id)->find();
		$this->assign('domain_mess',$domain_mess);
		$this->display();
	}
	/**域名续费申请   提交接口**/
	public function insert(){
		$data['domain_id'] = (int)I('domain_id');
		$data['money'] =  I('param.money');
		$data['org_expired_time'] =  I('param.expired_time');  //原过期时间
		$data['year_num'] = I('param.year');   //域名续费年限
		$data['new_expired_time'] = $data['org_expired_time'] + $data['year_num']*60*60*24*365;  //域名到期时间计算      新过期时间
		$data['pay_time'] = I('param.pay_time');;
		$model = M('Domain_renewal');
		$data = $model->data($data)->add();
	
		$this->success('域名续费申请成功',U('Domain/domain_list'));
	}
	
	/**提交 待审申请**/
	public function check(){
		$id = (int)I('param.id');
		if ($id <= 0) $this->error('参数非法');
		
		$Domain_renewal = M('Domain_renewal');
		$apply_list = $Domain_renewal->table('erp_domain as dn,erp_domain_renewal as dr')
		->where("dn.id=dr.domain_id AND dr.id=$id")
		->getField("dr.id,dr.domain_id,dr.new_expired_time");
		
	   //域名信息更新
		$domain_id = $apply_list[$id]['domain_id'];
		$domain_expired_time = $apply_list[$id]['new_expired_time'];   //域名新过期时间
		$domain_M = M('Domain');
		$domain_M -> where('id='.$domain_id)->setField('expired_time',$domain_expired_time);
		
		
		//提交续费申请
		$newdata = array();
		$newdata['id'] = I('param.id');
		$newdata['check'] = 1;
		$newdata['status'] = 1;   //提交申请后 域名状态为1 正常
		$newdata['check_time'] = time();
		$model = M('Domain_renewal');
		if (false === $model->create($newdata)) $this->error($model->getError());
		if (false === $model->where('id='.$id)->save()) $this->error('审核失败');
		$this->success('审核成功',U('Domren/dom_ren_app'));
	}
	
	/**查看域名申请的详细信息***/
	public function domren_apply_detailed(){
		$id = (int)I('param.id');
		
		$model = M('Domain_renewal');
		
		$apply_list = $model->table('erp_domain as dn,erp_domain_renewal as dr,erp_customer as cu')
		->where("dn.id=dr.domain_id AND cu.id=dn.cust_id AND dr.id=$id")
		->getField("dr.id,dr.domain_id,dn.domain,dn.service,dn.reg_time,dr.money,dr.org_expired_time,dr.new_expired_time,dr.pay_time,dr.`check`,dr.check_time,cu.name,cu.contacts,cu.phone");
		
// 		print_r($apply_list);
// 		exit();
	   $this->assign('apply_list',$apply_list);
		$this->display();	
		
	}
	
	/***域名续费申请编辑***/
	public function domain_apply_edit(){

		$id = (int)I('param.id');
		print_r($id);
		exit();
		
		$this->display();
	}
	
}