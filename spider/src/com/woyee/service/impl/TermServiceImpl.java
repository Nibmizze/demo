package com.woyee.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woyee.entity.Sales;
import com.woyee.entity.Store;
import com.woyee.entity.Term;
import com.woyee.entity.TermVo;
import com.woyee.mapper.TermMapper;
import com.woyee.service.TermService;

@Service("termService")
public class TermServiceImpl implements TermService {

	@Resource(name = "termMapper")
	private TermMapper termMapper;
	
	@Override
	public int showCount(TermVo termVo) {
		return termMapper.showCount(termVo);
	}

	@Override
	public List<Term> showTerms(TermVo termVo) {
		return termMapper.queryTerms(termVo);
	}

	@Override
	public void addTerm(Term term) {
		termMapper.addTerm(term);
	}

	@Override
	public List<Term> showDatalist(String kinfo) {
		return termMapper.showDatalist(kinfo);
	}

	@Override
	public void updateState(String state, String tid,String mid,String type) {
		termMapper.updateState(state, tid,mid,type);
	}

	@Override
	public Term showSterm(String tid,String mid,String type) {
		return termMapper.showSterm(tid,mid,type);
	}

	@Override
	public void updateDetailinfo(Term term) {
		termMapper.updateDetailinfo(term);
	}

	@Override
	public Sales selSa(String salesid) {
		return termMapper.selSa(salesid);
	}

	@Override
	public Store selSo(String storeid) {
		return termMapper.selSo(storeid);
	}
}
