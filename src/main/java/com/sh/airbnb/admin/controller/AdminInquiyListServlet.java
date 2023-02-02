package com.sh.airbnb.admin.controller;

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
 * Servlet implementation class AdminInquiyList
 */
@WebServlet("/board/admininquiyList")
public class AdminInquiyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BoardService boardService = new BoardService();
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		List<InquiyBoard> inquiyBoardList = boardService.selectAdminInquiyList();
		System.out.println("inquiyBoardList = " + inquiyBoardList);
		
		request.setAttribute("inquiyBoardList", inquiyBoardList);
		request.getRequestDispatcher("/WEB-INF/views/admin/adminInquiyList.jsp").
			forward(request, response);
	}

	

}
