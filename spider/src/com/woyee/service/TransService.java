package com.woyee.service;

import java.util.List;

import com.woyee.entity.Trans;

public interface TransService {

	// count数量
	public int showCount(Trans trans);

	// 交易信息显示
	public List<Trans> showTrans(Trans trans);

}