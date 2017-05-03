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
import com.woyee.entity.Store;
import com.woyee.service.StoreService;

@Controller
@RequestMapping(value = "storeController")
public class StoreController {
	@Resource(name = "storeService")
	private StoreService storeService;

	// 查询所有机构
	@RequestMapping("queryAllStore")
	public ModelAndView queryAllStore(HttpServletRequest request, Store store, Integer page) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		int pageSize = 15;
		int totalPage = 0;
		int spage;
		int epage;
		int curPage;
		int count = storeService.showCount(store);
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
		store.setSpage(spage);
		store.setEpage(epage);
		List<Store> list = storeService.showStores(store);
		session.setAttribute("list", list);
		session.setAttribute("count", count);
		session.setAttribute("totalpage", totalPage);
		session.setAttribute("curPage", curPage);
		mv.setViewName("redirect:/example/store.jsp");
		return mv;
	}

	// 添加机构
	@RequestMapping("addStore")
	public void addStore(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		String storeId = request.getParameter("storeid");
		String storeName = request.getParameter("storeName");
		String linkMan = request.getParameter("linkMan");
		String linkTel = request.getParameter("linkTel");
		String address = request.getParameter("address");
		storeService.addStore(storeId, storeName, linkMan, linkTel, address);
		storeService.addUser(storeId, storeId);
		response.getWriter().write(
				"<script>alert('添加成功');window.location='/spider/storeController/queryAllStore.do';window.close();</script>");
		response.getWriter().flush();
	}

	// 查询机构是否存在
	@RequestMapping("queryStore")
	public void queryStore(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/json;charset=utf-8");
		String storeId = request.getParameter("storeid");
		PrintWriter out = response.getWriter();
		int count = storeService.querySto(storeId);
		Gson gson = new Gson();
		out.print(gson.toJson(count));
	}

	// 注销机构
	@RequestMapping("logout")
	public ModelAndView logout(HttpServletRequest request) throws IOException {
		ModelAndView mv = new ModelAndView();
		String storeid = request.getParameter("storeid");
		storeService.updateState(storeid);
		mv.setViewName("redirect:/storeController/queryAllStore.do");
		return mv;
	}
	
	// 修改机构
		@RequestMapping("updateStore")
		public void updateStore(HttpServletRequest request, HttpServletResponse response) throws IOException {
			response.setContentType("text/html;charset=utf-8");
			String storeId = request.getParameter("storeid");
			String storeName = request.getParameter("storeName");
			String linkMan = request.getParameter("linkMan");
			String linkTel = request.getParameter("linkTel");
			String address = request.getParameter("address");
			String state = request.getParameter("state");
			storeService.updateStore(storeId, storeName, linkMan, linkTel, address,state);
			response.getWriter().write(
					"<script>alert('修改成功');window.location='/spider/storeController/queryAllStore.do';window.close();</script>");
			response.getWriter().flush();
		}

}
