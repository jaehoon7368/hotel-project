package com.sh.airbnb.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sh.airbnb.user.model.service.UserService;



/**
 * Servlet implementation class AdminUpdateMemberRoleServlet
 */
@WebServlet("/user/updateUserRole")
public class UpdateUserRoleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		try {
			// 1. 사용자입력값 - memberId, memberRole
			String userId = request.getParameter("userId");
			String userRole = request.getParameter("userRole");
			System.out.println("userId = " + userId);
			System.out.println("userRole = " + userRole);
			
			// 2. 업무로직 - DB 해당회원 권한 수정
			int result = userService.updateUserRole(userId, userRole);
			
			// 2.5 사용자메세지 전송 
			session.setAttribute("msg", "회원권한을 성공적으로 변경했습니다.");
			
		} catch (Exception e) {
			session.setAttribute("msg", "회원권한 변경중 오류가 발생했습니다.");
			e.printStackTrace();
		}
		
		// 3. 리다이렉트 - url변경
		response.sendRedirect(request.getContextPath() + "/user/userList");
	}

}
