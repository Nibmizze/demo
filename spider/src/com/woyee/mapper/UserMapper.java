package com.woyee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.woyee.entity.LogInfo;
import com.woyee.entity.Module;
import com.woyee.entity.ModuleGroup;
import com.woyee.entity.ModuleVo;
import com.woyee.entity.User;

@Repository("userMapper")
public interface UserMapper {

	// 用户登录
	public List<User> login(@Param("userName") String userName);

	// 登陆日志
	public void log(@Param("uuid") String uuid, @Param("realName") String realName, @Param("ip") String ip,
			@Param("date") String date, @Param("userName") String userName);

	// 查询登陆信息
	public List<LogInfo> queryLog(@Param("uuid") String uuid);

	// 用户退出
	public void updatelog(@Param("uuid") String uuid, @Param("date") String date);

	// 修改密码
	public void updatePwd(@Param("userName") String userName, @Param("newPassword") String newPassword);

	// 登陆日志
	public void UpdatePwdLog(@Param("uuid") String uuid, @Param("realName") String realName, @Param("ip") String ip,
			@Param("date") String date, @Param("userName") String userName);

	// 查询主菜单
	public List<Module> querymenu();

	// 查询子菜单
	public List<ModuleVo> querySubmenu(@Param("moduleId")String moduleId);
	
	//判断用户角色\子菜单
	public List<ModuleGroup> queryMod(@Param("role")String role);
	
	//父菜单
	public ModuleVo queryFather(@Param("module_id")String module_id);
	
	//
	public List<ModuleGroup> querySon(@Param("module_id")String module_id,@Param("role")String role);

}
