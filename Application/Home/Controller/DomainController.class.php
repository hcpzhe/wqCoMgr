<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\DomainModel;

class DomainController extends HomeBaseController{
	/*域名庫*/
	public function domain_list($domain=null, $tpl=null){
		$map=array();
		$model=new DomainModel();
		$id = (int)I('param.id');
		if ($id>0) $map['id'] = $id;
		if(isset($domain)){
			$map['domain']   =   array('like', '%'.$domain.'%');
		}
		$count=$model->where($map)->count();       // 查询满足要求的总记录数
		$Page       = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(10)
		$show       = $Page->show();// 分页显示输出
		$domain_list = $model->where($map)->limit($Page->firstRow.','.$Page->listRows)->order('expired_time desc')->select();
		$this->assign('domain_list',$domain_list);
		$this->assign('show',$show);   //分页显示
		$this->assign('domain', $domain);           //用于搜索条件的显示
		if (isset($tpl)) $this->display($tpl);
		else $this->display();
	}
	/*添加域名*/
	public function add_domain(){
		$cust_id = (int)I('param.cust_id');
		$this->assign('cust_id',$cust_id);
		$this->display();
	}
	/**域名添加   提交接口**/
	public function insert(){	
		$data['cust_id'] = (int)I('cust_id');
		$data['domain'] =  I('param.domain');
		$data['service'] =  I('param.service');
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

		$domain = M('Domain'); //获取域名详细信息
		$domain_list = $domain->table('erp_customer as cr,erp_domain as dom')
		->where("cr.id=dom.cust_id AND dom.id=$id")
		->getField("dom.id as id,cr.id as cust_id,cr.`name` as `name`,dom.domain as domain,dom.service as service,dom.reg_time as reg_time,dom.expired_time as expired_time,dom.`check` as `check`,dom.check_time as check_time,dom.`status` as `status`");
       
        $this->assign('cust_id',$domain_list[$id]['cust_id']);  //公司id
        $this->assign('id',$domain_list[$id]['id']);  //公司域名所对应的id
		$this->assign('domain_list',$domain_list);
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