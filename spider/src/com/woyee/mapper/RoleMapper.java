package com.woyee.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.woyee.entity.Role;

@Repository("roleMapper")
public interface RoleMapper {

	// 查询数量
	public int showCount(Role role);

	// 查询机构
	public List<Role> showRoles(Role role);

}
