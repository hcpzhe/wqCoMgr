<?php
namespace Home\Model;
use Think\Model;
class Auth_groupModel extends Model{
	/** 用户组列表  */
	public function lists(){
		return $this->where("status=1")->select();
	}
}