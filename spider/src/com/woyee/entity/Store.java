package com.woyee.entity;

public class Store {
	private String storeId;// 机构号
	private String storeName;// 机构名
	private String linkMan;// 联系人
	private String linkTel;// 联系电话
	private String state;// 0:录入状态，1：已激活，2：已注销
	private String address;// 地址

	private int spage; // 动态分页开始行
	private int epage; // 动态分页截止行

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

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getLinkMan() {
		return linkMan;
	}

	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Store [storeId=" + storeId + ", storeName=" + storeName + ", linkMan=" + linkMan + ", linkTel="
				+ linkTel + ", state=" + state + ", address=" + address + ", spage=" + spage + ", epage=" + epage + "]";
	}

}
