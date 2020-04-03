package com.inspur.cmis.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.MgrCertificateMapper;
import com.inspur.cmis.pojo.MgrCertificate;
import com.inspur.cmis.service.MgrCertificateService;
@Service
public class MgrCertificateServiceImpl implements MgrCertificateService{
	@Autowired
	private MgrCertificateMapper mgrCertificateMapper;

	@Override
	public List<MgrCertificate> getMgrCertList(HashMap<String, Object> map) {
		return mgrCertificateMapper.getMgrCertList(map);
	}
}
