<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Develop_userModel;
use Home\Model\OrderModel;
use Home\Model\Develop_orderModel;
class DevelopuserController extends HomeBaseController{
	public function add_pu(){
		$de_user=new Develop_userModel();
		/*获取订单编号和开发人员编号*/
		$oid=$_GET['oid'];
		$uid=$_POST['user'];
		/*查询是否重复添加*/
		$res=$de_user->s_isset($oid, $uid);
		if($res==0){
			// 开始事务
			mysql_query("start transaction");
			/*如果没有分配，将check值修改为1(判断成功与否)*/
			$de_ord=new Develop_orderModel();
			$res1=$de_ord->up_check($oid);
			/*执行添加数据操作（erp_develo_user）*/
			$res2=$de_user->add_du($oid,$uid);
			if($res1 && $res2){
				mysql_query("COMMIT");
				$this->success('添加成员成功');
			}else{
				$this->error('添加失败');
				mysql_query("ROLLBACK");
			}
		}else {
			$this->error('该成员已分配！');
		}	
	}
}