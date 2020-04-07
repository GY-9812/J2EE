package com.inspur.cmis.pojo;

public class ClientCustExt {
	private String mgrName;//客户经理姓名
	private double salarySum;//年收入总和
	private double balanceSum;//资产总和
	private double debtSum;//负债总和
	public String getMgrName() {
		return mgrName;
	}
	public void setMgrName(String mgrName) {
		this.mgrName = mgrName;
	}
	public double getSalarySum() {
		return salarySum;
	}
	public void setSalarySum(double salarySum) {
		this.salarySum = salarySum;
	}
	public double getBalanceSum() {
		return balanceSum;
	}
	public void setBalanceSum(double balanceSum) {
		this.balanceSum = balanceSum;
	}
	public double getDebtSum() {
		return debtSum;
	}
	public void setDebtSum(double debtSum) {
		this.debtSum = debtSum;
	}
}