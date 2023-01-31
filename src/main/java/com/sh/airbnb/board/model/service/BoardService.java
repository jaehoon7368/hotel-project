package com.sh.airbnb.board.model.service;

import static com.sh.airbnb.common.JdbcTemplate.close;
import static com.sh.airbnb.common.JdbcTemplate.commit;
import static com.sh.airbnb.common.JdbcTemplate.getConnection;
import static com.sh.airbnb.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sh.airbnb.board.model.dao.BoardDao;
import com.sh.airbnb.board.model.dto.FaqBoard;
import com.sh.airbnb.board.model.dto.InquiyBoard;
import com.sh.airbnb.board.model.dto.InquiyBoardComment;
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

	public List<NoticeBoard> selectNoticeList(Map<String, Object> param) {
		Connection conn = getConnection();
		List<NoticeBoard> noticeBoardList = boardDao.selectNoticeList(conn, param);
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


	public List<InquiyBoard> selectInquiyBoardList(String userId) {
		Connection conn = getConnection();
		List<InquiyBoard> inquiyBoardList = new ArrayList<>();
		try {
			inquiyBoardList = boardDao.selectInquiyBoardList(conn, userId);

		if(!inquiyBoardList.isEmpty()) {
			
			for(InquiyBoard board : inquiyBoardList) {
				board.setListComment(boardDao.selectComment(board.getInquiyNo(),conn));
			}
			
		}
		close(conn);
		}catch(Exception e) {
			throw e;
		}
		
		
		
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

	public int deleteInquiyBoard(int inquiyNo) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = boardDao.deleteInquiyBoard(conn, inquiyNo);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int updateNoticeBoard(NoticeBoard noticeBoard) {
		Connection conn = getConnection();
		int result = 0;
		
		try {
			result = boardDao.updateNoticeBoard(conn, noticeBoard);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public NoticeBoard selectOneNoticeBoard(int noticeNo) {
		Connection conn = getConnection();
		NoticeBoard noticeBoard = boardDao.selectOneNoticeBoard(conn, noticeNo);
		close(conn);
		return noticeBoard;
	}

	public InquiyBoard selectOneInquiyBoard(int inquiyNo) {
		Connection conn = getConnection();
		InquiyBoard inquiyBoard = boardDao.selectOneInquiyBoard(conn, inquiyNo);
		close(conn);
		return inquiyBoard;
	}

	public int updateInquiyBoard(InquiyBoard inquiyBoard) {
		Connection conn = getConnection();
		int result = 0;
		
		try {
			result = boardDao.updateInquiyBoard(conn, inquiyBoard);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int selectTotalCount() {
		Connection conn = getConnection();
		int totalCount = boardDao.selectTotalCount(conn);
		close(conn);
		return totalCount;
	}

	public int insertInquiyComment(InquiyBoardComment inquiyBoardComment) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = boardDao.insertInquiyComment(conn, inquiyBoardComment);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public List<FaqBoard> selectFaqBoardList() {
		Connection conn = getConnection();
		List<FaqBoard> faqBoardList = boardDao.selectFaqBoardList(conn);
		close(conn);
		return faqBoardList;
	}

	public int insertFaqBoard(FaqBoard faqBoard) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = boardDao.insertFaqBoard(conn, faqBoard);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}



	public int deleteFaqBoard(int faqNo) {
		Connection conn = getConnection();
		int result = 0;
		
		try {
			result = boardDao.deleteFaqBoard(conn, faqNo);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public FaqBoard selectOneFaqBoard(int faqNo) {
		Connection conn = getConnection();
		FaqBoard faqBoard = boardDao.selectOneFaqBoard(conn, faqNo);
		close(conn);
		return faqBoard;
	}

	public int updateFaqBoard(FaqBoard faqBoard) {
		Connection conn = getConnection();
		int result = 0;
		
		try {
			result = boardDao.updateFaqBoard(conn, faqBoard);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	

	public List<FaqBoard> selectFaqBoardMenu(String category) {
		Connection conn = getConnection();
		List<FaqBoard> faqBoardMenu = boardDao.selectFaqBoardMenu(conn, category); 
		close(conn);
		return faqBoardMenu;
	}

	public NoticeBoard selectNoticeBoard() {
		Connection conn = getConnection();
		NoticeBoard noticeBoard = boardDao.selectNoticeBoard(conn);
		close(conn);
		return noticeBoard;
	}

	public List<InquiyBoardComment> selectInquiyBoardCommentList() {
		Connection conn = getConnection();
		List<InquiyBoardComment> inquiyBoardCommentList = boardDao.selectInquiyBoardCommentList(conn);
		close(conn);
		return inquiyBoardCommentList;
	}

	

	

	

}
