package com.woyee.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woyee.entity.Sales;
import com.woyee.mapper.SalesMapper;
import com.woyee.service.SalesService;

@Service("salesService")
public class SalesServiceImpl implements SalesService {

	@Resource(name = "salesMapper")
	private SalesMapper salesMapper;
	
	// 查询数量
	@Override
	public int showCount(Sales sales) {
		return salesMapper.showCount(sales);
	}

	// 查询机构
	@Override
	public List<Sales> showSales(Sales sales) {
		return salesMapper.showSales(sales);
	}

	// 添加业务员
	@Override
	public void addSales(String storeId, String salesId, String salesMan, String linkTel, String mail) {
		salesMapper.addSales(storeId, salesId, salesMan, linkTel, mail);
	}

	// 添加业务员登陆信息
	@Override
	public void addUser(String userName, String salesId) {
		salesMapper.addUser(userName, salesId);
	}

	// 查询业务员编号是否存在
	@Override
	public int querySal(String salesId) {
		return salesMapper.querySal(salesId);
	}

	// 注销业务员
	@Override
	public void updateState(String salesid) {
		salesMapper.updateState(salesid);
	}

}
