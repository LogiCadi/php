<?php

namespace app\api\controller;

use app\api\model\Package as ModelPackage;
use app\base\controller\Base;
use app\base\service\Common;

class Package extends Base
{
    public function list()
    {
        $page = $this->req('page');
        $size = $this->req('size');

        $res['list'] = ModelPackage::where('1=1')->order('create_time desc')->page($page, $size)->select();
        $res['total'] = ModelPackage::where('1=1')->count();

        Common::res(['data' => $res]);
    }

    public function save()
    {
        $form = $this->req('form');

        ModelPackage::create($form);

        Common::res();
    }
}
