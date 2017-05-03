package com.woyee.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.woyee.entity.Sales;
import com.woyee.entity.Trans;
import com.woyee.entity.User;
import com.woyee.service.MerchService;
import com.woyee.service.TransService;

@Controller
@RequestMapping(value = "transController")
public class TransController {
	@Resource(name = "transService")
	private TransService transService;
	@Resource(name = "merchService")
	private MerchService merchService;

	// 显示
	@RequestMapping("showTrans")
	public ModelAndView showInfo(HttpServletRequest request, Integer page, Trans trans) {
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
			trans.setMid(mid);
		}
		if ("20".equals(role)) {
			salesid = user.getSalesid();
			trans.setSalesid(salesid);
		}
		if ("30".equals(role)) {
			storeid = user.getIns();
			if(storeid.substring(1).equals("000000")){
				trans.setStoreid(storeid.substring(0, 1));
			}else{
				trans.setStoreid(storeid);
			}
		}
		String fsdate = request.getParameter("sdate");
		String fedate = request.getParameter("edate");
		if (fsdate != null) {
			sdate = fsdate.replace("-", "");
			session.setAttribute("fsdate", fsdate);
		}
		if (fedate != null) {
			edate = fedate.replace("-", "");
			session.setAttribute("fedate", fedate);
		}
		if (mid == null) {
			mid = request.getParameter("mid");
			trans.setMid(mid);
		}
		String orderpos = request.getParameter("orderpos");
		String type = request.getParameter("type");

		if (storeid == null) {
			storeid = request.getParameter("storeid");
			trans.setStoreid(storeid);
		}
		if (salesid == null) {
			salesid = request.getParameter("salesid");
			trans.setSalesid(salesid);
		}
		/*if(salesid != null){
			String salesMan = transService.querysalesName(salesid);
			session.setAttribute("salesMan", salesMan);
		}*/
		String stat = request.getParameter("stat");
		trans.setOrderpos(orderpos);
		trans.setType(type);
		trans.setStat(stat);
		trans.setSdate(sdate);
		trans.setEdate(edate);
		
		int count = transService.showCount(trans);
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
		trans.setSpage(spage);
		trans.setEpage(epage);
		
		List<Trans> list = transService.showTrans(trans);
		session.setAttribute("list", list);
		session.setAttribute("count", count);
		session.setAttribute("totalpage", totalPage);
		session.setAttribute("curPage", curPage);
		session.setAttribute("sdate", sdate);
		session.setAttribute("edate", edate);
		session.setAttribute("mid", mid);
		session.setAttribute("orderpos", orderpos);
		session.setAttribute("type", type);
		session.setAttribute("storeid", storeid);
		session.setAttribute("salesid", salesid);
		session.setAttribute("stat", stat);
		mv.setViewName("redirect:/example/jyls.jsp");
		return mv;
	}

	// 查询机构下的员工表
	@RequestMapping("querySales")
	public void querySales(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		String storeId = request.getParameter("storeid");
		List<Sales> list = merchService.querySal(storeId);
		Gson gson = new Gson();
		out.print(gson.toJson(list));
	}

}
