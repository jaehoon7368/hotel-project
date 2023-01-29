package com.sh.airbnb.board.model.dto;

import java.sql.Date;

public class InquiyBoardComment {
	
	private int inquiyCommentNo;
	private String content;
	private Date regDate;
	private int inquiyCommentLevel;
	private int inquiyNo;
	private String writer;
	
	public InquiyBoardComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public InquiyBoardComment(int inquiyCommentNo, String content, Date regDate, int inquiyCommentLevel, int inquiyNo,
			String writer) {
		super();
		this.inquiyCommentNo = inquiyCommentNo;
		this.content = content;
		this.regDate = regDate;
		this.inquiyCommentLevel = inquiyCommentLevel;
		this.inquiyNo = inquiyNo;
		this.writer = writer;
	}

	public int getInquiyCommentNo() {
		return inquiyCommentNo;
	}

	public void setInquiyCommentNo(int inquiyCommentNo) {
		this.inquiyCommentNo = inquiyCommentNo;
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

	public int getInquiyCommentLevel() {
		return inquiyCommentLevel;
	}

	public void setInquiyCommentLevel(int inquiyCommentLevel) {
		this.inquiyCommentLevel = inquiyCommentLevel;
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
		return "InquiyBoardComment [inquiyCommentNo=" + inquiyCommentNo + ", content=" + content + ", regDate="
				+ regDate + ", inquiyCommentLevel=" + inquiyCommentLevel + ", inquiyNo=" + inquiyNo + ", writer="
				+ writer + "]";
	}
	
	
	
	
}
