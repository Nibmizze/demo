package com.woyee.entity;

public class MerchExcel {
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
	private String datadate; // 创建时间
	private String upTime;// 修改时间

	public String getUpTime() {
		return upTime;
	}

	public void setUpTime(String upTime) {
		this.upTime = upTime;
	}

	public String getDatadate() {
		return datadate;
	}

	public void setDatadate(String datadate) {
		this.datadate = datadate;
	}

	public MerchExcel() {
		super();
	}

	public MerchExcel(String mid, String midName, String type, String dfee, String cfee, String dtop, String o2ofee,
			String linkMan, String linkTel, String address, String branch, String accname, String accno, String channel,
			String storeid, String salesid) {
		super();
		this.mid = mid;
		this.midName = midName;
		this.type = type;
		this.dfee = dfee;
		this.cfee = cfee;
		this.dtop = dtop;
		this.o2ofee = o2ofee;
		this.linkMan = linkMan;
		this.linkTel = linkTel;
		this.address = address;
		this.branch = branch;
		this.accname = accname;
		this.accno = accno;
		this.channel = channel;
		this.storeid = storeid;
		this.salesid = salesid;
	}

	public MerchExcel(String mid, String midName, String type, String dfee, String cfee, String dtop, String o2ofee,
			String linkMan, String linkTel, String address, String branch, String accname, String accno, String channel,
			String storeid, String salesid, String datadate, String upTime) {
		super();
		this.mid = mid;
		this.midName = midName;
		this.type = type;
		this.dfee = dfee;
		this.cfee = cfee;
		this.dtop = dtop;
		this.o2ofee = o2ofee;
		this.linkMan = linkMan;
		this.linkTel = linkTel;
		this.address = address;
		this.branch = branch;
		this.accname = accname;
		this.accno = accno;
		this.channel = channel;
		this.storeid = storeid;
		this.salesid = salesid;
		this.datadate = datadate;
		this.upTime = upTime;
	}

	public MerchExcel(String mid, String midName, String type, String dfee, String cfee, String dtop, String o2ofee,
			String linkMan, String linkTel, String address, String branch, String accname, String accno, String channel,
			String state, String storeid, String salesid, String datadate, String upTime) {
		super();
		this.mid = mid;
		this.midName = midName;
		this.type = type;
		this.dfee = dfee;
		this.cfee = cfee;
		this.dtop = dtop;
		this.o2ofee = o2ofee;
		this.linkMan = linkMan;
		this.linkTel = linkTel;
		this.address = address;
		this.branch = branch;
		this.accname = accname;
		this.accno = accno;
		this.channel = channel;
		this.state = state;
		this.storeid = storeid;
		this.salesid = salesid;
		this.datadate = datadate;
		this.upTime = upTime;
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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
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

	@Override
	public String toString() {
		return "MerchExcel [mid=" + mid + ", midName=" + midName + ", type=" + type + ", dfee=" + dfee + ", cfee="
				+ cfee + ", dtop=" + dtop + ", o2ofee=" + o2ofee + ", linkMan=" + linkMan + ", linkTel=" + linkTel
				+ ", address=" + address + ", branch=" + branch + ", accname=" + accname + ", accno=" + accno
				+ ", channel=" + channel + ", state=" + state + ", storeid=" + storeid + ", salesid=" + salesid
				+ ", datadate=" + datadate + ", upTime=" + upTime + "]";
	}

}
