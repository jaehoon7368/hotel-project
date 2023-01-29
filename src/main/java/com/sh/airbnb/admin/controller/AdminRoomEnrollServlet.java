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
import com.sh.airbnb.room.model.dto.Room;
import com.sh.airbnb.room.model.dto.RoomImage;

/**
 * Servlet implementation class AdminRoomEnrollServlet
 */
@WebServlet("/admin/adminRoomEnroll")
public class AdminRoomEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminService();
	String hotel_no ="";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		hotel_no = request.getParameter("no");
		System.out.println(hotel_no+"두겟 호텔넘버");
		request.getRequestDispatcher("/WEB-INF/views/admin/adminRoomEnrollView.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		try {
		String saveDirectory = getServletContext().getRealPath("/upload/room");
		int maxPostSize = 100*1024*1024;
		String encoding = "utf-8";
		FileRenamePolicy policy = new HelloMvcFileRenamePolicy();
		MultipartRequest multiReq = new MultipartRequest(request, saveDirectory, maxPostSize, encoding,policy);
		
		
		String type= multiReq.getParameter("type");
		int people = Integer.parseInt(multiReq.getParameter("people"));
		int price = Integer.parseInt(multiReq.getParameter("price"));
		String info = multiReq.getParameter("info");
		
		Room room = new Room(null,type,price,people,hotel_no,null,info);
		
		
		if(multiReq.getFile("upFile")!=null) {
			RoomImage roomImage = new RoomImage();
			roomImage.setOriginalFilename(multiReq.getOriginalFileName("upFile"));
			roomImage.setRenamedFilename(multiReq.getFilesystemName("upFile"));
			room.addRoomImage(roomImage);
		}
		
		int result = 0 ; 
		result = adminService.insertRoom(room);
		
		request.getSession().setAttribute("msg","룸 등록을 성공하였습니다.");
		response.sendRedirect(request.getContextPath()+"/");
		
		}catch (Exception e ) {
			e.printStackTrace();
			request.getSession().setAttribute("msg","룸 등록을 실패하였습니다.");
			throw e ;
			
		}
		
		
	}

}
