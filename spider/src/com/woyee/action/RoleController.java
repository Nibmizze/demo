package com.woyee.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.woyee.entity.Role;
import com.woyee.service.RoleService;

/**
 * Created by Administrator on 2017年4月21日 系统管理-->用户管理
 */
@Controller
@RequestMapping(value = "roleController")
public class RoleController {
	@Resource(name = "roleService")
	private RoleService roleService;

	// 查询所有角色
	@RequestMapping("queryAllRoles")
	public ModelAndView queryAllRoles(HttpServletRequest request, Role role, Integer page) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		int pageSize = 15;
		int totalPage = 0;
		int spage;
		int epage;
		int curPage;
		
		int count = roleService.showCount(role);
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
		role.setSpage(spage);
		role.setEpage(epage);
		List<Role> list = roleService.showRoles(role);
		session.setAttribute("list", list);
		session.setAttribute("count", count);
		session.setAttribute("totalpage", totalPage);
		session.setAttribute("curPage", curPage);
		mv.setViewName("redirect:/example/roles.jsp");
		return mv;
	}

/*	// 查询修改信息
	@RequestMapping("queryUpdate")
	public ModelAndView queryUpdate(HttpServletRequest request) throws IOException {
		ModelAndView mv = new ModelAndView();
		String username = request.getParameter("username");
		List<User> list = usersService.queryOneUser(username);
		request.getSession().setAttribute("users", list);
		mv.setViewName("redirect:/example/updateUsers.jsp");
		return mv;
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
*/
}
