package com.inspur.cmis.pojo;

public class Study {
	private int key;
	private String name;
	private String type;
	private String des;
	private String url;
	private String line;
	private String uper;
	private String unit;
	private String date;
	public int getKey() {
		return key;
	}
	public void setKey(int key) {
		this.key = key;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getLine() {
		return line;
	}
	public void setLine(String line) {
		this.line = line;
	}
	public String getUper() {
		return uper;
	}
	public void setUper(String uper) {
		this.uper = uper;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Study [key=" + key + ", name=" + name + ", type=" + type
				+ ", des=" + des + ", url=" + url + ", line=" + line
				+ ", uper=" + uper + ", unit=" + unit + ", date=" + date + "]";
	}
}
