package com.inspur.cmis.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.MgrLevelMapper;
import com.inspur.cmis.pojo.MgrLevels;
import com.inspur.cmis.service.MgrLevelService;
@Service("mgrLevelService")
public class MgrLevelServiceImpl implements MgrLevelService{
	@Autowired
	private MgrLevelMapper mgrLevelMapper;

	@Override
	public List<MgrLevels> getMgrLevelList(HashMap<String, Object> map) {
		return mgrLevelMapper.getMgrLevelList(map);
	}

	@Override
	public void addMgrLevel(MgrLevels level) {
		mgrLevelMapper.addMgrLevel(level);
	}

	@Override
	public List<MgrLevels> getLevelByKey(int cmKey) {
		return mgrLevelMapper.getLevelByKey(cmKey);
	}

	@Override
	public void updateMgrLevel(MgrLevels level) {
		mgrLevelMapper.updateMgrLevel(level);
	}

	@Override
	public void deleteMgrLevel(int[] keys) {
		mgrLevelMapper.deleteMgrLevel(keys);
	}
}
