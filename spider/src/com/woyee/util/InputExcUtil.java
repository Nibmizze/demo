package com.woyee.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.woyee.entity.MerchExcel;
import com.woyee.service.MerchService;

import jxl.Sheet;
import jxl.Workbook;
import jxl.WorkbookSettings;

public class InputExcUtil {
	
	@Resource(name = "merchService")
	private static MerchService merchService;
	
	/**
     * 查询指定目录中电子表格中所有的数据
     * @param file 文件完整路径
     * @return
     */
    public static List<MerchExcel> getAllByExcel(String file){
        List<MerchExcel> list=new ArrayList<MerchExcel>();
        try {
        	WorkbookSettings workbooksetting = new WorkbookSettings();
        	workbooksetting .setCellValidationDisabled(true);
            Workbook rwb=Workbook.getWorkbook(new File(file),workbooksetting);
            Sheet rs=rwb.getSheet(0);//或者rwb.getSheet(0)
            int clos=rs.getColumns();//得到所有的列
            int rows=rs.getRows();//得到所有的行
            
            System.out.println(clos+" rows:"+rows);
            for (int i = 1; i < rows; i++) {
                for (int j = 0; j < clos; j++) {
                    //第一个是列数，第二个是行数
                	String midName=rs.getCell(j++, i).getContents().trim();
                	String type=rs.getCell(j++, i).getContents().trim();
                    String mid=rs.getCell(j++, i).getContents().trim();//默认最左边编号也算一列 所以这里得j++
                    String channel=rs.getCell(j++, i).getContents().trim();
                    String dfee=rs.getCell(j++, i).getContents().trim();
                    String dtop=rs.getCell(j++, i).getContents().trim();
                    String cfee=rs.getCell(j++, i).getContents().trim();
                    String o2ofee=rs.getCell(j++, i).getContents().trim();
                    String linkMan=rs.getCell(j++, i).getContents().trim();
                    String linkTel=rs.getCell(j++, i).getContents().trim();
                    String address=rs.getCell(j++, i).getContents().trim();
                    String branch=rs.getCell(j++, i).getContents().trim();
                    String accname=rs.getCell(j++, i).getContents().trim();
                    String accno=rs.getCell(j++, i).getContents().trim();
                    String storeid=rs.getCell(j++, i).getContents().trim();
                    String salesid=rs.getCell(j++, i).getContents().trim();
                    
                    System.out.println("mid:"+mid+" name:"+midName+" type:"+type);
                    list.add(new MerchExcel(mid, midName, type, dfee, cfee, dtop, o2ofee, linkMan, linkTel, address, branch, accname, accno, channel, storeid, salesid));
                   
                }
            }
            for (MerchExcel m : list) {
				System.out.println(m.getMid());
			}
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return list;
        
    }
    
    /**
     * 通过Id判断是否存在
     * @param id
     * @return
     */
    public static boolean isExist(String id,String type){
            int count = merchService.queryMerch(id,type);
            if (count>0) {
                return true;
        }
        return false;
    }
    
}
