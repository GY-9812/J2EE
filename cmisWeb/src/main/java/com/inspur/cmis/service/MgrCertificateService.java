package com.inspur.cmis.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.MgrCertificate;
@Resource
public interface MgrCertificateService {
	public List<MgrCertificate> getMgrCertList(HashMap<String, Object> map);
	public void addMgrCert(MgrCertificate cert);
	public List<MgrCertificate> getCertByKey(int cmKey);
	public void updateMgrCert(MgrCertificate cert);
	public void deleteMgrCert(int keys[]);
}
