package com.inspur.cmis.pojo;

public class MgrCertificateExt extends MgrCertificate{
	private String mgrName;//客户经理名
	private String modifierName;//修改人名称
	public String getMgrName() {
		return mgrName;
	}
	public void setMgrName(String mgrName) {
		this.mgrName = mgrName;
	}
	public String getModifierName() {
		return modifierName;
	}
	public void setModifierName(String modifierName) {
		this.modifierName = modifierName;
	}
}
