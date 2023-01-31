package com.sh.airbnb.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminHotelDeleteServlet
 */
@WebServlet("/admin/adminhotelDelete")
public class AdminHotelDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminService();
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		String hotelNo = request.getParameter("hotelNo");
		
		
			System.out.println("호텔넘버 딜리트"+hotelNo);
		
		try {
			
			result = adminService.deleteHotel(hotelNo);
			
			
			request.getSession().setAttribute("msg","호텔 삭제를 성공하였습니다.");
			response.sendRedirect(request.getContextPath()+"/");
		}catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("msg","호텔 삭제를 실패하였습니다.");
			response.sendRedirect(request.getContextPath()+"/");
		}
		
		
		
	}

}
