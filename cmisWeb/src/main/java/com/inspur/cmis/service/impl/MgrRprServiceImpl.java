package com.inspur.cmis.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.MgrRprMapper;
import com.inspur.cmis.pojo.MgrRpr;
import com.inspur.cmis.pojo.User;
import com.inspur.cmis.service.MgrRprService;
@Service
public class MgrRprServiceImpl implements MgrRprService{
	@Autowired
	private MgrRprMapper mgrRprMapper;

	@Override
	public List<MgrRpr> getMgrRprList(HashMap<String, Object> map) {
		return mgrRprMapper.getMgrRprList(map);
	}

	@Override
	public String getUserByName(String aPerson) {
		return mgrRprMapper.getUserByName(aPerson);
	}

	@Override
	public void addMgrRpr(MgrRpr rpr) {
		mgrRprMapper.addMgrRpr(rpr);
	}

	@Override
	public List<MgrRpr> getRprByKey(int cmKey) {
		return mgrRprMapper.getRprByKey(cmKey);
	}

	@Override
	public void updateMgrRpr(MgrRpr rpr) {
		mgrRprMapper.updateMgrRpr(rpr);
	}

	@Override
	public void deleteMgrRpr(int[] keys) {
		mgrRprMapper.deleteMgrRpr(keys);
	}
}
