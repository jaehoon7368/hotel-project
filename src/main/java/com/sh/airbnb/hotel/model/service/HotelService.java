package com.sh.airbnb.hotel.model.service;

import static com.sh.airbnb.common.JdbcTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.sh.airbnb.hotel.model.dao.HotelDao;
import com.sh.airbnb.hotel.model.dto.Hotel;
import com.sh.airbnb.hotel.model.dto.HotelCategory;
import com.sh.airbnb.hotel.model.dto.HotelEntity;
import com.sh.airbnb.room.model.dao.RoomDao;
import com.sh.airbnb.room.model.dto.RoomPrice;

public class HotelService {
	private HotelDao hotelDao = new HotelDao();
	private RoomDao roomDao = new RoomDao();

	public List<Hotel> hotelTotalView() {
		Connection conn = getConnection();
		
		List<Hotel> hotelList = hotelDao.hotelTotalView(conn);
		close(conn);
		return hotelList;
	}

	public Hotel selectOneHotel(String hotelNo) {
		Connection conn = getConnection();
		Hotel hotel = hotelDao.selectOneHotel(conn,hotelNo);
		close(conn);
		return hotel;
	}

	public List<Hotel> selectHotel() {
		Connection conn = getConnection();
		
		List<Hotel> hotelList = hotelDao.selectHotel(conn);
		close(conn);
		return hotelList;
	}

	public List<Hotel> selectPension() {
		Connection conn = getConnection();
		
		List<Hotel> hotelList = hotelDao.selectPension(conn);
		close(conn);
		return hotelList;
	}
	
	public List<Hotel> selectMotel() {
		Connection conn = getConnection();
		
		List<Hotel> hotelList = hotelDao.selectMotel(conn);
		close(conn);
		return hotelList;
	}

	public List<Hotel> filterSelectHotel(int minPrice, int maxPrice, String category) {
		Connection conn = getConnection();
		
		// 가격 필터로 걸러진 hotelNo를 가져온다.
		List<RoomPrice> priceHotelNo = roomDao.priceFilterHotelNo(conn,minPrice,maxPrice);
		System.out.println("priceHotelNo = " + priceHotelNo);
		// 가격 필터로 걸러진 hotelNo와 category로 hotelNo를 가져온다.
		List<HotelCategory> categoryHotelNo = hotelDao.selectCategoryHotelNo(conn,category,priceHotelNo);
		System.out.println("categoryHotelNo = " + categoryHotelNo);
		// 전부 걸러진 hotelList를 Servlet으로 보내준다.
		List<Hotel> hotelList = hotelDao.filterSelectHotel(conn,categoryHotelNo);
		System.out.println("hotelList = " + hotelList);
		close(conn);
		return hotelList;
	}

}
