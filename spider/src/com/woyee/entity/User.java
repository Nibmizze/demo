package com.woyee.entity;

public class User {
	private String username;// 用户名
	private String passwd;// 密码
	private String role;// 用户角色。00：管理员，01：业务员， 10：商户，20：机构
	private String member;// 真实姓名
	private String mid;// 商户号
	private String state;// 状态：0，正常可用； 1，不可用；
	private String ins;// 机构号
	private String salesid;// 业务员编号

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

	private int spage; // 动态分页开始行
	private int epage; // 动态分页截止行

	public String getSalesid() {
		return salesid;
	}

	public void setSalesid(String salesid) {
		this.salesid = salesid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getMember() {
		return member;
	}

	public void setMember(String member) {
		this.member = member;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getIns() {
		return ins;
	}

	public void setIns(String ins) {
		this.ins = ins;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", passwd=" + passwd + ", role=" + role + ", member=" + member + ", mid="
				+ mid + ", state=" + state + ", ins=" + ins + ", salesid=" + salesid + ", spage=" + spage + ", epage="
				+ epage + "]";
	}

}
