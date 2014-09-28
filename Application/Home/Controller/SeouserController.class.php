<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Seo_userModel;
use Home\Model\Seo_orderModel;
class SeouserController extends HomeBaseController{
	public function add_pu(){
		$de_user=new Seo_userModel();
		/*获取订单编号和开发人员编号*/
		$oid=$_GET['oid'];
		$uid=$_POST['user'];
		/*判断订单是否已经分配（根据订单id在订单参与表中查询）*/
		/*如果没有分配，将check值修改为1(判断成功与否)*/
		$de_ord=new Seo_orderModel();
		$de_ord->up_check($oid);
		/*查询是否重复添加*/
		$res=$de_user->s_isset($oid, $uid);		
		/*如果没有数据*/
		if($res==0){
			/*执行添加数据操作（erp_develo_user）*/
			$flag=$de_user->add_du($oid,$uid);
			if($flag==1){ $this->success('添加成员成功');}
			else{ $this->error('添加成员失败');}
		}else{
			$this->error('该成员已分配！');
		}	
	}
}