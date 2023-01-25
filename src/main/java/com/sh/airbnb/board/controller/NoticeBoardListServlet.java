package com.sh.airbnb.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.board.model.dto.NoticeBoard;
import com.sh.airbnb.board.model.service.BoardService;

/**
 * Servlet implementation class NoticeBoardListServlet
 */
@WebServlet("/board/noticeBoardList")
public class NoticeBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1.
		
		// 2.
		List<NoticeBoard> noticeBoardList = boardService.selectNoticeList();
		System.out.println("noticeBoardList = " + noticeBoardList);
		
		// 3.
		request.setAttribute("noticeBoardList", noticeBoardList);
		request.getRequestDispatcher("/WEB-INF/views/board/noticeBoardList.jsp")
			.forward(request, response);
		
	}

}
