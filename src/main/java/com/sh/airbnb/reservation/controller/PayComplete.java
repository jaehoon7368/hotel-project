package com.sh.airbnb.reservation.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sh.airbnb.reservation.model.service.ReservationService;

/**
 * Servlet implementation class PayComplete
 */
@WebServlet("/reservation/payComplete")
public class PayComplete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       ReservationService reservationService = new ReservationService();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reNo = request.getParameter("revReNo");
		int price = Integer.parseInt(request.getParameter("price"));
		String userId = request.getParameter("userId");
		System.out.println(reNo+"예약번호");
		System.out.println(price+"프라이스");
		System.out.println(userId+"유저아이디");
		
		int result = 0;
		result = reservationService.insertPayment(price,reNo,userId);
	
		
		response.setContentType("application/json; charset=utf-8");
		Map<String,Object> map = new HashMap<>();
		map.put("result", "등록성공");
		
		new Gson().toJson(map, response.getWriter());
	}

}
