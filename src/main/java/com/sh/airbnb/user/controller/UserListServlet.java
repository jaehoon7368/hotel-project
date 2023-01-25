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

import com.sh.airbnb.common.HelloMvcUtils;
import com.sh.airbnb.user.model.dto.User;
import com.sh.airbnb.user.model.service.UserService;



/**
 * 페이징
 * 1. content 영역
 * 	- sql문
 *  - 현재페이지 page
 *  - 한페이지당 게시물수 limit
 *  - stard ~ end
 *  
 * 2. pagebar 영역
 * 	- 총게시물수
 *  - 페이지수
 *  - 페이바의 크기
 *  - 현재페이지
 *  - 한페이지당 게시물수
 *  - url
 * 
 */
@WebServlet("/user/userList")
public class UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자입력값 처리
		final int limit = 10;
		int page = 1; // 기본값
		try {
			page = Integer.parseInt(request.getParameter("page"));			
		} catch (NumberFormatException e) {
			// NumberFormatException이 발생했지만, 기본값은 1로 처리.
		}
		Map<String, Object> param = new HashMap<>();
		param.put("page", page);
		param.put("limit", limit);
		System.out.println("param = " + param);
		
		// 2. 업무로직
		// a. content 영역
		List<User> users = userService.selectAllUser(param);
		System.out.println(users);
		// b. pagebar 영역
		int totalCount = userService.selectTotalCount();
		System.out.println(totalCount);
		String url = request.getRequestURI(); // /mvc/admin/memberList
		String pagebar = HelloMvcUtils.getPagebar(page, limit, totalCount, url);
		System.out.println(pagebar);
		
		// 3. view단 처리
		request.setAttribute("users", users);
		request.setAttribute("pagebar", pagebar);
		
		request.getRequestDispatcher("/WEB-INF/views/user/userList.jsp")
			.forward(request, response);
		
	}

}





