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
 * Servlet implementation class FaqBoardEnrollServlet
 */
@WebServlet("/board/faqBoardEnroll")
public class FaqBoardEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
	
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/board/faqBoardEnroll.jsp")
			.forward(request, response);
	}
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 입력값
//		int faqNo = Integer.parseInt(request.getParameter("faqNo"));
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
//		System.out.println("faqNo = " + faqNo);
		System.out.println("catecory = " + category);
		System.out.println("title = " + title);
		System.out.println("content = " + content);
		System.out.println("writer = " + writer);
		
		FaqBoard faqBoard = new FaqBoard();
//		faqBoard.setFaqNo(faqNo);
		faqBoard.setCategory(category);
		faqBoard.setTitle(title);
		faqBoard.setContent(content);
		faqBoard.setWriter(writer);
		
		// 로직
		int result = boardService.insertFaqBoard(faqBoard);
		
		// 리다이렉트
		response.sendRedirect(request.getContextPath() + "/board/faqBoardList");
	}

}
