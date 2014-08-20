<?php
namespace Common\Controller;
use Think\Controller;
use Home\Model\ConfigModel;

abstract class HomeBaseController extends Controller {
	
	protected function _initialize() {
        define('UID',is_login());
        if( !UID ){// 还没登录 跳转到登录页面
            $this->redirect('Home/Common/login');
        }
        
		$model = new ConfigModel();
		$model->loadConfig();
		
		define('IS_ROOT',   is_administrator());
		
		// 检测访问权限
		$access =   $this->accessControl();
		if ( $access === false ) {
			$this->error('403:禁止访问');
		}elseif( $access === null ) {
			//检测非动态权限
			$rule  = strtolower(MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME);
			if ( !$this->checkRule($rule,array('in','1,2')) ) {
				$this->error('未授权访问!');
			}
		}
	}

	/**
	 * action访问控制,在 **登陆成功** 后执行的第一项权限检测任务
	 *
	 * @return boolean|null  返回值必须使用 `===` 进行判断
	 *
	 *   返回 **false**, 不允许任何人访问(超管除外)
	 *   返回 **true**, 允许任何管理员访问,无需执行节点权限检测
	 *   返回 **null**, 需要继续执行节点权限检测决定是否允许访问
	 */
	final protected function accessControl(){
		if(IS_ROOT){
			return true;//管理员允许访问任何页面
		}
		$allow = C('ALLOW_VISIT');
		$deny  = C('DENY_VISIT');
		$check = strtolower(CONTROLLER_NAME.'/'.ACTION_NAME);
		if ( !empty($deny)  && in_array_case($check,$deny) ) {
			return false;//非超管禁止访问deny中的方法
		}
		if ( !empty($allow) && in_array_case($check,$allow) ) {
			return true;
		}
		return null;//需要检测节点权限
	}

	/**
	 * 权限检测
	 * @param string  $rule	检测的规则
	 * @param string  $mode	check模式
	 * @return boolean
	 */
	final protected function checkRule($rule, $type, $mode='url'){
		if(IS_ROOT){
			return true;//管理员允许访问任何页面
		}
		static $Auth = null;
		if (!$Auth) {
			$Auth = new \Think\Auth();
		}
		if(!$Auth->check($rule,UID,$type,$mode)){
			return false;
		}
		return true;
	}
}