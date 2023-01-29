package com.sh.airbnb.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.sh.airbnb.admin.model.service.AdminService;
import com.sh.airbnb.common.HelloMvcFileRenamePolicy;
import com.sh.airbnb.hotel.model.dto.Hotel;
import com.sh.airbnb.hotel.model.dto.HotelImage;
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
			 
			
			String saveDirectory =  getServletContext().getRealPath("/upload/hotel"); //웹루트디렉토리(src/main/webapp)부터 탐색
			System.out.println(saveDirectory+"------------------세이브디렉토리 위치 ");
			int maxPostSize = 100*1024*1024;
			String encoding = "utf-8";
			
			FileRenamePolicy policy = new HelloMvcFileRenamePolicy();//년월일_시분초밀리초_난수.txt 
			
			MultipartRequest multiReq = new MultipartRequest(request, saveDirectory ,maxPostSize , encoding, policy);
			
			String userId = multiReq.getParameter("userId");
			String hotelName = multiReq.getParameter("hotelName");
			String hotelAddress = multiReq.getParameter("hotelAddress");
			String hotelInfo = multiReq.getParameter("hotelInfo");
			HotelType hotelType = HotelType.valueOf(multiReq.getParameter("hotelType"));
			String[] category = multiReq.getParameterValues("checkbox");
			
			
			Hotel hotel = new Hotel();
			hotel.setUserId(userId);
			hotel.setHotelName(hotelName);
			hotel.setHotelAddress(hotelAddress);
			hotel.setHotelInfo(hotelInfo);
			hotel.setHotelType(hotelType);
			hotel.setUserId(userId);
			
			if(multiReq.getFile("upFile")!=null) {
				HotelImage hotelImage = new HotelImage();
				hotelImage.setOriginalFilename(multiReq.getOriginalFileName("upFile"));
				hotelImage.setRenamedFilename(multiReq.getFilesystemName("upFile"));
				hotel.addHotelImage(hotelImage);
			}
			
			
			int result = 0;
			int result1 = 0;
			//2. 업무로직
			result = adminService.insertHotel(hotel);
			if(category!=null) {
			result1 = adminService.insertCategory(userId,category,hotel.getHotelNo());
			}
			request.getSession().setAttribute("msg","호텔 등록을 성공하였습니다.");
			response.sendRedirect(request.getContextPath()+"/admin/adminenrolledhotelview?user_id="+userId);
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("msg","호텔 등록을 실패하였습니다.");
			response.sendRedirect(request.getContextPath()+"/admin/adminhotelenroll");
			throw e;  //톰캣에 오류 전송
		}
		
	}

}
