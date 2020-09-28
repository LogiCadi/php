<?php


namespace app\api\model;

use app\cmcc\service\Api;
use think\Db;
use think\Model;

class Agent extends Model
{
    public function meal()
    {
        return $this->hasMany('Meal', 'down_agent_id', 'id');
    }

    /** 卡激活操作 */
    public static function cardActive($orderInfo)
    {
        $card = Card::where('id', $orderInfo['card_id'])->find();
        $meal = Meal::where('id', $orderInfo['meal_id'])->find();

        // 分润层级
        $tier = json_decode(CardMeal::where('card_id', $orderInfo['card_id'])->where('meal_id', $orderInfo['meal_id'])->value('tier'), true);
        // 按cost排序
        foreach ($tier as $key => $value) {
            $sort[$key] = $value['cost'];
        }
        array_multisort($tier, SORT_ASC, $sort);

        $curPrice = $meal['meal_price'];
        foreach ($tier as $key => $value) {
            $cur = array_pop($tier);

            $shareprofit = $curPrice - $cur['cost'];
            if ($shareprofit < 0) $shareprofit = 0;
            $agent = $cur['agent_id'];

            Agent::where('id', $agent)->update(['shareprofit' => Db::raw('shareprofit+' . $shareprofit)]);

            $curPrice = $cur['cost'];
        }

        // 卡变成已激活
        Card::where('id', $orderInfo['card_id'])->update(['card_status' => 1, 'first_active_time' => date('Y-m-d H:i:s')]);
        // 开启允许实名权限
        (new Api)->realname($card['business_code'], 1);
    }
}
