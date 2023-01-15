package com.sh.airbnb.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Properties;

import com.sh.airbnb.admin.model.exception.AdminException;
import com.sh.airbnb.hotel.model.dto.Hotel;
import com.sh.airbnb.hotel.model.dto.HotelType;

public class AdminDao {
	private Properties prop = new Properties();

	public AdminDao() {
		String filePath= AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("query load 완료" +prop);
	}
	
	public int insertHotel(Connection conn, Hotel hotel) {
		String sql = prop.getProperty("insertHotel");

		System.out.println("sql문 가져왓느지 확인 "+sql);
		System.out.println("호텔 객체 확인 ="+hotel);
		int result = 0 ;
		String user = "admin";
		//insert into tb_hotel values ( ? || to_char(req_hotel_no.nextval,'fm0000') ,?,?,?,?,?
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
		pstmt.setString(1, hotel.getHotelType().name());
		pstmt.setString(2, hotel.getHotelName());
		pstmt.setString(3, hotel.getHotelAddress());
		pstmt.setString(4, hotel.getHotelType().name());
		pstmt.setString(5, hotel.getHotelInfo());
		pstmt.setString(6, user);
		result = pstmt.executeUpdate();
		}catch(Exception e) {
			throw new AdminException("호텔 등록 오류입니다.",e);
		}
		
		return result;
	}

}
