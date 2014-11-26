<?php
namespace Home\Model;
use Think\Model;
class ProductModel extends Model{
	//正常经营的产品
	public function p_list(){
		$product=M('Product');
 		return  $product->where("status=1")->select();	
	}
	//禁用 和 正常经营的产品
	public function p_lists(){
		$product=M('Product');
 		return  $product->where("status>=0")->select();	
	}
}