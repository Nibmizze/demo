package com.woyee.service;

import java.util.List;

import com.woyee.entity.Sales;
import com.woyee.entity.Store;
import com.woyee.entity.User;

public interface UsersService {

	// 查询数量
	public int showCount(User user);

	// 查询机构
	public List<User> showUsers(User user);

	// 查询修改用户信息
	public List<User> queryOneUser(String username);

	// 查询机构表
	public List<Store> querySto();
	
	// 查询业务员表
	public List<Sales> querySal();

	// 修改用户信息
	public void updateUser(User user);
	
	// 重置密码
	public void updatePwd(String username, String passwd);

	// 注销账户
	public void updateState(String username);

	// 添加用户
	public void addUsers(String username, String role, String member, String mid, String ins, String salesid,
			String state);

}
