package com.sh.airbnb.hotel.model.dto;

public class HotelCategory {
	private String CategoryNo;
	private String HotelNo;
	private String userId;
	
	public HotelCategory() {}

	public HotelCategory(String categoryNo, String hotelNo, String userId) {
		super();
		CategoryNo = categoryNo;
		HotelNo = hotelNo;
		this.userId = userId;
	}

	public String getCategoryNo() {
		return CategoryNo;
	}

	public void setCategoryNo(String categoryNo) {
		CategoryNo = categoryNo;
	}

	public String getHotelNo() {
		return HotelNo;
	}

	public void setHotelNo(String hotelNo) {
		HotelNo = hotelNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "HotelCategory [CategoryNo=" + CategoryNo + ", HotelNo=" + HotelNo + ", userId=" + userId + "]";
	}
	
	
	
	
}
