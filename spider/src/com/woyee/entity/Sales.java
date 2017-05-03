package com.woyee.entity;

public class Sales {
	private String storeId;// 机构号
	private String salesId;// 业务员编号
	private String salesMan;// 业务员姓名
	private String linkTel;// 联系电话
	private String state;// 0:录入状态，1：已激活，2：已注销
	private String mail;// 邮箱

	private int spage; // 动态分页开始行
	private int epage; // 动态分页截止行

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public int getSpage() {
		return spage;
	}

	public void setSpage(int spage) {
		this.spage = spage;
	}

	public int getEpage() {
		return epage;
	}

	public void setEpage(int epage) {
		this.epage = epage;
	}

	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public String getSalesId() {
		return salesId;
	}

	public void setSalesId(String salesId) {
		this.salesId = salesId;
	}

	public String getSalesMan() {
		return salesMan;
	}

	public void setSalesMan(String salesMan) {
		this.salesMan = salesMan;
	}

	public String getLinkTel() {
		return linkTel;
	}

	public void setLinkTel(String linkTel) {
		this.linkTel = linkTel;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Sales [storeId=" + storeId + ", salesId=" + salesId + ", salesMan=" + salesMan + ", linkTel=" + linkTel
				+ ", state=" + state + ", mail=" + mail + ", spage=" + spage + ", epage=" + epage + "]";
	}

}
