package com.sh.airbnb.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.user.model.dto.User;
import com.sh.airbnb.user.model.service.UserService;

/**
 * Servlet implementation class CheckIdDuplicateServlet
 */
@WebServlet("/user/checkIdDuplicate")
public class CheckIdDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 인코딩처리
		request.setCharacterEncoding("utf-8");
		
		// 2. 입력값 가져오기
		String userId = request.getParameter("userId");
		System.out.println("userId = " + userId);
		
		// 3. 업무로직
		User user = userService.selectOneUser(userId);
		boolean available = (user == null);
		
		// 4. view단 위임
		request.setAttribute("available", available);
		request.getRequestDispatcher("/WEB-INF/views/user/checkIdDuplicate.jsp")
			.forward(request, response);
		
		
		
		
	}

}
