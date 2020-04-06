package com.inspur.cmis.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.MgrMass;
@Resource
public interface MgrMassService {
	public List<MgrMass> getMgrMassList(HashMap<String, Object> map);
	public void addMgrMass(MgrMass mass);
	public List<MgrMass> getMassByKey(int cmKey);
	public void updateMgrMass(MgrMass mass);
	public void deleteMgrMass(int keys[]);
}
