package com.inspur.cmis.mapper;

import java.util.HashMap;
import java.util.List;

import com.inspur.cmis.pojo.MgrWorkHistory;

public interface MgrWorkHistoryMapper {
	public List<MgrWorkHistory> getMgrWorkList(HashMap<String, Object> map);
	public void addWorkHist(MgrWorkHistory hist);
	public List<MgrWorkHistory> getWorkByKey(int cmKey);
	public void updateWorkHist(MgrWorkHistory hist);
	public void deleteWorkHist(int keys[]);
}