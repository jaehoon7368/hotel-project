package com.sh.airbnb.hotel.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HotelSearchServlet
 */
@WebServlet("/hotel/searchHotel")
public class HotelSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchLocation = request.getParameter("searchLocation");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		System.out.println("searchLocation = " + searchLocation);
		System.out.println("checkIn = " + checkIn);
		System.out.println("checkOut = " + checkOut);
		
		request.setAttribute("searchLocation", searchLocation);
		request.setAttribute("checkIn", checkIn);
		request.setAttribute("checkOut", checkOut);
		response.sendRedirect(request.getContextPath());
	}

}
