<?php


namespace app\api\model;

use think\Db;
use think\Model;

class Agent extends Model
{
    public function meal()
    {
        return $this->hasMany('Meal', 'down_agent_id', 'id');
    }

    /** 代理商获得分润值 */
    public static function increase_shareprofit($orderInfo)
    {
        // 代理商
        $agent = Card::where('id', $orderInfo['card_id'])->value('agent');
        if (!$agent) return;
        // 利润
        $meal = Meal::where('id', $orderInfo['meal_id'])->find();
        $earn = $meal['meal_price'] - $meal['meal_cost'];

        Agent::where('id', $agent)->update([
            'shareprofit' => Db::raw('shareprofit+' . $earn)
        ]);

        // 卡变成已激活
        Card::where('id', $orderInfo['card_id'])->update(['card_status' => 1, 'first_active_time' => date('Y-m-d H:i:s')]);
    }
}
