<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Develop_userModel;
use Home\Model\OrderModel;
class DevelopuserController extends HomeBaseController{
	public function add_pu(){
		/*获取订单编号和开发人员编号*/
		$oid=$_GET['oid'];
		$uid=$_POST['user'];
		/*执行添加数据操作（erp_develo_user）*/
		$de_user=new Develop_userModel();
		$flag=$de_user->add_du($oid,$uid);
		if($flag==1){ $this->success('添加成员成功');}
		else{ $this->error('添加成员失败');}
	}
}