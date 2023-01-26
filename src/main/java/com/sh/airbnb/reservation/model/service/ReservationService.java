package com.sh.airbnb.reservation.model.service;
import static com.sh.airbnb.common.JdbcTemplate.close;
import static com.sh.airbnb.common.JdbcTemplate.getConnection;
import static com.sh.airbnb.common.JdbcTemplate.rollback;

import java.sql.Connection;

import com.sh.airbnb.reservation.model.dao.ReservationDao;
import com.sh.airbnb.reservation.model.dto.Reservation;

public class ReservationService {
	private ReservationDao reservationDao  = new ReservationDao();
	public int insertResevation(Reservation reservation) {
		int result = 0;
		Connection conn = getConnection();
		try {
			
			result = reservationDao.insertReservation(reservation,conn);
			
			String reNo = reservationDao.selectLastReNo(conn);
			reservation.setReNo(reNo);
			
		}catch(Exception e ) {
			rollback(conn);
			throw e ;
		}finally {
			close(conn);
		}
		return result;
	}

}
