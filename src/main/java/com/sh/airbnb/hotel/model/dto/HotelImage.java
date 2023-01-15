package com.sh.airbnb.hotel.model.dto;

import java.sql.Date;

public class HotelImage {
	private int no;
	private String originalFilename;
	private String renamedFilename;
	private Date enrollDate;
	private String hotelNo;
	
	public HotelImage() {}

	public HotelImage(int no, String originalFilename, String renamedFilename, Date enrollDate, String hotelNo) {
		super();
		this.no = no;
		this.originalFilename = originalFilename;
		this.renamedFilename = renamedFilename;
		this.enrollDate = enrollDate;
		this.hotelNo = hotelNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public String getRenamedFilename() {
		return renamedFilename;
	}

	public void setRenamedFilename(String renamedFilename) {
		this.renamedFilename = renamedFilename;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getHotelNo() {
		return hotelNo;
	}

	public void setHotelNo(String hotelNo) {
		this.hotelNo = hotelNo;
	}

	@Override
	public String toString() {
		return "HotelImage [no=" + no + ", originalFilename=" + originalFilename + ", renamedFilename="
				+ renamedFilename + ", enrollDate=" + enrollDate + ", hotelNo=" + hotelNo + "]";
	}
	

}
