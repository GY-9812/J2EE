package com.inspur.cmis.pojo;

import java.util.Date;

public class MgrWorkResult {
	private int cmKey;
	private int mgrId;
	private String cmWorkYear;
	private String cmWorkResult;
	private String cmAttach;
	private Date modifyDate;
	private String modifier;
	public int getCmKey() {
		return cmKey;
	}
	public void setCmKey(int cmKey) {
		this.cmKey = cmKey;
	}
	public int getMgrId() {
		return mgrId;
	}
	public void setMgrId(int mgrId) {
		this.mgrId = mgrId;
	}
	public String getCmWorkYear() {
		return cmWorkYear;
	}
	public void setCmWorkYear(String cmWorkYear) {
		this.cmWorkYear = cmWorkYear;
	}
	public String getCmWorkResult() {
		return cmWorkResult;
	}
	public void setCmWorkResult(String cmWorkResult) {
		this.cmWorkResult = cmWorkResult;
	}
	public String getCmAttach() {
		return cmAttach;
	}
	public void setCmAttach(String cmAttach) {
		this.cmAttach = cmAttach;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getModifier() {
		return modifier;
	}
	public void setModifier(String modifier) {
		this.modifier = modifier;
	}
}
