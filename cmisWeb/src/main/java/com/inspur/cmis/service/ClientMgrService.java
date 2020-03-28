package com.inspur.cmis.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.inspur.cmis.pojo.ClientManager;
@Resource
public interface ClientMgrService {
	public List<ClientManager> getClientMgrList(HashMap<String, Object> map);
	public void addMgr(ClientManager clientMgr);
	public ClientManager getClientMgr(String cmid);
	public void deleteMgr(String cmid[]);
	public List<HashMap<String,Object>> exportExcel(HashMap<String, Object> map);
	public XSSFWorkbook exportExcelInfo(HashMap<String, Object> map) throws Exception;
}