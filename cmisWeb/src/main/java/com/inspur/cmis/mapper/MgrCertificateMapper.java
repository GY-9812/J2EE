package com.inspur.cmis.mapper;

import java.util.HashMap;
import java.util.List;

import com.inspur.cmis.pojo.MgrCertificate;

public interface MgrCertificateMapper {
	public List<MgrCertificate> getMgrCertList(HashMap<String, Object> map);
}
