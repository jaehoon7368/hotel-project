package com.sh.airbnb.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.board.model.dto.NoticeBoard;
import com.sh.airbnb.board.model.service.BoardService;

/**
 * Servlet implementation class NoticeBoardEnrollServlet
 */
@WebServlet("/board/noticeBoardEnroll")
public class NoticeBoardEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/board/noticeBoardEnroll.jsp")
			.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 입력값
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		System.out.println("title = " + title);
		System.out.println("writer = " + writer);
		System.out.println("content = " + content);
		
		NoticeBoard noticeBoard = new NoticeBoard();
		noticeBoard.setTitle(title);
		noticeBoard.setWriter(writer);
		noticeBoard.setContent(content);
		System.out.println("noticeBoard = " + noticeBoard);
		
		// 로직
		int result = boardService.insertNoticeBoardEnroll(noticeBoard);
		System.out.println("result = " + result);
		
		
		// 리다이렉트
		
		response.sendRedirect(request.getContextPath() + "/board/noticeBoardList");
	}

}
