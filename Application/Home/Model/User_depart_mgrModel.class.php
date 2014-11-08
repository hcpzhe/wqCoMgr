<?php
namespace Home\Model;
use Think\Model;
class User_depart_mgrModel extends Model{
	/*查询是否存在某条记录*/
	public function s_one($uid,$did){
		$map['user_id']=$_POST['uid'];
		$map['depart_id']=$_POST['did'];
		return $this->where($map)->find();
	}
}