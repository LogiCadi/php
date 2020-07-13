<?php

namespace app\api\controller;

use app\api\model\Agent as ModelAgent;
use app\api\model\Meal;
use app\base\controller\Base;
use app\base\service\Common;

class Agent extends Base
{
    public function list()
    {
        $page = $this->req('page', 1);
        $size = $this->req('size', 20);

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

    /**获取分配给代理商的套餐 */
    public function getMealList()
    {
        $id = $this->req('id');

        $page = $this->req('page', 1);
        $size = $this->req('size', 20);

        $res['list'] = Meal::where('down_agent_id', $id)->order('create_time desc')->page($page, $size)->select();
        $res['total'] = Meal::where('down_agent_id', $id)->count();

        $res['agent_name'] = ModelAgent::where('id', $id)->value('name');

        Common::res(['data' => $res]);
    }
}
