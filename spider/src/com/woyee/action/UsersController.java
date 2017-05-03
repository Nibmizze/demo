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
import com.woyee.entity.Store;
import com.woyee.entity.User;
import com.woyee.service.UsersService;
import com.woyee.util.MD5Util;

/**
 * Created by Administrator on 2017年4月21日 系统管理-->用户管理
 */
@Controller
@RequestMapping(value = "usersController")
public class UsersController {
	@Resource(name = "usersService")
	private UsersService usersService;

	// 查询所有机构
	@RequestMapping("queryAllUsers")
	public ModelAndView queryAllUsers(HttpServletRequest request, User user, Integer page) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		int pageSize = 15;
		int totalPage = 0;
		int spage;
		int epage;
		int curPage;
		
		String ins = request.getParameter("ins");
		String salesid = request.getParameter("salesid");
		String username = request.getParameter("username");
		String roles = request.getParameter("role");
		String member = request.getParameter("member");
		String mid = request.getParameter("mid");
		String state = request.getParameter("state");
		user.setIns(ins);
		user.setSalesid(salesid);
		user.setUsername(username);
		user.setRole(roles);
		user.setMember(member);
		user.setMid(mid);
		user.setState(state);
		
		int count = usersService.showCount(user);
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
		user.setSpage(spage);
		user.setEpage(epage);
		List<User> list = usersService.showUsers(user);
		session.setAttribute("list", list);
		session.setAttribute("count", count);
		session.setAttribute("totalpage", totalPage);
		session.setAttribute("curPage", curPage);
		session.setAttribute("ins", ins);
		session.setAttribute("salesid", salesid);
		session.setAttribute("username", username);
		session.setAttribute("roles", roles);
		session.setAttribute("member", member);
		session.setAttribute("mid", mid);
		session.setAttribute("state", state);
		mv.setViewName("redirect:/example/users.jsp");
		return mv;
	}

	// 查询修改信息
	@RequestMapping("queryUpdate")
	public ModelAndView queryUpdate(HttpServletRequest request) throws IOException {
		ModelAndView mv = new ModelAndView();
		String username = request.getParameter("username");
		List<User> list = usersService.queryOneUser(username);
		request.getSession().setAttribute("users", list);
		mv.setViewName("redirect:/example/updateUsers.jsp");
		return mv;
	}

	// 查询机构表
	@RequestMapping("queryStore")
	public void queryStore(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Store> list = usersService.querySto();
		Gson gson = new Gson();
		out.print(gson.toJson(list));
	}

	// 查询业务员表
	@RequestMapping("querySales")
	public void querySales(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Sales> list = usersService.querySal();
		Gson gson = new Gson();
		out.print(gson.toJson(list));
	}

	// 修改账户信息
	@RequestMapping("updateUser")
	public void updateInfo(User user, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		usersService.updateUser(user);
		try {
			response.getWriter().write(
					"<script>alert('修改成功');parent.location.href='/spider/usersController/queryAllUsers.do';window.close();</script>");
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 密码重置
	@RequestMapping("updatePwd")
	public void updatePwd(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String passwd = MD5Util.getMD5("123456");
		usersService.updatePwd(username, passwd);
		try {
			response.getWriter().write(
					"<script>alert('密码已重置');location.href='/spider/usersController/queryAllUsers.do';window.close();</script>");
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 注销账户
	@RequestMapping("logout")
	public ModelAndView logout(HttpServletRequest request) throws IOException {
		ModelAndView mv = new ModelAndView();
		String username = request.getParameter("username");
		usersService.updateState(username);
		mv.setViewName("redirect:/usersController/queryAllUsers.do");
		return mv;
	}
	
	// 添加机构
	@RequestMapping("addUsers")
	public void addUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String role = request.getParameter("role");
		String member = request.getParameter("member");
		String mid = request.getParameter("mid");
		String ins = request.getParameter("ins");
		String salesid = request.getParameter("salesid");
		String state = request.getParameter("state");
		usersService.addUsers(username, role, member, mid, ins, salesid, state);
		response.getWriter().write(
				"<script>alert('添加成功');window.location='/spider/usersController/queryAllUsers.do';window.close();</script>");
		response.getWriter().flush();
	}

}
