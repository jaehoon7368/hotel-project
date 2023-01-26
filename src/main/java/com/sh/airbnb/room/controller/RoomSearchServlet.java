package com.sh.airbnb.room.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.airbnb.hotel.model.dto.Hotel;
import com.sh.airbnb.hotel.model.service.HotelService;
import com.sh.airbnb.review.model.dto.Review;
import com.sh.airbnb.review.model.service.ReviewService;
import com.sh.airbnb.room.model.dto.Room;
import com.sh.airbnb.room.model.service.RoomService;

/**
 * Servlet implementation class RoomSearchServlet
 */
@WebServlet("/room/searchRoom")
public class RoomSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RoomService roomService = new RoomService();
	private HotelService hotelService = new HotelService();
	private ReviewService reviewService = new ReviewService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hotelNo = request.getParameter("hotelNo");
		System.out.println("hotelNo = " + hotelNo);
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		System.out.println("checkIn = " + checkIn);
		System.out.println("checkOut = " + checkOut);
		// 2. 업무로직
		//호텔 룸정보 가져오기
		List<Room> roomList = roomService.roomTotalView(hotelNo); //select r.*,(select renamed_filename from tb_room_image i where i.room_no = r.room_no) renamed_filename from tb_room r where hotel_no = 'H001' order by room_price asc
		System.out.println("roomList = " + roomList);
		
		//호텔 정보 가져오기
		Hotel hotel = hotelService.selectOneHotel(hotelNo);
		System.out.println("hotel = " + hotel);
		
		//리뷰 정보 가져오기
		List<Review> reviewList = reviewService.selectAllReview(hotelNo);
		System.out.println("reviewList = " + reviewList);
		
		
		// 3. view단처리
		request.setAttribute("roomList", roomList);
		request.setAttribute("hotel", hotel);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("checkIn", checkIn);
		request.setAttribute("checkOut", checkOut);
		request.getRequestDispatcher("/WEB-INF/views/room/roomView.jsp").forward(request, response);
	}

}
