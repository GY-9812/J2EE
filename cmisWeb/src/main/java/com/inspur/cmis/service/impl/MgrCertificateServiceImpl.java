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

	@Override
	public void addMgrCert(MgrCertificate cert) {
		mgrCertificateMapper.addMgrCert(cert);
	}

	@Override
	public List<MgrCertificate> getCertByKey(int cmKey) {
		return mgrCertificateMapper.getCertByKey(cmKey);
	}

	@Override
	public void updateMgrCert(MgrCertificate cert) {
		mgrCertificateMapper.updateMgrCert(cert);
	}

	@Override
	public void deleteMgrCert(int[] keys) {
		mgrCertificateMapper.deleteMgrCert(keys);
	}
}
