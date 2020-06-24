<?php

namespace app\api\controller;

use app\base\controller\Base;
use app\base\service\Common;
use app\api\model\User as ModelUser;

class User extends Base
{
    public function login()
    {
        $username = $this->req('username');
        $password = $this->req('password');
        $uid = ModelUser::where('username', $username)->where('password', $password)->value('id');
        if (!$uid) Common::res(['code' => 1, 'msg' => '用户名或密码错误']);
        $token = Common::setSession($uid);
        Common::res(['data' => [
            'token' => $token,
        ]]);
    }

    public function info()
    {
        $this->getUser();
        $user = ModelUser::where('id', $this->uid)->find();
        Common::res(['data' => [
            'roles' => ['admin'],
            'avatar' => $user['avatar'],
            'name' => $user['name']
        ]]);
    }
}
