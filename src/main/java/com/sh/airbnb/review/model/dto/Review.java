package com.sh.airbnb.review.model.dto;

import java.sql.Date;

public class Review {
	private int commentNo;
	private int commentLevel;
	private String content;
	private int commentRef;
	private Date regDate;
	private String hotelNo;
	private String userId;
	
	public Review() {}

	public Review(int commentNo, int commentLevel, String content, int commentRef, Date regDate, String hotelNo,
			String userId) {
		super();
		this.commentNo = commentNo;
		this.commentLevel = commentLevel;
		this.content = content;
		this.commentRef = commentRef;
		this.regDate = regDate;
		this.hotelNo = hotelNo;
		this.userId = userId;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getCommentLevel() {
		return commentLevel;
	}

	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCommentRef() {
		return commentRef;
	}

	public void setCommentRef(int commentRef) {
		this.commentRef = commentRef;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getHotelNo() {
		return hotelNo;
	}

	public void setHotelNo(String hotelNo) {
		this.hotelNo = hotelNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Review [commentNo=" + commentNo + ", commentLevel=" + commentLevel + ", content=" + content
				+ ", commentRef=" + commentRef + ", regDate=" + regDate + ", hotelNo=" + hotelNo + ", userId=" + userId
				+ "]";
	}
	
		
	
}
