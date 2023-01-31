package com.sh.airbnb.hotel.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.hotel.model.dto.Hotel;
import com.sh.airbnb.hotel.model.service.HotelService;
import com.sh.airbnb.room.model.dto.RoomPrice;
import com.sh.airbnb.room.model.service.RoomService;

/**
 * Servlet implementation class SearchDateLocationServlet
 */
@WebServlet("/searchDateLocation")
public class SearchDateLocationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HotelService hotelService = new HotelService();
	private RoomService roomService = new RoomService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String location = request.getParameter("searchLocation")==null?"":request.getParameter("searchLocation");
		String checkIn = request.getParameter("checkIn").equals("null")?"":request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut").equals("null")?"":request.getParameter("checkOut");;
		System.out.println("location = " + location);
		System.out.println("checkIn = " + checkIn);
		System.out.println("checkOut = " + checkOut);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = formatter.parse(checkIn);
		Date endDate = formatter.parse(checkOut);
		long startDate1 = startDate.getTime();
		long endDate1 = endDate.getTime();

		
		java.sql.Date sqlDate1 = new java.sql.Date(startDate1);
		java.sql.Date sqlDate2 = new java.sql.Date(endDate1);
		
		List<Hotel> hotelList = hotelService.selectSearchHotel(location,sqlDate1,sqlDate2);
		RoomPrice roomPrice = roomService.selectRoomPrice();
		
		request.setAttribute("hotelList", hotelList);
		request.setAttribute("searchLocation", location);
		request.setAttribute("checkIn", checkIn);
		request.setAttribute("checkOut", checkOut);
		request.setAttribute("roomPrice", roomPrice);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
