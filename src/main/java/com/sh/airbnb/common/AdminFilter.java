package com.sh.airbnb.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sh.airbnb.user.model.dto.User;
import com.sh.airbnb.user.model.dto.UserRole;

/**
 * Servlet Filter implementation class AdminFilter
 */
@WebFilter("/admin/*")
public class AdminFilter extends HttpFilter implements Filter {
       
  
	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpReq =(HttpServletRequest) request;
		HttpServletResponse httpRes =(HttpServletResponse) response;
		HttpSession session = httpReq.getSession();
		
		User loginUser = ((User)session.getAttribute("loginUser"));
		
		if(loginUser == null || loginUser.getUserRole()==UserRole.U) {
			session.setAttribute("msg", "관리자 전용입니다.");
			httpRes.sendRedirect(httpReq.getContextPath()+"/");
			return;
		}
		
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
