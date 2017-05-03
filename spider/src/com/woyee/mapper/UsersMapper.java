package com.woyee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.woyee.entity.Sales;
import com.woyee.entity.Store;
import com.woyee.entity.User;

@Repository("usersMapper")
public interface UsersMapper {

	// 查询数量
	public int showCount(User user);

	// 查询机构
	public List<User> showUsers(User user);

	// 查询修改用户信息
	public List<User> queryOneUser(@Param("username") String username);

	// 查询机构表
	public List<Store> querySto();

	// 查询业务员表
	public List<Sales> querySal();

	// 修改用户信息
	public void updateUser(User user);

	// 重置密码
	public void updatePwd(@Param("username") String username, @Param("passwd") String passwd);

	// 注销账户
	public void updateState(@Param("username") String username);

	// 添加用户
	public void addUsers(@Param("username") String username, @Param("role") String role, @Param("member") String member,
			@Param("mid") String mid, @Param("ins") String ins, @Param("salesid") String salesid,
			@Param("state") String state);

}
