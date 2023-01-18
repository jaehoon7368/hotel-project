package com.sh.airbnb.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			
			
			
			String hotelUserId = multiReq.getParameter("userId");
			hotelUserId = "admin";     //임시아이디 수동 지정
					
			String hotelName = multiReq.getParameter("hotelName");
			String hotelAddress = multiReq.getParameter("hotelAddress");
			String hotelInfo = multiReq.getParameter("hotelInfo");
			HotelType hotelType = HotelType.valueOf(multiReq.getParameter("radio-1"));
			Hotel hotel = new Hotel();
			hotel.setUserId(hotelUserId);
			hotel.setHotelName(hotelName);
			hotel.setHotelAddress(hotelAddress);
			hotel.setHotelInfo(hotelInfo);
			hotel.setHotelType(hotelType);
			
			if(multiReq.getFile("upFile1")!=null) {
				HotelImage hotelImage = new HotelImage();
				hotelImage.setOriginalFilename(multiReq.getOriginalFileName("upFile1"));
				hotelImage.setRenamedFilename(multiReq.getFilesystemName("upFile1"));
				hotel.addHotelImage(hotelImage);
				
			}
			
			int result = 0;
		//2. 업무로직
			result = adminService.insertHotel(hotel);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;  //톰캣에 오류 전송
		}
		System.out.println("호텔등록완료 -> 룸 사진 추가 페이지 바로 이동  나중에 세션으로 보내서 alert 뜨게 만들기");
		
		response.sendRedirect(request.getContextPath()+"/admin/adminRoomEnrollView.jsp");
		
		
	}

}
