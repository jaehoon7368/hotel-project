package com.sh.airbnb.reservation.model.dao;

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

import com.sh.airbnb.admin.model.dao.AdminDao;
import com.sh.airbnb.hotel.model.dto.Hotel;
import com.sh.airbnb.reservation.model.dto.Reservation;
import com.sh.airbnb.reservation.model.dto.ReservationEntity;
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
		String sql = prop.getProperty("insertReservation");
		//insert into tb_reservation values ('R'||to_char(req_reservation.nextval,'fm0000'),?,?,?,'Y',?,?,?,?,?,?)
		int result = 0;
		
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1,rev.getPeople());
			pstmt.setDate(2, rev.getStartDate());
			pstmt.setDate(3, rev.getEndDate());
			pstmt.setString(4, rev.getRoomNo());
			pstmt.setString(5, rev.getUserId());
			pstmt.setString(6,rev.getHotelNo());
			pstmt.setString(7, rev.getReName());
			pstmt.setInt(8, rev.getReDay());
			pstmt.setInt(9, rev.getRePrice());
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

	public Reservation selectOneReservation(String reNo, Connection conn) {
		String sql = prop.getProperty("selectOneReservation");
// select hotel_name,room_type,re.*
//from tb_reservation re join tb_room rm  on re.room_no = rm.room_no join tb_hotel h on rm.hotel_no = h.hotel_no where re_no = ?

		Reservation reservation = new Reservation ();
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, reNo);

			try(ResultSet rset = pstmt.executeQuery()){
				
				while(rset.next()) {
					reservation.setStartDate(rset.getDate("start_date"));
					reservation.setRoomNo(rset.getString("room_no"));
					reservation.setReservationStatus(rset.getString("reservation_status"));
					reservation.setPeople(rset.getInt("people_num"));
					reservation.setHotelNo(rset.getString("hotel_no"));
					reservation.setEndDate(rset.getDate("end_date"));
					reservation.setHotelName(rset.getString("hotel_name"));
					reservation.setRoomType(rset.getString("room_type"));
					reservation.setReName(rset.getString("re_name"));
					reservation.setRePrice(rset.getInt("re_price"));
					reservation.setReDay(rset.getInt("re_day"));

				}
			
			}
		
		}catch(Exception e ) {
			throw new ReservationException("예약 조회 오류 ",e);
		}
		
		return reservation;
	}

	public int insertPayment(int price, String reNo,Connection conn ,String userId) {
		String sql = prop.getProperty("insertPayment");
		//insert into tb_sales_data values ('S'||to_char(req_sales_data_no.nextval,'fm0000'),?,default,?)
		int result =0;
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, price);
			pstmt.setString(2, reNo);
			pstmt.setString(3, userId);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			throw new ReservationException("매출통계데이터 등록 오류",e);
		}
		return result;
	}
	public List<Reservation> selectAllReservation(Connection conn, String userId) {
		String sql = prop.getProperty("selectAllReservation");
		List<Reservation> reservations = new ArrayList<>();
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, userId);
			
			
			try(ResultSet rset = pstmt.executeQuery();){
				
				while(rset.next()) {
					Reservation reservation = new Reservation();
					reservation.setHotelName(rset.getString("hotel_name"));
					reservation.setRoomType(rset.getString("room_type"));
					reservation.setReDay(rset.getInt("re_day"));
					reservation.setStartDate(rset.getDate("start_date"));
					reservation.setEndDate(rset.getDate("end_date"));
					reservation.setReName(rset.getString("re_name"));
					reservation.setRePrice(rset.getInt("re_price"));
					reservation.setReNo(rset.getString("re_no"));
					reservation.setReservationStatus(rset.getString("reservation_status"));
					reservations.add(reservation);
					System.out.println("reservation : " + reservations);
				}
			}
			
		} catch (SQLException e) {
			throw new ReservationException("예약내역조회 오류!", e);
		}
				
		return reservations;
	}

	public int updateReservationStatus(Connection conn, Reservation rev) {
		String sql = prop.getProperty("updateReservationStatus");
		int result = 0;
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1,  rev.getReNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new ReservationException("예약취소 오류", e);
		}
		return result;
	}

	public List<ReservationEntity> selectSearhHotel(Connection conn, List<Hotel> addressList, Date sqlDate1, Date sqlDate2) {
		String sql = prop.getProperty("selectReservationNotHotel");
		List<ReservationEntity> reservationList = new ArrayList<>();
		
		List<String> addressListArray = new ArrayList<>();
		for(int i = 0 ; i< addressList.size(); i++) {
			addressListArray.add(addressList.get(i).getHotelNo());
		}
		String temp = "";
		for(int i = 0; i < addressListArray.size();i++) {
			temp += "'" + addressListArray.get(i) + "'";
			if(i != addressListArray.size() -1)
				temp += ", ";
		}
		sql = sql.replace("$", temp);
		System.out.println(temp);
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setDate(1, sqlDate1);
			pstmt.setDate(2, sqlDate2);
			pstmt.setDate(3, sqlDate1);
			pstmt.setDate(4, sqlDate2);
			pstmt.setDate(5, sqlDate1);
			pstmt.setDate(6, sqlDate2);
			
			try(ResultSet rset = pstmt.executeQuery()){
				while(rset.next()) {
				ReservationEntity reservation = new ReservationEntity();
				reservation.setHotelNo(rset.getString("hotel_no"));
				reservationList.add(reservation);
				}
			}
		} catch (SQLException e) {
			throw new ReservationException("예약안된 호텔 불러오기 오류", e);
		}
		return reservationList;
	}

	public int updateReservationStatusY(Connection conn, String reNo) {
		String sql = prop.getProperty("updateReservationStatusY");
		int result = 0;
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1,  reNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new ReservationException("결제시 예약 상황 Y 로 변경 오류", e);
		}
		return result;
		
	}



}
