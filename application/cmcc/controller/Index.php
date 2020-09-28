<?php

namespace app\cmcc\controller;

use app\base\service\Common;
use app\cmcc\service\Api;
use think\Controller;
use think\Log;

class Index extends Controller
{


    public function index()
    {
        return (new Api)->realname(17244150588, 2);
    }
}
