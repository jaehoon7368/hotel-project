package com.sh.airbnb.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.admin.model.service.AdminService;
import com.sh.airbnb.hotel.model.dto.Hotel;
import com.sh.airbnb.room.model.dto.Room;

/**
 * Servlet implementation class AdminEnrolledHotelView
 */
@WebServlet("/admin/adminenrolledhotelview")
public class AdminEnrolledHotelViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private AdminService adminService = new AdminService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.입력값
		String userId = request.getParameter("user_id");
		
		userId = "admin";
		//2.업무로직
		List<Hotel>hotelList = new ArrayList<>();
		hotelList = adminService.selectAllHotel(userId);

		//3.view단처리
		request.setAttribute("hotelList",hotelList );
		request.getRequestDispatcher("/WEB-INF/views/admin/adminEnrolledHotelView.jsp")
		.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	
	
	
	
	
	}

	
	
	
	
	
	
}
