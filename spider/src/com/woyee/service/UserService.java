package com.woyee.service;

import java.util.List;

import com.woyee.entity.LogInfo;
import com.woyee.entity.Module;
import com.woyee.entity.ModuleGroup;
import com.woyee.entity.ModuleVo;
import com.woyee.entity.User;

public interface UserService {

	// 用户登陆
	public List<User> login(String userName);

	// 登陆日志
	public void log(String uuid, String realName, String ip, String date, String userName);

	// 查询登陆信息
	public List<LogInfo> queryLog(String uuid);

	// 用户退出
	public void updatelog(String uuid, String date);

	// 修改密码
	public void updatePwd(String userName, String newPassword);

	// 修改密码日志
	public void UpdatePwdLog(String uuid, String realName, String ip, String date, String userName);

	//查询主菜单
	public List<Module> querymenu();

	//查询子菜单
	public List<ModuleVo> querySubmenu(String moduleId);
	
	//判断用户角色
	public List<ModuleGroup> queryMod(String role);
	
	//
	public ModuleVo queryFather(String module_id);
	
	public List<ModuleGroup> querySon(String module_id,String role);

}
