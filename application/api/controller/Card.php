<?php

namespace app\api\controller;

use app\api\model\Card as ModelCard;
use app\api\model\CardMeal;
use app\api\model\User;
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

    /** 卡片划拨 */
    public function cardAssign()
    {
        $form = $this->req('form');
        // 根据业务号段获取卡id的数组
        $ids = ModelCard::getIDs($form);
        if (!isset($form['to_agent'])) Common::res(['code' => 1, 'msg' => '请选择划拨目标']);
        ModelCard::where('id', 'in', $ids)->update(['agent' => $form['to_agent'], 'assign_status' => 1]);
        Common::res(['data' => $ids]);
    }

    /** 根据id获取卡片详情 */
    public function getInfo()
    {
        $id = $this->req('id');
        $res = ModelCard::where('id', $id)->find();

        $res['meals'] = CardMeal::with('meal')->where('card_id', $id)->select();
        Common::res(['data' => $res]);
    }
}
