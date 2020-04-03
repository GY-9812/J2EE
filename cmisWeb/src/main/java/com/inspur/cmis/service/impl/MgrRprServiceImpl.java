package com.inspur.cmis.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.MgrRprMapper;
import com.inspur.cmis.pojo.MgrRpr;
import com.inspur.cmis.service.MgrRprService;
@Service
public class MgrRprServiceImpl implements MgrRprService{
	@Autowired
	private MgrRprMapper mgrRprMapper;

	@Override
	public List<MgrRpr> getMgrRprList(HashMap<String, Object> map) {
		return mgrRprMapper.getMgrRprList(map);
	}
}
