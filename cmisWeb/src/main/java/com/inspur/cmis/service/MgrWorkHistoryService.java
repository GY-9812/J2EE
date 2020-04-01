package com.inspur.cmis.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.MgrWorkHistory;
@Resource
public interface MgrWorkHistoryService {
  
  public List<MgrWorkHistory> getWorkList(HashMap<String, Object> map);
  public List<MgrWorkHistory> getWorkByKey(String key);
  public void updateWorkHist(MgrWorkHistory hist);
}