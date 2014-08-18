<?php
namespace Home\Controller;
use Think\Controller;
use Home\Model\ConfigModel;

abstract class BaseController extends Controller {
	
	protected function _initialize() {
    	$config =   S('DB_CONFIG_DATA');
    	
    	if(!$config) {
    		$model = new ConfigModel();
    		$config = $model->lists();
    		S('DB_CONFIG_DATA',$config);
    	}
		
    	C($config); //添加配置
    	dump(C());
	}
	
}