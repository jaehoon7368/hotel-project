package com.sh.airbnb.board.model.dto;

import java.sql.Date;

public class NoticeBoard {
	
	private int noticeNo;
	private String title;
	private Date regDate;
	private String content;
	private String writer;
	
	
	public NoticeBoard() {
		super();
		// TODO Auto-generated constructor stub
	}


	public NoticeBoard(int noticeNo, String title, Date regDate, String content, String writer) {
		super();
		this.noticeNo = noticeNo;
		this.title = title;
		this.regDate = regDate;
		this.content = content;
		this.writer = writer;
	}


	public int getNoticeNo() {
		return noticeNo;
	}


	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
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


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	@Override
	public String toString() {
		return "NoticeBoard [noticeNo=" + noticeNo + ", title=" + title + ", regDate=" + regDate + ", content="
				+ content + ", writer=" + writer + "]";
	}
	
	
	
	

}
