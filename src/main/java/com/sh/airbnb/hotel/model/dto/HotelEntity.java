package com.sh.airbnb.hotel.model.dto;

public class HotelEntity {
	private String hotelNo;
	private String hotelName;
	private String hotelAddress;
	private HotelType hotelType;
	private String hotelInfo;
	private String userId;
	
	public HotelEntity() {}

	public HotelEntity(String hotelNo, String hotelName, String hotelAddress, HotelType hotelType, String hotelInfo,
			String userId) {
		super();
		this.hotelNo = hotelNo;
		this.hotelName = hotelName;
		this.hotelAddress = hotelAddress;
		this.hotelType = hotelType;
		this.hotelInfo = hotelInfo;
		this.userId = userId;
	}

	public String getHotelNo() {
		return hotelNo;
	}

	public void setHotelNo(String hotelNo) {
		this.hotelNo = hotelNo;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public String getHotelAddress() {
		return hotelAddress;
	}

	public void setHotelAddress(String hotelAddress) {
		this.hotelAddress = hotelAddress;
	}

	public HotelType getHotelType() {
		return hotelType;
	}

	public void setHotelType(HotelType hotelType) {
		this.hotelType = hotelType;
	}

	public String getHotelInfo() {
		return hotelInfo;
	}

	public void setHotelInfo(String hotelInfo) {
		this.hotelInfo = hotelInfo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Hotel [hotelNo=" + hotelNo + ", hotelName=" + hotelName + ", hotelAddress=" + hotelAddress
				+ ", hotelType=" + hotelType + ", hotelInfo=" + hotelInfo + ", userId=" + userId + "]";
	}

	
	
}
