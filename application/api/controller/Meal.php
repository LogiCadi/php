<?php

namespace app\api\controller;

use app\api\model\Meal as ModelMeal;
use app\base\controller\Base;
use app\base\service\Common;

class Meal extends Base
{
    public function list()
    {
        $page = $this->req('page');
        $size = $this->req('size');

        $res['list'] = ModelMeal::where('1=1')->order('create_time desc')->page($page, $size)->select();
        $res['total'] = ModelMeal::where('1=1')->count();

        Common::res(['data' => $res]);
    }

    public function save()
    {
        $form = $this->req('form');

        ModelMeal::create($form);

        Common::res();
    }
}
