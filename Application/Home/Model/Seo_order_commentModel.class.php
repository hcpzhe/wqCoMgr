<?php
namespace Home\Model;
use Think\Model;
class Seo_order_commentModel extends Model{
	/*查询指定订单的沟通记录*/
	public function doc_list($oid){
		$data=$this->table('erp_seo_order_comment as esoc,erp_user as eu')
		->where("esoc.user_id=eu.id AND esoc.order_id=$oid")
		->field("esoc.content as content,esoc.post_time as post_time,eu.realname as realname")
		->select();
		return $data;
	}
}