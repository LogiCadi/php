<?php

namespace app\base\model;

use think\Model;
use traits\model\SoftDelete;

class Base extends Model
{
    protected function setCreateTimeAttr($value)
    {
        return date('Y-m-d H:i:s', $value);
    }

    protected function setUpdateTimeAttr($value)
    {
        return date('Y-m-d H:i:s', $value);
    }
    protected function setDeleteTimeAttr($value)
    {
        return date('Y-m-d H:i:s', $value);
    }

    // 软删除
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    protected $update = ['delete_time'];
    // 隐藏字段
    protected $hidden = ['delete_time'];

    /**
     * 数据库清理
     * @param int $day   清除多少天之前的数据
     * @param int $count 条数
     */
    public static function clear($day = 30, $count = 10)
    {
        $clearTime = time() - 3600 * 24 * $day;
        static::where('1=1')->whereTime('create_time', '<', $clearTime)->limit($count)->delete(true);
    }
}
