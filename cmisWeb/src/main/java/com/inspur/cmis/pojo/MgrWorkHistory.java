package com.inspur.cmis.pojo;

import java.util.Date;

public class MgrWorkHistory {
	private int cmKey;
	private int mgrId;
	private String cmPostion;
	private String cmAttach;
	private Date officeDate;
	private String cmUnit;
	private String cmWork;
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
	public String getCmPostion() {
		return cmPostion;
	}
	public void setCmPostion(String cmPostion) {
		this.cmPostion = cmPostion;
	}
	public String getCmAttach() {
		return cmAttach;
	}
	public void setCmAttach(String cmAttach) {
		this.cmAttach = cmAttach;
	}
	public Date getOfficeDate() {
		return officeDate;
	}
	public void setOfficeDate(Date officeDate) {
		this.officeDate = officeDate;
	}
	public String getCmUnit() {
		return cmUnit;
	}
	public void setCmUnit(String cmUnit) {
		this.cmUnit = cmUnit;
	}
	public String getCmWork() {
		return cmWork;
	}
	public void setCmWork(String cmWork) {
		this.cmWork = cmWork;
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
