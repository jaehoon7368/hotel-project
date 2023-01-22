package com.sh.airbnb.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.review.model.service.ReviewService;

/**
 * Servlet implementation class HotelReviewDeleteServlet
 */
@WebServlet("/review/HotelReviewCommentDelete")
public class HotelReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReviewService reviewService = new ReviewService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자입력값 처리
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		String hotelNo = request.getParameter("hotelNo");
		System.out.println("hotelNo = " + hotelNo);
		System.out.println("commentNo = " + commentNo);
		
		// 2. 업무로직
		int result = reviewService.deleteHotelReview(commentNo);
		
		// 3. view단처리 
		response.sendRedirect(request.getContextPath() + "/room/roomView?hotelNo=" + hotelNo);
	}

}
