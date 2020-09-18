<?php


namespace app\api\model;

use app\base\service\Common;
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

    /** 
     * 获取卡ID集合
     */
    public static function getIDs($query)
    {
        $select = self::where('1=1');
        // 根据业务号码区段查询
        if (isset($query['business_code_start']) && isset($query['business_code_end'])) {
            $select = $select->where('business_code', 'between', [$query['business_code_start'], $query['business_code_end']]);
        }

        if (isset($query['batch'])) {
            $select = $select->where('batch', $query['batch']);
        }

        // 根据所属代理商查询
        if (isset($query['agent']) && $query['agent']) {
            $select = $select->where('agent', $query['agent']);
        }

        return $select->column('id');
    }
}
