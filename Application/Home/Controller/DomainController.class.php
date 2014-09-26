<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
class DomainController extends HomeBaseController{
	/*域名庫*/
	public function domain_list(){
		$this->display();
	}
	/*添加域名*/
	public function add_domain(){
		$this->display();
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
		// 		print_r($newdata['check_time']);
		// 		exit();
	}
	
	
	
}     