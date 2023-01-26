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
 * Servlet implementation class NoticeBoardUpdateServlet
 */
@WebServlet("/board/noticeBoardUpdate")
public class NoticeBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
			int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
			System.out.println("noticeNo = " + noticeNo);
			
			NoticeBoard noticeBoard = boardService.selectOneNoticeBoard(noticeNo);
			System.out.println("noticeBoard = " + noticeBoard);
			
			request.setAttribute("noticeBoard", noticeBoard);
			request.getRequestDispatcher("/WEB-INF/views/board/noticeBoardUpdate.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		System.out.println("noticeNo = " + noticeNo);
		System.out.println("title = " + title);
		System.out.println("content = " + content);
		System.out.println("writer = " + writer);
		
		NoticeBoard noticeBoard = new NoticeBoard();
		noticeBoard.setNoticeNo(noticeNo);
		noticeBoard.setTitle(title);
		noticeBoard.setContent(content);
		noticeBoard.setWriter(writer);
		System.out.println("noticeBoard = " + noticeBoard);
		
		// 로직
		int result = boardService.updateNoticeBoard(noticeBoard);
		
		// 리다이렉트
		response.sendRedirect(request.getContextPath() + "/board/noticeBoardList");
	}

}
