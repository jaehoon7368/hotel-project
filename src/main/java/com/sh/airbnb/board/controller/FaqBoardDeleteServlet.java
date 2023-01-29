package com.sh.airbnb.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.board.model.service.BoardService;

/**
 * Servlet implementation class FaqBoardDeleteServlet
 */
@WebServlet("/board/faqBoardDelete")
public class FaqBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int faqNo = Integer.parseInt(request.getParameter("faqNo"));
		System.out.println("faqNo = " + faqNo);
		
		int result = boardService.deleteFaqBoard(faqNo);
		
		response.sendRedirect(request.getContextPath() + "/board/faqBoardList");
	}

}
