package com.woyee.entity;

public class ModuleGroup {
	
	private String group_id;
	
	private String group_name;
	
	private String module_id;

	public ModuleGroup() {
		super();
	}

	public ModuleGroup(String group_id, String group_name, String module_id) {
		super();
		this.group_id = group_id;
		this.group_name = group_name;
		this.module_id = module_id;
	}

	public String getGroup_id() {
		return group_id;
	}

	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public String getModule_id() {
		return module_id;
	}

	public void setModule_id(String module_id) {
		this.module_id = module_id;
	}

	@Override
	public String toString() {
		return "ModuleGroup [group_id=" + group_id + ", group_name=" + group_name + ", module_id=" + module_id + "]";
	}
	
}
