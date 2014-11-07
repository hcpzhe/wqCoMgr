<?php
namespace Home\Model;
use Think\Model;
class Auth_groupModel extends Model{
	/** 用户组列表  */
	public function lists(){
		return $this->where("status=1")->select();
	}
	/**查询指定用户组的权限  */
	public function g_rule($id){
		$res=$this->where("status=1 AND id=$id")->getField('rules');
		return explode(',',$res);
	}
	/**查询所有权限信息及该用户组所拥有的所有权限  */
	public function ztreeArr($map,$id) {
		/*当前用户组所拥有的权限*/
		$group=$this->g_rule($id);
		/*所有权限节点*/
		$cate_tree = array();
		$rule=new Auth_ruleModel();
		$list = $rule->where($map)->select();
		foreach ($list as $row) {
			/*查看该用户组是否拥有该权限*/
			$flag=in_array($row['id'], $group);
			$tmp = array(
					'id' => $row['id'],
					'pId' => $row['parent_id'],
					'name' => $row['title'],
					'open' => true,
					'checked' => $flag,
					'value' => $row['id']
			);
			$cate_tree[] = $tmp;
		}
		return $cate_tree;
	}	
}