<?php

namespace app\api\controller;

use app\base\controller\Base;
use app\base\service\Common;
use app\api\model\User as ModelUser;
use app\api\model\Agent as ModelAgent;

class User extends Base
{
    public function login()
    {
        $username = $this->req('username');
        $password = $this->req('password');
        $uid = ModelUser::where('username', $username)->where('password', $password)->value('id');
        if (!$uid) Common::res(['code' => 1, 'msg' => '用户名或密码错误']);
        // 生成token
        $token = Common::setSession($uid);
        // 设置最后登录时间
        ModelUser::where('id', $uid)->update(['least_login' => date('Y-m-d H:i:s')]);
        Common::res(['data' => [
            'token' => $token,
        ]]);
    }

    public function info()
    {
        $this->getUser();
        $user = ModelUser::where('id', $this->uid)->find();
        $role = array_column(config('index')['enum']['role'], 'roleCode', 'id');
        $agent = ModelAgent::where('id', $user['agent'])->find();
        Common::res(['data' => [
            'roles' => [$role[$user['role']]],
            'avatar' => $user['avatar'],
            'name' => $user['realname'],
            'agent' => $agent
        ]]);
    }

    public function list()
    {
        $page = $this->req('page');
        $size = $this->req('size');

        $res['list'] = ModelUser::where('1=1')->order('create_time desc')->page($page, $size)->select();
        $res['total'] = ModelUser::where('1=1')->count();

        Common::res(['data' => $res]);
    }

    public function save()
    {
        $form = $this->req('form');
        ModelUser::create($form);
        Common::res();
    }
}
