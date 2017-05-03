package com.woyee.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.woyee.entity.User;
import com.woyee.entity.LogInfo;
import com.woyee.entity.ModuleGroup;
import com.woyee.entity.ModuleVo;
import com.woyee.service.UserService;
import com.woyee.util.IPUtil;
import com.woyee.util.MD5Util;

/** 
 * Created by Administrator on 2017年4月21日
 * 用户登陆内容
 */
@Controller
@RequestMapping(value = "userController")
public class UserController {
	@Resource(name = "userService")
	private UserService userService;
	private static Logger log = Logger.getLogger("UserController");
	
	/** 
	 * Created by Administrator on 2017年3月31日
	 * 菜单栏显示
	 */
	@RequestMapping("leftMenu")
	public ModelAndView leftMenu(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String module_name= "";
		List<ModuleVo> list1 =null;
		String role = (String) session.getAttribute("role");
	    List<ModuleGroup> mdlist = userService.queryMod(role);
	    //页面菜单 list
	    HashMap<String, List<ModuleVo>> map = new HashMap<String, List<ModuleVo>>();
	    for (ModuleGroup moduleGroup : mdlist) {
	    	List<ModuleVo> list2 =new ArrayList<ModuleVo>();
			System.out.println(moduleGroup.toString());
			String module_id = moduleGroup.getModule_id();
			ModuleVo modv= userService.queryFather(module_id);
			if(modv.getFather_id().equals("0")){
				System.out.println(modv.getModule_name()+"这是一级");
				module_name = modv.getModule_name();
				list1 = userService.querySubmenu(modv.getModule_id());//子菜单
				for (ModuleVo mo : list1) {
					List<ModuleGroup> moduleGroup2 =userService.querySon( mo.getModule_id(),role);
					if(moduleGroup2.size()!=0){
						System.out.println(mo.getModule_name()+"二级"+moduleGroup2.size());
						list2.add(mo);
					}
				}
				map.put(module_name, list2);
			}
		}
		request.getSession().setAttribute("leftMenu",map);
		mv.setViewName("redirect:/example/menu.jsp");
		return mv;
	}
	
	/** 
	 * Created by Administrator on 2017年3月31日
	 * 修改密码
	 */
	@RequestMapping("updatePassword")
	public ModelAndView UpdatePassword(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String userName = request.getParameter("username");// 用户账号
		String oldPassword = MD5Util.getMD5(request.getParameter("oldPassword"));// 原密码
		String newPassword = MD5Util.getMD5(request.getParameter("newPassword"));// 新密码
		String uuid = UUID.randomUUID().toString().replace("-", "");//设置用户的唯一的uuid
		String ip = IPUtil.getIpAddress(request);//用户ip
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());//修改密码时间
		List<User> user = userService.login(userName);
		String pwd = user.get(0).getPasswd();
		String realName = user.get(0).getMember();//真实姓名
		if(oldPassword.equals(pwd)){
			userService.updatePwd(userName,newPassword);
			userService.UpdatePwdLog(uuid,realName,ip,date,userName);
			mv.addObject("msg","1");
			mv.setViewName("redirect:/example/updatePwd.jsp");
			return mv;
		}
		mv.addObject("msg","2");
		mv.setViewName("redirect:/example/updatePwd.jsp");
		return mv;
	}
	
	/** 
	 * Created by Administrator on 2017年3月30日
	 * 用户退出
	 */
	@RequestMapping("quit")
	public ModelAndView quit(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String uuid = request.getParameter("uuid");// uuid
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		if(uuid!=null&&uuid!=""){
			userService.updatelog(uuid,date);
			mv.setViewName("redirect:/example/login.jsp");
		}
		mv.setViewName("redirect:/example/login.jsp");
		return mv;
	}
	
	/** 
	 * Created by Administrator on 2017年3月30日
	 * 首页登录信息
	 */
	@RequestMapping("querylog")
	public void querylog(HttpServletResponse response,HttpServletRequest request) throws IOException {
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String uuid = request.getParameter("userInfo");
		List<LogInfo> list = userService.queryLog(uuid);
		out.print(gson.toJson(list));
	}
	
	/** 
	 * Created by Administrator on 2017年3月30日
	 * 验证码验证
	 */
	@RequestMapping("queryCode")
	public void queryCode(HttpServletResponse response,HttpServletRequest request) throws IOException {
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String code = (String) request.getSession().getAttribute("rand");//获取生成的验证码
		String authcode = request.getParameter("authcode");//获取用户输入的验证码
		String userName = request.getParameter("username");// 用户名
		String password = request.getParameter("passwd");
		List list = new ArrayList<>();
		list.add(userName);
		list.add(password);
		if(!code.equalsIgnoreCase(authcode)){
			out.print(1);
			return;
		}
		out.print(gson.toJson(list));
	}
	
	/** 
	 * Created by Administrator on 2017年3月29日
	 * 用户登录
	 */
	@RequestMapping("userlogin")
	public ModelAndView userLogin(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String userName = request.getParameter("username");// 用户名
		String password = request.getParameter("passwd");
		log.info("username: [" + userName +"]");
		log.info("password: [" + password +"]");
		String passWord = MD5Util.getMD5(password);// 密码
		
		String uuid = UUID.randomUUID().toString().replace("-", "");//设置用户的唯一的uuid
		String ip = IPUtil.getIpAddress(request);
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		List<User> user = userService.login(userName);
		if(user.size()==1){
			String state = user.get(0).getState();
			if(state.equals("0")){
				String pwd = user.get(0).getPasswd();
				if(passWord.equals(pwd)){
					String realName = user.get(0).getMember();//真实姓名
					userService.log(uuid,realName,ip,date,userName);
					request.getSession().setAttribute("user", user.get(0));
					request.getSession().setAttribute("uuid", uuid);
					request.getSession().setAttribute("role", user.get(0).getRole());
					mv.setViewName("redirect:/example/index.jsp");
					return mv;
				}
				mv.addObject("error", "2");
				mv.setViewName("redirect:/example/login.jsp");
				return mv;
			}else{
				mv.addObject("error", "3");
				mv.setViewName("redirect:/example/login.jsp");
				return mv;
			}
			
		}
		mv.addObject("error", "1");
		mv.setViewName("redirect:/example/login.jsp");
		return mv;
	}
}
