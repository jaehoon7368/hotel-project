package com.sh.airbnb.hotel.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.sh.airbnb.hotel.model.dto.Hotel;
import com.sh.airbnb.hotel.model.dto.HotelType;
import com.sh.airbnb.hotel.model.exception.HotelException;

public class HotelDao {
	
	private Properties prop = new Properties();
	
	
	public HotelDao() {
		String filePath= HotelDao.class.getResource("/sql/hotel/hotel-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("Hotel query load 완료" +prop);
		
	}

	public List<Hotel> hotelTotalView(Connection conn) {
		String sql = prop.getProperty("hotelTotalView");
		List<Hotel> hotelList = new ArrayList<>();
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			
		try(ResultSet rset = pstmt.executeQuery()){
			while(rset.next()) {
				Hotel hotel = new Hotel();
				hotel.setHotelNo(rset.getString("hotel_no"));
				hotel.setHotelName(rset.getString("hotel_name"));
				hotel.setHotelAddress(rset.getString("hotel_address"));
				hotel.setHotelType(HotelType.valueOf(rset.getString("hotel_type")));
				hotel.setHotelInfo(rset.getString("hotel_info"));
				hotel.setPrice(rset.getInt("price"));
				hotel.setRenamedFilename(rset.getString("renamed_filename"));
				hotelList.add(hotel);
			}
//			System.out.println(hotelList);
		}
		} catch (SQLException e) {
			throw new HotelException("호텔 정보 불러오기 오류!",e);
		}
		return hotelList;
	}

	public Hotel selectOneHotel(Connection conn, String hotelNo) {
		String sql = prop.getProperty("selectOneHotel");
		Hotel hotel = null;
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, hotelNo);
			try(ResultSet rset = pstmt.executeQuery()){
				while(rset.next()) {
					hotel = new Hotel();
					hotel.setHotelNo(rset.getString("hotel_no"));
					hotel.setHotelName(rset.getString("hotel_name"));
					hotel.setHotelAddress(rset.getString("hotel_address"));
					hotel.setHotelType(HotelType.valueOf(rset.getString("hotel_type")));
					hotel.setHotelInfo(rset.getString("hotel_info"));
					hotel.setRenamedFilename(rset.getString("renamed_filename"));
				}
//				System.out.println(hotelList);
			}
			} catch (SQLException e) {
				throw new HotelException("한개의 호텔 정보 불러오기 오류!",e);
			}
		return hotel;
	}


}