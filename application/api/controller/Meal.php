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
        $words = $this->req('words');

        $query = ModelMeal::where('1=1')->order('create_time desc');
        // 分页查询
        if ($page && $size) $query = $query->page($page, $size);
        // name模糊查询
        if ($words) $query = $query->where('name', 'like', '%' . $words . '%');
        $res['list'] = $query->select();
        // 总数据量
        $res['total'] = $query->count();

        Common::res(['data' => $res]);
    }

    public function save()
    {
        $form = $this->req('form');

        ModelMeal::create($form);

        Common::res();
    }
}
