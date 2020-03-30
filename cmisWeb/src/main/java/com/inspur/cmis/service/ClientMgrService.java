package com.inspur.cmis.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.ClientManager;
@Resource
public interface ClientMgrService {
	public List<ClientManager> getClientMgrList(HashMap<String, Object> map);
	public void addMgr(ClientManager clientMgr);
	public ClientManager getClientMgr(String cmid);
	public void deleteMgr(String cmid[]);
	public ClientManager getClientMgrByCmid(int key);
	public void updateClientMgr(ClientManager mgr);
	//导入
	public void importClientMgrList(List<ClientManager> clientMgrList);
	
	//报表
	public List<ClientManager> getStatList(HashMap<String, Object> map);
}