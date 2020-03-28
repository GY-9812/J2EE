package com.inspur.cmis.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.Param;

@Resource
public interface ParamService {
	public String getParamName(Map map)throws Exception;
	public List<Param> getParamList(String paramType); 
}