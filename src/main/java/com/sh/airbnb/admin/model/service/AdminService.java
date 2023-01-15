package com.sh.airbnb.admin.model.service;

import static com.sh.airbnb.common.JdbcTemplate.close;
import static com.sh.airbnb.common.JdbcTemplate.getConnection;
import static com.sh.airbnb.common.JdbcTemplate.rollback;

import java.sql.Connection;

import com.sh.airbnb.admin.model.dao.AdminDao;
import com.sh.airbnb.hotel.model.dto.Hotel;

public class AdminService {
	private AdminDao adminDao = new AdminDao();
	
	public int insertHotel(Hotel hotel) {
		int result = 0 ;
		Connection conn = getConnection();
		try {
		result = adminDao.insertHotel(conn,hotel);
				
		}catch(Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}
		return result;
	}

}
