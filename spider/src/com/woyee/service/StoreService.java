package com.woyee.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.woyee.entity.Store;

public interface StoreService {

	// 查询数量
	public int showCount(Store store);

	// 查询机构
	public List<Store> showStores(Store store);

	// 添加机构
	public void addStore(String storeId, String storeName, String linkMan, String linkTel, String address);

	// 添加机构为登陆用户
	public void addUser(String userName,String storeId);

	// 查询机构是否存在
	public int querySto(String storeId);

	//  注销机构
	public void updateState(String storeid);
	
//  修改机构
	public void updateStore(String storeId,String storeName,String linkMan,String linkTel,String address,String state);

}
