package com.sh.airbnb.reservation.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import com.sh.airbnb.admin.model.dao.AdminDao;
import com.sh.airbnb.reservation.model.dto.Reservation;
import com.sh.airbnb.reservation.model.exception.ReservationException;

public class ReservationDao {
	private Properties prop = new Properties ();

	
	public ReservationDao() {

		String filePath= AdminDao.class.getResource("/sql/reservation/reservation-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
			
		}
		System.out.println("query load 완료" +prop);
	
	
	}
	
	public int insertReservation(Reservation rev, Connection conn) {
		String sql = prop.getProperty("insertResevation");
		
		int result = 0;
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1,rev.getPeople());
			pstmt.setDate(2, (Date) rev.getStartDate());
			pstmt.setDate(3, (Date) rev.getEndDate());
			pstmt.setString(4, rev.getRoomNo());
			pstmt.setString(5, rev.getUserId());
			pstmt.setString(6,rev.getHotelNo());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			throw new ReservationException("예약 등록 오류 ",e);
		}
		return result;
	}

	public String selectLastReNo(Connection conn) {
		String sql = prop.getProperty("selectLastReNo");
		String reNo = "";
		try(PreparedStatement pstmt =conn.prepareStatement(sql)){
			try(ResultSet rset = pstmt.executeQuery()){
				if(rset.next()) {
					reNo = rset.getString(1);
				}
			}
			
		}catch(Exception e ) {
			throw new ReservationException("예약 마지막 번호 조회 오류 ",e);
		}
		return reNo;
	}

}
