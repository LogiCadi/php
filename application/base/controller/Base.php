<?php

namespace app\base\controller;

use think\Controller;
use app\base\service\Common;
use app\api\model\User;
use think\Validate;

class Base extends Controller
{
    public function __construct()
    {
        parent::__construct();

        header('Access-Control-Allow-Origin:*');
        header('Content-Type:application/json');

        $version = input('version');
    }

    /**获取访问用户uid */
    protected function getUser()
    {
        $token = $this->req('token');
        if (!$token) Common::res(['code' => 200]);
        $this->uid = Common::getSession($token);
        if (!$this->uid) Common::res(['code' => 201]);
    }

    protected function getUserByUnionid()
    {
        $this->uid = User::where('unionid', input('unionid'))->value('id');
        if (!$this->uid) Common::res(['code' => 1, 'msg' => '不存在的用户']);
    }

    /**
     * 获取请求参数
     */
    protected function req($field, $default = null)
    {
        $params = json_decode(file_get_contents('php://input'), true);
        if (isset($params[$field])) {
            $value = $params[$field];
        } else {
            $value = $default;
        }

        return $value;
    }
}
