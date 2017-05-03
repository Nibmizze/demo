package com.woyee.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woyee.entity.Store;
import com.woyee.mapper.StoreMapper;
import com.woyee.service.StoreService;

@Service("storeService")
public class StoreServiceImpl implements StoreService {

	@Resource(name = "storeMapper")
	private StoreMapper storeMapper;
	
	// 查询数量
	@Override
	public int showCount(Store store) {
		return storeMapper.showCount(store);
	}

	// 查询机构
	@Override
	public List<Store> showStores(Store store) {
		return storeMapper.showStores(store);
	}

	// 添加机构
	@Override
	public void addStore(String storeId, String storeName, String linkMan, String linkTel, String address) {
		storeMapper.addStore(storeId, storeName, linkMan, linkTel, address);
	}

	// 添加机构位登陆用户
	@Override
	public void addUser(String userName, String storeId) {
		storeMapper.addUser(userName,storeId);
	}

	// 查询机构是否存在
	@Override
	public int querySto(String storeId) {
		return storeMapper.querySto(storeId);
	}

	// 注销机构
	@Override
	public void updateState(String storeid) {
		storeMapper.updateState(storeid);
	}

	@Override
	public void updateStore(String storeId, String storeName, String linkMan, String linkTel, String address,
			String state) {
		storeMapper.updateStore(storeId, storeName, linkMan, linkTel, address, state);
	}

}
