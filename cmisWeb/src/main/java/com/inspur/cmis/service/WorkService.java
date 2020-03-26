package com.inspur.cmis.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.Work;
@Resource
public interface WorkService {
	 public List<Work> getWorkList(Map<String, String> map);
	 public void addWork(Work work);
	 public Work getWorkByKey(int key);
	 public void updateWork(Work work);
	 public void deleteWork(int keys[]);
}
