package com.woyee.action;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.woyee.entity.Term;
import com.woyee.entity.TermVo;
import com.woyee.entity.User;
import com.woyee.service.TermService;
import com.woyee.util.InputTermExlUtil;




@Controller
@RequestMapping(value = "termController")
public class TermController {

	@Resource(name = "termService")
	private TermService termService;

	@RequestMapping("showTerms")
	public ModelAndView showInfo(HttpServletRequest request, Integer page,TermVo termVo) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String role = (String) session.getAttribute("role");
		User user = (User) session.getAttribute("user");
		int pageSize = 15;
		int totalPage;
		int spage;
		int epage;
		int curPage;
		String mid =null;
		String sales_id=null;
		String store_id=null;
		String	sdate = null;
		String	edate = null; 
		if ("10".equals(role)) {
			mid = user.getMid();
			termVo.setMid(mid);
		}
		if ("20".equals(role)) {
			sales_id = user.getSalesid();
			termVo.setSales_id(sales_id);
		}
//		if ("30".equals(role)) {
//			store_id = user.getIns();
//			termVo.setStore_id(store_id);
//		}
		if ("30".equals(role)) {
			store_id = user.getIns();
			if(store_id.substring(1).equals("000000")){
				termVo.setStore_id(store_id.substring(0, 1));
			}else{
				termVo.setStore_id(store_id);
			}
		}
		String fsdate = request.getParameter("sdate");
		String fedate = request.getParameter("edate");
		if(fsdate!=null){
			sdate = fsdate.replace("-", "");
		}
		if(fedate!=null){
			edate = fedate.replace("-", "");
		}
		String termName = request.getParameter("name");
		if(mid == null){
			mid = request.getParameter("mid");
			termVo.setMid(mid);
		}
		String tid = request.getParameter("tid");
		String belong = request.getParameter("belong");
		String model = request.getParameter("model");
		String serial_nu = request.getParameter("serial_nu");
		String state = request.getParameter("state");
		if (store_id == null) {
			store_id = request.getParameter("store_id");
			termVo.setStore_id(store_id);
		}
		if (sales_id == null) {
			sales_id = request.getParameter("sales_id");
			termVo.setSales_id(sales_id);
		}
		termVo.setBelong(belong);
		termVo.setEdate(edate);
		termVo.setSdate(sdate);
		termVo.setModel(model);
		termVo.setTid(tid);
		termVo.setName(termName);
		termVo.setSerial_nu(serial_nu);
		termVo.setState(state);
		int count = termService.showCount(termVo);
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
		spage = (page - 1) * pageSize;
		epage = spage + pageSize;
		termVo.setSpage(spage);
		termVo.setEpage(epage);
		
		List<Term> list1 = termService.showTerms(termVo);
		session.setAttribute("tlist", list1);
		session.setAttribute("count", count);
		session.setAttribute("totalpage", totalPage);
		session.setAttribute("curPage", curPage);
		
		session.setAttribute("sdate", sdate);
		session.setAttribute("edate", edate);
		session.setAttribute("termName", termName);
		session.setAttribute("mid", mid);
		session.setAttribute("tid", tid);
		session.setAttribute("belong", belong);
		session.setAttribute("model", model);
		session.setAttribute("serial_nu", serial_nu);
		session.setAttribute("state", state);
		session.setAttribute("store_id", store_id);
		session.setAttribute("sales_id", sales_id);
		mv.setViewName("redirect:/example/term.jsp");
		return mv;
	}

	@RequestMapping("downloadModel")
	public void inputExcel(HttpServletRequest request,HttpServletResponse response) throws IOException{
	    File file = new File("../template_file/文件模板-终端.xls");
	    String modelName="终端模板(请保存时另存为03版本)";
        // 读出文件到i/o流  
        FileInputStream fis = new FileInputStream(file);  
        BufferedInputStream buff = new BufferedInputStream(fis);  
        response.setHeader("content-disposition","attachment;filename="+ java.net.URLEncoder.encode(modelName,"UTF-8") + ".xls");
  
        byte[] b = new byte[1024];// 相当于我们的缓存  
        long k = 0;// 该值用于计算当前实际下载了多少字节  
        // 从response对象中得到输出流,准备下载  
        OutputStream myout = response.getOutputStream();  
        // 开始循环下载  
  
        while (k < file.length()) {  
            int j = buff.read(b, 0, 1024);  
            k += j;  
            // 将b中的数据写到客户端的内存  
            myout.write(b, 0, j);  
        }  
        // 将写入到客户端的内存的数据,刷新到磁盘  
        myout.flush();  
	}
	
	@RequestMapping("showDatalist")
	public void showDatalist(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
	    String kinfo = request.getParameter("tid");

	    if(kinfo!=""){
	    List<Term> klist = termService.showDatalist(kinfo);
	    //String data = "[";
	    String data = "";
	    for (int i=0;i<klist.size();i++) {
	    	if(i==0){
	    		data =data+klist.get(i).getTid().toString();
	    		
	    	}else{
	    		data =data+","+klist.get(i).getTid().toString();
	
	    	}
		}
	    response.getWriter().print(data);
	    
	    }
	}
	
	@RequestMapping("addTerminfo")
	public ModelAndView addTerminfo(HttpServletRequest request,HttpServletResponse response,Term term){
		ModelAndView mv = new ModelAndView();
	    String name = request.getParameter("name");
		String mid = request.getParameter("mid");
		String tid = request.getParameter("tid");
		String belong = request.getParameter("belong");
		String model = request.getParameter("model");
		String serial_nu = request.getParameter("serial_nu");
		String store_id = request.getParameter("store_id");
		String sales_id = request.getParameter("sales_id");
		SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String up_time = dataFormat.format(new Date());
		SimpleDateFormat dataFormat2 = new SimpleDateFormat("yyyyMMdd");
		String data_date = dataFormat2.format(new Date());
		String type = request.getParameter("type");
		String deposit = request.getParameter("deposit");
		term.setBelong(belong);
		term.setMid(mid);
		term.setModel(model);
		term.setTid(tid);
		term.setName(name);
		term.setSerial_nu(serial_nu);
		term.setState("1");
		term.setData_date(data_date);
		term.setType(type);
		term.setDeposit(deposit);
		term.setUp_time(up_time);
		term.setStore_id(store_id);
		term.setSales_id(sales_id);
		termService.addTerm(term);
		mv.setViewName("redirect:/termController/showTerms.do");
		return mv;
	}
	@RequestMapping("updateState")
	public ModelAndView updateState(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		String state = request.getParameter("state");
		String tid = request.getParameter("tid");
		String type = request.getParameter("type");
		String mid = request.getParameter("mid");
		termService.updateState(state,tid,mid,type);
		System.out.println(state+"========================="+tid);
		mv.setViewName("redirect:/termController/showTerms.do");
		return mv;
	}
	
	@RequestMapping("showSTerm")
	public ModelAndView showSTerm(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		String tid = request.getParameter("tid");
		String mid = request.getParameter("mid");
		String type = request.getParameter("type");
		Term term = termService.showSterm(tid,mid,type);
		HttpSession session = request.getSession();
		session.setAttribute("term", term);
		mv.setViewName("redirect:/example/updateTerm.jsp");
		return mv;
	} 
	
	@RequestMapping("updateDetail")
	public void updateDetail(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//ModelAndView mv = new ModelAndView();
		String tid = request.getParameter("tid");
		String type = request.getParameter("type");
		String mid = request.getParameter("mid");
		String belong = request.getParameter("belong");
		String deposit = request.getParameter("deposit");
		String serial_nu = request.getParameter("serial_nu");
		String model = request.getParameter("model");
		String store_id = request.getParameter("store_id");
		String sales_id = request.getParameter("sales_id");
		Term term = new Term();
		term.setTid(tid);
		term.setDeposit(deposit);
		term.setSerial_nu(serial_nu);
		term.setModel(model);
		term.setBelong(belong);
		term.setStore_id(store_id);
		term.setSales_id(sales_id);
		term.setMid(mid);
		term.setType(type);
		termService.updateDetailinfo(term);
		response.getWriter().write(
				"<script>parent.location.href='/spider//termController/showTerms.do';window.close();</script>");
		response.getWriter().flush();
	}
			
	@RequestMapping("inputTermExcel")
	public void inputExcel(HttpServletRequest request,HttpServletResponse response,@RequestParam("file")MultipartFile file) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		ModelAndView mv = new ModelAndView();
		boolean result = false;
		String fname = file.getOriginalFilename();
		
	    //生成路径
	    File ifile = null;
	    ifile = new File("../../temp");
		if (!ifile.isDirectory()){
			ifile.mkdirs();
		}
	    String basePath = "../../temp/";
	    
	    String path = basePath + fname;
	    file.transferTo(new File(path));
	    SimpleDateFormat dataFormat2 = new SimpleDateFormat("yyyyMMdd");
		String data_date = dataFormat2.format(new Date());
		// 得到表格中所有的数据
        List<Term> listExcel = InputTermExlUtil.getAllByExcel(basePath + fname,data_date);
        
        for (Term t : listExcel) {
			termService.addTerm(t);
			File file1 = new File(path);
			file1.delete();
			result = true;
		}
        try {
			if(result){
				response.getWriter().print("导入成功");
			}else{
				response.getWriter().print("导入失败");
			}
		} catch (Exception e) {
		}
	}

}
