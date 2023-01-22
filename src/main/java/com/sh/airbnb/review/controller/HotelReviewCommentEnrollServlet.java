package com.sh.airbnb.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.review.model.dto.Review;
import com.sh.airbnb.review.model.service.ReviewService;

/**
 * Servlet implementation class HotelReviewCommentEnrollServlet
 */
@WebServlet("/review/hotelReviewCommentEnroll")
public class HotelReviewCommentEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReviewService reviewService = new ReviewService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자 입력값 처리
		String hotelNo = request.getParameter("hotelNo");
		String userId = request.getParameter("writer");
		String content = request.getParameter("content");
		int commentLevel = Integer.parseInt(request.getParameter("commentLevel"));
		int commentRef = Integer.parseInt(request.getParameter("commentRef"));
		System.out.println("hotelNo = " + hotelNo);
		System.out.println("commentRef = " + commentRef);
		Review review = new Review();
		review.setHotelNo(hotelNo);
		review.setUserId(userId);
		review.setContent(content);
		review.setCommentLevel(commentLevel);
		review.setCommentRef(commentRef);
		
		// 2. 업무로직
		int result = reviewService.insertHotelReviewComment(review);
		
		
		// 3. 리다이렉트
		response.sendRedirect(request.getContextPath() + "/room/roomView?hotelNo=" + hotelNo);
		
	}

}
