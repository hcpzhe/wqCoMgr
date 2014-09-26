<?php
namespace Home\Model;
use Think\Model;
class Seo_orderModel extends Model{
	/*添加一条优化记录*/
	public function add_so($id){
	/*检查是否重复操作*/
		$count=$this->where("order_id=$id")->count();
		/*如果存在id为$id的记录返回0*/
		if($count>=1){ return 0;}
		else{ /*添加一条记录*/
			$data['order_id']=$id;
			$this->add($data);
			return 1;}	
	}
	/*优化开发订单列表*/
	public function sr_list(){
	
	}	
}