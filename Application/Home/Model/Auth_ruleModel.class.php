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
	
	/**
	 * 
	 * @param number $pid
	 * @return
	 * 		array(
	 * 			id=>int,
	 * 			name=>string,
	 * 			title=>string,
	 * 			son=> array(
	 * 				id=>int,
	 * 				name=>string,
	 * 				title=>string,
	 * 				son=> array...
	 * 			)
	 * 		)
	 */
	/*回调函数*/
	public function allrule($pid=0) {
		$return = array();
		$map = array('parent_id'=>$pid,'status'=>'1');
		$idarr = $this->where($map)->getField('id',true);
		if (empty($idarr)) return $return;
	
		$return = $idarr;
		foreach ($idarr as $rowid) {
			$tmparr = $this->allrule($rowid);
			$return = array_merge($return,$tmparr);
		}
		return $return;
	}
/**查询所有权限信息  */
	public function ztreeArr($map) {
// 		/*当前用户组所拥有的权限*/
// 		$auth_group=new Auth_groupModel();
// 		$group=$auth_group->g_rule(1);		
		/*所有权限节点*/
		$cate_tree = array();
		$list = $this->where($map)->select();
		foreach ($list as $row) {
			/*查看该用户组是否拥有该权限*/
// 			$flag=in_array($row['id'], $group);
			$tmp = array(
					'id' => $row['id'],
					'pId' => $row['parent_id'],
					'name' => $row['title'],
					'open' => true,
// 					'checked' => $flag
			);
// 			$tmp['pname'] = $tmp['pId'] > 0? $this->where('id='.$tmp['pId'])->getField('cate_name') : '顶级分类';			
			$cate_tree[] = $tmp;
		}
		return $cate_tree;
	}	
	//获取指定id的规则
	public function guize($id){
		$auth_rule=$this->where("id=".$id)->field("name")->find();
		return $auth_rule['name'];
	}
	//获取指定id的规则
	public function guize_id($gz){
<<<<<<< HEAD
		$auth_rule=$this->where("name='".$gz."'")->field("id")->find();//echo $this->_sql();exit();
=======
		$auth_rule=$this->where("name='".$gz."'")->field("id")->find();
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75
		return $auth_rule['id'];
	}
}