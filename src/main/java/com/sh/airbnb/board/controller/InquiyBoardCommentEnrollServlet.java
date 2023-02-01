package com.sh.airbnb.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.board.model.dto.InquiyBoardComment;
import com.sh.airbnb.board.model.service.BoardService;

/**
 * Servlet implementation class InquiyBoardCommentEnroll
 */
@WebServlet("/board/inquiyBoardCommentEnroll")
public class InquiyBoardCommentEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 입력값
		int inquiyNo = Integer.parseInt(request.getParameter("inquiyNo"));
		System.out.println("inquiyNo = " + inquiyNo);
		String writer = request.getParameter("writer");
		int inquiyCommentLevel = Integer.parseInt(request.getParameter("inquiyCommentLevel"));
		String content = request.getParameter("content");
		
		System.out.println("writer = " + writer);
		System.out.println("inquiyCommentLevel = " + inquiyCommentLevel);
		System.out.println("content = " + content);
		
		InquiyBoardComment inquiyBoardComment = new InquiyBoardComment(2, content, null, inquiyCommentLevel, inquiyNo, writer);
//		InquiyBoardComment inquiyBoardComment = new InquiyBoardComment();
//		inquiyBoardComment.setInquiyNo(inquiyNo);
//		inquiyBoardComment.setWriter(writer);
//		inquiyBoardComment.setInquiyCommentLevel(inquiyCommentLevel);
//		inquiyBoardComment.setContent(content);
		System.out.println("inquiyBoardComment = " + inquiyBoardComment);
		
		
		// 로직
		int result = boardService.insertInquiyComment(inquiyBoardComment);
		
		// 리다
		response.sendRedirect(request.getContextPath() + "/board/admininquiyList");
	}

}
