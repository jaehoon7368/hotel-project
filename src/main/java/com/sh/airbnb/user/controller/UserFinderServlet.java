package com.sh.airbnb.user.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.user.model.dto.User;
import com.sh.airbnb.user.model.service.UserService;



/**
 * Servlet implementation class AdminMemberFinderServlet
 */
@WebServlet("/user/userFinder")
public class UserFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자입력값 가져오기 - searchType, searchKeyword
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		
		Map<String, String> param = new HashMap<>();
		param.put("searchType", searchType);
		param.put("searchKeyword", searchKeyword);
		System.out.println("param = " + param);
		
		// 2. 업무로직 - 회원검색 
		List<User> users = userService.searchUser(param);
		System.out.println("users = " + users);
		
		// 3. forward(view단처리)
		request.setAttribute("users", users);
		request.getRequestDispatcher("/WEB-INF/views/user/userList.jsp")
			.forward(request, response);
		
		
	}

}





