<?php

namespace app\base\service;

use app\base\model\Appinfo;
use app\base\model\Wx;

/**服务端wx接口 */
class WxAPI
{
    public function __construct()
    {
        $this->access_token = Wx::where('id', 1)->value('access_token');
    }

    /**
     * 检查更新accessToken
     * @return string access_token
     */
    public function refreshAccessToken()
    {
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET';
        $url = str_replace('APPID', config('private')['gzh_appid'], $url);
        $url = str_replace('APPSECRET', config('private')['gzh_secret'], $url);

        $res = Common::request($url);
        if (isset($res['access_token'])) {
            // 将新的token保存到数据库
            Wx::where('id', 1)->update([
                'access_token' => $res['access_token']
            ]);
            $this->access_token = $res['access_token'];
        }
    }

    public function request($originUrl, $data = false)
    {
        $url = str_replace('ACCESS_TOKEN', $this->access_token, $originUrl);
        $res = Common::request($url, $data);
        if ($res['errcode'] === 40001) {
            $this->refreshAccessToken();
            $url = str_replace('ACCESS_TOKEN', $this->access_token, $originUrl);
            $res = Common::request($url, $data);
        }

        return $res;
    }

    /** 二维码/条码识别接口 */
    public function qrcodeCV($imgUrl)
    {
        $url = "https://api.weixin.qq.com/cv/img/qrcode?img_url=ENCODE_URL&access_token=ACCESS_TOKEN";
        $url = str_replace('ENCODE_URL', urlencode($imgUrl), $url);

        $res = $this->request($url, true);
        return $res;
    }
}
