<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\ProductModel;
class ProductController extends HomeBaseController{
	/*查询产品分类列表*/
	public function pro_list(){
		$product=new ProductModel();
		$this->pro_list=$product->p_list();
		$this->display();
	}
	/** 删除产品 */
	public function del_pro($id){
		$product=new ProductModel();
		$flag=$product->where("id=$id")->setField('status','-1');
		if($flag==1){	$this->success('删除成功！');
		}else{	$this->error('删除失败！');}
	}
}