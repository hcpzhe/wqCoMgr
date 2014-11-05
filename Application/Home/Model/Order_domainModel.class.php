<?php
namespace Home\Model;
use Think\Model;
class Order_domainModel extends Model{
	/*添加一条记录*/
	public function s_all($id){
		$data=$this->table("erp_order_domain as od,erp_domain as dn")->where("od.order_id=$id AND od.domain_id=dn.id")->field("dn.domain as domain")->select();
		return $data;
	}
}