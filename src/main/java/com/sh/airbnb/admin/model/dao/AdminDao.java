package com.sh.airbnb.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.sh.airbnb.admin.model.exception.AdminException;
import com.sh.airbnb.hotel.model.dto.Hotel;
import com.sh.airbnb.hotel.model.dto.HotelImage;
import com.sh.airbnb.hotel.model.dto.HotelType;
import com.sh.airbnb.room.model.dto.Room;

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

	public List<Hotel> selectAllHotel(Connection conn, String userId) {
		String sql = prop.getProperty("selectAllHotel");
		//select * from tb_hotel where user_id = ?
		List<Hotel> hotels = new ArrayList<>();
		try(PreparedStatement pstmt =conn.prepareStatement(sql)){
			pstmt.setString(1, userId);
			
			try(ResultSet rset = pstmt.executeQuery()){
				while(rset.next()) {
				Hotel hotel = new Hotel();
				hotel.setHotelNo(rset.getString("hotel_no"));
				hotel.setHotelName(rset.getString("hotel_name"));
				hotel.setHotelAddress(rset.getString("hotel_address"));
				hotel.setHotelType(HotelType.valueOf(rset.getString("hotel_type")));
				hotel.setHotelInfo(rset.getString("hotel_info"));
				hotel.setRenamedFilename(rset.getString("renamed_filename"));
				hotels.add(hotel);
				}
			}
		}catch(SQLException e) {
			throw new AdminException("관리자 호텔전체목록 조회",e);
		}
		return hotels;
	}

	public String selectLastHotelNo(Connection conn,Hotel hotel) {
		String sql = prop.getProperty("selectLastHoteldNo");
		//selectLastHoteldNo = select ?||to_char(req_hotel_no.nextval,'fm0000') from dual
		String hotelNo = "";

		try (PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, hotel.getHotelType().name());
			try (ResultSet rset = pstmt.executeQuery()) {
				if (rset.next()) {
					hotelNo = rset.getString(1);
				}
			}

		} catch (SQLException e) {
			throw new AdminException("호텔마지막 넘버 조회오류 ", e);
		}
		return hotelNo;
	}

	public int insertHotelImages(Connection conn,HotelImage hotelImage) {
		String sql = prop.getProperty("insertHotelImage");
		int result = 0;
//		insert into tb_hotel_images values(req_tb_hotel_imges_no.nextval ,?,?,default,?)
		try(
			PreparedStatement pstmt =conn.prepareStatement(sql);
				){
			pstmt.setString(1, hotelImage.getOriginalFilename());
			pstmt.setString(2, hotelImage.getRenamedFilename());
			pstmt.setString(3, hotelImage.getHotelNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new AdminException("호텔이미지 등록 오류 !",e);
		}
		return result;
	}
	//호텔안에 룸 셋팅 
	public List<Room> selectAllRoom(String hotelNo, Connection conn) {  
		String sql = prop.getProperty("selectAllRoom");
		
		//select *from tb_room where hotel_no = ?
		List<Room> rooms =new ArrayList<>();
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, hotelNo);
			try(ResultSet rset =pstmt.executeQuery()){
				while(rset.next()) {
					Room room = new Room();
					room.setHotelNo(hotelNo);
					room.setLimitPeople(rset.getInt("limit_people"));
					room.setRoomPrice(rset.getInt("room_price"));
					room.setRoomType(rset.getString("room_type"));
					room.setRoomNo(rset.getString("room_no"));
					room.setRenamedFilename(rset.getString("renamed_filename"));
					rooms.add(room);
				}
			}
		}catch(Exception e) {
			throw new AdminException ("호텔당 룸 객체 가져오기 오류 ",e);
		}
		return rooms;
	}

	public int insertCategory(String userId,String hotelNo, String[] category, Connection conn) {
		int result = 0 ;
		String sql = prop.getProperty("insertgCategory");
		//insert into tb_category values (? ,?, ?)
		for(int i = 0 ; i<category.length; i++) {
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, category[i]);
			pstmt.setString(2,hotelNo);
			pstmt.setString(3, userId);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			throw new AdminException("카테고리 등록 오류 ",e);
		}
		}
		
		return result;
	}
}
