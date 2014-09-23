<?php
namespace Home\Model;
use Think\Model;
class Develop_orderModel extends Model{
	/*添加一条网站开发记录*/
	public function add_do($id){
		echo "审核通过，增加一条网站开发记录";
		$data['order_id']=$id;
		$data['remark']="无";
		$data['start_time']="2014.9.18";
		$data['end_time']="2015.9.18";
		$data['finish_time']="...";
		$data['check']="1";
		$data['status']="1";
	}
}