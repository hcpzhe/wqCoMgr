<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
use Home\Model\ConfigModel;
class ConfigController extends HomeBaseController{
	//配置列表
	public function config_list(){
		if (!IS_ROOT){ //非超管
			$this->error('您没有权限，不能进行此操作！');
		}
		$model = new ConfigModel();
		$list=$model->lists();
		$this->assign('list',$list);	
		$this->display();
	}
	//配置信息更新
	public function update(){
 		$id = (int)I('id');
		$model = new ConfigModel();
		$list=$model->where("id=$id")->select();
		$this->assign('id',$id);
		$this->assign('list',$list);
		$this->display();
	}
	//配置信息更新提交
	public function config_up(){
		$id = (int)I('id');
		$data['value'] = I('param.values');  //配置值
		$data['update_time'] = time();         //更新时间
		$model = new ConfigModel();
		$flag=$model->update($id,$data);
		if($flag==1){ $this->success('更新成功！',U('Config/config_list'));}
		else{ $this->error('更新失败',U('Config/config_list'));}
	}
	//配置信息添加
	public function add(){	
		//print_r(C('DB_CONFIG_DATA'));exit();
		$this->display();
	}
	//配置信息添加提交
	public  function insert(){
		$data['name']  = I('param.name');
		$data['title'] = I('param.title');
		$data['value'] = I('param.value');
		$data['remark'] = I('param.remark');
		$model = new ConfigModel();
	//print_r(C('WEB_SITE_TITLE'));exit();
		$data = $model->create();
		$res=$model->add($data);
		if ($res){
			$this->success('添加成功！',U('Config/config_list'));
		}else {
			$this->error('添加失败！',U('Config/config_list'));
		}
	}
	//配置信息删除
	public function del(){
		$id = (int)I('id');
		$model = M("Config");
        $flag=$model->where('id='.$id)->delete();  //删除配置信息
        if ($flag==1){
        	$this->success('删除成功',U('Config/config_list'));
        }else {
        	$this->error('删除失败',U('Config/config_list'));
        }
	}
}