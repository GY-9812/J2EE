package com.inspur.cmis.mapper;

import java.util.HashMap;
import java.util.List;

import com.inspur.cmis.pojo.MgrLevels;

public interface MgrLevelMapper {
	public List<MgrLevels> getMgrLevelList(HashMap<String, Object> map);
	public void addMgrLevel(MgrLevels level);
	public List<MgrLevels> getLevelByKey(int cmKey);
	public void updateMgrLevel(MgrLevels level);
	public void deleteMgrLevel(int keys[]);
}
