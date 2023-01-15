package com.sh.airbnb.board.model.dto;

import java.sql.Date;

public class BoardComment {
	
	private int commemtNo; // 댓글번호
	private String content; // 댓글내용
	private Date regDate; // 댓글날짜
	private int commentLevel; //
	private int boardNo; // 게시판번호
	private String userId; // 유저아이디
	
	public BoardComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardComment(int commemtNo, String content, Date regDate, int commentLevel, int boardNo, String userId) {
		super();
		this.commemtNo = commemtNo;
		this.content = content;
		this.regDate = regDate;
		this.commentLevel = commentLevel;
		this.boardNo = boardNo;
		this.userId = userId;
	}

	public int getCommemtNo() {
		return commemtNo;
	}

	public void setCommemtNo(int commemtNo) {
		this.commemtNo = commemtNo;
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

	public int getCommentLevel() {
		return commentLevel;
	}

	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "BoardComment [commemtNo=" + commemtNo + ", content=" + content + ", regDate=" + regDate
				+ ", commentLevel=" + commentLevel + ", boardNo=" + boardNo + ", userId=" + userId + "]";
	}
	
	
	
	
	

}
