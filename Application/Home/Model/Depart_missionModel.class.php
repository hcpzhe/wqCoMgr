<?php
namespace Home\Model;
use Think\Model;
class Depart_missionModel extends Model {
	/**
	 * 查询所有部门的任务
	 */
	function dp_mission_list($time) {
		$dep=M('Depart_mission');
		$data = $dep->table('erp_depart as de,erp_depart_mission as edm')
		->where("de.id=edm.depart_id and edm.mission_date='".$time."'")
		->getField('de.id,de.name,edm.task,edm.mission_date');
		echo $this->_sql();
		return $data;
	}
	/** 总任务 */
	function zrw($time){
		$sql="select sum(task) as smoney from erp_depart_mission where mission_date";
		return $this->query($sql);
	}
}