<?php


namespace app\api\model;

use think\Model;

class Card extends Model
{

    public static function getCSV(&$csv)
    {
        $file = fopen($csv, 'r');
        while (!feof($file)) {
            $csvList[] = fgetcsv($file);
        }
        fclose($file);
        // 去除标题row
        unset($csvList[0]);
        return $csvList;
    }

    /**获取最新卡批次 */
    public static function getNewBatch()
    {
        $curMaxBatchStr = self::where('1=1')->order('batch desc')->value('batch');
        if (!$curMaxBatchStr) {
            return date('Ymd') . '-0001';
        } else {
            $batchNum = (int) explode('-', $curMaxBatchStr)[1];
            $newBatchNum = str_pad($batchNum + 1, 4, "0", STR_PAD_LEFT);
            return date('Ymd') . '-' . $newBatchNum;
        }
    }
}
