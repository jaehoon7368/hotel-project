package com.sh.airbnb.hotel.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.hotel.model.dto.Hotel;
import com.sh.airbnb.hotel.model.service.HotelService;

/**
 * Servlet implementation class HotelSearchServlet
 */
@WebServlet("")
public class HotelViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HotelService hotelService = new HotelService();
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
		
		List<Hotel> hotelList = hotelService.hotelTotalView();
		System.out.println("hotelList = " + hotelList);
		
		request.setAttribute("hotelList", hotelList);
		request.setAttribute("searchLocation", searchLocation);
		request.setAttribute("checkIn", checkIn);
		request.setAttribute("checkOut", checkOut);
		request.getRequestDispatcher("/WEB-INF/views/hotel/hotel.jsp").forward(request, response);
	}

}
