package com.inspur.cmis.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.MgrLtrMapper;
import com.inspur.cmis.pojo.MgrLtr;
import com.inspur.cmis.service.MgrLtrService;
@Service
public class MgrLtrServiceImpl implements MgrLtrService{
	@Autowired
	private MgrLtrMapper mgrLtrMapper;

	@Override
	public List<MgrLtr> getMgrLtrList(HashMap<String, Object> map) {
		return mgrLtrMapper.getMgrLtrList(map);
	}

	@Override
	public void addMgrLtr(MgrLtr ltr) {
		mgrLtrMapper.addMgrLtr(ltr);
	}

	@Override
	public List<MgrLtr> getLtrByKey(int cmKey) {
		return mgrLtrMapper.getLtrByKey(cmKey);
	}

	@Override
	public void updateMgrLtr(MgrLtr ltr) {
		mgrLtrMapper.updateMgrLtr(ltr);
	}

	@Override
	public void deleteMgrLtr(int[] keys) {
		mgrLtrMapper.deleteMgrLtr(keys);
	}

}
