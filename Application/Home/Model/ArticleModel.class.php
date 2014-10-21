<?php
namespace Home\Model;
use Think\Model;
use Think\Page;
class ArticleModel extends Model {
	
	/**
	 * 字段验证
	 * 
	 *  MUST_VALIDATE	必须验证 不管表单是否有设置该字段
     * VALUE_VALIDATE	值不为空的时候才验证
     * EXISTS_VALIDATE	表单存在该字段就验证   (默认)
	 */
	protected $_validate	=	array(
			array('title','require','标题必须'),
			array('user_id','require','员工编号必须'),
			array('class','require','文章类型必须'),			
	
			array('status',array(-1,0,1),'文章状态非法',self::VALUE_VALIDATE,'in'),//-1-删除, 0-禁用, 1-正常			
	);
	
	protected $_auto		=	array(
			array('time','time',self::MODEL_INSERT,'function'),
	);
	
	
}