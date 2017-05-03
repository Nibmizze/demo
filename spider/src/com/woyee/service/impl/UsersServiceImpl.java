package com.woyee.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woyee.entity.Sales;
import com.woyee.entity.Store;
import com.woyee.entity.User;
import com.woyee.mapper.UsersMapper;
import com.woyee.service.UsersService;

@Service("usersService")
public class UsersServiceImpl implements UsersService {

	@Resource(name = "usersMapper")
	private UsersMapper usersMapper;
	
	// 查询数量
	@Override
	public int showCount(User user) {
		return usersMapper.showCount(user);
	}

	// 查询机构
	@Override
	public List<User> showUsers(User user) {
		return usersMapper.showUsers(user);
	}

	// 查询修改用户信息
	@Override
	public List<User> queryOneUser(String username) {
		return usersMapper.queryOneUser(username);
	}

	// 查询机构表
	@Override
	public List<Store> querySto() {
		return usersMapper.querySto();
	}
	
	// 查询业务员表
	@Override
	public List<Sales> querySal() {
		return usersMapper.querySal();
	}

	// 修改用户信息
	@Override
	public void updateUser(User user) {
		usersMapper.updateUser(user);
	}

	// 重置密码
	@Override
	public void updatePwd(String username, String passwd) {
		usersMapper.updatePwd(username, passwd);
	}

	// 注销账户
	@Override
	public void updateState(String username) {
		usersMapper.updateState(username);
	}

	// 添加用户
	@Override
	public void addUsers(String username, String role, String member, String mid, String ins, String salesid,
			String state) {
		usersMapper.addUsers(username, role, member, mid, ins, salesid, state);
	}
	
}
