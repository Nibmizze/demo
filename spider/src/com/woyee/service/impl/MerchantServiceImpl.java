package com.woyee.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woyee.entity.Merchant;
import com.woyee.entity.MerchantVo;
import com.woyee.entity.User;
import com.woyee.mapper.MerchantMapper;
import com.woyee.mapper.UserMapper;
import com.woyee.service.MerchantService;
import com.woyee.service.UserService;

@Service("merchantService")
public class MerchantServiceImpl implements MerchantService {
	@Resource(name = "merchantMapper")
	private MerchantMapper merchantMapper;

	public int showCount(MerchantVo merchantVo) {
		return merchantMapper.showCount(merchantVo);
	}

	public List<Merchant> showMerchants(MerchantVo merchantVo) {
		return merchantMapper.showMerchants(merchantVo);
	}

	@Override
	public List<MerchantVo> exportByInfo(MerchantVo merchantVo) {
		return merchantMapper.exportByInfo(merchantVo);
	}

}
