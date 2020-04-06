package com.inspur.cmis.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.MgrMassMapper;
import com.inspur.cmis.pojo.MgrMass;
import com.inspur.cmis.service.MgrMassService;
@Service
public class MgrMassServiceImpl implements MgrMassService{
	@Autowired
	private MgrMassMapper mgrMassMapper;
	@Override
	public List<MgrMass> getMgrMassList(HashMap<String, Object> map) {
		return mgrMassMapper.getMgrMassList(map);
	}
	@Override
	public void addMgrMass(MgrMass mass) {
		mgrMassMapper.addMgrMass(mass);
	}
	@Override
	public List<MgrMass> getMassByKey(int cmKey) {
		return mgrMassMapper.getMassByKey(cmKey);
	}
	@Override
	public void updateMgrMass(MgrMass mass) {
		mgrMassMapper.updateMgrMass(mass);
	}
	@Override
	public void deleteMgrMass(int[] keys) {
		mgrMassMapper.deleteMgrMass(keys);
	}
}
