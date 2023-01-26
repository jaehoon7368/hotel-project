package com.sh.airbnb.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.sh.airbnb.board.model.dto.InquiyBoard;
import com.sh.airbnb.board.model.dto.NoticeBoard;
import com.sh.airbnb.board.model.exception.BoardException;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		String path = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("BoardDao 쿼리 로드 완료! - " + prop);
	}
	

	

	public int insertInquiy(Connection conn, InquiyBoard inquiyBoard) {
		String sql = prop.getProperty("insertInquiy");
		int result = 0;
//		System.out.println(prop);
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, inquiyBoard.getProductType());
			pstmt.setString(2, inquiyBoard.getInquiyType());
			pstmt.setString(3, inquiyBoard.getPhone());
			pstmt.setString(4, inquiyBoard.getEmail());
			pstmt.setString(5, inquiyBoard.getContent());
			pstmt.setString(6, inquiyBoard.getWriter());
//			pstmt.setDate(6, inquiyBoard.getRegDate());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			throw new BoardException("문의작성 오류", e);
		}
		return result;
	}



	public List<NoticeBoard> selectNoticeList(Connection conn) {
		String sql = prop.getProperty("selectNoticeList");
		List<NoticeBoard> noticeBoardList = new ArrayList<>();
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			try (ResultSet rs = pstmt.executeQuery()){
				
				while (rs.next()) {
					NoticeBoard noticeBoard = new NoticeBoard();
					noticeBoard.setNoticeNo(rs.getInt("notice_no"));
					noticeBoard.setTitle(rs.getString("title"));
					noticeBoard.setRegDate(rs.getDate("reg_date"));
					noticeBoard.setContent(rs.getString("content"));
					noticeBoard.setWriter(rs.getString("writer"));
					noticeBoardList.add(noticeBoard);
					
				}
			}
		} catch (SQLException e) {
			throw new BoardException("공시사항 조회 오류", e);
		}
		return noticeBoardList;
	}


	public int insertNoticeBoardEnroll(Connection conn, NoticeBoard noticeBoard) {
		// insert into notice_board (notice_no, title, reg_date, content, writer) values (seq_notice_board.nextval, ?, default, ?, ?)
		String sql = prop.getProperty("insertNoticeBoardEnroll");
		int result = 0;
//		System.out.println("sql = " + sql + "result = " + result);
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, noticeBoard.getTitle());
			pstmt.setString(2, noticeBoard.getContent());
			pstmt.setString(3, noticeBoard.getWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new BoardException("공지사항 작성 오류", e);
		}
		return result;
	}




	public List<InquiyBoard> selectInquiyBoardList(Connection conn) {
		String sql = prop.getProperty("selectInquiyBoardList");
		List<InquiyBoard> inquiyBoardList = new ArrayList<>();
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			try (ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					InquiyBoard inquiyBoard = new InquiyBoard();
					inquiyBoard.setInquiyNo(rs.getInt("inquiy_no"));
					inquiyBoard.setProductType(rs.getString("product_type"));
					inquiyBoard.setInquiyType(rs.getString("inquiy_type"));
					inquiyBoard.setPhone(rs.getString("phone"));
					inquiyBoard.setEmail(rs.getString("email"));
					inquiyBoard.setContent(rs.getString("content"));
					inquiyBoard.setRegDate(rs.getDate("reg_date"));
					inquiyBoard.setWriter(rs.getString("writer"));
					inquiyBoardList.add(inquiyBoard);
				}
				
			}
		} catch (Exception e) {
			throw new BoardException("문의글 조회 오류", e);
			
		}
		return inquiyBoardList;
	}




	public int deleteNoticeBoard(Connection conn, int noticeNo) {
		String sql = prop.getProperty("deleteNoticeBoard");
		// delete from tb_notice_board where notice_no = ?
		int result = 0;
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new BoardException("공지사항 삭제 오류", e);
		}
		return result;
	}

}
