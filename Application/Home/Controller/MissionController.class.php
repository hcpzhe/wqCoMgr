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
		$now=date('Ym');
		//print_r($now_month);exit();
		$Mission = M("Depart_mission");
		$where = "dm.depart_id=de.id";  //多表查询条件
		/*获取搜索条件*/
		$time['year'] = I('param.year');
		$time['month'] = I('param.month');
		$seartime=$time['year'].$time['month']; //搜索的时间
		if (empty($seartime) || $seartime == ''){			
			$where=$where." AND ( dm.mission_date = $now)";			
		}else {			
			$where=$where." AND ( dm.mission_date = $seartime)";
		}
		$mission_list = $Mission->table('erp_depart_mission as dm,erp_depart as de')
		->where($where)
		->field("dm.mission_date as mission_date,dm.task as task,de.name as dname,de.id as dep_id")
		->select();
		if (empty($mission_list)){
			$dep = M('Depart');   //部门任务为空， 查询部门
			$dep_list = $dep->where('status=1')->select();
			$this->assign('depart',$dep_list);			
		}
		$this->assign('month',$time['month']);$time['month'];   //搜索月份
		$this->assign('mission_list',$mission_list);  //任务列表
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
		//print_r($mission_date);exit();
		//部门查询
		$dep = M('Depart');
		$dep_list = $dep->where('status=1')->select();
		$this->assign('depart',$dep_list);
		//print_r($)
		$this->display();
	}
	/***部门业绩添加  **/
	public function addmission(){
		$now_year=date('Y');  //当前年份
		$month = I('param.month');
		$data['mission_date'] = $now_year . $month;		
		$data['depart_id'] = I('param.depart_id');
		$data['task'] = I('param.task');
		$data['update_time']=time();
		$time = $data['mission_date'];
		$dep = $data['depart_id'];
		$mission = M('Depart_mission');
		$flag = $mission->where("depart_id=$dep AND mission_date=$time")->find();
		if (empty($flag)){
			$mission->add($data);
		    $this->success('添加成功！',U('Mission/mission_list'));
		}else {
			$this->error('添加失败！',U('Mission/mission_list'));
		}		
	}	
}