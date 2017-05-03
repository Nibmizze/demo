package com.woyee.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.woyee.entity.MerchExcel;
import com.woyee.entity.Term;
import com.woyee.service.MerchService;
import com.woyee.service.TermService;

import jxl.Sheet;
import jxl.Workbook;
import jxl.WorkbookSettings;

public class InputTermExlUtil {
	
	@Resource(name = "termService")
	private static TermService termService;
	
	/**
     * 查询指定目录中电子表格中所有的数据
     * @param file 文件完整路径
     * @return
     */
    public static List<Term> getAllByExcel(String file,String data_date){
        List<Term> list=new ArrayList<Term>();
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
                	String store_id=rs.getCell(j++, i).getContents().trim();
                    String sales_id=rs.getCell(j++,i).getContents().trim();
                	String name=rs.getCell(j++, i).getContents().trim();
                	String type=rs.getCell(j++, i).getContents().trim();
                    String mid=rs.getCell(j++, i).getContents().trim();//默认最左边编号也算一列 所以这里得j++
                    String tid=rs.getCell(j++, i).getContents().trim();
                    String belong=rs.getCell(j++, i).getContents().trim();
                    String model=rs.getCell(j++, i).getContents().trim();
                    String serial_nu=rs.getCell(j++, i).getContents().trim();
                    String deposit=rs.getCell(j++,i).getContents().trim();
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String up_time = dateFormat.format(new Date());
                  //String up_time = data_date;
                 // String state=rs.getCell(j++, i).getContents();
                 // String data_date=rs.getCell(j++, i).getContents();
                    
                    list.add(new Term(name,type,mid,tid,belong,model,serial_nu,"1",data_date,deposit,store_id,sales_id,up_time));
                   
                }
            }
            for (Term m : list) {
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
  /*  public static boolean isExist(String id,String type){
            int count = merchService.queryMerch(id,type);
            if (count>0) {
                return true;
        }
        return false;
    }
    
    public static void main(String[] args) {
		getAllByExcel("e:/logs/1.xls");
	}*/
    
}
