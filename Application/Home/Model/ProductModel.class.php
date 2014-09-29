<?php
namespace Home\Model;
use Think\Model;
class ProductModel extends Model{
	public function p_list(){
		$product=M('Product');
 		return  $product->where("status=1")->select();	
	}
}