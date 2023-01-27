package com.sh.airbnb.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sh.airbnb.reservation.model.dto.Reservation;
import com.sh.airbnb.reservation.model.service.ReservationService;
import com.sh.airbnb.user.model.dto.User;
import com.sh.airbnb.user.model.service.UserService;



@WebServlet("/user/userCheckRev")
public class UserCheckRevServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReservationService reservationService = new ReservationService();
	

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("user_id");
		
		List<Reservation> reservations = reservationService.selectAllReservation(userId);
//		System.out.println(reservations);
		
		request.setAttribute("reservations", reservations);
	
		request.getRequestDispatcher("/WEB-INF/views/user/userCheckRev.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

}

