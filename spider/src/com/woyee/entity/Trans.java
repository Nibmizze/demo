package com.woyee.entity;

public class Trans {
	private String transId;// 交易类型：3：消费(银行卡、商户主扫，商户被扫)，4：撤销订单，6：退款
	private String trName;// 交易名称
	private String type;// 交易分类：1：银行卡，2：商户主扫，3：商户被扫，T：未分类
	private String sdatetime;// 主机日期(系统日期)
	private String stime;// 主机时间(系统时间)
	private String tdate;// 交易日期
	private String ttime;// 交易时间
	private String orgdate;// 原交易日期
	private String actno;// 交易账号
	private String expdate;// 账号有效期
	private String iptmode;// 服务点输入方式
	private double amt;// 交易金额
	private String curcode;// 交易币种
	private String cycleno;// 交易周期号
	private String traceno;// 交易流水号
	private String orgtrno;// 原交易流水号
	private String mid;// 商户号
	private String tid;// 终端号
	private String oper;// 操作员号
	private String stat;// 交易标志位：T：处理中 R：已冲正 C：已撤销 S: 成功 E：失败
	private String rspcode;// 返回码
	private String rspmsg;// 返回信息
	private String refno;// POS中心系统流水号
	private String orgrefno;// 原POS中心系统流水号
	private String authcode;// 授权码
	private String stdate;// 清算日期
	private String aptid;// 受理方标识码
	private String crdtid;// 发卡行标识码 o2o：alipay、weixin
	private String crdname;// 发卡行名 o2o：支付宝、微信
	private String sttid;// 收单机构代码
	private String intid;// 国际组织代码
	private String cardrspmsg;// 附加响应信息
	private String cupsrspmsg;// 附加响应信息
	private String settlerspmsg;// 附加响应信息
	private String sucflag;// 清算标志
	private String orderpos;// POS订单号
	private String ordero2o;// 支付宝/微信返回的唯一编号（交易编号）
	private String storeid;// 机构号
	private String salesid;// 业务员编号

	private String midName;

	private String sdate;// 开始时间
	private String edate;// 结束时间
	private int spage; // 动态分页开始行
	private int epage; // 动态分页截止行

	public String getMidName() {
		return midName;
	}

	public void setMidName(String midName) {
		this.midName = midName;
	}

	public String getTransId() {
		return transId;
	}

	public void setTransId(String transId) {
		this.transId = transId;
	}

	public String getTrName() {
		return trName;
	}

	public void setTrName(String trName) {
		this.trName = trName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSdatetime() {
		return sdatetime;
	}

	public void setSdatetime(String sdatetime) {
		this.sdatetime = sdatetime;
	}

	public String getStime() {
		return stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

	public String getTdate() {
		return tdate;
	}

	public void setTdate(String tdate) {
		this.tdate = tdate;
	}

	public String getTtime() {
		return ttime;
	}

	public void setTtime(String ttime) {
		this.ttime = ttime;
	}

	public String getOrgdate() {
		return orgdate;
	}

	public void setOrgdate(String orgdate) {
		this.orgdate = orgdate;
	}

	public String getActno() {
		return actno;
	}

	public void setActno(String actno) {
		this.actno = actno;
	}

	public String getExpdate() {
		return expdate;
	}

	public void setExpdate(String expdate) {
		this.expdate = expdate;
	}

	public String getIptmode() {
		return iptmode;
	}

	public void setIptmode(String iptmode) {
		this.iptmode = iptmode;
	}

	public double getAmt() {
		return amt;
	}

	public void setAmt(double amt) {
		this.amt = amt;
	}

	public String getCurcode() {
		return curcode;
	}

	public void setCurcode(String curcode) {
		this.curcode = curcode;
	}

	public String getCycleno() {
		return cycleno;
	}

	public void setCycleno(String cycleno) {
		this.cycleno = cycleno;
	}

	public String getTraceno() {
		return traceno;
	}

	public void setTraceno(String traceno) {
		this.traceno = traceno;
	}

	public String getOrgtrno() {
		return orgtrno;
	}

	public void setOrgtrno(String orgtrno) {
		this.orgtrno = orgtrno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getOper() {
		return oper;
	}

	public void setOper(String oper) {
		this.oper = oper;
	}

	public String getStat() {
		return stat;
	}

	public void setStat(String stat) {
		this.stat = stat;
	}

	public String getRspcode() {
		return rspcode;
	}

	public void setRspcode(String rspcode) {
		this.rspcode = rspcode;
	}

	public String getRspmsg() {
		return rspmsg;
	}

	public void setRspmsg(String rspmsg) {
		this.rspmsg = rspmsg;
	}

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String getOrgrefno() {
		return orgrefno;
	}

	public void setOrgrefno(String orgrefno) {
		this.orgrefno = orgrefno;
	}

	public String getAuthcode() {
		return authcode;
	}

	public void setAuthcode(String authcode) {
		this.authcode = authcode;
	}

	public String getStdate() {
		return stdate;
	}

	public void setStdate(String stdate) {
		this.stdate = stdate;
	}

	public String getAptid() {
		return aptid;
	}

	public void setAptid(String aptid) {
		this.aptid = aptid;
	}

	public String getCrdtid() {
		return crdtid;
	}

	public void setCrdtid(String crdtid) {
		this.crdtid = crdtid;
	}

	public String getCrdname() {
		return crdname;
	}

	public void setCrdname(String crdname) {
		this.crdname = crdname;
	}

	public String getSttid() {
		return sttid;
	}

	public void setSttid(String sttid) {
		this.sttid = sttid;
	}

	public String getIntid() {
		return intid;
	}

	public void setIntid(String intid) {
		this.intid = intid;
	}

	public String getCardrspmsg() {
		return cardrspmsg;
	}

	public void setCardrspmsg(String cardrspmsg) {
		this.cardrspmsg = cardrspmsg;
	}

	public String getCupsrspmsg() {
		return cupsrspmsg;
	}

	public void setCupsrspmsg(String cupsrspmsg) {
		this.cupsrspmsg = cupsrspmsg;
	}

	public String getSettlerspmsg() {
		return settlerspmsg;
	}

	public void setSettlerspmsg(String settlerspmsg) {
		this.settlerspmsg = settlerspmsg;
	}

	public String getSucflag() {
		return sucflag;
	}

	public void setSucflag(String sucflag) {
		this.sucflag = sucflag;
	}

	public String getOrderpos() {
		return orderpos;
	}

	public void setOrderpos(String orderpos) {
		this.orderpos = orderpos;
	}

	public String getOrdero2o() {
		return ordero2o;
	}

	public void setOrdero2o(String ordero2o) {
		this.ordero2o = ordero2o;
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

	@Override
	public String toString() {
		return "Trans [transId=" + transId + ", trName=" + trName + ", type=" + type + ", sdatetime=" + sdatetime
				+ ", stime=" + stime + ", tdate=" + tdate + ", ttime=" + ttime + ", orgdate=" + orgdate + ", actno="
				+ actno + ", expdate=" + expdate + ", iptmode=" + iptmode + ", amt=" + amt + ", curcode=" + curcode
				+ ", cycleno=" + cycleno + ", traceno=" + traceno + ", orgtrno=" + orgtrno + ", mid=" + mid + ", tid="
				+ tid + ", oper=" + oper + ", stat=" + stat + ", rspcode=" + rspcode + ", rspmsg=" + rspmsg + ", refno="
				+ refno + ", orgrefno=" + orgrefno + ", authcode=" + authcode + ", stdate=" + stdate + ", aptid="
				+ aptid + ", crdtid=" + crdtid + ", crdname=" + crdname + ", sttid=" + sttid + ", intid=" + intid
				+ ", cardrspmsg=" + cardrspmsg + ", cupsrspmsg=" + cupsrspmsg + ", settlerspmsg=" + settlerspmsg
				+ ", sucflag=" + sucflag + ", orderpos=" + orderpos + ", ordero2o=" + ordero2o + ", storeid=" + storeid
				+ ", salesid=" + salesid + ", midName=" + midName + ", sdate=" + sdate + ", edate=" + edate + ", spage="
				+ spage + ", epage=" + epage + "]";
	}

}
