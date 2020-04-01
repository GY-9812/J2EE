package com.inspur.cmis.mapper;

import java.util.HashMap;
import java.util.List;

import com.inspur.cmis.pojo.MgrWorkResult;

public interface MgrWorkResultMapper {
	public List<MgrWorkResult> getWorkResultList(HashMap<String, Object> map);
	public void workResultAdd(MgrWorkResult mgrWorkResult);
}