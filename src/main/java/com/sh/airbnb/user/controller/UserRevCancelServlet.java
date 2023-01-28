package com.sh.airbnb.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sh.airbnb.reservation.model.dto.Reservation;
import com.sh.airbnb.reservation.model.service.ReservationService;

/**
 * Servlet implementation class UserRevCancelServlet
 */
@WebServlet("/user/userRevCancel")
public class UserRevCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReservationService reservationService = new ReservationService();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String reNo = request.getParameter("reNo");
		String userId = request.getParameter("userId");
		try {
			System.out.println("reNo = " + reNo);
			System.out.println("userId = " + userId);
			
			
			Reservation rev = new Reservation();
			rev.setReNo(reNo);
			System.out.println("rev + " + rev);
			
			int result = reservationService.updateReservationStatus(rev);
			
			session.setAttribute("msg", "예약취소가 완료되었습니다.");
		} catch (Exception e) {
			session.setAttribute("msg", "예약취소 실패");
			e.printStackTrace();
		}
			
		response.sendRedirect(request.getContextPath() + "/user/userCheckRev?user_id=" + userId);
			
	}

}
