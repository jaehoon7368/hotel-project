package com.sh.airbnb.admin.model.service;

import static com.sh.airbnb.common.JdbcTemplate.close;
import static com.sh.airbnb.common.JdbcTemplate.commit;
import static com.sh.airbnb.common.JdbcTemplate.getConnection;
import static com.sh.airbnb.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sh.airbnb.admin.model.dao.AdminDao;
import com.sh.airbnb.hotel.model.dto.Hotel;
import com.sh.airbnb.hotel.model.dto.HotelImage;
import com.sh.airbnb.room.model.dto.Room;
import com.sh.airbnb.room.model.dto.RoomImage;
import com.sh.airbnb.user.model.dto.User;

public class AdminService {
	private AdminDao adminDao = new AdminDao();
	
	
	public int insertHotel(Hotel hotel) {
		int result = 0 ;
		Connection conn = getConnection();
		try {
			
		result = adminDao.insertHotel(conn,hotel);
		String hotelNo = adminDao.selectLastHotelNo(conn,hotel);
		hotel.setHotelNo(hotelNo);
		List<HotelImage> hotelImages = hotel.getHotelImages();
		if(!hotelImages.isEmpty()) {
			for(HotelImage hotelImage : hotelImages) {
				hotelImage.setHotelNo(hotelNo);
				result = adminDao.insertHotelImages(conn,hotelImage);
				System.out.println(hotelImage);
			}
		}
				
		
		
		commit(conn);
		}catch(Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}
		return result;
	}

	public List<Hotel> selectAllHotel(String userId) {
		List<Hotel>hotelList =new ArrayList<>();
		try {
		Connection conn =getConnection();
		hotelList = adminDao.selectAllHotel(conn,userId);
		if(hotelList != null) {
		for(Hotel hotel : hotelList) {
			hotel.setRooms(adminDao.selectAllRoom(hotel.getHotelNo(),conn));
		}
		}
		close(conn);
		}catch(Exception e) {
			throw e;
		}
		return hotelList;
	}

	public int insertCategory(String userId,String[] category, String hotelNo) {
		int result = 0;
		Connection conn = getConnection();
		
		try {
			
			result = adminDao.insertCategory(userId,hotelNo,category,conn);
			
			
			commit(conn);
		}catch(Exception e ){
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}
		
		return result;
	}

	public List<User> searchUser(Map<String, String> param) {
		List<User> userList = new ArrayList<>();
		
		try {
			Connection conn = getConnection();
			
		userList = adminDao.searchUser(conn,param);
		
		close(conn);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return userList;
	}

	public int insertRoom(Room room) {
		int result =0;
		
		Connection conn = getConnection();
		
		try {
			result = adminDao.insertRoom(room,conn);
			String roomNo = adminDao.selectLastRoomNo(conn,room);
			room.setRoomNo(roomNo);
			List<RoomImage> roomImages = room.getRoomImage();
			if(!roomImages.isEmpty()){
				for (RoomImage roomImage : roomImages) {
					roomImage.setRoomNo(roomNo);
					result = adminDao.insertRoomImages(conn,roomImage);
				}
			
			}
			
			
			commit(conn);
		}catch (Exception e) {
			rollback(conn);
			throw e ;
		}finally {
			close(conn);
		}
		
		return result;
	}

	public int deleteHotel(String hotelNo) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = adminDao.deleteHotel(conn,hotelNo);			
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}

		return result;
	}

}
