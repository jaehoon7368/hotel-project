package com.sh.airbnb.hotel.model.service;

import static com.sh.airbnb.common.JdbcTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.sh.airbnb.hotel.model.dao.HotelDao;
import com.sh.airbnb.hotel.model.dto.Hotel;

public class HotelService {
	private HotelDao hotelDao = new HotelDao();

	public List<Hotel> hotelTotalView() {
		Connection conn = getConnection();
		
		List<Hotel> hotelList = hotelDao.hotelTotalView(conn);
		close(conn);
		return hotelList;
	}

}
