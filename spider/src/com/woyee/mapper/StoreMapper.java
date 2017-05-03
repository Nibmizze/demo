package com.woyee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.woyee.entity.Store;

@Repository("storeMapper")
public interface StoreMapper {

	// 查询数量
	public int showCount(Store store);

	// 查询机构
	public List<Store> showStores(Store store);

	// 添加机构
	public void addStore(@Param("storeId") String storeId, @Param("storeName") String storeName,
			@Param("linkMan") String linkMan, @Param("linkTel") String linkTel, @Param("address") String address);

	// 添加机构为登陆用户
	public void addUser(@Param("userName") String userName, @Param("storeId") String storeId);

	// 查询机构是否存在
	public int querySto(@Param("storeId")String storeId);
	
	//  注销机构
	public void updateState(@Param("storeid")String storeid);
	
	//  修改机构
	public void updateStore(@Param("storeId") String storeId, @Param("storeName") String storeName,
			@Param("linkMan") String linkMan, @Param("linkTel") String linkTel, @Param("address") String address,@Param("state") String state);

}
