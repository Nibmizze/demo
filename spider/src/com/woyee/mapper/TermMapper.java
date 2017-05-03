package com.woyee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.woyee.entity.Sales;
import com.woyee.entity.Store;
import com.woyee.entity.Term;
import com.woyee.entity.TermVo;

@Repository("termMapper")
public interface TermMapper {

	//数量
	public int showCount(TermVo termVo);
	
	//显示
	public List<Term> queryTerms(TermVo termVo);
	
	// excel导入添加商户信息
    public void addTerm(Term term);
    
	//检索效果
	public List<Term> showDatalist(@Param("kinfo") String kinfo);
	
	//状态修改
	public void updateState(@Param("state")String state,@Param("tid")String tid,@Param("mid")String mid,@Param("type")String type);
	
	//单条信息
	public Term showSterm(@Param("tid")String tid,@Param("mid")String mid,@Param("type")String type);
	
	//修改信息
    public void updateDetailinfo(Term term);	
    
    public Sales selSa(@Param("salesid")String salesid);
    
    public Store selSo(@Param("storeid")String storeid);
}
