package com.sh.airbnb.reservation.model.dto;

import java.sql.Date;

public class ReservationEntity extends Reservation {

	private String hotelName;
	private String roomType;
	
	
	
	public ReservationEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReservationEntity(String reNo, int people, Date startDate, Date endDate, String reservationStatus,
			String roomNo, String userId, String hotelNo, String reName, int reDay, int rePrice) {
		super(reNo, people, startDate, endDate, reservationStatus, roomNo, userId, hotelNo, reName, reDay, rePrice);
		// TODO Auto-generated constructor stub
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
