package com.sh.airbnb.hotel.model.dto;

import java.util.ArrayList;
import java.util.List;

public class Hotel extends HotelEntity {
	private int price;
	private String renamedFilename;
	private List<HotelImage> hotelImages =new ArrayList<>();
	
	
	public Hotel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Hotel(String hotelNo, String hotelName, String hotelAddress, HotelType hotelType, String hotelInfo,
			String userId, int price, String renamedFilename) {
		super(hotelNo, hotelName, hotelAddress, hotelType, hotelInfo, userId);
		this.price = price;
		this.renamedFilename = renamedFilename;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getRenamedFilename() {
		return renamedFilename;
	}

	public void setRenamedFilename(String renamedFilename) {
		this.renamedFilename = renamedFilename;
	}

	@Override
	public String toString() {
		return "Hotel [price=" + price + ", renamedFilename=" + renamedFilename + ", toString()=" + super.toString()
				+ "]";
	}
	public void addHotelImage(HotelImage hotelImage) {
		this.hotelImages.add(hotelImage);
	}

	public List<HotelImage> getHotelImages() {
		return hotelImages;
	}

	
	
	
}
