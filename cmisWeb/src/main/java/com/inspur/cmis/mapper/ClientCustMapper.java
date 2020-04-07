package com.inspur.cmis.mapper;

import java.util.List;

import com.inspur.cmis.pojo.ClientCustExt;


public interface ClientCustMapper {
    /*
     * 统计每个客户经理名下营销客户的资金情况
     */
	public List<ClientCustExt> finceStatByMgr();
}