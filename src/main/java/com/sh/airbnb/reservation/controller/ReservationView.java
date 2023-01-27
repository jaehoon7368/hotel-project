package com.sh.airbnb.reservation.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sh.airbnb.reservation.model.dto.Reservation;
import com.sh.airbnb.reservation.model.service.ReservationService;

/**
 * Servlet implementation class ReservationView
 */
@WebServlet("/reservation/reservationView")
public class ReservationView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReservationService reservationService = new ReservationService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hotelName = request.getParameter("hotelName");
		String roomType = request.getParameter("roomType");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		int price = Integer.parseInt(request.getParameter("price"));
		String hotelNo = request.getParameter("hotelNo");
		String roomNo = request.getParameter("roomNo");
		
		request.setAttribute("hotelName", hotelName);
		request.setAttribute("roomType", roomType);
		request.setAttribute("checkIn", checkIn);
		request.setAttribute("checkOut", checkOut);
		request.setAttribute("price", price);
		request.setAttribute("hotelNo", hotelNo);
		request.setAttribute("roomNo", roomNo);
		request.getRequestDispatcher("/WEB-INF/views/reservation/reservationView.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =  request.getSession();
		System.out.println("예약 등록 서블릿 오는지 확인");
		//입력값 확인 
		try {
		
		String hotelNo = request.getParameter("hotelNo");
		String roomNo = request.getParameter("roomNo");
		String checkIn= request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		int people = Integer.parseInt(request.getParameter("people"));
		String userId = request.getParameter("userId");
		String reName = request.getParameter("reName");
		int reDay = Integer.parseInt(request.getParameter("reDay"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		
		

		System.out.println("룸넘버"+roomNo);
		System.out.println("예약자이름"+reName);
		System.out.println("몇박햇는지"+reDay);
		System.out.println("총가격 "+totalPrice);
		

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = formatter.parse(checkIn);
		Date endDate = formatter.parse(checkOut);
		long startDate1 = startDate.getTime();
		long endDate1 = endDate.getTime();

		
		
		
		java.sql.Date sqlDate1 = new java.sql.Date(startDate1);
		java.sql.Date sqlDate2 = new java.sql.Date(endDate1);
		System.out.println("sql 데이트"+sqlDate1);
		System.out.println("sql 데이트"+sqlDate2);
		
		Reservation reservation = new Reservation(null,people,sqlDate1,sqlDate2,null,roomNo,userId,hotelNo,reName,reDay,totalPrice);
		
		//등록 메소드
		int result = 0;
		result = reservationService.insertResevation(reservation);
		String reNo = reservation.getReNo();
			
		response.sendRedirect(request.getContextPath()+"/reservation/completeReservation?reNo="+reNo);
		session.setAttribute("msg", "예약에 성공 하셨습니다. 예약후 결제를 하셔야 예약확정됩니다.");
		}catch (Exception e ) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath()+"/");
			session.setAttribute("msg", "예약에 실패 하셨습니다. 다시 예약 부탁드립니다.");
			
		}
		
		// 리다이렉트
		
	
	}

}
