package com.inspur.cmis.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.MgrLevels;
@Resource
public interface MgrLevelService {
	public List<MgrLevels> getMgrLevelList(HashMap<String, Object> map);
	public void addMgrLevel(MgrLevels level);
	public List<MgrLevels> getLevelByKey(int cmKey);
	public void updateMgrLevel(MgrLevels level);
	public void deleteMgrLevel(int keys[]);
}
