package com.woyee.action;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.woyee.entity.Merchant;
import com.woyee.entity.MerchantVo;
import com.woyee.service.MerchantService;
import com.woyee.util.BrowserUtil;
import com.woyee.util.FileUtil;


@Controller
@RequestMapping(value = "merchantController")
public class MerchantController {

	@Resource(name = "merchantService")
	private MerchantService merchantService;

	//显示
	@RequestMapping("showAll")
	public ModelAndView showInfo(HttpServletRequest request, Integer page ,MerchantVo merchantVo) {
		ModelAndView mv = new ModelAndView();
		
		int pageSize = 15;
		int totalPage= 0;
		int spage;
		int epage;
		int curPage;
		
		String	sdate = null;
		String	edate = null; 
		String fsdate = request.getParameter("sdate");
		String fedate = request.getParameter("edate");
		
		if(fsdate!=null){
			sdate = fsdate.replace("-", "");
		}
		if(fedate!=null){
			edate = fedate.replace("-", "");
		}

		String dcflag     = request.getParameter("dcflag");
		String state      = request.getParameter("state");
		String trans_name = request.getParameter("trans_name");
		String mid        = request.getParameter("mid");
		
		merchantVo.setSdate(sdate);
		merchantVo.setEdate(edate);
		merchantVo.setMid(mid);
		merchantVo.setState(state);
		merchantVo.setTrans_name(trans_name);
		merchantVo.setDcflag(dcflag);
		
		int count = merchantService.showCount(merchantVo);
		System.out.println(count + "===============");
		
		if (count % pageSize == 0) {
			totalPage = count / pageSize;
		} else {
			totalPage = count / pageSize + 1;
		}
		// 上下页限制
		if (null == page) {
			page = 1;
		} else {
			if (page < 1) {
				page = 1;
			} else if (page > totalPage) {
				page = totalPage;
			}
		}
		curPage = page;
		spage   = (page - 1) * pageSize;
		epage   = spage + pageSize;
		merchantVo.setSpage(spage);
		merchantVo.setEpage(epage);
		
		List<Merchant> list = merchantService.showMerchants(merchantVo);

		HttpSession session = request.getSession();
		session.setAttribute("mlist", list);
		session.setAttribute("count", count);
		session.setAttribute("dcflag", dcflag);
		session.setAttribute("sdate", sdate);
		session.setAttribute("edate", edate);
		session.setAttribute("state", state);
		session.setAttribute("trans_name", trans_name);
		session.setAttribute("totalpage", totalPage);
		session.setAttribute("curPage", curPage);
		mv.setViewName("redirect:/example/merInfo.jsp");
		return mv;
	}

	//导入
	@RequestMapping("inputExcel")
	public void inputExcel(HttpServletRequest request,HttpServletResponse response,Merchant merchant,@RequestParam("file")MultipartFile file) throws IOException {
		//ModelAndView mv = new ModelAndView();
		response.setContentType("text/html;charset=utf-8");
		String fname = file.getOriginalFilename();
		
	    //生成路径
	    File ifile = null;
	    ifile = new File("../../cupsData/");
	    
		if (!ifile.isDirectory()){
			ifile.mkdirs();
		}
	    String basePath = "../../cupsData/";
	    
//	    SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
//		String importdate = date.format(new Date());
      
	    String importdate = request.getParameter("data_date");
	    String path = basePath + fname;
	    file.transferTo(new File(path));	    
	    
		System.out.println("=====上传的文件名：" +fname+"=====上传文件日期：" +importdate);
        boolean result = false;
        result = FileUtil.inPut(fname,importdate);
       // mv.setViewName("redirect:/merchantController/showAll.do");
        try {
			if(result){
				System.out.println("=====上传的文件：" +fname +"成功 result=" +result);
				/*JSONObject jsonObj;
				jsonObj = new JSONObject().put("data","导入成功");
				response.getWriter().print(jsonObj.toString());*/
				response.getWriter().print("导入成功");
				//return mv;
			}else{
				System.out.println("=====上传的文件：" +fname +"失败 result=" +result);
				/*JSONObject jsonObj;
				jsonObj = new JSONObject().put("data","导入失败");
				response.getWriter().print(jsonObj.toString());*/
				response.getWriter().print("导入失败");
				//return mv;
			}
		} catch (Exception e) {
			System.out.println("=====上传的文件：" +fname +"显示异常  result=" +result);
			//return mv;
		}
	}

	//导出文件
	@RequestMapping("outputExcel")
	public void outputExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");  
        OutputStream out = null;
        
        try {
        	String codedFileName = request.getParameter("export_file");
	    
        	response.setContentType("application/vnd.ms-excel");
        	// 根据浏览器进行转码，使其支持中文文件名
	 		String browse = BrowserUtil.checkBrowse(request);
	 		
	 		if(browse.equals("其它"))
	 		{
	 			response.setHeader(
	 					"content-disposition",
	 					"attachment;filename="
	 					+ java.net.URLEncoder.encode(codedFileName,
	 					"UTF-8") + ".xls");
	 		}
	 		else if ("MSIE".equalsIgnoreCase(browse.substring(0, 4))) {
	 			response.setHeader(
	 					"content-disposition",
	 					"attachment;filename="
	 					+ java.net.URLEncoder.encode(codedFileName,
	 					"UTF-8") + ".xls");
	 		} 
	 		else {
	 			String newtitle = new String(codedFileName.getBytes("UTF-8"), "ISO8859-1");
	 	
	 			response.setHeader("content-disposition", "attachment;filename=" + newtitle + ".xls");
	 		}
	 		
	 		// 第一步，创建一个workbook，对应一个Excel文件      
	 		HSSFWorkbook wb = new HSSFWorkbook(); 
	 		// 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet   
	 		// HSSFSheet sheet = wb.createSheet("MerInfo");
	 		HSSFSheet sheet = wb.createSheet();
	 		//设置编码方式
	 		wb.setSheetName(0, "商户流水表",HSSFWorkbook.ENCODING_UTF_16);
	 		//默认宽度
	 		sheet.setDefaultColumnWidth((short) 13);
	 		//单独设置宽度
	 		sheet.setColumnWidth((short) 6, (short)7000);
	 		sheet.setColumnWidth((short) 7, (short)9000);
	 		sheet.setColumnWidth((short) 8, (short)6000);
	 		// 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short      
	 		HSSFRow row = sheet.createRow((int) 0);      
	 		// 第四步，创建单元格，并设置值表头 设置表头居中      
	 		HSSFCellStyle style = wb.createCellStyle();  
	 		style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式      
      
	 		HSSFCell cell = null;
	 		String [] excel={"交易日期","清算日期","交易名称","交易金额","交易手续费","收单服务商分润","交易账号",
	 				         "商户名称","商户号","终端号","交易流水","参考号","授权码","交易时间","卡信息","冲正标志","撤销标志" };
	 		
	 		for(short i=0; i<excel.length; i++){
	 			cell = row.createCell(i);
	 			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	 			cell.setCellValue(excel[i]); 
	 			cell.setCellStyle(style); 
	 		}
	 		// 第五步，写入实体数据 实际应用中这些数据从数据库得到，      
	 		// List <Merchant> mlist = merchantService.showBydate(codedFileName);
	 		MerchantVo merchantVo = new MerchantVo();
	 		HttpSession session = request.getSession();
	 		String sdate        = (String) session.getAttribute("sdate");
	 		String edate        = (String) session.getAttribute("edate");
	 		String trans_name   = (String) session.getAttribute("trans_name");
	 		String dcflag       = (String) session.getAttribute("dcflag");
	 		String state        = (String) session.getAttribute("state");
	 		String mid          = (String) session.getAttribute("mid");
	 		
			merchantVo.setSdate(sdate);
			merchantVo.setEdate(edate);
			merchantVo.setState(state);
			merchantVo.setMid(mid);
			merchantVo.setDcflag(dcflag);
			merchantVo.setTrans_name(trans_name);

			List<MerchantVo> mlist = merchantService.exportByInfo(merchantVo);
			
			for(int i=0;i<mlist.size();i++){
				row = sheet.createRow((int) i + 1);
				MerchantVo m = mlist.get(i);
        	
				if(m.getTdate()!=null){
					cell=row.createCell((short) 0);
					cell.setCellValue(m.getTdate());
					cell.setCellStyle(style);
				}
				if(m.getSettle_date()!=null){
					cell=row.createCell((short) 1);
					cell.setCellValue(m.getSettle_date());
					cell.setCellStyle(style);
				}
				if(m.getTrans_name()!=null){
	        		cell=row.createCell((short) 2);
	        		cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	        		cell.setCellValue(m.getTrans_name());
	        		cell.setCellStyle(style);
	        	}
	        	if(m.getAmt()!=null){
	        		cell=row.createCell((short) 3);
	        		cell.setCellValue(m.getAmt());
	        		cell.setCellStyle(style);
	        	}
	        	if(m.getMerch_fee()!=null){
	        		cell=row.createCell((short) 4);
	        		cell.setCellValue(m.getMerch_fee());
	        		cell.setCellStyle(style);
	        	}
	        	if(m.getSdf_fee()!=null){
	        		cell=row.createCell((short) 5);
	        		cell.setCellValue(m.getSdf_fee());
	        		cell.setCellStyle(style);
	        	}
	        	if(m.getCard_no()!=null){
	        		cell=row.createCell((short) 6);
	        		cell.setCellValue(m.getCard_no());
	        		cell.setCellStyle(style);
	        	}
	        	if(m.getMidname()!=null){
	        		cell=row.createCell((short) 7);
	        		cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	        		cell.setCellValue(m.getMidname());
	        		cell.setCellStyle(style);
	        	}
	        	if(m.getMid()!=null){
	        		cell=row.createCell((short) 8);
	        		cell.setCellValue(m.getMid());
	        		cell.setCellStyle(style);
	        	}
	        	if(m.getTid()!=null){
	        		cell=row.createCell((short) 9);
	        		cell.setCellValue(m.getTid());
	        		cell.setCellStyle(style);
	        	}
	        	if(m.getTraceno()!=null){
	        		cell=row.createCell((short) 10);
	        		cell.setCellValue(m.getTraceno());
	        		cell.setCellStyle(style);
	        	}
	        	if(m.getRefno()!=null){
	        		cell=row.createCell((short) 11);
	        		cell.setCellValue(m.getRefno());
	        		cell.setCellStyle(style);
	        	}
	        	if(m.getAuth_id()!=null){
	        		cell=row.createCell((short) 12);
	        		cell.setCellValue(m.getAuth_id());
	        		cell.setCellStyle(style);
	        	}
	        	if(m.getTtime()!=null){
	        		cell=row.createCell((short) 13);
	        		cell.setCellValue(m.getTtime());
	        		cell.setCellStyle(style);
	        	}
	        	if(m.getDcflag()!=null){
	        		String dcFlag=m.getDcflag();
	        		if(dcFlag.equals("C")){
	        			cell=row.createCell((short) 14);
	        			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		        		cell.setCellValue("贷记卡");
		        		cell.setCellStyle(style);
	        		}else if(dcFlag.equals("D")){
		        	    cell=row.createCell((short) 14);
		        		cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			        	cell.setCellValue("借记卡");
			        	cell.setCellStyle(style);
	        		}else if(dcFlag.equals("Z")){
	        			cell=row.createCell((short) 14);
	        			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		        		cell.setCellValue("准贷记卡");
		        		cell.setCellStyle(style);
        		    }else if(dcFlag.equals("T")){
	        			cell=row.createCell((short) 14);
	        			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		        		cell.setCellValue("未知卡");
		        		cell.setCellStyle(style);
        		    }else if(dcFlag.equals("O")){
	        			cell=row.createCell((short) 14);
	        			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
		        		cell.setCellValue("预付费卡");
		        		cell.setCellStyle(style);
        		    }
	        	}
	        	if(m.getR_flag()!=null){
	        		cell=row.createCell((short) 15);
	        		cell.setCellValue(m.getR_flag());
	        		cell.setCellStyle(style);
	        	}
	        	if(m.getC_flag()!=null){
	        		cell=row.createCell((short) 16);
	        		cell.setCellValue(m.getC_flag());
	        		cell.setCellStyle(style);
	        	}
	        }
			// 第六步，将文件存到指定位置    
			out = response.getOutputStream();
			wb.write(out);
        } catch (Exception e) {
        	System.out.println("导出文件异常 ：" +e.getMessage());
        }
		finally {
			try {
				out.flush();
				out.close();
			} catch (IOException e) {
				System.out.println("导出文件后关闭异常 ：" +e.getMessage());

			}
		}
    }     
}
