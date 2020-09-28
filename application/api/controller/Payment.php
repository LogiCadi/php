<?php

namespace app\api\controller;

use app\api\model\Agent;
use app\api\model\Card;
use app\api\model\Meal;
use app\api\model\Order;
use app\base\controller\Base;
use app\base\service\Common;
use think\Db;
use think\Log;

class Payment extends Base
{

    public function order()
    {
        $openid = $this->req('openid');
        $card_id = $this->req('card_id');
        $meal_id = $this->req('meal_id');

        // 生成订单
        $orderId = date('YmdHis') . mt_rand(1000, 9999);
        $totalFee = Meal::where('id', $meal_id)->value('meal_price');
        Order::create([
            'id' => $orderId,
            'total_fee' => $totalFee,
            'info' => json_encode([
                'card_id' => $card_id,
                'meal_id' => $meal_id
            ]),
            'create_time' => date('Y-m-d H:i:s')
        ]);

        $url = 'https://api.mch.weixin.qq.com/pay/unifiedorder';
        // 商户号
        $mch_id = config('private')['mch_id'];
        // apikey
        $apikey = config('private')['apikey'];
        // 公众号appid
        $appid = config('private')['gzh_appid'];
        $params = [
            'appid' => $appid,
            'mch_id' => $mch_id,
            'nonce_str' => Common::getRandCode(), // 随机字符串
            'body' => '开宗源泉-充值', // 商品描述
            'out_trade_no' => $orderId, // 商户订单号
            'total_fee' => $totalFee * 100, // 总金额 单位 分
            'spbill_create_ip' => $_SERVER['REMOTE_ADDR'],
            'notify_url' => 'https://' . $_SERVER['HTTP_HOST'] . '/api/payment/notify',
            'trade_type' => 'JSAPI',
            'openid' => $openid
        ];

        // 签名
        $params['sign'] = Common::makeSign($params, $apikey);
        // 发送请求
        $xml = Common::toXml($params);
        $resXML = Common::request($url, $xml);
        $res = Common::fromXml($resXML);

        if (isset($res['result_code']) && $res['result_code'] == 'SUCCESS') {
            // JSAPI支付
            $returnData = [
                'appId' => $appid,
                'timeStamp' => (string) time(),
                'nonceStr' => $res['nonce_str'],
                'package' => 'prepay_id=' . $res['prepay_id'],
                'signType' => 'MD5',
            ];
            $returnData['paySign'] = Common::makeSign($returnData, $apikey);

            Common::res(['data' => $returnData]);
        } else {
            // 支付异常
            Common::res(['code' => 600, 'data' => $res]);
        }
    }

    public function notify()
    {
        //接收微信返回的数据数据,返回的xml格式
        $xmlData = file_get_contents('php://input');
        $data = Common::fromXml($xmlData);
        if ($data['result_code'] != 'SUCCESS') return;

        $sign = $data['sign'];
        unset($data['sign']); // 剔除sign再校验
        $apikey = config('private')['apikey'];
        if ($sign != Common::makeSign($data, $apikey)) return;

        Order::where('id', $data['out_trade_no'])->update(['pay_time' => $data['time_end']]);

        $orderInfo = json_decode(Order::where('id', $data['out_trade_no'])->value('info'), true);
        Agent::cardActive($orderInfo);

        die('<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>');
    }
}
