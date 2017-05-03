package com.woyee.entity;

public class TermVo {
	private String name;// 名称（商户名或终端名称）
	private String type;// 商户类型 "cups"：银联商户， "o2o"：O2O商户
	private String mid;// 商户号
	private String tid;// 终端号
	private String belong;// 机具产权
	private String model;// 机具型号
	private String serial_nu;// 机具序列号
	private String state;// 0:录入， 1：已激活，2：已注销
	private String data_date;//导入日期
	private String deposit;//押金
	private String store_id;// 机构号
	private String sales_id;// 业务员编号
	private String up_time;//修改时间
	
	private String sdate;
	
	private String edate;
	
    private int spage;
	
	private int  epage;

	public TermVo() {
		super();
	}

	public TermVo(String name, String type, String mid, String tid, String belong, String model, String serial_nu,
			String state, String data_date, String deposit, String store_id, String sales_id, String up_time,
			String sdate, String edate, int spage, int epage) {
		super();
		this.name = name;
		this.type = type;
		this.mid = mid;
		this.tid = tid;
		this.belong = belong;
		this.model = model;
		this.serial_nu = serial_nu;
		this.state = state;
		this.data_date = data_date;
		this.deposit = deposit;
		this.store_id = store_id;
		this.sales_id = sales_id;
		this.up_time = up_time;
		this.sdate = sdate;
		this.edate = edate;
		this.spage = spage;
		this.epage = epage;
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

	public String getBelong() {
		return belong;
	}

	public void setBelong(String belong) {
		this.belong = belong;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getSerial_nu() {
		return serial_nu;
	}

	public void setSerial_nu(String serial_nu) {
		this.serial_nu = serial_nu;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getData_date() {
		return data_date;
	}

	public void setData_date(String data_date) {
		this.data_date = data_date;
	}

	public String getDeposit() {
		return deposit;
	}

	public void setDeposit(String deposit) {
		this.deposit = deposit;
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

	public String getUp_time() {
		return up_time;
	}

	public void setUp_time(String up_time) {
		this.up_time = up_time;
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public String getSales_id() {
		return sales_id;
	}

	public void setSales_id(String sales_id) {
		this.sales_id = sales_id;
	}

}
