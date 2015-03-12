<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Think\Org\Net\IpLocation;
use Home\Model\User_cust_prodModel;
class IndexController extends HomeBaseController {

	public function index(){
		$this->display();
	}
	
	public function welcome() {
		/**
		 * 1.根据当前登录用户id查询员工产品权限表中是否存在已经过期的权限
		 * 2.删除已经过期的权限
		 * 3.将已经过期的权限对应的客户放入加工海中
		 */
		$user_cust_prod=new User_cust_prodModel();
		$public_customer=M('public_customer');
		$data['user_id']=UID;
		$time=time();
		$data['expired_time']=array('lt',$time);
		$ucps=$user_cust_prod->where($data)->select();
		for($i=0;$i<count($ucps);$i++){
			// 开始事务
			mysql_query("start transaction");
			//将客户添入公海
			$map['cust_id']=$ucps[$i]['cust_id'];
			$map['public_time']=time();
			$flag=$public_customer->add($map);
			//删除当前已经过期权限
			$det['user_id']=$ucps[$i]['user_id'];
			$det['cust_id']=$ucps[$i]['cust_id'];
			$flag1=$user_cust_prod->where($det)->delete();
			if ($flag && $flag1) {	mysql_query("COMMIT");
			}else{	mysql_query("ROLLBACK");	}
		}
		$arr = session('user_auth');
		$uid=$arr['uid'];
		$User = M("User");
		$users = $User->table('erp_user as ur,erp_depart as de')
		->where('ur.depart_id=de.id AND ur.id='.$uid)
		->getField("ur.id as id,ur.account as account,ur.realname as realname,de.name as name,ur.sex as sex,ur.position as position,ur.startime as startime,ur.birthday as birthday,ur.status as status,ur.last_login_ip as last_login_ip,ur.login_times as login_times,ur.last_login_time as last_login_time");
	    $this->assign('users',$users);
		$this->display();
	}
}