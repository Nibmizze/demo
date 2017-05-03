package com.woyee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.woyee.entity.Sales;

@Repository("salesMapper")
public interface SalesMapper {

	// 查询数量
	public int showCount(Sales sales);

	// 查询机构
	public List<Sales> showSales(Sales sales);

	// 添加业务员
	void addSales(@Param("storeId") String storeId, @Param("salesId") String salesId,
			@Param("salesMan") String salesMan, @Param("linkTel") String linkTel, @Param("mail") String mail);

	// 添加业务员登陆信息
	void addUser(@Param("userName") String userName, @Param("salesId") String salesId);

	// 查询业务员编号是否存在
	int querySal(@Param("salesId") String salesId);
	
	// 注销业务员
	void updateState(@Param("salesid") String salesid);

}
