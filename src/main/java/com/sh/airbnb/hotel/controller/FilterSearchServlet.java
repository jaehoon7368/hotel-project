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
		String[] _category = request.getParameterValues("checkbox");
		String searchLocation = request.getParameter("searchLocation");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		
		StringBuilder price = new StringBuilder();
		
		for(int i = 0 ; i <_category.length;i++) {
			if(i == 0) {
				price.append(_category[i] + "'" + ","); //여기에 작은 따옴표 하나 빠진 거 아님? 앞에꺼 일부러뻇는데  잇어도 안됌 이거 사용한 곳으로 가는 거 단축키 뭐더라 함수
			} //컨트롤 클릭크 안 되길래 이거 어디서 호출됨?  jsp ? 쿼리문 어딨엉
			else if(i != _category.length-1) {
				price.append("'" + _category[i] + "'" + ",") ;
			}else if(i == _category.length-1){
				price.append("'" + _category[i]);
			}
			else {
				price.append("'" + _category[i] + "'");
			}
		}
		String category = price.toString();
		
//		String category = _category != null ? String.join(",", _category) : null;
	
		
		List<Hotel> hotelList = hotelService.filterSelectHotel(minPrice,maxPrice,category);
		RoomPrice roomPrice = roomService.selectRoomPrice();
		
		request.setAttribute("hotelList", hotelList);
		request.setAttribute("roomPrice", roomPrice);
		request.setAttribute("searchLocation", searchLocation);
		request.setAttribute("checkIn", checkIn);
		request.setAttribute("checkOut", checkOut);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}


}
