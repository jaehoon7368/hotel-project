package com.sh.airbnb.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.board.model.dto.InquiyBoard;
import com.sh.airbnb.board.model.service.BoardService;

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
		// 1 
		
		// 2
		List<InquiyBoard> inquiyBoardList = boardService.selectInquiyBoardList();
		System.out.println("inquiyBoardList = " + inquiyBoardList);
		
		// 3
		request.setAttribute("inquiyBoardList", inquiyBoardList);
		request.getRequestDispatcher("/WEB-INF/views/board/inquiyBoardList.jsp").
			forward(request, response);
	}

}
