package com.woyee.entity;

public class LogInfo {
	private String id; // uuid
	private String username;// 登录用户名
	private String logcontent;// 操作内容
	private int loglevel;// 操作等级， 一般登录为 1， 添加为 2， 删除/修改为 3
	private String loginIp;// 用户访问IP
	private String operatetime;// 登陆/操作时间
	private String quittime;// 退出时间
	private String userno;// 登录用户ID

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getLogcontent() {
		return logcontent;
	}

	public void setLogcontent(String logcontent) {
		this.logcontent = logcontent;
	}

	public int getLoglevel() {
		return loglevel;
	}

	public void setLoglevel(int loglevel) {
		this.loglevel = loglevel;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public String getOperatetime() {
		return operatetime;
	}

	public void setOperatetime(String operatetime) {
		this.operatetime = operatetime;
	}

	public String getQuittime() {
		return quittime;
	}

	public void setQuittime(String quittime) {
		this.quittime = quittime;
	}

	public String getUserno() {
		return userno;
	}

	public void setUserno(String userno) {
		this.userno = userno;
	}

	@Override
	public String toString() {
		return "logInfo [id=" + id + ", username=" + username + ", logcontent=" + logcontent + ", loglevel=" + loglevel
				+ ", loginIp=" + loginIp + ", operatetime=" + operatetime + ", quittime=" + quittime + ", userno="
				+ userno + "]";
	}

}
