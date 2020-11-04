<?php

namespace app\api\controller;

use app\base\controller\Base;
use app\base\service\Common;
use app\base\service\WxAPI;

class Config extends Base
{
    public function index()
    {
        Common::res(['data' => config('index')]);
    }

    public function upload()
    {
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('file');

        // 移动到框架应用根目录/public/uploads/ 目录下
        if ($file) {
            $savePath = ROOT_PATH . 'public' . DS . 'uploads';
            $info = $file->move($savePath);
            if ($info) {
                // 成功上传
                $fileName = $info->getSaveName();
                // $filePath = $savePath . DS . $fileName;
                // $result = (new WxAPI)->uploadimg($filePath);
                // unlink($filePath);
                Common::res([
                    'data' => [
                        'url' => $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'] . '/uploads/' . $fileName,
                        // 'url' => $result['url']
                    ]
                ]);
            } else {
                // 上传失败
                Common::res([
                    'code' => 1,
                    'msg' =>  $file->getError(),
                ]);
            }
        }
    }

    /** 二维码/条码识别 */
    public function qrcodeCV()
    {
        $imgUrl = $this->req('imgUrl');
        $res = (new WxAPI)->qrcodeCV($imgUrl);
        Common::res(['data' => $res['code_results']]);
    }

    public function getSignature()
    {
        $vars = [
            'noncestr' => Common::getRandCode(),
            'jsapi_ticket' => (new WxAPI)->getJsapiTicket(),
            'timestamp' => time(),
            'url' => $this->req('url')
        ];

        ksort($vars);
        $sign = [];
        foreach ($vars as $key => $value) {
            $sign[] = $key . '=' . $value;
        }
        $sign = implode('&', $sign);
        $sign = sha1($sign);

        Common::res(['data' => [
            'appId' => config('private')['gzh_appid'], // 必填，公众号的唯一标识
            'timestamp' => $vars['timestamp'], // 必填，生成签名的时间戳
            'nonceStr' => $vars['noncestr'], // 必填，生成签名的随机串
            'signature' => $sign, // 必填，签名
        ]]);
    }
}
