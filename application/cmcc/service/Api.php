<?php

namespace app\cmcc\service;

class Api
{

    /** 
     * 提供号码是否允许实名权限的控制，并提供该号码实名权限的查询。
     * @param String 号码
     * @param Int 1、允许实名 2、查询是否允许实名
     */
    public function realname($msisdn, $optType)
    {
        $method = 'triopi.member.realname.boss';
        return (new Common)->request($method, [
            'msisdn' => $msisdn,
            'optType' => $optType
        ]);
    }

    /**
     * 查询集团基本信息，包括成员数、各生命周期成员数等
     */
    public function groupInfo()
    {
        $method = 'triopi.group.info.query';
        return (new Common)->request($method, [
            'groupCode' => (new Common)->groupCode,
        ]);
    }
}
