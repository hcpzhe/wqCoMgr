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
	/** 跳转到添加产品页面 */
	public function ad_pro_from(){
		$this->display();
	}
	/** 添加产品 */
	public function ad_pro(){
		$data['name']=$_POST['name'];
		$product=new ProductModel();
		$flag=$product->add($data);
		if($flag==0){	$this->error('添加失败！');
		}else{	$this->success('添加成功！');}
	}
	/** 修改产品详情 */
	public function up_info($id){
		$map['name']=$_POST['name'];
		$product=new ProductModel();
		$flag=$product->where("status=1 AND id=$id")->save($map);
		if($flag==1){	$this->success('修改成功！');
		}else{	$this->error('修改失败！');}
	}
	/** 指定产品的详情信息  */
	public function pro_info($id){
		$product=new ProductModel();
		$this->proinfo=$product->where("status=1 AND id=$id")->find();
		$this->display();
	}
}