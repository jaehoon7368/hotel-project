package com.sh.airbnb.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReservationView
 */
@WebServlet("/reservation/reservationView")
public class ReservationView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hotelName = request.getParameter("hotelName");
		String roomType = request.getParameter("roomType");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		int price = Integer.parseInt(request.getParameter("price"));
		
		request.setAttribute("hotelName", hotelName);
		request.setAttribute("roomType", roomType);
		request.setAttribute("checkIn", checkIn);
		request.setAttribute("checkOut", checkOut);
		request.setAttribute("price", price);
		request.getRequestDispatcher("/WEB-INF/views/reservation/reservationView.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
