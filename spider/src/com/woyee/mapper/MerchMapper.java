package com.woyee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.woyee.entity.Merch;
import com.woyee.entity.Sales;
import com.woyee.entity.Store;

@Repository("merchMapper")
public interface MerchMapper {

	// count数量
	public int showCount(Merch merch);

	// 商户信息显示
	public List<Merch> queryMerchs(Merch merch);

	// 查询唯一商户信息
	public int queryMerch(@Param("id") String id, @Param("type") String type);

	// excel导入添加商户信息
	public void addMerch(@Param("mid") String mid, @Param("midName") String midName, @Param("type") String type,
			@Param("dfee") String dfee, @Param("cfee") String cfee, @Param("dtop") String dtop,
			@Param("o2ofee") String o2ofee, @Param("linkMan") String linkMan, @Param("linkTel") String linkTel,
			@Param("address") String address, @Param("branch") String branch, @Param("accname") String accname,
			@Param("accno") String accno, @Param("channel") String channel, @Param("storeid") String storeid,
			@Param("salesid") String salesid, @Param("date") String date, @Param("upTime")String upTime);

	// 查询机构表
	public List<Store> querySto();

	// 查询业务员
	public List<Sales> querySal(@Param("storeId") String storeId);

	// 注销用户
	public void updateState(@Param("mid") String mid, @Param("type") String type, @Param("upTime")String upTime);

	// 查询修改商户信息
	public List<Merch> queryOneMerch(@Param("mid") String mid, @Param("type") String type);

	// 修改账户信息
	public void updateInfo(@Param("mid") String mid, @Param("type") String type, @Param("dfee") String dfee,
			@Param("cfee") String cfee, @Param("dtop") String dtop, @Param("o2ofee") String o2ofee,
			@Param("linkMan") String linkMan, @Param("linkTel") String linkTel, @Param("address") String address,
			@Param("branch") String branch, @Param("accname") String accname, @Param("accno") String accno,
			@Param("channel") String channel, @Param("upTime")String upTime);

}
