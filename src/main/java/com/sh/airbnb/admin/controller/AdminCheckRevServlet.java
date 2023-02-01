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
import com.sh.airbnb.reservation.model.dto.Reservation;
import com.sh.airbnb.reservation.model.service.ReservationService;



@WebServlet("/admin/adminCheckRev")
public class AdminCheckRevServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReservationService reservationService = new ReservationService();
	private AdminService adminService = new AdminService();
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("user_id");
		System.out.println("관리자 유저 아이디"+userId);
		List<Reservation> reservations = new ArrayList<>();
		try {
			List<Hotel> hotelList = adminService.selectOneHotel(userId);
			System.out.println("호텔리스트"+hotelList);
			 reservations = reservationService.selectAllReservation(hotelList);
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("관리자 호텔 예약내역 "+reservations);
		request.setAttribute("reservations", reservations);
		request.getRequestDispatcher("/WEB-INF/views/admin/adminCheckRev.jsp").forward(request, response);
	}

}

