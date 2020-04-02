package com.inspur.cmis.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.MgrWorkHistoryMapper;
import com.inspur.cmis.pojo.MgrWorkHistory;
import com.inspur.cmis.service.MgrWorkHistoryService;
@Service("mgrWorkHistoryService")
public class MgrWorkHistoryServiceImpl implements MgrWorkHistoryService {
	@Autowired
	private MgrWorkHistoryMapper mgrWorkHistoryMapper;

	@Override
	public List<MgrWorkHistory> getMgrWorkList(HashMap<String, Object> map) {
		return mgrWorkHistoryMapper.getMgrWorkList(map);
	}
	
	@Override
	public void addWorkHist(MgrWorkHistory hist) {
		mgrWorkHistoryMapper.addWorkHist(hist);
	}
	
	public List<MgrWorkHistory> getWorkByKey(int cmKey){
		return mgrWorkHistoryMapper.getWorkByKey(cmKey);
	}
	
	@Override
	public void updateWorkHist(MgrWorkHistory hist) {
		mgrWorkHistoryMapper.updateWorkHist(hist);
	}

	@Override
	public void deleteWorkHist(int[] keys) {
		mgrWorkHistoryMapper.deleteWorkHist(keys);
	}
}