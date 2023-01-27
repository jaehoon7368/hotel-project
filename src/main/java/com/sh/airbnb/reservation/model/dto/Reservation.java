package com.sh.airbnb.reservation.model.dto;

import java.sql.Date;

public class Reservation extends ReservationEntity {
	private String hotelName;
	private String roomType;

	
	

	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Reservation(String reNo, int people, Date startDate, Date endDate, String reservationStatus, String roomNo,
			String userId, String hotelNo, String reName, int reDay, int rePrice, String hotelName, String roomType) {
		super(reNo, people, startDate, endDate, reservationStatus, roomNo, userId, hotelNo, reName, reDay, rePrice);
		this.hotelName = hotelName;
		this.roomType = roomType;
	}

	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	
	
}
