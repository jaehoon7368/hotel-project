package com.sh.airbnb.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sh.airbnb.board.model.dto.InquiyBoard;
import com.sh.airbnb.board.model.dto.InquiyBoardComment;
import com.sh.airbnb.board.model.service.BoardService;
import com.sh.airbnb.user.model.dto.User;

/**
 * Servlet implementation class InquiyBoardListServlet
 */
@WebServlet("/board/inquiyBoardList")
public class InquiyBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션으로 입력값
		HttpSession session = request.getSession();
		System.out.println("session = " + session);
		
		User loginUser = (User) session.getAttribute("loginUser");
		System.out.println("loginUser = " + loginUser);
		String userId = loginUser.getUserId();
		System.out.println("userId = " + userId);
		
		// 업무 로직
		List<InquiyBoard> inquiyBoardList = boardService.selectInquiyBoardList(userId);
		System.out.println("inquiyBoardList = " + inquiyBoardList);
		
		
		
		// 뷰단처리
		request.setAttribute("inquiyBoardList", inquiyBoardList);
		request.getRequestDispatcher("/WEB-INF/views/board/inquiyBoardList.jsp").
			forward(request, response);
	}

}
