<?php


namespace app\api\model;

use think\Model;

class CardMeal extends Model
{
    public function meal()
    {
        return $this->belongsTo('Meal');
    }
}
