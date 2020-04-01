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
	public List<MgrWorkHistory> getWorkList(HashMap<String, Object> map) {
		return mgrWorkHistoryMapper.getWorkList(map);
	}
	public List<MgrWorkHistory> getWorkByKey(String key){
		return mgrWorkHistoryMapper.getWorkByKey(key);
	}
	@Override
	public void updateWorkHist(MgrWorkHistory hist) {
		mgrWorkHistoryMapper.updateWorkHist(hist);
	}
}