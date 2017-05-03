package com.woyee.entity;

public class Module {
	private String moduleId;// 模块id
	private String moduleName;// 模块名称
	private String fatherId;// 父节点
	private String programSource;// 程序地址

	public String getModuleId() {
		return moduleId;
	}

	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getFatherId() {
		return fatherId;
	}

	public void setFatherId(String fatherId) {
		this.fatherId = fatherId;
	}

	public String getProgramSource() {
		return programSource;
	}

	public void setProgramSource(String programSource) {
		this.programSource = programSource;
	}

	@Override
	public String toString() {
		return "Module [moduleId=" + moduleId + ", moduleName=" + moduleName + ", fatherId=" + fatherId
				+ ", programSource=" + programSource + "]";
	}
	
}
