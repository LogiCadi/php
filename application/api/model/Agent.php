<?php


namespace app\api\model;

use think\Model;

class Agent extends Model
{
    public function meal()
    {
        return $this->hasMany('Meal', 'down_agent_id', 'id');
    }
    
}
