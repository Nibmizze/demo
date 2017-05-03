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
import com.woyee.service.SalesService;

@Controller
@RequestMapping(value = "salesController")
public class salesController {
	@Resource(name = "salesService")
	private SalesService salesService;

	// 查询所有机构
	@RequestMapping("queryAllSales")
	public ModelAndView queryAllSales(HttpServletRequest request, Sales sales, Integer page) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		int pageSize = 15;
		int totalPage = 0;
		int spage;
		int epage;
		int curPage;
		int count = salesService.showCount(sales);
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
		sales.setSpage(spage);
		sales.setEpage(epage);
		List<Sales> list = salesService.showSales(sales);
		session.setAttribute("list", list);
		session.setAttribute("count", count);
		session.setAttribute("totalpage", totalPage);
		session.setAttribute("curPage", curPage);
		mv.setViewName("redirect:/example/sales.jsp");
		return mv;
	}

	// 添加机构
	@RequestMapping("addSales")
	public void addSales(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		String storeId = request.getParameter("storeid");
		String salesId = request.getParameter("salesid");
		String salesMan = request.getParameter("salesMan");
		String linkTel = request.getParameter("linkTel");
		String mail = request.getParameter("mail");
		salesService.addSales(storeId, salesId, salesMan, linkTel, mail);
		salesService.addUser(salesId, salesId);
		response.getWriter().write(
				"<script>alert('添加成功');window.location='/spider/salesController/queryAllSales.do';window.close();</script>");
		response.getWriter().flush();
	}

	// 查询机构是否存在
	@RequestMapping("querySales")
	public void querySales(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/json;charset=utf-8");
		String salesId = request.getParameter("salesid");
		PrintWriter out = response.getWriter();
		int count = salesService.querySal(salesId);
		Gson gson = new Gson();
		out.print(gson.toJson(count));
	}
	
	// 注销业务员
	@RequestMapping("logout")
	public ModelAndView logout(HttpServletRequest request) throws IOException {
		ModelAndView mv = new ModelAndView();
		String salesid = request.getParameter("salesid");
		salesService.updateState(salesid);
		mv.setViewName("redirect:/salesController/queryAllSales.do");
		return mv;
	}

}
