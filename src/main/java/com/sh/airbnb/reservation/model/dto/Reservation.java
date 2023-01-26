package com.sh.airbnb.reservation.model.dto;

import java.util.Date;

public class Reservation {

	String reNo;
	int people;
	Date startDate;
	Date endDate;
	String reservationStatus;
	String roomNo;
	String userId;
	String hotelNo;
	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reservation(String reNo, int people, Date startDate, Date endDate, String reservationStatus, String roomNo,
			String userId, String hotelNo) {
		super();
		this.reNo = reNo;
		this.people = people;
		this.startDate = startDate;
		this.endDate = endDate;
		this.reservationStatus = reservationStatus;
		this.roomNo = roomNo;
		this.userId = userId;
		this.hotelNo = hotelNo;
	}
	@Override
	public String toString() {
		return "Reservation [reNo=" + reNo + ", people=" + people + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", reservationStatus=" + reservationStatus + ", roomNo=" + roomNo + ", userId=" + userId
				+ ", hotelNo=" + hotelNo + "]";
	}
	public String getReNo() {
		return reNo;
	}
	public void setReNo(String reNo) {
		this.reNo = reNo;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getReservationStatus() {
		return reservationStatus;
	}
	public void setReservationStatus(String reservationStatus) {
		this.reservationStatus = reservationStatus;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getHotelNo() {
		return hotelNo;
	}
	public void setHotelNo(String hotelNo) {
		this.hotelNo = hotelNo;
	}
	
	
	
	
	
}
