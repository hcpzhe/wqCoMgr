<?php
namespace Home\Model;
use Think\Model;
class Develop_orderModel extends Model{
	/*添加一条网站开发记录*/
	public function add_do($id){
		/*检查是否重复操作*/
		$dev_ord=M('Develop_order');
		$dev_ord->where("order_id=$id")->find();
		
		$data['order_id']=$id;
		$this->add($data);
	}
}