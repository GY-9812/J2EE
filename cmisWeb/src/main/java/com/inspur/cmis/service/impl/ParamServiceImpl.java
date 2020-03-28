package com.inspur.cmis.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.inspur.cmis.mapper.ParamMapper;
import com.inspur.cmis.pojo.Param;
import com.inspur.cmis.service.ParamService;

@Service("paramService")
public class ParamServiceImpl implements ParamService {
	@Autowired
	private ParamMapper paramMapper;
	
	/**
	 * 根据参数代码参数类型代码获取参数名称
	 */
	public String getParamName(Map map)throws Exception{
	    return paramMapper.getParamName(map);
	}
	
	/**
	 * 根据参数代码类型获取具体的参数列表
	 */
	public List<Param> getParamList(String paramType){
		return paramMapper.getParamList(paramType);
	}	
}