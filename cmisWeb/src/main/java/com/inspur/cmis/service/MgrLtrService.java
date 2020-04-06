package com.inspur.cmis.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.MgrLtr;
@Resource
public interface MgrLtrService {
	public List<MgrLtr> getMgrLtrList(HashMap<String, Object> map);
	public void addMgrLtr(MgrLtr ltr);
	public List<MgrLtr> getLtrByKey(int cmKey);
	public void updateMgrLtr(MgrLtr ltr);
	public void deleteMgrLtr(int keys[]);
}
