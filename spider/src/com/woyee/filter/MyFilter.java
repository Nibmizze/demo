package com.woyee.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyFilter implements Filter {

	public void init(FilterConfig fc) throws ServletException {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		StringBuffer url = req.getRequestURL();
		if(url.indexOf("login.jsp")>-1 || url.indexOf("image.jsp")>-1){
			filterChain.doFilter(req, res);
		}else if (session.getAttribute("user") == null) {
			request.getRequestDispatcher("/example/login.jsp").forward(req,
					res);
		} else {
			filterChain.doFilter(req, res);
		}
	}

	public void destroy() {

	}

}
