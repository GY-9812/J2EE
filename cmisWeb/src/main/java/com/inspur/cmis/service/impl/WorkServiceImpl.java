package com.inspur.cmis.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.WorkMapper;
import com.inspur.cmis.pojo.Work;
import com.inspur.cmis.service.WorkService;

@Service("workService")
public class WorkServiceImpl implements WorkService{
	@Autowired
	private WorkMapper workMapper;

	@Override
	public List<Work> getWorkList(Map<String, String> map) {
		return workMapper.getWorkList(map);
	}

	@Override
	public void addWork(Work work) {
		workMapper.addWork(work);
	}

	@Override
	public Work getWorkByKey(int key) {
		return workMapper.getWorkByKey(key);
	}

	@Override
	public void updateWork(Work work) {
		workMapper.updateWork(work);
	}

	@Override
	public void deleteWork(int[] keys) {
		workMapper.deleteWork(keys);
	}
}
