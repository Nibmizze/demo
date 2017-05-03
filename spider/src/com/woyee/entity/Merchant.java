package com.woyee.entity;

public class Merchant {

	private String ins_rcv;
	
	private String ins_snd;
	
	private String traceno;  
	
	private String tdate;
	
	private String ttime;
	
	private String card_no;
	
	private String amt;
	
	private String msg_type;
	
	private String process_code;
	
	private String mcc;
	
	private String tid;
	
	private String mid;//商户号
	
	private String refno;
	
	private String condition;
	
	private String auth_id;
	
	private String org_traceno;
	
	private String rspcode;
	
	private String entry_mode;
	
	private String transfer_dc;
	
	private String transfer_fee;
	
	private String card_seq;
	
	private String org_rtime;
	
	private String card_issuer;
	
	private String term_type;
	
	private String fq_fee;
	
	private String r_flag;
	
	private String c_flag;
	
	private String settle_date;
	
	private String midname;
	
	private String curcode;
	
	private String discount_fee;
	
	private String merch_fee_dc;
	
	private String merch_fee;
	
	private String sdf_role;
	
	private String sdf_fee_dc;
	
	private String sdf_fee;
	
	private String data_date;
	
	private String orderno;
	
	private String trans_name;
	
	private String dcflag;
	
	private String  file_name;

	public Merchant() {
		super();
	}

	public Merchant(String ins_rcv, String ins_snd, String traceno, String tdate, String ttime, String card_no,
			String amt, String msg_type, String process_code, String mcc, String tid, String mid, String refno,
			String condition, String auth_id, String org_traceno, String rspcode, String entry_mode, String transfer_dc,
			String transfer_fee, String card_seq, String org_rtime, String card_issuer, String term_type, String fq_fee,
			String r_flag, String c_flag, String settle_date, String midname, String curcode, String discount_fee,
			String merch_fee_dc, String merch_fee, String sdf_role, String sdf_fee_dc, String sdf_fee, String data_date,
			String orderno, String trans_name, String dcflag, String file_name) {
		super();
		this.ins_rcv = ins_rcv;
		this.ins_snd = ins_snd;
		this.traceno = traceno;
		this.tdate = tdate;
		this.ttime = ttime;
		this.card_no = card_no;
		this.amt = amt;
		this.msg_type = msg_type;
		this.process_code = process_code;
		this.mcc = mcc;
		this.tid = tid;
		this.mid = mid;
		this.refno = refno;
		this.condition = condition;
		this.auth_id = auth_id;
		this.org_traceno = org_traceno;
		this.rspcode = rspcode;
		this.entry_mode = entry_mode;
		this.transfer_dc = transfer_dc;
		this.transfer_fee = transfer_fee;
		this.card_seq = card_seq;
		this.org_rtime = org_rtime;
		this.card_issuer = card_issuer;
		this.term_type = term_type;
		this.fq_fee = fq_fee;
		this.r_flag = r_flag;
		this.c_flag = c_flag;
		this.settle_date = settle_date;
		this.midname = midname;
		this.curcode = curcode;
		this.discount_fee = discount_fee;
		this.merch_fee_dc = merch_fee_dc;
		this.merch_fee = merch_fee;
		this.sdf_role = sdf_role;
		this.sdf_fee_dc = sdf_fee_dc;
		this.sdf_fee = sdf_fee;
		this.data_date = data_date;
		this.orderno = orderno;
		this.trans_name = trans_name;
		this.dcflag = dcflag;
		this.file_name = file_name;
	}

	public String getIns_rcv() {
		return ins_rcv;
	}

	public void setIns_rcv(String ins_rcv) {
		this.ins_rcv = ins_rcv;
	}

	public String getIns_snd() {
		return ins_snd;
	}

	public void setIns_snd(String ins_snd) {
		this.ins_snd = ins_snd;
	}

	public String getTraceno() {
		return traceno;
	}

	public void setTraceno(String traceno) {
		this.traceno = traceno;
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

	public String getCard_no() {
		return card_no;
	}

	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}

	public String getAmt() {
		return amt;
	}

	public void setAmt(String amt) {
		this.amt = amt;
	}

	public String getMsg_type() {
		return msg_type;
	}

	public void setMsg_type(String msg_type) {
		this.msg_type = msg_type;
	}

	public String getProcess_code() {
		return process_code;
	}

	public void setProcess_code(String process_code) {
		this.process_code = process_code;
	}

	public String getMcc() {
		return mcc;
	}

	public void setMcc(String mcc) {
		this.mcc = mcc;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getAuth_id() {
		return auth_id;
	}

	public void setAuth_id(String auth_id) {
		this.auth_id = auth_id;
	}

	public String getOrg_traceno() {
		return org_traceno;
	}

	public void setOrg_traceno(String org_traceno) {
		this.org_traceno = org_traceno;
	}

	public String getRspcode() {
		return rspcode;
	}

	public void setRspcode(String rspcode) {
		this.rspcode = rspcode;
	}

	public String getEntry_mode() {
		return entry_mode;
	}

	public void setEntry_mode(String entry_mode) {
		this.entry_mode = entry_mode;
	}

	public String getTransfer_dc() {
		return transfer_dc;
	}

	public void setTransfer_dc(String transfer_dc) {
		this.transfer_dc = transfer_dc;
	}

	public String getTransfer_fee() {
		return transfer_fee;
	}

	public void setTransfer_fee(String transfer_fee) {
		this.transfer_fee = transfer_fee;
	}

	public String getCard_seq() {
		return card_seq;
	}

	public void setCard_seq(String card_seq) {
		this.card_seq = card_seq;
	}

	public String getOrg_rtime() {
		return org_rtime;
	}

	public void setOrg_rtime(String org_rtime) {
		this.org_rtime = org_rtime;
	}

	public String getCard_issuer() {
		return card_issuer;
	}

	public void setCard_issuer(String card_issuer) {
		this.card_issuer = card_issuer;
	}

	public String getTerm_type() {
		return term_type;
	}

	public void setTerm_type(String term_type) {
		this.term_type = term_type;
	}

	public String getFq_fee() {
		return fq_fee;
	}

	public void setFq_fee(String fq_fee) {
		this.fq_fee = fq_fee;
	}

	public String getR_flag() {
		return r_flag;
	}

	public void setR_flag(String r_flag) {
		this.r_flag = r_flag;
	}

	public String getC_flag() {
		return c_flag;
	}

	public void setC_flag(String c_flag) {
		this.c_flag = c_flag;
	}

	public String getSettle_date() {
		return settle_date;
	}

	public void setSettle_date(String settle_date) {
		this.settle_date = settle_date;
	}

	public String getMidname() {
		return midname;
	}

	public void setMidname(String midname) {
		this.midname = midname;
	}

	public String getCurcode() {
		return curcode;
	}

	public void setCurcode(String curcode) {
		this.curcode = curcode;
	}

	public String getDiscount_fee() {
		return discount_fee;
	}

	public void setDiscount_fee(String discount_fee) {
		this.discount_fee = discount_fee;
	}

	public String getMerch_fee_dc() {
		return merch_fee_dc;
	}

	public void setMerch_fee_dc(String merch_fee_dc) {
		this.merch_fee_dc = merch_fee_dc;
	}

	public String getMerch_fee() {
		return merch_fee;
	}

	public void setMerch_fee(String merch_fee) {
		this.merch_fee = merch_fee;
	}

	public String getSdf_role() {
		return sdf_role;
	}

	public void setSdf_role(String sdf_role) {
		this.sdf_role = sdf_role;
	}

	public String getSdf_fee_dc() {
		return sdf_fee_dc;
	}

	public void setSdf_fee_dc(String sdf_fee_dc) {
		this.sdf_fee_dc = sdf_fee_dc;
	}

	public String getSdf_fee() {
		return sdf_fee;
	}

	public void setSdf_fee(String sdf_fee) {
		this.sdf_fee = sdf_fee;
	}

	public String getData_date() {
		return data_date;
	}

	public void setData_date(String data_date) {
		this.data_date = data_date;
	}

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public String getTrans_name() {
		return trans_name;
	}

	public void setTrans_name(String trans_name) {
		this.trans_name = trans_name;
	}

	public String getDcflag() {
		return dcflag;
	}

	public void setDcflag(String dcflag) {
		this.dcflag = dcflag;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	@Override
	public String toString() {
		return "Merchant [ins_rcv=" + ins_rcv + ", ins_snd=" + ins_snd + ", traceno=" + traceno + ", tdate=" + tdate
				+ ", ttime=" + ttime + ", card_no=" + card_no + ", amt=" + amt + ", msg_type=" + msg_type
				+ ", process_code=" + process_code + ", mcc=" + mcc + ", tid=" + tid + ", mid=" + mid + ", refno="
				+ refno + ", condition=" + condition + ", auth_id=" + auth_id + ", org_traceno=" + org_traceno
				+ ", rspcode=" + rspcode + ", entry_mode=" + entry_mode + ", transfer_dc=" + transfer_dc
				+ ", transfer_fee=" + transfer_fee + ", card_seq=" + card_seq + ", org_rtime=" + org_rtime
				+ ", card_issuer=" + card_issuer + ", term_type=" + term_type + ", fq_fee=" + fq_fee + ", r_flag="
				+ r_flag + ", c_flag=" + c_flag + ", settle_date=" + settle_date + ", midname=" + midname + ", curcode="
				+ curcode + ", discount_fee=" + discount_fee + ", merch_fee_dc=" + merch_fee_dc + ", merch_fee="
				+ merch_fee + ", sdf_role=" + sdf_role + ", sdf_fee_dc=" + sdf_fee_dc + ", sdf_fee=" + sdf_fee
				+ ", data_date=" + data_date + ", orderno=" + orderno + ", trans_name=" + trans_name + ", dcflag="
				+ dcflag + ", file_name=" + file_name + "]";
	}
    

}
