package com.sh.airbnb.board.model.dto;

import java.sql.Date;

public class InquiyComment {
	
	private int inquiyCommentNo;
	private Date regDate;
	private String content;
	private int inquiyNo;
	private String writer;
	
	public InquiyComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public InquiyComment(int inquiyCommentNo, Date regDate, String content, int inquiyNo, String writer) {
		super();
		this.inquiyCommentNo = inquiyCommentNo;
		this.regDate = regDate;
		this.content = content;
		this.inquiyNo = inquiyNo;
		this.writer = writer;
	}
	public int getInquiyCommentNo() {
		return inquiyCommentNo;
	}
	public void setInquiyCommentNo(int inquiyCommentNo) {
		this.inquiyCommentNo = inquiyCommentNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getInquiyNo() {
		return inquiyNo;
	}
	public void setInquiyNo(int inquiyNo) {
		this.inquiyNo = inquiyNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	@Override
	public String toString() {
		return "InquiyComment [inquiyCommentNo=" + inquiyCommentNo + ", regDate=" + regDate + ", content=" + content
				+ ", inquiyNo=" + inquiyNo + ", writer=" + writer + "]";
	}
	
	
}
