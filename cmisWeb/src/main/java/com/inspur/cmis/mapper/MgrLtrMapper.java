package com.inspur.cmis.mapper;

import java.util.HashMap;
import java.util.List;

import com.inspur.cmis.pojo.MgrLtr;

public interface MgrLtrMapper {
	public List<MgrLtr> getMgrLtrList(HashMap<String, Object> map);
	public void addMgrLtr(MgrLtr ltr);
	public List<MgrLtr> getLtrByKey(int cmKey);
	public void updateMgrLtr(MgrLtr ltr);
	public void deleteMgrLtr(int keys[]);
}
