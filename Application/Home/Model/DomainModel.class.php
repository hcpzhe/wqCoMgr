<?php
namespace Home\Model;
use Think\Model;

class DomainModel extends Model {
	
	/**
	 * 字段验证
	 * 
	 *  MUST_VALIDATE	必须验证 不管表单是否有设置该字段
     * VALUE_VALIDATE	值不为空的时候才验证
     * EXISTS_VALIDATE	表单存在该字段就验证   (默认)
	 */
	protected $_validate	=	array(
			array('domain','require','域名必须'),
			array('service','require','域名运营商必须'),
	
			array('status',array(-1,0,1),'客户状态非法',self::VALUE_VALIDATE,'in'),//-1-删除, 0-禁用, 1-正常
			array('check',array(-1,0,1),'审核状态非法',self::VALUE_VALIDATE,'in'),//-1-拒绝, 0-待审, 1-通过
	);
	
	protected $_auto		=	array(
			array('reg_time','time',self::MODEL_INSERT,'function'),
	);
	/*查找指定客户名下所有的域名*/
	public function all($id){
		return $this->where("cust_id=$id")->select();
	}	

}