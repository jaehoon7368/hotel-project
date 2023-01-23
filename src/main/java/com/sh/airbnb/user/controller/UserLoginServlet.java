package com.sh.airbnb.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sh.airbnb.common.HelloMvcUtils;
import com.sh.airbnb.user.model.dto.User;
import com.sh.airbnb.user.model.service.UserService;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/user/userLogin")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/user/userLogin.jsp")
		.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String password =  HelloMvcUtils.getEncryptedPassword(request.getParameter("password"), userId);
		String saveId = request.getParameter("saveId");
		
		System.out.println("userId = " + userId);
		System.out.println("password = " + password);
		System.out.println("saveId = " + saveId);
		
		User user = userService.selectOneUser(userId);
		System.out.println("user = " + user);
		
		HttpSession session = request.getSession();
		
		if(user != null && password.equals(user.getPassword())) {
			session.setAttribute("loginUser", user);
			
			Cookie cookie = new Cookie("saveId", userId);
			if(saveId != null) {
				cookie.setMaxAge(60 * 60 * 24 * 7);
			}
			else {
				cookie.setMaxAge(0);
			}
			response.addCookie(cookie);
		}
		else {
			session.setAttribute("msg", "아이디가 존재하지 않거나 비밀번호가 틀립니다.");
		}
//		String referer = request.getHeader("Referer");
//		response.sendRedirect(referer);
		response.sendRedirect(request.getContextPath() + "/");

	}

}
