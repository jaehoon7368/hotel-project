package com.sh.airbnb.room.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
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

	public List<Room> roomselectDate(Connection conn, String hotelNo, Date sqlDate1, Date sqlDate2) {
		String sql = prop.getProperty("selectDateRoom");
		List<Room> roomDateList = new ArrayList<>();
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setDate(1, sqlDate1);
			pstmt.setDate(2, sqlDate2);
			pstmt.setDate(3, sqlDate1);
			pstmt.setDate(4, sqlDate2);
			pstmt.setDate(5, sqlDate1);
			pstmt.setDate(6, sqlDate2);
			pstmt.setString(7, hotelNo);
			try(ResultSet rset = pstmt.executeQuery()){
				while(rset.next()) {
					Room room = new Room();
					room.setRoomNo(rset.getString("room_no"));
					roomDateList.add(room);
				}
			}
		} catch (SQLException e) {
			throw new RoomException("체크인아웃 정보로 RoomNo 가져오기 오류",e);
		}
		
		return roomDateList;
	}

	private Room handleRoomResultSet(ResultSet rset) throws SQLException {
		Room room = new Room();
		room.setRoomNo(rset.getString("room_no"));
		room.setRoomType(rset.getString("room_type"));
		room.setRoomPrice(rset.getInt("room_price"));
		room.setLimitPeople(rset.getInt("limit_people"));
		room.setHotelNo(rset.getString("hotel_no"));
		room.setRenamedFilename(rset.getString("renamed_filename"));
		room.setRoomInfo(rset.getString("room_info"));
		return room;
	}

	public List<Room> selectCheckRoom(Connection conn, List<Room> roomDateList) {
		String sql = prop.getProperty("selectRoom");
		List<Room> roomList = new ArrayList<>();
		
		List<String> roomListArray = new ArrayList<>();
		for(int i = 0 ; i< roomDateList.size(); i++) {
			roomListArray.add(roomDateList.get(i).getRoomNo());
		}
		String temp = "";
		for(int i = 0; i < roomListArray.size();i++) {
			temp += "'" + roomListArray.get(i) + "'";
			if(i != roomListArray.size() -1)
				temp += ", ";
		}
		sql = sql.replace("$", temp);
		System.out.println("selectSearchHotel = " + temp);
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			try(ResultSet rset = pstmt.executeQuery()){
				while(rset.next()) {
					Room room = handleRoomResultSet(rset);
					roomList.add(room);
				}
			}
		} catch (SQLException e) {
			throw new RoomException("체크인아웃 정보로 Room 가져오기 오류",e);
		}
		return roomList;
	}

	public List<Room> roomImage(Connection conn, String hotelNo) {
		String sql = prop.getProperty("roomImage");
		List<Room> roomImage = new ArrayList<>();
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, hotelNo);
			try(ResultSet rset = pstmt.executeQuery()){
				while(rset.next()) {
					Room room = new Room();
					room.setRenamedFilename(rset.getString("renamed_filename"));
					roomImage.add(room);
				}
			}
		} catch (SQLException e) {
			throw new RoomException("Room 이미지 가져오기 오류",e);
		}
		return roomImage;
	}

}
