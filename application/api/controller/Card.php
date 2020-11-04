<?php

namespace app\api\controller;

use app\api\model\Agent;
use app\api\model\Card as ModelCard;
use app\api\model\CardMeal;
use app\api\model\Meal;
use app\api\model\MealAgentCost;
use app\api\model\User;
use app\base\controller\Base;
use app\base\service\Common;
use app\cmcc\service\Api;
use app\index\model\User as ModelUser;
use think\Db;

class Card extends Base
{
    /** 卡列表 */
    public function cardList()
    {
        // 排序
        $sortProp = $this->req('sortProp');
        $sortOrder = $this->req('sortOrder');
        $order = 'create_time desc';
        if ($sortOrder) $order = $sortProp . ' ' . $sortOrder . ',' . $order;

        $query = ModelCard::where('1=1')->order($order);

        // 过滤
        $business_code = $this->req('business_code');
        if ($business_code) {
            $query = $query->where('business_code', $business_code);
        }
        $iccid = $this->req('iccid');
        if ($iccid) {
            $query = $query->where('iccid', $iccid);
        }
        $agent = $this->req('agent');
        if ($agent) {
            $query = $query->where('agent', $agent);
        }

        $page = $this->req('page');
        $size = $this->req('size'); 
        $res['list'] = $query->page($page, $size)->select();
        // 总计
        $res['total'] = $query->count();

        Common::res(['data' => $res]);
    }

    /** 新建卡片 */
    public function cardInput()
    {
        $this->getUser();

        $cardForm = $this->req('form');
        // 获取csv数组
        $csvList = ModelCard::getCSV($cardForm['csv']);
        // 去除csv文件
        unset($cardForm['csv']);
        // 生成卡批次
        $cardForm['batch'] = ModelCard::getNewBatch();

        foreach ($csvList as $row) {
            $dataList[] = array_merge($cardForm, [
                'business_code' => $row[0],
                'password' => $row[1],
                'iccid' => $row[2],
                'remarks' => $row[3],

                'agent' => 1,
            ]);
        }

        try {
            (new ModelCard)->saveAll($dataList);
        } catch (\Exception $th) {
            Common::res(['code' => 1, 'msg' => $th->getMessage()]);
        }

        Common::res();
    }

    /** 卡片数 */
    public function cardCount()
    {
        $form = $this->req('form');
        $ids = ModelCard::getIDs($form);
        Common::res(['data' => count($ids)]);
    }

    public function getMeals()
    {
        $this->getUser();
        $agent_id = ModelUser::where('id', $this->uid)->value('agent');
        $form = $this->req('form');
        // 卡划拨
        $ids = ModelCard::getIDs($form);

        if (!$ids) Common::res(['code' => 1, 'msg' => '未找到批次']);
        $id = $ids[0];

        $isExist = ModelCard::where('id', $id)->where('agent', $agent_id)->find();
        if (!$isExist) Common::res(['code' => 1, 'msg' => '该卡批不属于你的代理商']);

        $res = CardMeal::with('meal')->where('card_id', $id)->select();
        Common::res(['data' => [
            'meals' => $res,
            'count' => count($ids),
        ]]);
    }

    /** 卡片划拨 */
    public function cardAssign()
    {
        $form = $this->req('form');
        $meals = $this->req('meals');
        if (!$meals) Common::res(['code' => 1, 'msg' => '未设置套餐']);
        // 根据业务号段获取卡id的数组
        $ids = ModelCard::getIDs($form);
        if (!isset($form['to_agent'])) Common::res(['code' => 1, 'msg' => '请选择划拨目标']);
        ModelCard::where('id', 'in', $ids)->update(['agent' => $form['to_agent'], 'assign_status' => 1]);

        foreach ($meals as $meal) {
            if (!isset($meal['cost']) || !$meal['cost']) Common::res(['code' => 1, 'msg' => '请设置成本价格']);
            $cardMeal = CardMeal::where('id', $meal['id'])->find();
            $tier = json_decode($cardMeal['tier'], true);
            $tier[] = ['agent_id' => $form['to_agent'], 'cost' => (float) $meal['cost']];
            CardMeal::where('card_id', 'in', $ids)->where('meal_id', $cardMeal['meal_id'])->update([
                'tier' => json_encode($tier)
            ]);
        }

        Common::res(['data' => $ids]);
    }

    /** 根据id获取卡片详情 */
    public function getInfo()
    {
        $id = $this->req('id');
        $iccid = $this->req('iccid');
        if (!$id && !$iccid) Common::res(['code' => 1, 'msg' => '请填写iccid']);

        $query = ModelCard::where('1=1');
        if ($id) {
            $query = $query->where('id', $id);
        }
        if ($iccid) {
            $query = $query->where('iccid', $iccid);
        }
        $res = $query->find();

        $res['meals'] = CardMeal::with('meal')->where('card_id', $id)->select();
        Common::res(['data' => $res]);
    }

    /** 开启实名权限 */
    public function cardActive()
    {
        $business_code = $this->req('business_code');
        (new Api)->realname($business_code, 1);
        Common::res();
    }
}
