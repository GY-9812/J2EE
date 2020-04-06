package com.inspur.cmis.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.MgrRpr;
@Resource
public interface MgrRprService {
	public List<MgrRpr> getMgrRprList(HashMap<String, Object> map);
	public String getUserByName(String aPerson);
	public void addMgrRpr(MgrRpr rpr);
	public List<MgrRpr> getRprByKey(int cmKey);
	public void updateMgrRpr(MgrRpr rpr);
	public void deleteMgrRpr(int keys[]);
}
