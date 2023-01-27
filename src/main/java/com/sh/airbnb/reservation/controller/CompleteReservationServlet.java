package com.sh.airbnb.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.reservation.model.dto.Reservation;
import com.sh.airbnb.reservation.model.service.ReservationService;

/**
 * Servlet implementation class CompleteReservationServlet
 */
@WebServlet("/reservation/completeReservation")
public class CompleteReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReservationService reservationService = new ReservationService();
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Reservation reservation = new Reservation();
		String reNo = request.getParameter("reNo");
		
		
		
		
		
		reservation = reservationService.selectOneReservation(reNo);
		
		
		
		
		
		
		
		request.getSession().setAttribute("resevation", reservation);
		request.getRequestDispatcher("/WEB-INF/views/reservation/completeReservationView.jsp").forward(request, response);
		
	}
	
	
	
	

}
