package com.inspur.cmis.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.MgrWorkResult;
@Resource
public interface MgrWorkResultService {
  public List<MgrWorkResult> getWorkResultList(HashMap<String, Object> map);
  public void workResultAdd(MgrWorkResult mgrWorkResult);
}