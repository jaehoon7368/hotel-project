package com.sh.airbnb.board.model.dto;

public class FaqBoard {
	
	private int faqNo;
	private String category;
	private String title;
	private String content;
	private String writer;
	
	public FaqBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FaqBoard(int faqNo, String category, String title, String content, String writer) {
		super();
		this.faqNo = faqNo;
		this.category = category;
		this.title = title;
		this.content = content;
		this.writer = writer;
	}
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	@Override
	public String toString() {
		return "FAQBoard [faqNo=" + faqNo + ", category=" + category + ", title=" + title + ", content=" + content
				+ ", writer=" + writer + "]";
	}
	
	
	
	
	

}
