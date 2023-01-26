package com.sh.airbnb.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.board.model.service.BoardService;

/**
 * Servlet implementation class InquiyBoardDeleteServlet
 */
@WebServlet("/board/inquiyBoardDelete")
public class InquiyBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int inquiyNo = Integer.parseInt(request.getParameter("inquiyNo"));
		System.out.println("inquiyNo = " + inquiyNo);
		
		int result = boardService.deleteInquiyBoard(inquiyNo);
		
		response.sendRedirect(request.getContextPath() + "/board/inquiyBoardList");
	}

}
