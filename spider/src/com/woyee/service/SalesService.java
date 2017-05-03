package com.woyee.service;

import java.util.List;

import com.woyee.entity.Sales;

public interface SalesService {

	// 查询数量
	int showCount(Sales sales);

	// 查询机构
	List<Sales> showSales(Sales sales);

	// 添加业务员
	void addSales(String storeId, String salesId, String salesMan, String linkTel, String mail);

	// 添加业务员登陆信息
	void addUser(String userName, String salesId);

	// 查询业务员编号是否存在
	int querySal(String salesId);

	// 注销业务员
	void updateState(String salesid);

}