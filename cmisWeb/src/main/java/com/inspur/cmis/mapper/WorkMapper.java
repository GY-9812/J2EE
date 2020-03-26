package com.inspur.cmis.mapper;

import java.util.List;
import java.util.Map;

import com.inspur.cmis.pojo.Work;

public interface WorkMapper {
	 public List<Work> getWorkList(Map<String, String> map);
	 public void addWork(Work work);
	 public Work getWorkByKey(int key);
	 public void updateWork(Work work);
	 public void deleteWork(int keys[]);

}
