package com.sh.airbnb.admin.model.service;

import static com.sh.airbnb.common.JdbcTemplate.close;
import static com.sh.airbnb.common.JdbcTemplate.commit;
import static com.sh.airbnb.common.JdbcTemplate.getConnection;
import static com.sh.airbnb.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.sh.airbnb.admin.model.dao.AdminDao;
import com.sh.airbnb.hotel.model.dto.Hotel;
import com.sh.airbnb.hotel.model.dto.HotelImage;

public class AdminService {
	private AdminDao adminDao = new AdminDao();
	
//	List<Attachment> attachments = board.getAttachments();
//	if(!attachments.isEmpty()) {
//		for(Attachment attach : attachments) {
//			attach.setBoardNo(boardNo); //fk 컬럼값 세팅
//			result = boardDao.insertAttachment(conn,attach);
//		}
	
	public int insertHotel(Hotel hotel) {
		int result = 0 ;
		Connection conn = getConnection();
		try {
			
		result = adminDao.insertHotel(conn,hotel);
		
		String hotelNo = adminDao.selectLastHotelNo(conn,hotel);
		
		System.out.println("hotelNo = "+hotelNo);
		hotel.setHotelNo(hotelNo);
		
		List<HotelImage> hotelImages = hotel.getHotelImages();
		if(!hotelImages.isEmpty()) {
			for(HotelImage hotelImage : hotelImages) {
				hotelImage.setHotelNo(hotelNo);
				result = adminDao.insertHotelImages(conn,hotelImage);
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
		List<Hotel>hotelList =new ArrayList();
		
		try {
		Connection conn =getConnection();
		hotelList = adminDao.selectAllHotel(conn,userId);
		close(conn);
		if(hotelList != null) {
		for(Hotel hotel : hotelList) {
			hotel.setRooms(adminDao.selectAllRoom(hotel.getHotelNo(),conn));
		}
		}
		
		}catch(Exception e) {
			throw e;
		}
		
		
		return hotelList;
	}

}
