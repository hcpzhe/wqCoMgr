<?php
namespace Home\Model;
use Think\Model;
class DepartModel extends Model{
	
	/**
	 * 获取指定部门下，所有的子部门的id数组
	 * @param int $id	部门id
	 * @return array(1,2,3,4,6)
	 */
	public function allDept($id) {
		$return = array();
		$map = array('parent_id'=>$id,'status'=>'1');
		$idarr = $this->where($map)->getField('id',true);
		if (empty($idarr)) return $return;
		
		$return = $idarr;
		foreach ($idarr as $rowid) {
			$tmparr = $this->allDept($rowid);
			$return = array_merge($return,$tmparr);
		}
		return $return;
	}
	/**  获取部门列表 */
	public function depalist(){
		$dep=M('Depart');
		$data=$dep->where('status=1')->select();
		return $data;
	}
	/**  获取部门列表 */
	public function depalists(){
		//erp_user_depart_mgr 查询部门负责人
		$dep=M('Depart');
		$data = $dep->table('erp_depart as de,erp_user_depart_mgr as udm,erp_user as ur')
		->where('de.id=udm.depart_id AND ur.id=udm.user_id')
		->getField('ur.id as uid,de.id as id,de.`name` as `name`,de.`status` as `status`,udm.depart_id as depart_id,ur.realname');
		return $data;
	}
	/** 查询所有部门 */
	public function alldepart(){
		$data=$this->where('status=1')->select();
		return $data;
	}
	/** 查询某一部门的详细信息 */
	public function s_one($id){
		return $this->where("status=1 AND id=$id")->find();
	}
	
}