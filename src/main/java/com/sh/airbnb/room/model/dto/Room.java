package com.sh.airbnb.room.model.dto;

public class Room extends RoomEntity{
	
	private String renamedFilename;

	public Room() {}

	public Room(String roomNo, String roomType, int roomPrice, int limitPeople, String hotelNo,
			String renamedFilename, String roomInfo) {
		super(roomNo, roomType, roomPrice, limitPeople, hotelNo, roomInfo);
		this.renamedFilename = renamedFilename;
	}

	public String getRenamedFilename() {
		return renamedFilename;
	}

	public void setRenamedFilename(String renamedFilename) {
		this.renamedFilename = renamedFilename;
	}

	@Override
	public String toString() {
		return "Room [renamedFilename=" + renamedFilename + ", toString()=" + super.toString() + "]";
	}
		
	
}
