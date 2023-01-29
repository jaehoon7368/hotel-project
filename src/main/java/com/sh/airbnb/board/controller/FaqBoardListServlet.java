package com.sh.airbnb.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.board.model.dto.FaqBoard;
import com.sh.airbnb.board.model.service.BoardService;

/**
 * Servlet implementation class FAQBoardListServlet
 */
@WebServlet("/board/faqBoardList")
public class FaqBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		List<FaqBoard> faqBoardList = boardService.selectFaqBoardList();
		System.out.println(faqBoardList);
		
		request.setAttribute("faqBoardList", faqBoardList);
		request.getRequestDispatcher("/WEB-INF/views/board/faqBoardList.jsp").forward(request, response);
	}

}
