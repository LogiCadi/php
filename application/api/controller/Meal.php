<?php

namespace app\api\controller;

use app\api\model\Card as ModelCard;
use app\api\model\CardMeal;
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

    public function bind()
    {
        $form = $this->req('form');

        $cardIds = ModelCard::getIDs($form);

        $insert = [];
        $meal_options = ['year', 'half_year', 'season', 'month'];
        foreach ($cardIds as $id) {
            foreach ($meal_options as $type) {
                if (isset($form[$type])) $insert[] = ['card_id' => $id, 'meal_id' => $form[$type], 'time_type' => $type];
            }
        }
        $res = (new CardMeal)->saveAll($insert);
        Common::res(['data' => $res]);
    }
}
