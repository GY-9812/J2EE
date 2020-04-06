package com.inspur.cmis.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.ClientMgrMapper;
import com.inspur.cmis.pojo.ClientManager;
import com.inspur.cmis.service.ClientMgrService;

@Service("clientMgrService")
public class ClientMgrServiceImpl implements ClientMgrService{
	@Autowired
	private ClientMgrMapper clientMgrMapper;

	@Override
	public List<ClientManager> getClientMgrList(HashMap<String, Object> map) {
		return clientMgrMapper.getClientMgrList(map);
	}

	@Override
	public void addMgr(ClientManager clientMgr) {
		clientMgrMapper.addMgr(clientMgr);
	}

	@Override
	public ClientManager getClientMgr(String cmid) {
		return clientMgrMapper.getClientMgr(cmid);
	}

	@Override
	public void deleteMgr(int[] cmid) {
		clientMgrMapper.deleteMgr(cmid);
	}

	@Override
	public ClientManager getClientMgrByCmid(int key) {
		return clientMgrMapper.getClientMgrByCmid(key);
	}

	@Override
	public void updateClientMgr(ClientManager mgr) {
		clientMgrMapper.updateClientMgr(mgr);
	}

	//导入
	@Override
	public void importClientMgrList(List<ClientManager> clientMgrList) {
		clientMgrMapper.importClientMgrList(clientMgrList);
	}

	//报表
	@Override
	public List<ClientManager> getStatList(HashMap<String, Object> map) {
		return clientMgrMapper.getStatList(map);
	}
}
