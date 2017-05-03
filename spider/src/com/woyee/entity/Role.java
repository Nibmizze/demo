package com.woyee.entity;

public class Role {
	private String roleid;// 角色ID
	private String rolename;// 角色名称
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

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	@Override
	public String toString() {
		return "Role [roleid=" + roleid + ", rolename=" + rolename + ", spage=" + spage + ", epage=" + epage + "]";
	}

}
