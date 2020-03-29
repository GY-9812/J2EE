package com.inspur.cmis.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.inspur.cmis.pojo.ClientManager;

public interface ClientMgrMapper {
	public List<ClientManager> getClientMgrList(HashMap<String, Object> map);
	public void addMgr(ClientManager clientMgr);
	public ClientManager getClientMgr(String mgrId);
	public void deleteMgr(String cmId[]);
}
