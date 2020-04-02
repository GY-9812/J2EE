package com.inspur.cmis.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.MgrWorkResultMapper;
import com.inspur.cmis.pojo.MgrWorkResult;
import com.inspur.cmis.service.MgrWorkResultService;
@Service("mgrWorkResultService")
public class MgrWorkResultServiceImpl implements MgrWorkResultService {
	@Autowired
	private MgrWorkResultMapper mgrWorkResultMapper;

	@Override
	public List<MgrWorkResult> getWorkResultList(HashMap<String, Object> map) {

		return mgrWorkResultMapper.getWorkResultList(map);
	}

	@Override
	public void workResultAdd(MgrWorkResult mgrWorkResult) {
		mgrWorkResultMapper.workResultAdd(mgrWorkResult);	
	}

	@Override
	public List<MgrWorkResult> getResultByKey(int cmKey) {
		return mgrWorkResultMapper.getResultByKey(cmKey);
	}

	@Override
	public void updateWorkResult(MgrWorkResult work) {
		mgrWorkResultMapper.updateWorkResult(work);
	}

	@Override
	public void deleteMgrResult(int[] keys) {
		mgrWorkResultMapper.deleteMgrResult(keys);
	}
}