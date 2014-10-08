<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\DomrenModel;

class DomrenController extends HomeBaseController{
	/*域名续费申请*/
	public function dom_ren_app(){
		$domain_id = (int)I('id');
		$domain = M('Domain');
		$domain_mess = $domain->where('id='.$domain_id)->find();
		$this->assign('domain_mess',$domain_mess);
		
// 		print_r($list);
// 		exit();
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
}