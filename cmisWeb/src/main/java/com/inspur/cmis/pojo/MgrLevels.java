package com.inspur.cmis.pojo;

import java.util.Date;

public class MgrLevels {
	private int cmKey;
	private int mgrId;
	private Date date;
	private String level;
	private String type;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
