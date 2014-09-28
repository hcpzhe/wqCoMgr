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
}