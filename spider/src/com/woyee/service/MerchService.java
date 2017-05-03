package com.woyee.service;

import java.util.List;

import com.woyee.entity.Merch;
import com.woyee.entity.Sales;
import com.woyee.entity.Store;

public interface MerchService {

	// count数量
	public int showCount(Merch merch);

	// 商户信息显示
	public List<Merch> showMerchs(Merch merch);

	// 查询唯一商户信息
	public int queryMerch(String id, String type);

	// excel导入添加商户信息
	public void addMerch(String mid, String midName, String type, String dfee, String cfee, String dtop, String o2ofee,
			String linkMan, String linkTel, String address, String branch, String accname, String accno, String channel,
			String storeid, String salseid, String date, String upTime);

	// 查询机构表
	public List<Store> querySto();

	// 查询业务员
	public List<Sales> querySal(String storeId);

	// 注销用户
	public void updateState(String mid, String type, String upTime);

	// 查询修改商户信息
	public List<Merch> queryOneMerch(String mid, String type);

	// 修改账户信息
	public void updateInfo(String mid, String type, String dfee, String cfee, String dtop, String o2ofee, String linkMan, String linkTel,
			String address, String branch, String accname, String accno, String channel, String upTime);

}