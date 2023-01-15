package com.sh.airbnb.room.model.dto;

import java.sql.Date;

public class RoomImage {
	private int no;
	private String originalFilename;
	private String renamedFilename;
	private Date enrollDate;
	private String roomNo;
	
	public RoomImage() {}

	public RoomImage(int no, String originalFilename, String renamedFilename, Date enrollDate, String roomNo) {
		super();
		this.no = no;
		this.originalFilename = originalFilename;
		this.renamedFilename = renamedFilename;
		this.enrollDate = enrollDate;
		this.roomNo = roomNo;
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

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	@Override
	public String toString() {
		return "RoomImage [no=" + no + ", originalFilename=" + originalFilename + ", renamedFilename=" + renamedFilename
				+ ", enrollDate=" + enrollDate + ", roomNo=" + roomNo + "]";
	}

	
}
