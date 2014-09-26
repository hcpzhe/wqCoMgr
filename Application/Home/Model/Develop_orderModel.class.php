<?php
namespace Home\Model;
use Think\Model;
echo "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>";
class Develop_orderModel extends Model{
	/*添加一条网站开发记录*/
	public function add_do($id){
		/*检查是否重复操作*/
		$count=$this->where("order_id=$id")->count();
		/*如果存在id为$id的记录返回0*/
		if($count>=1){ return 0;}
		else{ /*添加一条记录*/
			$data['order_id']=$id;
			$this->add($data);
			return 1;}			
	}
	/*网站开发订单列表*/
	public function dor_list(){
		
	}
}