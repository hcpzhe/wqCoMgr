<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\OrderModel;
use Home\Model\ProductModel;
class MissionController extends HomeBaseController{
	/**部门任务列表 */
	public  function mission_list(){
		//当前日期所在的年份
		$now_year=date('Y');
		$this->assign('year',$now_year);
		/*获取搜索条件*/
		$year = I('param.year');
		$month = I('param.month');
		$now=date('Ym');
		//print_r($now);exit();
		$Mission = M("Depart_mission"); 
		$where = "dm.depart_id=de.id";  //多表查询条件
		$where=$where." AND ( dm.mission_date = $now)";
		$mission_list = $Mission->table('erp_depart_mission as dm,erp_depart as de')
		->where($where)
		->field("dm.mission_date as mission_date,dm.task as task,de.name as dname,de.id as dep_id")
		->select();
		
		$this->assign('mission_list',$mission_list);
		$this->display();
	}
	/***部门业绩添加***/
	public function add(){
		$dep_id = I('param.dep_id');
		$dname = I('param.dname');
		$mission_date = I('param.mission_date');
		$this->assign('dep_id',$dep_id);
		$this->assign('dname',$dname);
		$this->assign('mission_date',$mission_date);
		//print_r($dname);exit();
		//部门查询
		$cust = M('Depart');
		$dep_list = $cust->where('status=1')->select();
		$this->assign('depart',$dep_list);
		//print_r($)
		$this->display();
	}
	/***部门业绩添加  **/
	public function addmission(){
		$now_year=date('Y');
		$month = I('param.month');
		$data['mission_date'] = $now_year . $month;		
		$data['depart_id'] = I('param.depart_id');
		$data['task'] = I('param.task');
		$data['update_time']=time();
		$mission = M('Depart_mission');
		$mission->add($data);
		$this->success('添加成功',U('Mission/mission_list'));
				
	}
	
	/***业绩排行***/
	public function show_res(){
		$order=new OrderModel();
		$this->showres=$order->result();
		$this->display();
	}
}