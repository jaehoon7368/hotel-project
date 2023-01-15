package com.sh.airbnb.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.admin.model.service.AdminService;
import com.sh.airbnb.hotel.model.dto.Hotel;
import com.sh.airbnb.hotel.model.dto.HotelType;

/**
 * Servlet implementation class HotelEnrollServlet
 */
@WebServlet("/admin/adminhotelenroll")
public class AdminHotelEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private AdminService adminService = new AdminService();   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/admin/adminEnrollView.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.사용자입력값가져오기
		try {
			String hotelName = request.getParameter("hotelName");
			String hotelAddress = request.getParameter("hotelAddress");
			String hotelInfo = request.getParameter("hotelInfo");
			HotelType hotelType = HotelType.valueOf(request.getParameter("radio-1"));
			Hotel hotel = new Hotel();
			
			hotel.setHotelName(hotelName);
			hotel.setHotelAddress(hotelAddress);
			hotel.setHotelInfo(hotelInfo);
			hotel.setHotelType(hotelType);
			
			int result = 0;
		//2. 업무로직
			result = adminService.insertHotel(hotel);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;  //톰캣에 오류 전송
		}
		response.sendRedirect(request.getContextPath()+"/admin/adminhotelenroll");
		
		
	}

}
