package com.sh.airbnb.room.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.room.model.dto.Room;
import com.sh.airbnb.room.model.service.RoomService;

/**
 * Servlet implementation class RoomViewServlet
 */
@WebServlet("/room/roomView")
public class RoomViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RoomService roomService = new RoomService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자 입력값 처리
			String hotelNo = request.getParameter("hotelNo");
			System.out.println("hotelNo = " + hotelNo);
		// 2. 업무로직
		List<Room> roomList = roomService.roomTotalView(hotelNo); //select r.*,(select renamed_filename from tb_room_image i where i.room_no = r.room_no) renamed_filename from tb_room r where hotel_no = 'H001' order by room_price asc
		System.out.println("roomList = " + roomList);
		// 3. view단처리
		request.setAttribute("roomList", roomList);
		request.getRequestDispatcher("/WEB-INF/views/room/roomView.jsp").forward(request, response);
	}

}
