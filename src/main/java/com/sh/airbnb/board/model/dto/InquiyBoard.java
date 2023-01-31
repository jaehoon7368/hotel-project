package com.sh.airbnb.board.model.dto;

import java.sql.Date;
import java.util.List;

public class InquiyBoard {
	
	private int inquiyNo;
	private String productType;
	private String inquiyType;
	private String phone;
	private String email;
	private String content;
	private Date regDate;
	private String writer;
	private List<InquiyBoardComment> ListComment ;
	
	
	
	
	public InquiyBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public InquiyBoard(int inquiyNo, String productType, String inquiyType, String phone, String email, String content,
			Date regDate, String writer, List<InquiyBoardComment> listComment) {
		super();
		this.inquiyNo = inquiyNo;
		this.productType = productType;
		this.inquiyType = inquiyType;
		this.phone = phone;
		this.email = email;
		this.content = content;
		this.regDate = regDate;
		this.writer = writer;
		ListComment = listComment;
	}


	public int getInquiyNo() {
		return inquiyNo;
	}
	public void setInquiyNo(int inquiyNo) {
		this.inquiyNo = inquiyNo;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public String getInquiyType() {
		return inquiyType;
	}
	public void setInquiyType(String inquiyType) {
		this.inquiyType = inquiyType;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public List<InquiyBoardComment> getListComment() {
		return ListComment;
	}
	public void setListComment(List<InquiyBoardComment> listComment) {
		ListComment = listComment;
	}


	@Override
	public String toString() {
		return "InquiyBoard [inquiyNo=" + inquiyNo + ", productType=" + productType + ", inquiyType=" + inquiyType
				+ ", phone=" + phone + ", email=" + email + ", content=" + content + ", regDate=" + regDate
				+ ", writer=" + writer + ", ListComment=" + ListComment + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
