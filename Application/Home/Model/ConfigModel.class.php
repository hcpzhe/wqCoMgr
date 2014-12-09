<?php

namespace Home\Model;
use Think\Model;
/**
 * 配置模型
 */

class ConfigModel extends Model {
    protected $_validate = array(
        array('name', 'require', '标识不能为空', self::EXISTS_VALIDATE, 'regex', self::MODEL_BOTH),
        array('name', '', '标识已经存在', self::VALUE_VALIDATE, 'unique', self::MODEL_BOTH),
        array('title', 'require', '名称不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
    );

    protected $_auto = array(
        array('name', 'strtoupper', self::MODEL_BOTH, 'function'),
        array('create_time', NOW_TIME, self::MODEL_INSERT),
        array('update_time', NOW_TIME, self::MODEL_BOTH),
        array('status', '1', self::MODEL_BOTH),
    );
	
    /**
     * 载入数据库中的配置
     * @return NULL
     */
    public function loadConfig() {
    	$config =   S('DB_CONFIG_DATA');
    	if(!$config) {
    		$config = $this->lists();
    		S('DB_CONFIG_DATA',$config);
    	}
    	C($config); //添加配置
    	return null;
    }
    
    /**
     * 获取配置列表
     * @return array 配置数组
     */
    public function lists(){
        $map    = array('status' => 1);
        $data   = $this->where($map)->field('id,type,name,title,value,update_time')->select();
        
//         $config = array();
//         if($data && is_array($data)){
//             foreach ($data as $value) {
//                 $config[$value['name']] = $this->parse($value['type'], $value['value']);
//             }
//         }
        return $data;
    }

    /**
     * 根据配置类型解析配置
     * @param  integer $type  配置类型
     * @param  string  $value 配置值
     */
    private function parse($type, $value){
        switch ($type) {
            case 3: //解析数组
                $array = preg_split('/[,;\r\n]+/', trim($value, ",;\r\n"));
                if(strpos($value,':')){
                    $value  = array();
                    foreach ($array as $val) {
                        list($k, $v) = explode(':', $val);
                        $value[$k]   = $v;
                    }
                }else{
                    $value =    $array;
                }
                break;
        }
        return $value;
    }
	
    /**
     * 配置更新
     * TODO 数据更新成功后, 要清除DB_CONFIG_DATA缓存
     */
    public function update($id, $data) {
    	
    	$flag=$this->where("id=$id")->save($data);
    	
    	S('DB_CONFIG_DATA',NULL);
    	return $flag;
    }
}
