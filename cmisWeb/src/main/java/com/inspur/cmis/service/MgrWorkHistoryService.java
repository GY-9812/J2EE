package com.inspur.cmis.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.MgrWorkHistory;
@Resource
public interface MgrWorkHistoryService {
	public List<MgrWorkHistory> getMgrWorkList(HashMap<String, Object> map);
	public void addWorkHist(MgrWorkHistory hist);
	public List<MgrWorkHistory> getWorkByKey(int cmKey);
	public void updateWorkHist(MgrWorkHistory hist);
	public void deleteWorkHist(int keys[]);
}