package com.woyee.entity;

public class ModuleVo {
	private String module_id;// 模块id
	private String module_name;// 模块名称
	private String father_id;// 父节点
	private String program_source;// 程序地址
	public ModuleVo() {
		super();
	}
	public ModuleVo(String module_id, String module_name, String father_id, String program_source) {
		super();
		this.module_id = module_id;
		this.module_name = module_name;
		this.father_id = father_id;
		this.program_source = program_source;
	}
	public String getModule_id() {
		return module_id;
	}
	public void setModule_id(String module_id) {
		this.module_id = module_id;
	}
	public String getModule_name() {
		return module_name;
	}
	public void setModule_name(String module_name) {
		this.module_name = module_name;
	}
	public String getFather_id() {
		return father_id;
	}
	public void setFather_id(String father_id) {
		this.father_id = father_id;
	}
	public String getProgram_source() {
		return program_source;
	}
	public void setProgram_source(String program_source) {
		this.program_source = program_source;
	}
	@Override
	public String toString() {
		return "ModuleVo [module_id=" + module_id + ", module_name=" + module_name + ", father_id=" + father_id
				+ ", program_source=" + program_source + "]";
	}

}
