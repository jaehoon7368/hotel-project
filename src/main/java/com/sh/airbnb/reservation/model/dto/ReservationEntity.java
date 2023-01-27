package com.sh.airbnb.reservation.model.dto;

import java.sql.Date;

public class ReservationEntity {

	String reNo;
	int people;
	Date startDate;
	Date endDate;
	String reservationStatus;
	String roomNo;
	String userId;
	String hotelNo;
	String reName;
	int reDay;
	int rePrice;
	
	public ReservationEntity() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ReservationEntity(String reNo, int people, Date startDate, Date endDate, String reservationStatus,
			String roomNo, String userId, String hotelNo, String reName, int reDay, int rePrice) {
		super();
		this.reNo = reNo;
		this.people = people;
		this.startDate = startDate;
		this.endDate = endDate;
		this.reservationStatus = reservationStatus;
		this.roomNo = roomNo;
		this.userId = userId;
		this.hotelNo = hotelNo;
		this.reName = reName;
		this.reDay = reDay;
		this.rePrice = rePrice;
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
	public String getReName() {
		return reName;
	}
	public void setReName(String reName) {
		this.reName = reName;
	}
	public int getReDay() {
		return reDay;
	}
	public void setReDay(int reDay) {
		this.reDay = reDay;
	}
	public int getRePrice() {
		return rePrice;
	}
	public void setRePrice(int rePrice) {
		this.rePrice = rePrice;
	}
	@Override
	public String toString() {
		return "ReservationEntity [reNo=" + reNo + ", people=" + people + ", startDate=" + startDate + ", endDate="
				+ endDate + ", reservationStatus=" + reservationStatus + ", roomNo=" + roomNo + ", userId=" + userId
				+ ", hotelNo=" + hotelNo + ", reName=" + reName + ", reDay=" + reDay + ", rePrice=" + rePrice + "]";
	}
	
	
	
}