package com.sh.airbnb.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.board.model.dto.InquiyBoard;
import com.sh.airbnb.board.model.service.BoardService;

/**
 * Servlet implementation class InquiyEnrollServlet
 */
@WebServlet("/board/inquiyEnroll")
public class InquiyEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/board/inquiyEnroll.jsp")
			.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 입력값
		String productType = request.getParameter("productType");
		String inquiyType = request.getParameter("inquiyType");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		System.out.println(productType);
		System.out.println(inquiyType);
		System.out.println(phone);
		System.out.println(email);
		System.out.println(content);
		System.out.println(writer);
		
		InquiyBoard inquiyBoard = new InquiyBoard();
		inquiyBoard.setProductType(productType);
		inquiyBoard.setInquiyType(inquiyType);
		inquiyBoard.setPhone(phone);
		inquiyBoard.setEmail(email);
		inquiyBoard.setContent(content);
		inquiyBoard.setWriter(writer);
		System.out.println(inquiyBoard);
		// 로직
		int result = boardService.insertInquiy(inquiyBoard);
		System.out.println(result);
		
		// view
		response.sendRedirect(request.getContextPath()+ "/board/inquiyBoardList");
	}

}
