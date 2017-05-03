package com.woyee.service;

import java.util.List;

import com.woyee.entity.Sales;
import com.woyee.entity.Store;
import com.woyee.entity.Term;
import com.woyee.entity.TermVo;


public interface TermService {

	//数量
	public int showCount(TermVo termVo);
	
	//查询终端信息
	public List<Term> showTerms(TermVo termVo);
	
	//excel导入添加终端信息
	public void addTerm(Term term);
	
	//检索
	public List<Term>showDatalist(String kinfo);
	
	//修改状态
	public void updateState(String state,String tid,String mid,String type);
	
	public Term showSterm(String tid,String mid,String type);
	
	public void updateDetailinfo(Term term);
	
	public Sales selSa(String salesid);
    
    public Store selSo(String storeid);
}
