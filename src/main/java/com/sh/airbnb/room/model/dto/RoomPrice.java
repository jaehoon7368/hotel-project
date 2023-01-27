package com.sh.airbnb.room.model.dto;

public class RoomPrice extends RoomEntity {
	private int minPrice;
	private int maxPrice;
	private int avgPrice;
	
	public RoomPrice() {}

	public RoomPrice(String roomNo, String roomType, int roomPrice, int limitPeople, String hotelNo, String roomInfo,
			int minPrice, int maxPrice, int avgPrice) {
		super(roomNo, roomType, roomPrice, limitPeople, hotelNo, roomInfo);
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.avgPrice = avgPrice;
	}

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public int getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}

	public int getAvgPrice() {
		return avgPrice;
	}

	public void setAvgPrice(int avgPrice) {
		this.avgPrice = avgPrice;
	}

	@Override
	public String toString() {
		return "RoomPrice [minPrice=" + minPrice + ", maxPrice=" + maxPrice + ", avgPrice=" + avgPrice + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
	
}
