package com.inspur.cmis.mapper;

import java.util.List;
import java.util.Map;
import com.inspur.cmis.pojo.Param;

public interface ParamMapper {

	public String getParamName(Map map)throws Exception;
	public List<Param> getParamList(String paramType);
}