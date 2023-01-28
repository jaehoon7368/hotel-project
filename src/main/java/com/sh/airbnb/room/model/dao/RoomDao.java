package com.sh.airbnb.room.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.sh.airbnb.hotel.model.dao.HotelDao;
import com.sh.airbnb.room.model.dto.Room;
import com.sh.airbnb.room.model.dto.RoomPrice;
import com.sh.airbnb.room.model.exception.RoomException;

public class RoomDao {
	
	private Properties prop = new Properties();
	
	public RoomDao(){
		String filePath= HotelDao.class.getResource("/sql/room/room-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("Room query load 완료" +prop);
	}

	public List<Room> roomTotalView(Connection conn, String hotelNo) {
		String sql = prop.getProperty("roomTotalView");
		List<Room> roomList = new ArrayList<>();
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, hotelNo);
			
			try(ResultSet rset = pstmt.executeQuery()){
				while(rset.next()) {
					Room room = new Room();
					room.setRoomNo(rset.getString("room_no"));
					room.setRoomType(rset.getString("room_type"));
					room.setRoomPrice(rset.getInt("room_price"));
					room.setLimitPeople(rset.getInt("limit_people"));
					room.setHotelNo(rset.getString("hotel_no"));
					room.setRenamedFilename(rset.getString("renamed_filename"));
					room.setRoomInfo(rset.getString("room_info"));
					roomList.add(room);
				}
			}
			
		} catch (SQLException e) {
			throw new RoomException("객실 정보 불러오기 오류",e);
		}
		return roomList;
	}

	public RoomPrice selectRoomPrice(Connection conn) {
		String sql = prop.getProperty("selectRoomPrice");
		RoomPrice roomPrice = null;
		
		try(
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rset = pstmt.executeQuery();
			){
			while(rset.next()) {
				roomPrice = new RoomPrice();
				roomPrice.setMinPrice(rset.getInt("min_price"));
				roomPrice.setMaxPrice(rset.getInt("max_price"));
				roomPrice.setAvgPrice(rset.getInt("avg_price"));
				
			}
		} catch (SQLException e) {
			throw new RoomException("객실 최소,최대,평균 가격 불러오기 오류",e);
		}
		return roomPrice;
	}

	public List<RoomPrice> priceFilterHotelNo(Connection conn, int minPrice, int maxPrice) {
		String sql = prop.getProperty("selectPriceFilterHotelNo");
		List<RoomPrice> priceHotelNo = new ArrayList<>();
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, minPrice);
			pstmt.setInt(2, maxPrice);
			
			try(ResultSet rset = pstmt.executeQuery()){
				while(rset.next()) {
					RoomPrice roomPrice = new RoomPrice();
					roomPrice.setHotelNo(rset.getString("hotel_no"));
					priceHotelNo.add(roomPrice);
				}
			}
			
		} catch (SQLException e) {
			throw new RoomException("필터 가격 정보로 hotelNo 가져오기 오류",e);
		}
		
		return priceHotelNo;
	}

}
