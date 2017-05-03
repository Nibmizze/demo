package com.woyee.entity;

public class Merch {
	private String mid;// 银联商户号
	private String midName;// 商户名
	private String type;// 商户类型 "cups"：银联商户， "o2o"：O2O商户
	private String dfee;// 借记卡手续费率
	private String cfee;// 贷记卡手续费率
	private String dtop;// 借记卡封顶金额
	private String o2ofee;// O2O手续费率
	private String linkMan;// 商户联系人
	private String linkTel;// 联系方式
	private String address;// 商户地址
	private String branch;// 开户行
	private String accname;// 结算账户名
	private String accno;// 结算账户号
	private String channel;// 所属渠道
	private String state;// 0:录入状态，1：已激活，2：已注销
	private String storeid;// 机构号
	private String salesid;// 业务员编号
	private String datadate;// 创建日期
	private String upTime;// 修改时间

	private String sdate;// 开始时间
	private String edate;// 结束时间
	private int spage; // 动态分页开始行
	private int epage; // 动态分页截止行

	public String getUpTime() {
		return upTime;
	}

	public void setUpTime(String upTime) {
		this.upTime = upTime;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getDatadate() {
		return datadate;
	}

	public void setDatadate(String datadate) {
		this.datadate = datadate;
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

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMidName() {
		return midName;
	}

	public void setMidName(String midName) {
		this.midName = midName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDfee() {
		return dfee;
	}

	public void setDfee(String dfee) {
		this.dfee = dfee;
	}

	public String getCfee() {
		return cfee;
	}

	public void setCfee(String cfee) {
		this.cfee = cfee;
	}

	public String getDtop() {
		return dtop;
	}

	public void setDtop(String dtop) {
		this.dtop = dtop;
	}

	public String getO2ofee() {
		return o2ofee;
	}

	public void setO2ofee(String o2ofee) {
		this.o2ofee = o2ofee;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getAccname() {
		return accname;
	}

	public void setAccname(String accname) {
		this.accname = accname;
	}

	public String getAccno() {
		return accno;
	}

	public void setAccno(String accno) {
		this.accno = accno;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public String getStoreid() {
		return storeid;
	}

	public void setStoreid(String storeid) {
		this.storeid = storeid;
	}

	public String getSalesid() {
		return salesid;
	}

	public void setSalesid(String salesid) {
		this.salesid = salesid;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Merch [mid=" + mid + ", midName=" + midName + ", type=" + type + ", dfee=" + dfee + ", cfee=" + cfee
				+ ", dtop=" + dtop + ", o2ofee=" + o2ofee + ", linkMan=" + linkMan + ", linkTel=" + linkTel
				+ ", address=" + address + ", branch=" + branch + ", accname=" + accname + ", accno=" + accno
				+ ", channel=" + channel + ", state=" + state + ", storeid=" + storeid + ", salesid=" + salesid
				+ ", datadate=" + datadate + ", upTime=" + upTime + ", sdate=" + sdate + ", edate=" + edate + ", spage="
				+ spage + ", epage=" + epage + "]";
	}

}
