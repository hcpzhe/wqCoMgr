<?php
namespace Home\Model;
use Think\Model;
class Auth_group_accessModel extends Model{
	/*修改用户所属用户组*/
	public function up($uid,$gid){
		$map['group_id']=$gid;
		return $this->where("uid=$uid")->save($map);
	}
	//获取指定用户所在的用户组
	public function user_in_group($id){
		$result=$this->table("erp_auth_group_access as eaga,erp_auth_group as eag,erp_user as eu")
				->where("eu.id=eaga.uid and eag.id=eaga.group_id and eu.id=".$id." and eag.status=1")
				->field("eaga.group_id")->find();
		return $result['group_id'];
	}
}