<?php

namespace app\api\controller;

use app\base\controller\Base;
use app\base\service\Common;

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
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
            if ($info) {
                // 成功上传
                Common::res([
                    'data' => [
                        'url' => 'http://' . $_SERVER['HTTP_HOST'] . '/uploads/' . $info->getSaveName()
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
}
