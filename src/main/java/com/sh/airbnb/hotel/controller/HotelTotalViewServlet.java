package com.sh.airbnb.hotel.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sh.airbnb.hotel.model.dto.Hotel;
import com.sh.airbnb.hotel.model.service.HotelService;

/**
 * Servlet implementation class HotelTotalViewServlet
 */
@WebServlet("/hotel/hotelView")
public class HotelTotalViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HotelService hotelService = new HotelService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("servlet 로드 완료");
		
		List<Hotel> hotelList = hotelService.hotelTotalView();
		System.out.println("hotelList = " + hotelList);
		
		request.setAttribute("hotelList", hotelList);
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(hotelList, response.getWriter());
	}

}
