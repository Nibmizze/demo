package com.woyee.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woyee.entity.Role;
import com.woyee.mapper.RoleMapper;
import com.woyee.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService {

	@Resource(name = "roleMapper")
	private RoleMapper roleMapper;
	
	// 查询数量
	@Override
	public int showCount(Role role) {
		return roleMapper.showCount(role);
	}

	// 查询机构
	@Override
	public List<Role> showRoles(Role role) {
		return roleMapper.showRoles(role);
	}

}
