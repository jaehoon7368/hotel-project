package com.sh.airbnb.hotel.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

import com.sh.airbnb.hotel.model.dto.Hotel;
import com.sh.airbnb.hotel.model.dto.HotelCategory;
import com.sh.airbnb.hotel.model.dto.HotelType;
import com.sh.airbnb.hotel.model.exception.HotelException;
import com.sh.airbnb.reservation.model.dto.ReservationEntity;
import com.sh.airbnb.room.model.dto.RoomPrice;

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
				Hotel hotel = handleHotelResultSet(rset);
				hotelList.add(hotel);
			}
//			System.out.println(hotelList);
		}
		} catch (SQLException e) {
			throw new HotelException("전체 정보 불러오기 오류!",e);
		}
		return hotelList;
	}

	private Hotel handleHotelResultSet(ResultSet rset) throws SQLException {
		Hotel hotel = new Hotel();
		hotel.setHotelNo(rset.getString("hotel_no"));
		hotel.setHotelName(rset.getString("hotel_name"));
		hotel.setHotelAddress(rset.getString("hotel_address"));
		hotel.setHotelType(HotelType.valueOf(rset.getString("hotel_type")));
		hotel.setHotelInfo(rset.getString("hotel_info"));
		hotel.setPrice(rset.getInt("price"));
		hotel.setRenamedFilename(rset.getString("renamed_filename"));
		return hotel;
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

	public List<Hotel> selectHotel(Connection conn) {
		String sql = prop.getProperty("selectHotel");
		List<Hotel> hotelList = new ArrayList<>();
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			
		try(ResultSet rset = pstmt.executeQuery()){
			while(rset.next()) {
				Hotel hotel = handleHotelResultSet(rset);
				hotelList.add(hotel);
			}
		}
		} catch (SQLException e) {
			throw new HotelException("호텔 정보 불러오기 오류!",e);
		}
		return hotelList;
	}

	public List<Hotel> selectPension(Connection conn) {
		String sql = prop.getProperty("selectPension");
		List<Hotel> hotelList = new ArrayList<>();
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			
		try(ResultSet rset = pstmt.executeQuery()){
			while(rset.next()) {
				Hotel hotel = handleHotelResultSet(rset);
				hotelList.add(hotel);
			}
		}
		} catch (SQLException e) {
			throw new HotelException("펜션 정보 불러오기 오류!",e);
		}
		return hotelList;
	}
	
	public List<Hotel> selectMotel(Connection conn) {
		String sql = prop.getProperty("selectMotel");
		List<Hotel> hotelList = new ArrayList<>();
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			
		try(ResultSet rset = pstmt.executeQuery()){
			while(rset.next()) {
				Hotel hotel = handleHotelResultSet(rset);
				hotelList.add(hotel);
			}
		}
		} catch (SQLException e) {
			throw new HotelException("모텔 정보 불러오기 오류!",e);
		}
		return hotelList;
	}

	public List<HotelCategory> selectCategoryHotelNo(Connection conn, String[] category, List<RoomPrice> priceHotelNo) {
		String sql = prop.getProperty("selectCategoryHotelNo");
		// select hotel_no from tb_hotel_category where category_no >= all(?) and hotel_no in (?) group by hotel_no
		
		List<HotelCategory> categoryHotelNo = new ArrayList<>();
		System.out.println(category); 
		
		List<String> list = Arrays.asList(category);
		
		String temp = "";
		for(int i = 0; i < list.size();i++) {
			temp += "'" + category[i] + "'";
			if(i != list.size() -1)
				temp += ", ";
		}
		sql = sql.replace("$", temp);
	

		List<String> hotelList = new ArrayList<>();
		for(int i = 0 ; i< priceHotelNo.size(); i++) {
			hotelList.add(priceHotelNo.get(i).getHotelNo());
		}
		String temp2 = "";
		for(int i = 0; i < hotelList.size();i++) {
			temp2 += "'" + hotelList.get(i) + "'";
			if(i != hotelList.size() -1)
				temp2 += ", ";
		}
		sql = sql.replace("^", temp2);
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){

			try(ResultSet rset = pstmt.executeQuery()){
				System.out.println(sql);
				while(rset.next()) {
					HotelCategory hotelCategory = new HotelCategory();
					hotelCategory.setHotelNo(rset.getString("hotel_no"));
					categoryHotelNo.add(hotelCategory);
					
				}
			}
		} catch (SQLException e) {
			throw new HotelException("호텔 필터 카테고리 hotelNo 가져오기 오류!",e);
		}
		return categoryHotelNo;
	}

	public List<Hotel> filterSelectHotel(Connection conn, List<HotelCategory> categoryHotelNo) {
		String sql = prop.getProperty("filterHotelList");
		
		List<Hotel> hotelList = new ArrayList<>();
	
		List<String> hotelListArray = new ArrayList<>();
		for(int i = 0 ; i< categoryHotelNo.size(); i++) {
			hotelListArray.add(categoryHotelNo.get(i).getHotelNo());
		}
		String temp = "";
		for(int i = 0; i < hotelListArray.size();i++) {
			temp += "'" + hotelListArray.get(i) + "'";
			if(i != hotelListArray.size() -1)
				temp += ", ";
		}
		sql = sql.replace("$", temp);
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
	
		try(ResultSet rset = pstmt.executeQuery()){
			while(rset.next()) {
				Hotel hotel = handleHotelResultSet(rset);
				hotelList.add(hotel);
			}
		}
		} catch (SQLException e) {
			throw new HotelException("필터 호텔 정보 가져오기 오류!",e);
		}
		return hotelList;
	}

	public List<Hotel> selectHotelAddress(Connection conn, String location) {
		String sql = prop.getProperty("selectHotelAddress");
		
		List<Hotel> addressList = new ArrayList<>();
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, "%" + location + "%");
			try(ResultSet rset = pstmt.executeQuery()){
				while(rset.next()) {
					Hotel hotel = handleHotelResultSet(rset);
					addressList.add(hotel);
				}
			}
			
		} catch (SQLException e) {
			throw new HotelException("주소필터 호텔 정보 가져오기 오류!",e);
		}
		return addressList;
	}

	public List<Hotel> selectSearchHotel(Connection conn, List<ReservationEntity> reservationList) {
		
		String sql = prop.getProperty("filterHotelList");
		
		List<Hotel> hotelList = new ArrayList<>();
	
		List<String> hotelListArray = new ArrayList<>();
		for(int i = 0 ; i< reservationList.size(); i++) {
			hotelListArray.add(reservationList.get(i).getHotelNo());
		}
		String temp = "";
		for(int i = 0; i < hotelListArray.size();i++) {
			temp += "'" + hotelListArray.get(i) + "'";
			if(i != hotelListArray.size() -1)
				temp += ", ";
		}
		sql = sql.replace("$", temp);
		System.out.println("selectSearchHotel = " + temp);
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
	
		try(ResultSet rset = pstmt.executeQuery()){
			while(rset.next()) {
				Hotel hotel = handleHotelResultSet(rset);
				hotelList.add(hotel);
			}
		}
		} catch (SQLException e) {
			throw new HotelException("필터 호텔 정보 가져오기 오류!",e);
		}
		return hotelList;
	}

}