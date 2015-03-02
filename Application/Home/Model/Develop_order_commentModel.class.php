<?php
namespace Home\Model;
use Think\Model;
class Develop_order_commentModel extends Model{
	/*查询指定订单的沟通记录*/
	public function doc_list($oid){
		$data=$this->table('erp_develop_order_comment as edoc,erp_user as eu')
				->where("edoc.user_id=eu.id AND edoc.order_id=$oid")
				->field("edoc.content as content,edoc.post_time as post_time,eu.realname as realname,edoc.pace as pace")
				->select();
		return $data;
	}
}