package com.woyee.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woyee.entity.Sales;
import com.woyee.entity.Store;
import com.woyee.entity.Trans;
import com.woyee.mapper.TransMapper;
import com.woyee.service.TransService;

@Service("transService")
public class TransServiceImpl implements TransService {
	@Resource(name = "transMapper")
	private TransMapper transMapper;

	// count数量
	@Override
	public int showCount(Trans trans) {
		return transMapper.showCount(trans);
	}

	// 交易信息显示
	@Override
	public List<Trans> showTrans(Trans trans) {
		return transMapper.showTrans(trans);
	}

}
