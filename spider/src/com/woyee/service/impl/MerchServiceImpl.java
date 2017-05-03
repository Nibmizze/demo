package com.woyee.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woyee.entity.Merch;
import com.woyee.entity.Sales;
import com.woyee.entity.Store;
import com.woyee.mapper.MerchMapper;
import com.woyee.service.MerchService;

@Service("merchService")
public class MerchServiceImpl implements MerchService {
	@Resource(name = "merchMapper")
	private MerchMapper merchMapper;

	@Override
	public int showCount(Merch merch) {
		return merchMapper.showCount(merch);
	}

	// 商户信息显示
	@Override
	public List<Merch> showMerchs(Merch merch) {
		return merchMapper.queryMerchs(merch);
	}

	// 查询唯一商户信息
	@Override
	public int queryMerch(String id, String type) {
		return merchMapper.queryMerch(id, type);
	}

	// excel导入添加商户信息
	@Override
	public void addMerch(String mid, String midName, String type, String dfee, String cfee, String dtop, String o2ofee,
			String linkMan, String linkTel, String address, String branch, String accname, String accno, String channel,
			String storeid, String salseid, String date, String upTime) {
		merchMapper.addMerch(mid, midName, type, dfee, cfee, dtop, o2ofee, linkMan, linkTel, address, branch, accname,
				accno, channel, storeid, salseid, date, upTime);
	}

	// 查询机构表
	@Override
	public List<Store> querySto() {
		return merchMapper.querySto();
	}

	// 查询业务员
	@Override
	public List<Sales> querySal(String storeId) {
		return merchMapper.querySal(storeId);
	}

	// 注销用户
	@Override
	public void updateState(String mid, String type, String upTime) {
		merchMapper.updateState(mid, type, upTime);

	}

	// 查询修改商户信息
	@Override
	public List<Merch> queryOneMerch(String mid, String type) {
		return merchMapper.queryOneMerch(mid, type);
	}

	// 修改商户信息
	@Override
	public void updateInfo(String mid, String type, String dfee, String cfee, String dtop, String o2ofee,
			String linkMan, String linkTel, String address, String branch, String accname, String accno, String channel,
			String upTime) {
		merchMapper.updateInfo(mid, type, dfee, cfee, dtop, o2ofee, linkMan, linkTel, address, branch, accname, accno,
				channel, upTime);
	}

}
