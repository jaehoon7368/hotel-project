package com.sh.airbnb.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sh.airbnb.user.model.dto.User;
import com.sh.airbnb.user.model.service.UserService;

/**
 * Servlet implementation class UserUpdateServlet
 */
@WebServlet("/user/userUpdate")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();
	
	
	
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//아이디  이름 닉네임 이메일 휴대폰 
		
		try {
			request.setCharacterEncoding("utf-8");
			
			String userId = request.getParameter("userId");
			String userName = request.getParameter("userName");
			String nickName = request.getParameter("nickName");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			
			User user = new User();
			user.setUserId(userId);
			user.setUserName(userName);
			user.setNickName(nickName);
			user.setEmail(email);
			user.setPhone(phone);
			
			int result = userService.updateUser(user);
			System.out.println("result = " + result);
			
			if(result > 0) {
				session.setAttribute("msg", "회원정보를 성공적으로 수정했습니다.");
				
				// 세션정보 갱신
				session.setAttribute("loginUser", userService.selectOneUser(userId));
			}
			
		} catch (Exception e) {
			session.setAttribute("msg", "회원정보 수정중 오류가 발생했습니다.");
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/user/userView");
		
	}

}
