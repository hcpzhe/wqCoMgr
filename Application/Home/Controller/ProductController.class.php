<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\ProductModel;
class ProductController extends HomeBaseController{
	/*查询产品分类列表*/
	public function pro_list(){
		/*--------wcd权限判断---------*/
		//获取当前模块名称
		$contro=CONTROLLER_NAME;
		//获取当前操作名称
		$actio=ACTION_NAME;
		//获取当前访问规则
		$cd_rule="Home/".$contro."/".$actio;
		$uid = UID;
		if($this::cd_rule_check($uid,$cd_rule)!=1){
			$this->error('没有权限禁止操作！！！');
		}
		/*--------wcd权限判断---------*/
		$product=new ProductModel();
		$this->pro_list=$product->p_lists();
		$this->display();
	}
	/** 删除产品 */
	public function del_pro($id){
		/*--------wcd权限判断---------*/
		//获取当前模块名称
		$contro=CONTROLLER_NAME;
		//获取当前操作名称
		$actio=ACTION_NAME;
		//获取当前访问规则
		$cd_rule="Home/".$contro."/".$actio;
		$uid = UID;
		if($this::cd_rule_check($uid,$cd_rule)!=1){
			$this->error('没有权限禁止操作！！！');
		}
		/*--------wcd权限判断---------*/
		if (!IS_ROOT){ //非超管
		   $this->error('您没有权限，不能进行此操作！');
		}
		$product=new ProductModel();
		$flag=$product->where("id=$id")->setField('status','-1');
		if($flag==1){	$this->success('删除成功！');
		}else{	$this->error('删除失败！');}
	}
	/** 跳转到添加产品页面 */
	public function ad_pro_from(){
		/*--------wcd权限判断---------*/
		//获取当前模块名称
		$contro=CONTROLLER_NAME;
		//获取当前操作名称
		$actio=ACTION_NAME;
		//获取当前访问规则
		$cd_rule="Home/".$contro."/".$actio;
		$uid = UID;
		if($this::cd_rule_check($uid,$cd_rule)!=1){
			$this->error('没有权限禁止操作！！！');
		}
		/*--------wcd权限判断---------*/
		if (!IS_ROOT){ //非超管
		   $this->error('您没有权限，不能进行此操作！',U('Product/pro_list'));
		}else{
		$this->display();
		}
	}
	/** 添加产品 */
	public function ad_pro(){
		if (!IS_ROOT){ //非超管
		   $this->error('您没有权限，不能进行此操作！');
		}
		$data['name']=$_POST['name'];
		$product=new ProductModel();
		$flag=$product->add($data);
		if($flag==0){	$this->error('添加失败！');
		}else{	$this->success('添加成功！');}
	}
	/** 修改产品详情 */
	public function up_info($id){
<<<<<<< HEAD
// 		/*--------wcd权限判断---------*/
// 		//获取当前模块名称
// 		$contro=CONTROLLER_NAME;
// 		//获取当前操作名称
// 		$actio=ACTION_NAME;
// 		//获取当前访问规则
// 		$cd_rule="Home/".$contro."/".$actio;
// 		$uid = UID;
// 		if($this::cd_rule_check($uid,$cd_rule)!=1){
// 			$this->error('没有权限禁止操作！！！');
// 		}
// 		/*--------wcd权限判断---------*/
=======
		/*--------wcd权限判断---------*/
		//获取当前模块名称
		$contro=CONTROLLER_NAME;
		//获取当前操作名称
		$actio=ACTION_NAME;
		//获取当前访问规则
		$cd_rule="Home/".$contro."/".$actio;
		$uid = UID;
		if($this::cd_rule_check($uid,$cd_rule)!=1){
			$this->error('没有权限禁止操作！！！');
		}
		/*--------wcd权限判断---------*/
>>>>>>> ef0add2d1cd09f4bc251842f1eca6e0044df7d75
		$map['name']=$_POST['name'];
		$product=new ProductModel();
		$flag=$product->where("status=1 AND id=$id")->save($map);
		if($flag==1){	$this->success('修改成功！');
		}else{	$this->error('修改失败！');}
	}
	/** 指定产品的详情信息  */
	public function pro_info($id){
		if (!IS_ROOT){ //非超管
		   $this->error('您没有权限，不能进行此操作！');
		}
		$product=new ProductModel();
		$this->proinfo=$product->where("status=1 AND id=$id")->find();
		$this->display();
	}
	/** 禁用 */
	public function stop($id){
		/*--------wcd权限判断---------*/
		//获取当前模块名称
		$contro=CONTROLLER_NAME;
		//获取当前操作名称
		$actio=ACTION_NAME;
		//获取当前访问规则
		$cd_rule="Home/".$contro."/".$actio;
		$uid = UID;
		if($this::cd_rule_check($uid,$cd_rule)!=1){
			$this->error('没有权限禁止操作！！！');
		}
		/*--------wcd权限判断---------*/
		$product=new ProductModel();
		$flag=$product->where("id=$id")->setField("status","0");
		if($flag==1){ $this->success('成功');}
		else{ $this->error('失败');}
	}
	/** 启用 */
	public function star($id){
		/*--------wcd权限判断---------*/
		//获取当前模块名称
		$contro=CONTROLLER_NAME;
		//获取当前操作名称
		$actio=ACTION_NAME;
		//获取当前访问规则
		$cd_rule="Home/".$contro."/".$actio;
		$uid = UID;
		if($this::cd_rule_check($uid,$cd_rule)!=1){
			$this->error('没有权限禁止操作！！！');
		}
		/*--------wcd权限判断---------*/
		$product=new ProductModel();
		$flag=$product->where("id=$id")->setField("status","1");
		if($flag==1){ $this->success('成功');}
		else{ $this->error('失败');}
	}	
}