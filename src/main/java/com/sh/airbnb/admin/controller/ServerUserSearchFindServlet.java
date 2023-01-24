package com.sh.airbnb.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sh.airbnb.admin.model.service.AdminService;
import com.sh.airbnb.user.model.dto.User;

/**
 * Servlet implementation class ServerUserSearchFindServlet
 */
@WebServlet("/admin/userSearchFind")
public class ServerUserSearchFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		Map<String,String> param = new HashMap<>();

		param.put("searchType", searchType);
		param.put("searchKeyword", searchKeyword);
		
		List<User> userList = adminService.searchUser(param);
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(userList);
		System.out.println(userList);
		response.getWriter().append(jsonStr);
		
	}

}
