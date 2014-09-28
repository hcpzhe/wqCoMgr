<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\Seo_orderModel;
use Home\Model\Seo_userModel;
use Home\Model\UserModel;
use Home\Model\OrderModel;
use Home\Model\Seo_order_commentModel;
class SeoordController extends HomeBaseController{
	/*优化订单*/
	public function seo_list(){
		$dep=new Seo_orderModel();
		$this->data=$dep->seo_list();
		$this->display();
	}
	/**网站开发订单详细页面，订单详细信息，订单参与人员，订单沟通记录 */
	public function seo_info(){
		$oid=$_GET['id'];
		/** 详细信息 */
		$seo=new Seo_orderModel();
		$this->data=$seo->seoinfo($oid);
		/*开发人员*/
		$dep_user=new Seo_userModel();
		$this->users=$dep_user->s_dist($oid);
		/*订单沟通记录*/
		$doc=new Seo_order_commentModel();
		$this->conments=$doc->doc_list($oid);
		$this->display();
	}	
	/*跳转到分单页面*/
	public function dist(){
		$oid=$_GET['id'];
		/*查询所有优化人员*/
		$user=new UserModel();
		$this->users=$user->tech_list(3);
		/*查询该订单已经分配的人员*/
		$se_user=new Seo_userModel();
		$this->data=$se_user->s_dist($oid);
		/*查询订单名称*/
		$order=new OrderModel();
		$this->cname=$order->s_cname($oid);
	
		$this->id=$oid;
		$this->display();
	}	
}