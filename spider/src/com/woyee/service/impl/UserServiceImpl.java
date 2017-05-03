package com.woyee.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woyee.entity.LogInfo;
import com.woyee.entity.Module;
import com.woyee.entity.ModuleGroup;
import com.woyee.entity.ModuleVo;
import com.woyee.entity.User;
import com.woyee.mapper.UserMapper;
import com.woyee.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
@Resource(name="userMapper")
private UserMapper userMapper;

	public List<User> login(String userName) {
		return userMapper.login(userName);
	}

	//登陆日志
	@Override
	public void log(String uuid, String realName, String ip, String date, String userName) {
		userMapper.log(uuid, realName, ip, date, userName);
	}

	//查询登陆信息
	@Override
	public List<LogInfo> queryLog(String uuid) {
		return userMapper.queryLog(uuid);
	}

	//用户退出
	@Override
	public void updatelog(String uuid, String date) {
		userMapper.updatelog(uuid, date);
	}

	// 修改密码
	@Override
	public void updatePwd(String userName, String newPassword) {
		userMapper.updatePwd(userName, newPassword);
	}

	//修改密码日志
	@Override
	public void UpdatePwdLog(String uuid, String realName, String ip, String date, String userName) {
		userMapper.UpdatePwdLog(uuid, realName, ip, date, userName);
	}

	//查询主菜单
	@Override
	public List<Module> querymenu() {
		return userMapper.querymenu();
	}

	@Override
	public List<ModuleVo> querySubmenu(String moduleId) {
		return userMapper.querySubmenu(moduleId);
	}

	@Override
	public List<ModuleGroup> queryMod(String role) {
		return userMapper.queryMod(role);
	}

	@Override
	public ModuleVo queryFather(String module_id) {
		return userMapper.queryFather(module_id);
	}

	@Override
	public List<ModuleGroup> querySon(String module_id,String role) {
		return userMapper.querySon(module_id,role);
	}

	
}
