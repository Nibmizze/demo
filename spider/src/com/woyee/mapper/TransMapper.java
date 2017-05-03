package com.woyee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.woyee.entity.Sales;
import com.woyee.entity.Store;
import com.woyee.entity.Trans;

@Repository("transMapper")
public interface TransMapper {

	// count数量
	public int showCount(Trans trans);

	// 交易信息显示
	public List<Trans> showTrans(Trans trans);

}
