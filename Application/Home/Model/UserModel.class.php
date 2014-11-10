<?php
namespace Home\Model;
use Think\Model;
use Home\Model\DepartModel;

class UserModel extends Model {
	
	/**
	 * 登录用户
	 * @param  array $map 用户查询条件 account & password
	 * @return boolean      ture-登录成功，false-登录失败
	 */
	public function login($map) {
		if (empty($map)) {
			$this->error = '登录条件异常！';
			return false;
		}
		$password = $map['password'];
		unset($map['password']);
		
		$user = $this->where($map)->find();
		if(!$user || 1 != $user['status']) {
			$this->error = '用户不存在或已被禁用！';
			return false;
		}
		if($user['password'] != pwd_hash($password)) {
			$this->error = '密码错误！';
			return false;
		}
		
		/* 登录用户 */
		$this->autoLogin($user);
		
		// XXX 行为  用户登录
		tag('user_login');
		
		return true;
	}
	
	/**
	 * 注销当前用户
	 * @return void
	 */
	public function logout(){
		session('user_auth', null);
		session('user_auth_sign', null);
	}
	
	/**
	 * 自动登录用户
	 * @param  integer $user 用户信息数组
	 */
	private function autoLogin($user){
		/* 更新登录信息 */
		$data = array(
				'uid'             => $user['id'],
				'login_times'           => array('exp', '`login_times`+1'),
				'last_login_time' => NOW_TIME,
				'last_login_ip'   => get_client_ip(1)
		);
		$this->save($data);
	
		/* 记录登录SESSION和COOKIES */
		$auth = array(
				'uid'             => $user['id'],
				'realname'        => $user['realname'],
				'last_login_time' => $user['last_login_time'],
				'last_login_ip'   => $user['last_login_ip'],		
		);
		$user = new UserModel();  
		$arr=$user->user_auto();
		session('cust_id', $arr);   //登录人拥有的未过期的客户权限id
		session('user_auth', $auth);
		session('user_auth_sign', data_auth_sign($auth));
	
	}
	/** 查询技术部人员*/
	public function tech_list($id){
		$model = new DepartModel();
		$deptids = $model->allDept($id);
		$deptids[] = $id;
		
		$user_M = new Model('User');
		$user_map = array('depart_id'=>array('in',$deptids));
		$user_M->where($user_map)->select();
		$t_list=$this->where("status=1 AND depart_id=$id")->select();
		return $t_list;
	}		
// 	/** 查询系统用户列表 * /
// 	 */
// 	public function userlist(){
// 		$data=$this->table('erp_user as user,erp_depart as depart')
// 				->where('user.depart_id=depart.id AND user.status>=0')
// 				->field('user.id as id,user.account as account,user.realname as realname,depart.name as dname,user.status as status')
// 				->select();
// 		return $data;
// 	}
	/** 按条件查询系统用户列表 * /
	 */
	public function sealist($where){
		$where="user.depart_id=depart.id AND aga.uid=user.id AND aga.group_id =eag.id AND user.status>=0 ".$where;
		/*查询数据总条数*/
		$count=$this->table('erp_user as user,erp_depart as depart,erp_auth_group as eag,erp_auth_group_access as aga')
		->where($where)
		->count();
		/*载入分页类，初始化数据*/
		$page=new \Think\Page($count,10);
		/*调用分页链接函数*/
		$data['show']=$page->show();
		/*控制数据查询条数*/
		$data['order_list']=$this->table('erp_user as user,erp_depart as depart,erp_auth_group as eag,erp_auth_group_access as aga')
		->where($where)
		->field("user.id as id,user.account as account,user.realname as realname,user.position as position,user.startime as startime,depart.name as dname,user.status as status,eag.title as title")
		->limit($page->firstRow.','.$page->listRows)->select();
		return $data;
	}
	/** 查询某个用户的详细信息  */
	public function userinfo($id){
		return $this->table("erp_user as ur,erp_depart as dp,erp_auth_group as eag,erp_auth_group_access as aga")
		->where("aga.uid=ur.id AND aga.group_id =eag.id AND ur.depart_id=dp.id AND ur.id=$id")
		->field("aga.group_id as group_id,eag.title as group_title,ur.id as id,ur.account as uname,ur.realname as name,ur.sex as sex,ur.position as position,ur.startime as startime,ur.birthday as birthday,dp.id as dpid,dp.name as dpname")->find();
	}	
	/** 所有用户      */
	public function alluser(){
		return $this->where("status=1")->select();
	}
	/**登录人拥有的客户未过期权限 id**/
	public function user_auto(){
// 		$arr = session('user_auth');
 		$uid = UID; 		
 		$map = array('user_id'=>$uid);
 		$model = M('User_depart_mgr');
 		$depidarr = $model->where($map)->getField('depart_id',true);   //取出当前用户所管理的部门
 		 
 		//取出当前用户所管理所有部门 （递归取所有子部门）
 		$alldepart = $depidarr;
 		foreach ($depidarr as $rowdepid) {
 			$dep = new DepartModel();
 			$deptids = $dep->allDept($rowdepid);
 			$alldepart = array_merge($alldepart,$deptids); 			
 		}
 		 		
 		//获取部门下所有的员工
 		$user_M = new Model('User');
 		$where = array();
 		$where['depart_id'] = array('in',$alldepart);
 		$alluser=$user_M->where($where)->getField('id',true);
 				
 		// 获取客户权限未过期的所有客户
 		$Ucp=M('User_cust_prod');
 		$alluser[] = UID;
 		$ucpwhere['user_id'] = array('in',$alluser);		
 		$time=time();  		
 		$ucpwhere['expired_time'] = array(array('gt',$time),array('eq',0), 'or');
 		$cust_id=$Ucp->where($ucpwhere)->getField("cust_id",true);
 		session('[start]');
 		session('cust_id', $cust_id);
 		return $cust_id;
					
	}	
}