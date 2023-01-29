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
import com.sh.airbnb.hotel.model.dto.HotelCategory;
import com.sh.airbnb.hotel.model.dto.HotelEntity;
import com.sh.airbnb.hotel.model.dto.HotelType;
import com.sh.airbnb.hotel.model.exception.HotelException;
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

	public List<HotelCategory> selectCategoryHotelNo(Connection conn, String category, List<RoomPrice> priceHotelNo) {
		String sql = prop.getProperty("selectCategoryHotelNo");
		List<HotelCategory> categoryHotelNo = new ArrayList<>();

		StringBuilder price = new StringBuilder();
		
		System.out.println(category);
		
		for(int i = 0 ; i < priceHotelNo.size();i++) {
			if(i == 0) {
				price.append(priceHotelNo.get(i).getHotelNo() + "'" + ",");
			}
			else if(i != priceHotelNo.size()-1) {
				price.append("'" + priceHotelNo.get(i).getHotelNo() + "'" + ",");
			}else if( i == priceHotelNo.size()-1) {
				price.append("'" + priceHotelNo.get(i).getHotelNo());
			}
			else {
				price.append("'" + priceHotelNo.get(i).getHotelNo() + "'");
			}
		}
		String hotelNo = price.toString();
		System.out.println("카테고리"+category);
		
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
				
				
				pstmt.setString(1, category);
				pstmt.setString(2, hotelNo);
		
			try(ResultSet rset = pstmt.executeQuery()){
				System.out.println(sql);
				while(rset.next()) {
					HotelCategory hotelCategory = new HotelCategory();
					hotelCategory.setHotelNo(rset.getString("hotel_no"));
					System.out.println("rset후 호텔넘버"+hotelCategory.getHotelNo());
					categoryHotelNo.add(hotelCategory);
				}
			}
		} catch (SQLException e) {
			throw new HotelException("호텔 필터 카테고리 hotelNo 가져오기 오류!",e);
		}
		System.out.println(categoryHotelNo.size()+"사이즈");
		return categoryHotelNo;
	}

	public List<Hotel> filterSelectHotel(Connection conn, List<HotelCategory> categoryHotelNo) {
		String sql = prop.getProperty("filterHotelList");
		List<Hotel> hotelList = new ArrayList<>();
		StringBuilder cate = new StringBuilder();
		
		for(int i = 0 ; i < categoryHotelNo.size();i++) {
			if(i != categoryHotelNo.size()-1) {
				cate.append(categoryHotelNo.get(i).getHotelNo() + ",");
			}else {
				cate.append(categoryHotelNo.get(i).getHotelNo());
			}
		}
		String hotelNo = cate.toString();
		System.out.println("hotelNo = " + hotelNo);
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
				pstmt.setString(1, hotelNo);
				
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