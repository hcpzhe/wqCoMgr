<?php
namespace Home\Controller;
use Think\Controller;
use Home\Model\ConfigModel;
use Home\Model\UserModel;
use Think\Verify;

/**
 * 免登录控制器
 * @author RockSnap <hdszhe@hotmail.com>
 */
class CommonController extends Controller {
	
	protected function _initialize() {
    	$model = new ConfigModel();
    	$model->loadConfig();
	}
	
	public function _empty() {
		$this->redirect('Index/index');
	}
	
	/**
	 * 登录页面 , 登录提交接口
	 * @param string $account 帐号
	 * @param string $password 密码
	 * @param string $verify 验证码
	 */
	public function login($account = null, $password = null, $verify = null) {
        if(IS_POST){
        	//登录提交
			if(empty($account)) {
				$this->error('帐号错误！');
				//$this->success('登录成功', U('Common/login') );
			}elseif (empty($password)) {
				$this->error('密码必须！');
			}
			$code = $_POST['verify'];
			 //检测验证码
			$verify = new \Think\Verify();
			if (!$verify->check($code, 4)) {//验证码编号为1
				$this->error('验证码输入错误！', U('Common/login'));
			}
			
			
            //验证用户
			$map = array();
			$map['account']	= $account;
			$map["status"]	= 1; //-1:删除 0:禁用 1:正常
			$map['password'] = $password;
			$map['verify'] = $verify;
            $User = new UserModel();
            if (!$User->login($map)) {
            	$this->error('输入信息有误，请重新填写！', U('Common/login')); //登录验证失败
            }
            $this->success('登录成功', U('Index/index') );
        } else {
        	//登录页面
            if(is_login()){
                $this->redirect('Index/index');
            }else{
                $this->display();
            }
        }
	}
	
	/**
	 * 注销接口
	 */
	function logout() {
        if(is_login()) {
            D('User')->logout();
            session('[destroy]');
            $this->success('退出成功！', U('login'));
        } else {
            $this->success('已经退出！', U('login'));
        }
	}
	
	/**
	 * 验证码接口
	 */
    public function verify() {
		$verify = new \Think\Verify();
		$verify->fontSize = 30;
		$verify->length   = 4;
		$verify->useNoise = true;
		$verify->useCurve = false;
		
// 		$verify->entry();
// 		$verify->fontttf = '4.ttf';
        $verify->entry(4);//验证码编号为1
    }

}