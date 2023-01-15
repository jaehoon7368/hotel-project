package com.sh.airbnb.board.model.dto;

import java.sql.Date;

public class Board {
	
	private int boardNo;
	private String title;
	private String content;
	private Category caterory; // 카테고리 유형 선택 
	private InquiryType type;    // 문의유형 선택.
	private String phone;
	private String email;
	private Date regDate;
	private String userId;
	
	
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Board(int boardNo, String title, String content, Category caterory, InquiryType type, String phone,
			String email, Date regDate, String userId) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.caterory = caterory;
		this.type = type;
		this.phone = phone;
		this.email = email;
		this.regDate = regDate;
		this.userId = userId;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Category getCaterory() {
		return caterory;
	}


	public void setCaterory(Category caterory) {
		this.caterory = caterory;
	}


	public InquiryType getType() {
		return type;
	}


	public void setType(InquiryType type) {
		this.type = type;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", caterory=" + caterory
				+ ", type=" + type + ", phone=" + phone + ", email=" + email + ", regDate=" + regDate + ", userId="
				+ userId + "]";
	}
	
	
	
	
	
	
	
	
	

}
