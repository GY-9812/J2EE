package com.inspur.cmis.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.MgrRpr;
@Resource
public interface MgrRprService {
	public List<MgrRpr> getMgrRprList(HashMap<String, Object> map);
}
