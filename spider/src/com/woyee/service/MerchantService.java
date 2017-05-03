package com.woyee.service;

import java.util.List;

import com.woyee.entity.Merchant;
import com.woyee.entity.MerchantVo;

public interface MerchantService {
	
	// 数量
	public int showCount(MerchantVo merchantVo);

	//商户信息
	public List<Merchant> showMerchants(MerchantVo merchantVo);
	
	//
	public List<MerchantVo> exportByInfo(MerchantVo merchantVo);
}
