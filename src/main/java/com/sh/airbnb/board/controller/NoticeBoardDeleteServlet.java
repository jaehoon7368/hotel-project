package com.sh.airbnb.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.board.model.service.BoardService;

/**
 * Servlet implementation class NoticeBoardDeleteServlet
 */
@WebServlet("/board/noticeBoardDelete")
public class NoticeBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 입력값
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		System.out.println("notice_no = " + noticeNo);
		
		// 로직
		int result = boardService.deleteNoticeBoard(noticeNo);
		
		// 리다이렉트
//		request.getSession().setAttribute(getServletInfo(), response)
		response.sendRedirect(request.getContextPath() + "/board/noticeBoardList");
	}

}
