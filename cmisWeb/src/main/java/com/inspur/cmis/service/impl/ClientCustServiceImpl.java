package com.inspur.cmis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.ClientCustMapper;
import com.inspur.cmis.pojo.ClientCustExt;
import com.inspur.cmis.service.ClientCustService;

@Service("clientCustService")
public class ClientCustServiceImpl implements ClientCustService {
	@Autowired
	private ClientCustMapper clientCustMapper;

	@Override
	public List<ClientCustExt> finceStatByMgr() {
		return clientCustMapper.finceStatByMgr();
	}	
}