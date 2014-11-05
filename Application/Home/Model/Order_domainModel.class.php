<?php
namespace Home\Model;
use Think\Model;
class Order_domainModel extends Model{
	/*添加一条记录*/
	public function ad($data){
		$this->add($data);
	}
}