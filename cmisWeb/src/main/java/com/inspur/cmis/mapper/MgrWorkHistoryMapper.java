package com.inspur.cmis.mapper;

import java.util.HashMap;
import java.util.List;

import com.inspur.cmis.pojo.MgrWorkHistory;

public interface MgrWorkHistoryMapper {
	public List<MgrWorkHistory> getWorkList(HashMap<String, Object> map);
	public List<MgrWorkHistory> getWorkByKey(String key);
	public void updateWorkHist(MgrWorkHistory hist);
}