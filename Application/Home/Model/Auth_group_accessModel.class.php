<?php
namespace Home\Model;
use Think\Model;
class Auth_group_accessModel extends Model{
	/*修改用户所属用户组*/
	public function up($uid,$gid){
		$map['group_id']=$gid;
		return $this->where("uid=$uid")->save($map);
	}
}