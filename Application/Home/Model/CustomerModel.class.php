<?php
namespace Home\Model;
use Think\Model;
use Think\Page;
class CustomerModel extends Model {
	
	/**
	 * 字段验证
	 * 
	 *  MUST_VALIDATE	必须验证 不管表单是否有设置该字段
     * VALUE_VALIDATE	值不为空的时候才验证
     * EXISTS_VALIDATE	表单存在该字段就验证   (默认)
	 */
	protected $_validate	=	array(
			array('name','require','公司名称必须'),
			array('contacts','require','联系人必须'),
			array('phone','require','联系电话必须'),
			array('add_user','require','添加人必须'),
	
			array('status',array(-1,0,1),'客户状态非法',self::VALUE_VALIDATE,'in'),//-1-删除, 0-禁用, 1-正常
			array('check',array(-1,0,1),'审核状态非法',self::VALUE_VALIDATE,'in'),//-1-拒绝, 0-待审, 1-通过
	);
	
	protected $_auto		=	array(
			array('add_time','time',self::MODEL_INSERT,'function'),
	);
	/*查询所有客户*/
	public function cus_list(){
		$data=$this->where("status=1 AND `check`=1")->select();
		return $data;
	}
	/** 根据客户id查询 客户信息**/
	public function one($id){
		$data=$this->field('id,name')->where("id=$id and status=1")->find();
		return $data;
	}	
	/**客户列表***/
	public function customer_lists($where){
		$where = "cr.user_id=ur.id AND cr.`status`=1".$where;  //多表查询条件
		
		$count=$this->table('erp_user as ur,erp_customer as cr')
		->where($where)
		->count();       // 查询满足要求的总记录数
		$Page       = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(10)
		$data['show']       = $Page->show();// 分页显示输出
		$data['list'] = $this->table('erp_user as ur,erp_customer as cr')
		->where($where)
		->field("cr.id as id,ur.realname as uname,cr.`name` as cname,cr.contacts,cr.phone,cr.`check`")
		->limit($Page->firstRow.','.$Page->listRows)->order('cr.id desc')->select();
		return $data;
	}
	
	
}