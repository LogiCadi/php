<?php

namespace app\api\controller;

use app\api\model\Card;
use app\api\model\Meal;
use app\api\model\Order as ModelOrder;
use app\base\controller\Base;
use app\base\service\Common;

class Order extends Base
{

    public function list()
    {

        $page = $this->req('page', 1);
        $size = $this->req('size', 10);

        $res['list'] = ModelOrder::where('1=1')->page($page, $size)->order('create_time desc')->select();
        foreach ($res['list'] as &$value) {
            $info = json_decode($value['info'], true);
            $value['card'] = Card::get($info['card_id']);
            $value['meal'] = Meal::get($info['meal_id']);
        }


        $res['total'] = ModelOrder::where('1=1')->count();

        Common::res(['data' => $res]);
    }
}
