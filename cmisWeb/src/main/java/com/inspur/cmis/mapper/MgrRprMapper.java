package com.inspur.cmis.mapper;

import java.util.HashMap;
import java.util.List;

import com.inspur.cmis.pojo.MgrRpr;
import com.inspur.cmis.pojo.User;

public interface MgrRprMapper {
	public List<MgrRpr> getMgrRprList(HashMap<String, Object> map);
	public String getUserByName(String aPerson);
	public void addMgrRpr(MgrRpr rpr);
	public List<MgrRpr> getRprByKey(int cmKey);
	public void updateMgrRpr(MgrRpr rpr);
	public void deleteMgrRpr(int keys[]);
}
