package com.sh.airbnb.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.board.model.dto.NoticeBoard;
import com.sh.airbnb.board.model.service.BoardService;
import com.sh.airbnb.common.HelloMvcUtils;

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
		
		// 1. 입력값
		final int limit = 10;
		int page = 1;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {}
		
		Map<String, Object> param = new HashMap<>();
		param.put("page", page);
		param.put("limit", limit);
		
		// 2. 로직
		List<NoticeBoard> noticeBoardList = boardService.selectNoticeList(param);
		System.out.println("noticeBoardList = " + noticeBoardList);
		
		
		//  페이지바
		int totalCount = boardService.selectTotalCount(); // select count(*) from board
		System.out.println(totalCount);
		
		String url = request.getRequestURI(); // /mvc/board/boardList
		String pagebar = HelloMvcUtils.getPagebar(page, limit, totalCount, url);
		System.out.println(pagebar);
		
		// 3. view
		request.setAttribute("noticeBoardList", noticeBoardList);
		request.setAttribute("pagebar", pagebar);
		request.getRequestDispatcher("/WEB-INF/views/board/noticeBoardList.jsp")
			.forward(request, response);
		
	}

}
