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
import com.sh.airbnb.room.model.dto.RoomPrice;
import com.sh.airbnb.room.model.service.RoomService;

/**
 * Servlet implementation class FilterSearchServlet
 */
@WebServlet("/filterSearch")
public class FilterSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HotelService hotelService = new HotelService();
	private RoomService roomService = new RoomService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int minPrice = Integer.parseInt(request.getParameter("min_price"));
		int maxPrice = Integer.parseInt(request.getParameter("max_price"));
		String[] category = request.getParameterValues("checkbox");
		String searchLocation = request.getParameter("searchLocation");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		
		// 필터부분 평균,최소,최고 가격 가져오기
		RoomPrice roomPrice = roomService.selectRoomPrice();
		// 가격, 편의시설로 걸러진 hotelList
		List<Hotel> hotelList = hotelService.filterSelectHotel(minPrice,maxPrice,category);
		
		request.setAttribute("hotelList", hotelList);
		request.setAttribute("roomPrice", roomPrice);
		request.setAttribute("searchLocation", searchLocation);
		request.setAttribute("checkIn", checkIn);
		request.setAttribute("checkOut", checkOut);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}


}
