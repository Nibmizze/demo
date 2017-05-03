package com.woyee.service;

import java.util.List;

import com.woyee.entity.Role;

public interface RoleService {

	// 查询数量
	public int showCount(Role role);

	// 查询机构
	public List<Role> showRoles(Role role);

}
