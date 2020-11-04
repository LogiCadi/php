<?php

namespace app\base\service;

use app\base\model\Appinfo;
use app\base\model\Wx;

/**服务端wx接口 */
class WxAPI
{
    public function __construct()
    {
        $this->wx = Wx::where('id', 1)->find();
    }

    public function getAccessToken()
    {
        if ($this->wx['access_token_expire'] < time()) {
            $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET';
            $url = str_replace('APPID', config('private')['gzh_appid'], $url);
            $url = str_replace('APPSECRET', config('private')['gzh_secret'], $url);
            $res = Common::request($url);
            if ($res['access_token']) {
                $data = [
                    'access_token' => $res['access_token'],
                    'access_token_expire' => time() + $res['expires_in']
                ];
                Wx::where('id', 1)->update($data);
                $this->wx = array_merge((array)$this->wx, $data);
            }
        }
        return $this->wx['access_token'];
    }

    public function getJsapiTicket()
    {
        if ($this->wx['jsapi_ticket_expire'] < time()) {
            $url = 'https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi';
            $url = str_replace('ACCESS_TOKEN', $this->getAccessToken(), $url);
            $res = Common::request($url);
            if ($res['ticket']) {
                $data = [
                    'jsapi_ticket' => $res['ticket'],
                    'jsapi_ticket_expire' => time() + $res['expires_in']
                ];
                Wx::where('id', 1)->update($data);
                $this->wx = array_merge((array)$this->wx, $data);
            }
        }

        return $this->wx['jsapi_ticket'];
    }

    /** 二维码/条码识别接口 */
    public function qrcodeCV($imgUrl)
    {
        $url = "https://api.weixin.qq.com/cv/img/qrcode?img_url=ENCODE_URL&access_token=ACCESS_TOKEN";
        $url = str_replace('ACCESS_TOKEN', $this->getAccessToken(), $url);
        $url = str_replace('ENCODE_URL', urlencode($imgUrl), $url);

        $res = Common::request($url, true);
        return $res;
    }

    /** 上传图片至微信 */
    public function uploadimg($filePath)
    {
        $url = 'https://api.weixin.qq.com/cgi-bin/media/uploadimg?access_token=ACCESS_TOKEN';
        $url = str_replace('ACCESS_TOKEN', $this->getAccessToken(), $url);

        $data = ['media' => new \CURLFile($filePath, false, false)];
        $res = Common::request($url, $data);
        return $res;
    }
}
