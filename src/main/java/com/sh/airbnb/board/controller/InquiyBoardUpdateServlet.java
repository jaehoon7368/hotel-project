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
 * Servlet implementation class InquiyBoardUpdateServlet
 */
@WebServlet("/board/inquiyBoardUpdate")
public class InquiyBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			int inquiyNo = Integer.parseInt(request.getParameter("inquiyNo"));
			System.out.println("inquiyNo = " + inquiyNo);
			
			InquiyBoard inquiyBoard = boardService.selectOneInquiyBoard(inquiyNo);
			System.out.println("inquiyBoard = " + inquiyBoard);
			
			request.setAttribute("inquiyBoard", inquiyBoard);
			request.getRequestDispatcher("/WEB-INF/views/board/inquiyBoardUpdate.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 입력값
		int inquiyNo = Integer.parseInt(request.getParameter("inquiyNo"));
		String productType = request.getParameter("productType");
		String inquiyType = request.getParameter("inquiyType");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		System.out.println("inquiyNo = " + inquiyNo);
		System.out.println("productType = " + productType);
		System.out.println("inquiyType = " + inquiyType);
		System.out.println("phone = " + phone);
		System.out.println("email = " + email);
		System.out.println("content = " + content);
		System.out.println("writer = " + writer);
		
		InquiyBoard inquiyBoard = new InquiyBoard();
		inquiyBoard.setInquiyNo(inquiyNo);
		inquiyBoard.setProductType(productType);
		inquiyBoard.setInquiyType(inquiyType);
		inquiyBoard.setPhone(phone);
		inquiyBoard.setEmail(email);
		inquiyBoard.setContent(content);
		inquiyBoard.setWriter(writer);
		System.out.println("inquiyBoard = " + inquiyBoard);
		
		// 로직
		int result = boardService.updateInquiyBoard(inquiyBoard);
		
		// 리다이렉트
		response.sendRedirect(request.getContextPath() + "/board/inquiyBoardList" );
	}

}
