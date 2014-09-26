<?php
namespace Home\Model;
use Think\Model;

class Customer_visitModel extends Model {
	
	/**
	 * 字段验证
	 * 
	 *  MUST_VALIDATE	必须验证 不管表单是否有设置该字段
     * VALUE_VALIDATE	值不为空的时候才验证
     * EXISTS_VALIDATE	表单存在该字段就验证   (默认)
	 */
	protected $_validate	=	array(			
			array('content','require','拜访内容必须'),	
	);
	
	protected $_auto		=	array(
			array('visit_time','time',self::MODEL_INSERT,'function'),
	);
	 
    /**拜访记录列表**/
	Public function visitlist(){
		/*查询数据总条数*/
		$count=$this->table('erp_customer_visit as cu,erp_user as ur,erp_customer as cr')
		->where("cu.user_id=ur.id AND cu.cust_id=cr.id")
		->count();
		/*载入分页类，初始化数据*/
		$page=new \Think\Page($count,10);
		/*调用分页链接函数*/
		$data['show']=$page->show();
		/*控制数据查询条数*/
		$data['visit_list']=$this->table('erp_customer_visit as cu,erp_user as ur,erp_customer as cr')
		->where("cu.user_id=ur.id AND cu.cust_id=cr.id")
		->field("cu.id as id,ur.realname as uname,cr.`name` as cname,cu.visit_time,cu.`content`")
		->limit($page->firstRow.','.$page->listRows)->order('visit_time desc')->select();
		return $data;
	}
}