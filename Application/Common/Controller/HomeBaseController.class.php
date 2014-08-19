<?php
namespace Common\Controller;
use Think\Controller;
use Home\Model\ConfigModel;

abstract class HomeBaseController extends Controller {
	
	protected function _initialize() {
    	$config =   S('DB_CONFIG_DATA');
    	if(!$config) {
    		$model = new ConfigModel();
    		$config = $model->lists();
    		S('DB_CONFIG_DATA',$config);
    	}
    	C($config); //TODO 添加配置
    	
    	//TODO 权限验证
    	
	}
	
}