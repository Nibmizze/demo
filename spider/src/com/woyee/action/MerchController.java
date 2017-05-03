package com.woyee.action;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
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

import com.google.gson.Gson;
import com.woyee.entity.Merch;
import com.woyee.entity.MerchExcel;
import com.woyee.entity.Sales;
import com.woyee.entity.Store;
import com.woyee.entity.User;
import com.woyee.service.MerchService;
import com.woyee.util.InputExcUtil;

@Controller
@RequestMapping(value = "merchController")
public class MerchController {

	@Resource(name = "merchService")
	private MerchService merchService;

	// 显示
	@RequestMapping("showMerch")
	public ModelAndView showInfo(HttpServletRequest request, Integer page, Merch merch) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String role = (String) session.getAttribute("role");
		User user = (User) session.getAttribute("user");
		int pageSize = 15;
		int totalPage = 0;
		int spage;
		int epage;
		int curPage;
		String mid = null;
		String salesid = null;
		String storeid = null;
		String sdate = null;
		String edate = null;
		if ("10".equals(role)) {
			mid = user.getMid();
			merch.setMid(mid);
		}
		if ("20".equals(role)) {
			salesid = user.getSalesid();
			merch.setSalesid(salesid);
		}
		if ("30".equals(role)) {
			storeid = user.getIns();
			if(storeid.substring(1).equals("000000")){
				merch.setStoreid(storeid.substring(0, 1));
			}else{
				merch.setStoreid(storeid);
			}
		}
		String fsdate = request.getParameter("sdate");
		String fedate = request.getParameter("edate");
		if (fsdate != null) {
			sdate = fsdate.replace("-", "");
		}
		if (fedate != null) {
			edate = fedate.replace("-", "");
		}
		if (mid == null) {
			mid = request.getParameter("mid");
			merch.setMid(mid);
		}
		String midName = request.getParameter("midName");
		String type = request.getParameter("type");
		if (storeid == null) {
			storeid = request.getParameter("storeid");
			merch.setStoreid(storeid);
		}
		if (salesid == null) {
			salesid = request.getParameter("salesid");
			merch.setSalesid(salesid);
		}
		String state = request.getParameter("state");
		merch.setMidName(midName);
		merch.setType(type);
		merch.setState(state);
		merch.setSdate(sdate);
		merch.setEdate(edate);
		
		int count = merchService.showCount(merch);
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
		merch.setSpage(spage);
		merch.setEpage(epage);

		List<Merch> list = merchService.showMerchs(merch);
		session.setAttribute("list", list);
		session.setAttribute("count", count);
		session.setAttribute("totalpage", totalPage);
		session.setAttribute("curPage", curPage);
		session.setAttribute("sdate", sdate);
		session.setAttribute("edate", edate);
		session.setAttribute("mid", mid);
		session.setAttribute("midName", midName);
		session.setAttribute("type", type);
		session.setAttribute("storeid", storeid);
		session.setAttribute("salesid", salesid);
		session.setAttribute("state", state);
		mv.setViewName("redirect:/example/merch.jsp");
		return mv;
	}

	// 导入
	@RequestMapping("inputExcel")
	public void inputExcel(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("file") MultipartFile file) throws IOException {
		// ModelAndView mv = new ModelAndView();
		response.setContentType("text/html;charset=utf-8");
		boolean result = false;

		String fname = file.getOriginalFilename();
		// 生成路径
		File ifile = null;
		ifile = new File("../../temp");

		if (!ifile.isDirectory()) {
			ifile.mkdirs();
		}
		String basePath = "../../temp/";

		String path = basePath + fname;
		file.transferTo(new File(path));

		// 得到表格中所有的数据
		List<MerchExcel> listExcel = InputExcUtil.getAllByExcel(basePath + fname);
		SimpleDateFormat sm = new SimpleDateFormat("yyyyMMdd");
		String date = sm.format(new Date());
		SimpleDateFormat sm1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String upTime = sm1.format(new Date());
		for (MerchExcel m : listExcel) {
			try {

				merchService.addMerch(m.getMid(), m.getMidName(), m.getType(), m.getDfee(), m.getCfee(), m.getDtop(),
						m.getO2ofee(), m.getLinkMan(), m.getLinkTel(), m.getAddress(), m.getBranch(), m.getAccname(),
						m.getAccno(), m.getChannel(), m.getStoreid(), m.getSalesid(), date, upTime);
				File file1 = new File(path);
				file1.delete();
				result = true;
				/*
				 * String id=m.getMid(); String type = m.getType(); if
				 * (!InputExcUtil.isExist(id,type)) { //不存在就添加 }else { //存在就更新 }
				 */

			} catch (Exception e) {
				if (result == true) {
					break;
				} else {
					e.printStackTrace();
					File file1 = new File(path);
					file1.delete();
					response.getWriter().write("<script>alert('商户号为：" + m.getMid()
							+ "的商户信息录入出错，请检查');window.location='/spider/merchController/showMerch.do';window.close();</script>");
					response.getWriter().flush();
					return;
				}

			}
		}

		if (result) {
			response.getWriter().write(
					"<script>alert('导入成功');window.location='/spider/merchController/showMerch.do';window.close();</script>");
			response.getWriter().flush();
			return;
		} else {
			response.getWriter().write(
					"<script>alert('导入失败');window.location='/spider/merchController/showMerch.do';window.close();</script>");
			response.getWriter().flush();
			return;
		}
	}

	// 表格模板下载
	@RequestMapping("downloadModel")
	public void downloadModel(HttpServletRequest request, HttpServletResponse response) throws IOException {
		File file = new File("../template_file/文件模板-商户.xls");
		String modelName = "商户信息模板(请保存时另存为03版本)";
		// 读出文件到i/o流
		FileInputStream fis = new FileInputStream(file);
		BufferedInputStream buff = new BufferedInputStream(fis);
		response.setHeader("content-disposition",
				"attachment;filename=" + java.net.URLEncoder.encode(modelName, "UTF-8") + ".xls");

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

	// 单个添加
	@RequestMapping("addOneInfo")
	public ModelAndView addOneInfo(Merch merch) throws IOException {
		ModelAndView mv = new ModelAndView();
		SimpleDateFormat sm = new SimpleDateFormat("yyyyMMdd");
		String date = sm.format(new Date());
		SimpleDateFormat sm1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String upTime = sm1.format(new Date());
		merchService.addMerch(merch.getMid(), merch.getMidName(), merch.getType(), merch.getDfee(), merch.getCfee(),
				merch.getDtop(), merch.getO2ofee(), merch.getLinkMan(), merch.getLinkTel(), merch.getAddress(),
				merch.getBranch(), merch.getAccname(), merch.getAccno(), merch.getChannel(), merch.getStoreid(),
				merch.getSalesid(), date, upTime);
		mv.setViewName("redirect:/merchController/showMerch.do");
		return mv;
	}

	// 查询机构表
	@RequestMapping("queryStore")
	public void queryStore(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Store> list = merchService.querySto();
		Gson gson = new Gson();
		out.print(gson.toJson(list));
	}

	// 查询员工表
	@RequestMapping("querySales")
	public void querySales(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		String storeId = request.getParameter("storeid");
		List<Sales> list = merchService.querySal(storeId);
		Gson gson = new Gson();
		out.print(gson.toJson(list));
	}

	// 注销账户
	@RequestMapping("logout")
	public ModelAndView logout(HttpServletRequest request) throws IOException {
		ModelAndView mv = new ModelAndView();
		String mid = request.getParameter("mid");
		String type = request.getParameter("type");
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String upTime = sm.format(new Date());
		merchService.updateState(mid, type, upTime);
		mv.setViewName("redirect:/merchController/showMerch.do");
		return mv;
	}

	// 查询修改信息
	@RequestMapping("queryUpdate")
	public ModelAndView queryUpdate(HttpServletRequest request) throws IOException {
		ModelAndView mv = new ModelAndView();
		String mid = request.getParameter("mid");
		String type = request.getParameter("type");
		List<Merch> list = merchService.queryOneMerch(mid, type);
		request.getSession().setAttribute("merch", list);
		mv.setViewName("redirect:/example/updateInfo.jsp");
		return mv;
	}

	// 修改账户信息
	@RequestMapping("updateInfo")
	public void updateInfo(Merch merch, HttpServletResponse response) {
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String upTime = sm.format(new Date());
		merchService.updateInfo(merch.getMid(), merch.getType(), merch.getDfee(), merch.getCfee(), merch.getDtop(),
				merch.getO2ofee(), merch.getLinkMan(), merch.getLinkTel(), merch.getAddress(), merch.getBranch(),
				merch.getAccname(), merch.getAccno(), merch.getChannel(), upTime);
		try {
			response.getWriter().write(
					"<script>parent.location.href='/spider/merchController/showMerch.do';window.close();</script>");
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
