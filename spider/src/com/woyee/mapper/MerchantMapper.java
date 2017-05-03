package com.woyee.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.woyee.entity.Merchant;
import com.woyee.entity.MerchantVo;

@Repository("merchantMapper")
public interface MerchantMapper {
	
	// 数量
	public int showCount(MerchantVo merchantVo);

	//商户信息
	public List<Merchant> showMerchants(MerchantVo merchantVo);
	
	//
	public List<MerchantVo> exportByInfo(MerchantVo merchantVo);

}
