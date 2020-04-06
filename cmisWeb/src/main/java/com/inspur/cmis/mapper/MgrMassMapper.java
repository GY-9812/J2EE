package com.inspur.cmis.mapper;

import java.util.HashMap;
import java.util.List;

import com.inspur.cmis.pojo.MgrMass;

public interface MgrMassMapper {
	public List<MgrMass> getMgrMassList(HashMap<String, Object> map);
	public void addMgrMass(MgrMass mass);
	public List<MgrMass> getMassByKey(int cmKey);
	public void updateMgrMass(MgrMass mass);
	public void deleteMgrMass(int keys[]);
}
