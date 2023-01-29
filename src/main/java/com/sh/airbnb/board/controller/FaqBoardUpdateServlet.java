package com.sh.airbnb.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.board.model.dto.FaqBoard;
import com.sh.airbnb.board.model.service.BoardService;

/**
 * Servlet implementation class FaqBoardUpdateServlet
 */
@WebServlet("/board/faqBoardUpdate")
public class FaqBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int faqNo = Integer.parseInt(request.getParameter("faqNo"));
		System.out.println("faqNo = " + faqNo);
		
		FaqBoard faqBoard = boardService.selectOneFaqBoard(faqNo);
		System.out.println("faqBoard = " + faqBoard);
		
		request.setAttribute("faqBoard", faqBoard);
		request.getRequestDispatcher("/WEB-INF/views/board/faqBoardUpdate.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int faqNo = Integer.parseInt(request.getParameter("faqNo"));
		System.out.println("faqNo = " + faqNo);
		String category = request.getParameter("category");
		System.out.println("category = " + category);
		String title = request.getParameter("title");
		System.out.println("title = " + title);
		String content = request.getParameter("content");
		System.out.println("content = " + content);
		String writer = request.getParameter("writer");
		System.out.println("writer = " + writer);
		
		FaqBoard faqBoard = new FaqBoard();
		faqBoard.setFaqNo(faqNo);
		faqBoard.setCategory(category);
		faqBoard.setTitle(title);
		faqBoard.setContent(content);
		faqBoard.setWriter(writer);
		System.out.println("faqBoard = " + faqBoard);
		
		int result = boardService.updateFaqBoard(faqBoard);
		
		response.sendRedirect(request.getContextPath() + "/board/faqBoardList");
	}

}
