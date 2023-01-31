package com.sh.airbnb.reservation.model.service;
import static com.sh.airbnb.common.JdbcTemplate.close;
import static com.sh.airbnb.common.JdbcTemplate.getConnection;
import static com.sh.airbnb.common.JdbcTemplate.rollback;
import static com.sh.airbnb.common.JdbcTemplate.commit;


import java.sql.Connection;
import java.util.List;

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
	public Reservation selectOneReservation(String reNo) {
		Reservation reservation = new Reservation();
		Connection conn = getConnection();
		try {
			reservation =reservationDao.selectOneReservation(reNo,conn);
		
			close(conn);
		}catch(Exception e) {
			throw e;
		}
		
		return reservation;
	}
	public int insertPayment(int price, String reNo ,String userId) {
		int result = 0 ;
		Connection conn = getConnection();
		try {
			result = reservationDao.insertPayment(price,reNo,conn,userId);
			
			result = reservationDao.updateReservationStatusY(conn, reNo);
		}catch(Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}
		
		return result;
	}
	public List<Reservation> selectAllReservation(String userId) {
		Connection conn = getConnection();
		List<Reservation> reservations = reservationDao.selectAllReservation(conn, userId);
		close(conn);
		return reservations;
	}
	
	public int updateReservationStatus(Reservation rev) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = reservationDao.updateReservationStatus(conn, rev);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
		
	}
	

	

}
