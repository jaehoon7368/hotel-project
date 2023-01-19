package com.sh.airbnb.user.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sh.airbnb.user.model.dto.User;
import com.sh.airbnb.user.model.service.UserService;

/**
 * Servlet implementation class UserDeleteServlet
 */
@WebServlet("/user/userDelete")
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1. 사용자 입력값 처리
			HttpSession session = request.getSession();
			User loginUser = (User) session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			
			//2. 서비스로직호출
			int result = userService.deleteUser(userId);
			
			// 모든 속성 제거하기
			Enumeration<String> names = session.getAttributeNames();
			while(names.hasMoreElements()) {
				String name = names.nextElement();
				session.removeAttribute(name);
			}
			// saveId cookie 제거
			Cookie c = new Cookie("saveId", userId);
			c.setPath(request.getContextPath()); // /mvc
			c.setMaxAge(0);			// 쿠키의 유효기간 0=> 즉시삭제
			response.addCookie(c);	

			//3. 리다이렉트 처리
			session.setAttribute("msg", "회원을 성공적으로 삭제했습니다.");
			response.sendRedirect(request.getContextPath() + "/");
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
