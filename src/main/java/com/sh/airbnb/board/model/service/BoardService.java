package com.sh.airbnb.board.model.service;

import static com.sh.airbnb.common.JdbcTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.sh.airbnb.board.model.dao.BoardDao;
import com.sh.airbnb.board.model.dto.InquiyBoard;
import com.sh.airbnb.board.model.dto.NoticeBoard;

public class BoardService {
	
	private BoardDao boardDao = new BoardDao();

	

	public int insertInquiy(InquiyBoard inquiyBoard) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = boardDao.insertInquiy(conn, inquiyBoard);
			
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}



	public List<NoticeBoard> selectNoticeList() {
		Connection conn = getConnection();
		List<NoticeBoard> noticeBoardList = boardDao.selectNoticeList(conn);
		close(conn);
		return noticeBoardList;
	}



	public int insertNoticeBoardEnroll(NoticeBoard noticeBoard) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = boardDao.insertNoticeBoardEnroll(conn, noticeBoard);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}



	public List<InquiyBoard> selectInquiyBoardList() {
		Connection conn = getConnection();
		List<InquiyBoard> inquiyBoardList = boardDao.selectInquiyBoardList(conn);
		close(conn);
		return inquiyBoardList;
	}



	public int deleteNoticeBoard(int noticeNo) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = boardDao.deleteNoticeBoard(conn, noticeNo);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

}
