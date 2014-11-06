<?php
namespace Home\Model;
use Think\Model;
class Auth_ruleModel extends Model{
	/*根据权限编号查询权限 信息*/
	public function info($id){
		$data=$this->where("id=$id AND status=1")->find();
		return $data;
	}
	/*所有权限*/
	public function all(){
		return $this->where("status=1")->select();
	}
}