<?php

namespace app\cmcc\service;

use app\base\service\Common as ServiceCommon;

class Common
{
    public $appkey = 'vl306d2sp8';
    public $appsecret = 'a3ec023fc4f32735decdc027e93966ec';
    public $groupCode = '2004961488';

    public $url = 'https://api.iot.gd.chinamobile.com/openapi/router';

    public function getSign($vars)
    {
        $sign = '';
        // 1、	所有请求参数按参数名升序排序
        ksort($vars);
        // 2、	按请求参数名及参数值相互连接组成一个字符串
        foreach ($vars as $key => $value) {
            $sign .= $key . $value;
        }
        // 3、将应用密钥分别添加到以上请求参数串的头部和尾部：<secret><请求参数字符串><secret>
        $sign = $this->appsecret . $sign . $this->appsecret;
        // 4、对该字符串进行SHA1 运算，得到一个二进制数组
        $sign = strtoupper(sha1($sign));
        return $sign;
    }

    public function getTransID()
    {
        // 报文流水号，一共31位，构成：10位集团编码+17位到毫秒的时间戳+4位随机数字
        return $this->groupCode . date('YmdHis') . mt_rand(1000000, 9999999);
    }

    public function getUrl($url, $params)
    {
        $vars = array_merge([
            'appKey' => $this->appkey,
            'format' => 'json',
            'v' => '3.0',
            'transID' => $this->getTransID(),
        ], $params);
        $vars['sign'] = $this->getSign($vars);

        return $url . '?' . http_build_query($vars);
    }

    //des解密（cbc模式）
    public function decrypt($data, $key)
    {
        $data    = base64_decode($data);
        $decData = openssl_decrypt($data, 'DES-EDE3', $key, OPENSSL_RAW_DATA);
        return $decData;
    }

    public function request($method, $params)
    {
        $url = $this->getUrl($this->url, array_merge([
            'method' => $method,
        ], $params));

        $res = ServiceCommon::request($url);
        return $this->decrypt($res, substr($this->appsecret, 0, 24));
    }
}
