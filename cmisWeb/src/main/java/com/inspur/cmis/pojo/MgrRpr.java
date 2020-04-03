package com.inspur.cmis.pojo;

import java.util.Date;

public class MgrRpr {
	private int cmKey;
	private int mgrId;
	private String type;
	private String sub;
	private Date date;
	private String aUnit;
	private String aPerson;
	private Date rDate;
	private String aReason;
	private String remark;
	private String attach;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getaUnit() {
		return aUnit;
	}
	public void setaUnit(String aUnit) {
		this.aUnit = aUnit;
	}
	public String getaPerson() {
		return aPerson;
	}
	public void setaPerson(String aPerson) {
		this.aPerson = aPerson;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	public String getaReason() {
		return aReason;
	}
	public void setaReason(String aReason) {
		this.aReason = aReason;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getAttach() {
		return attach;
	}
	public void setAttach(String attach) {
		this.attach = attach;
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
