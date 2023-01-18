package com.sh.airbnb.room.model.dto;

public class RoomEntity {
	private String roomNo;
	private String roomType;
	private int roomPrice;
	private int limitPeople;
	private String hotelNo;
	
	public RoomEntity() {}

	public RoomEntity(String roomNo, String roomType, int roomPrice, int limitPeople, String hotelNo) {
		super();
		this.roomNo = roomNo;
		this.roomType = roomType;
		this.roomPrice = roomPrice;
		this.limitPeople = limitPeople;
		this.hotelNo = hotelNo;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public int getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}

	public int getLimitPeople() {
		return limitPeople;
	}

	public void setLimitPeople(int limitPeople) {
		this.limitPeople = limitPeople;
	}

	public String getHotelNo() {
		return hotelNo;
	}

	public void setHotelNo(String hotelNo) {
		this.hotelNo = hotelNo;
	}

	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", roomType=" + roomType + ", roomPrice=" + roomPrice + ", limitPeople="
				+ limitPeople + ", hotelNo=" + hotelNo + "]";
	}
	
	
}
