<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\OrderModel;
use Home\Model\ProductModel;
use Home\Model\Order_payModel;
use Home\Model\Order_renewalModel;
use Home\Model\Depart_missionModel;
use Home\Model\DepartModel;
use Home\Model\UserModel;
class ResultsController extends HomeBaseController{
	/**业绩列表 */
	public  function reslist(){
		/*获取搜索条件*/
		$pro=$_POST['product'];
		$check=$_POST['check'];
		$key=$_POST['key'];
		/** 拼接where条件 */
		if(!empty($pro)){
			$where=$where." AND pt.id=".$pro;
		}

			$where=$where." AND oe.check=1";
	
		if(!empty($key)){
			$where=$where." AND ( pt.name like '%".$key."%' or cr.name like '%".$key."%' or ur.realname like '%".$key."%')";
		}
		$order=new OrderModel();
		$this->data=$order->orderlist($where);
		/*产品列表*/
		$product=new ProductModel();
		$this->pro_list=$product->p_list();
		$this->display();
	}
	public function show_res(){
		//获取年份，月份
		$sta_time= strtotime($_POST['year'].$_POST['month']."01");
		$end_time= strtotime($_POST['year'].$_POST['month']."31");
		//时间值赋值
		$this->year=$_POST['year'];
		$this->month=$_POST['month'];
		/**
		 * 获取有业绩员工的总业绩，以及页面显示所占比例
		 */
		/** 1 获取订单付费表业绩 */
		$ordr_pay=new Order_payModel();
		$a=$ordr_pay->group_sum($sta_time,$end_time);
		/** 2 获得续费表业绩*/
		$order_renewal=new Order_renewalModel();
		$b=$order_renewal->group_sum($sta_time,$end_time);
		/** 3 合并两个数组，将业绩相加 */
		for($i=0;$i<count($a);$i++){
			foreach ($b as $key=>$value){
				if($a[$i]['realname']==$value['realname']){
					$a[$i]['money']=$a[$i]['money']+$value['money'];
				}
			}
		}
		/** 4求数组最大值（最高业绩） */
		$max_yj=0;
		for($g=0;$g<=count($a);$g++){
			if($a[$g]['money']>$max_yj){
				$max_yj=$a[$g]['money'];
			}
		}
		/** 5获取每个员工页面显示比例 */
		$max_yj=ceil($max_yj);
		for ($i=0;$i<count($a);$i++){
			$a[$i]['wcl']=ceil($a[$i]['money']/$max_yj*100);
		}
		/** 6获取所有员工 */
		$user=new UserModel();
		$users=$user->alluser();	
		/** 7给员工数组添加业绩，完成率项 **/
		for($mw=0;$mw<count($users);$mw++){
			$users[$mw]['money']=0;
			$users[$mw]['wcl']=0;
		}
		/** 8将有业绩员工的业绩放入所有员工数组当中 */
		for($g=0;$g<count($users);$g++){
			foreach ($a as $gkey=>$gvalue){
				if($users[$g]['id']==$gvalue['uid']){
					$users[$g]['money']=$gvalue['money'];
					$users[$g]['wcl']=$gvalue['wcl'];
				}
			}
		}	
		/**
		 * 获取每个部门下所有员工
		 */
		/** 1.获取所有部门 */
		$depart=new DepartModel();
		$departs=$depart->alldepart();
		/** 2.将每个部门下所有员工以数组形式放入部门数组中 */
		$user_list=array();
		for($dep=0;$dep<count($departs);$dep++){
			for ($use=0;$use<count($users);$use++){
				if($departs[$dep]['id']==$users[$use]['depart_id']){
					$user_list[$use]=$users[$use];
				}
			}
			$departs[$dep]['user_list']=$user_list;
			$user_list="";
		}	
		/**
		 * 获取部门任务
		 */
		$d_mission=new Depart_missionModel();
		$depart_m_list=$d_mission->dp_mission_list($_POST['year'].$_POST['month']);
		/** 将部门任务放入部门数组中 */
		for ($dm=0;$dm<count($departs);$dm++){
			foreach ($depart_m_list as $dmkey=>$dmvalue){
				if($departs[$dm]['id']==$dmvalue['id']){
					$departs[$dm]['mission']=$dmvalue['task'];
// 					$departs[$dm]['mission']=$dmvalue['task'];
				}
			}
		}
// 		echo "<pre>";print_r($departs);echo "</pre>";		
		
		/**
		 *  获取部门业绩 */	
		/** 1.部门已完成业绩 付款*/
		$ordr_pay=new Order_payModel();
		$dep_pay_list=$ordr_pay->depart_resu($sta_time,$end_time);
		/** 2.部门已完成业绩 续费*/
		$ordr_ren=new Order_renewalModel();
		$dep_ren_list=$ordr_ren->depart_renewal($sta_time,$end_time);
		/** 3 合并两个数组，将业绩相加 */
		for($j=0;$j<count($dep_pay_list);$j++){
			foreach ($dep_ren_list as $key1=>$value1){
				if($dep_pay_list[$j]['name']==$value1['name']){
 					$dep_pay_list[$j]['money']=($value1['money']+$dep_pay_list[$j]['money']);
				}
			}
		}	
		/** 将部门业绩放入部门数组中 */
		for ($yj=0;$yj<count($departs);$yj++){
			foreach ($dep_pay_list as $yjkey=>$yjvalue){
				if($departs[$yj]['id']==$yjvalue['id']){
					$departs[$yj]['yj']=$yjvalue['money'];
				}
			}
		}
		/** 获取每个部门的达成率 */
		for($wcl=0;$wcl<count($departs);$wcl++){
			$departs[$wcl]['wcl']=ceil(($departs[$wcl]['yj']/$departs[$wcl]['mission'])*100);
		}
		/** 模板赋值 */
		$this->department=$departs;
		/** 定义年份 */
		$this->years=array('2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018');
		/** 定义月份 */
		$this->months=array('01','02','03','04','05','06','07','08','09','10','11','12');	
		/** 获取公司总任务，获取公司总达成率 */
		$zrw=0;
		for ($z=0;$z<count($departs);$z++){
			$zrw=$zrw+$departs[$z]['mission'];
		}
		$zyj=0;
		for ($y=0;$y<count($departs);$y++){
			$zyj=$zyj+$departs[$y]['yj'];
		}
		$this->zongrw=$zrw;
		$this->zongyj=$zyj;
		$this->zwcl=ceil($zyj/$zrw*100);
		/** 对员工总业绩数组进行排序 */
		arsort($a);
		$this->user_money=$a;		
		$this->display();
	}
}