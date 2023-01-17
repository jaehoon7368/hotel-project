package com.sh.airbnb.user.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sh.airbnb.common.HotelUtils;
import com.sh.airbnb.user.model.dto.User;
import com.sh.airbnb.user.model.service.UserService;



@WebServlet("/user/userEnroll")
public class UserEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();

	/**
	 * 회원가입 폼 페이지 요청
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/user/userEnroll.jsp")
		.forward(request, response);
	}

	/**
	 * 회원가입처리
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
HttpSession session = request.getSession(true);
		
		try {
			// 0. 인코딩처리
			request.setCharacterEncoding("utf-8");
			
			// 1. 사용자입력값 가져오기 -> Member객체
			String userId = request.getParameter("userId");
			String password = HotelUtils.getEncryptedPassword(request.getParameter("password"), userId);
			String userName = request.getParameter("userName");
			String nickName = request.getParameter("nickName");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");

			User user = new User();
			user.setUserId(userId);
			user.setPassword(password);
			user.setUserName(userName);
			user.setNickName(nickName);
			user.setEmail(email);
			user.setPhone(phone);
			

			
			// 2. 업무로직 - db insert
			int result = userService.insertUser(user);
			

			if(result > 0) {
				// 회원가입성공 메세지
				session.setAttribute("msg", "회원가입을 축하드립니다.");
			}
		} catch(Exception e) {
			// 회원가입실패 메세지
			session.setAttribute("msg", "회원가입 실패했습니다.");

			// 예외로깅
			e.printStackTrace();
		}
		
		// 4. 리다이렉트 - /mvc/
		response.sendRedirect(request.getContextPath() + "/");
		
	}
}


