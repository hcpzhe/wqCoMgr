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
}