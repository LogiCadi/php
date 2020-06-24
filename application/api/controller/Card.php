<?php

namespace app\api\controller;

use app\api\model\Card as ModelCard;
use app\base\controller\Base;
use app\base\service\Common;

class Card extends Base
{
    public function cardList()
    {
        $page = $this->req('page');
        $size = $this->req('size');

        $res['list'] = ModelCard::where('1=1')->order('create_time desc')->page($page, $size)->select();
        $res['total'] = ModelCard::where('1=1')->count();

        Common::res(['data' => $res]);
    }

    public function cardInput()
    {
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
            ]);
        }

        try {
            (new ModelCard)->saveAll($dataList);
        } catch (\Throwable $th) {
            Common::res(['code' => 1, 'msg' => $th->getMessage()]);
        }

        Common::res();
    }
}
