<?php

namespace app\api\controller;

use app\api\model\Agent as ModelAgent;
use app\base\controller\Base;
use app\base\service\Common;

class Agent extends Base
{
    public function list()
    {
        $page = $this->req('page');
        $size = $this->req('size');

        $res['list'] = ModelAgent::where('1=1')->order('create_time desc')->page($page, $size)->select();
        $res['total'] = ModelAgent::where('1=1')->count();

        Common::res(['data' => $res]);
    }

    public function save()
    {
        $form = $this->req('form');

        ModelAgent::create($form);

        Common::res();
    }
}
