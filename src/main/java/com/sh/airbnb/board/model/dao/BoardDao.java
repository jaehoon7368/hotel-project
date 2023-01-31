package com.sh.airbnb.board.model.dao;

import static com.sh.airbnb.common.JdbcTemplate.close;
import static com.sh.airbnb.common.JdbcTemplate.getConnection;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.sh.airbnb.board.model.dto.FaqBoard;
import com.sh.airbnb.board.model.dto.InquiyBoard;
import com.sh.airbnb.board.model.dto.InquiyBoardComment;
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
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, inquiyBoard.getProductType());
			pstmt.setString(2, inquiyBoard.getInquiyType());
			pstmt.setString(3, inquiyBoard.getPhone());
			pstmt.setString(4, inquiyBoard.getEmail());
			pstmt.setString(5, inquiyBoard.getContent());
			pstmt.setString(6, inquiyBoard.getWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			throw new BoardException("문의작성 오류", e);
		}
		return result;
	}

	

	public List<NoticeBoard> selectNoticeList(Connection conn, Map<String, Object> param) {
		String sql = prop.getProperty("selectNoticeList");
		List<NoticeBoard> noticeBoardList = new ArrayList<>();
		
		int page = (int) param.get("page"); 
		int limit = (int) param.get("limit");
		
		int start = (page - 1) * limit + 1;
		int end = page * limit;
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			try (ResultSet rs = pstmt.executeQuery()){
				
				while (rs.next()) {
					NoticeBoard noticeBoard = handNoticeBoardResultSet(rs);
					noticeBoardList.add(noticeBoard);
				}
			}
		} catch (SQLException e) {
			throw new BoardException("공시사항 목록 조회 오류", e);
		}
		return noticeBoardList;
	}
	
	public int selectTotalCount(Connection conn) {
		String sql = prop.getProperty("selectTotalCount");
		int totalCount = 0;
		
		try (
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rset = pstmt.executeQuery();
		){
			if(rset.next()) {
				totalCount = rset.getInt(1);
			}
		} catch (Exception e) {
			throw new BoardException("전체 게시글수 조회 오류!", e);
		}
		return totalCount;
	}


	private NoticeBoard handNoticeBoardResultSet(ResultSet rs) throws SQLException {
		NoticeBoard noticeBoard = new NoticeBoard();
		noticeBoard.setNoticeNo(rs.getInt("notice_no"));
		noticeBoard.setTitle(rs.getString("title"));
		noticeBoard.setRegDate(rs.getDate("reg_date"));
		noticeBoard.setContent(rs.getString("content"));
		noticeBoard.setWriter(rs.getString("writer"));
		return noticeBoard;
	}


	public int insertNoticeBoardEnroll(Connection conn, NoticeBoard noticeBoard) {
		// insert into notice_board (notice_no, title, reg_date, content, writer) values (seq_notice_board.nextval, ?, default, ?, ?)
		String sql = prop.getProperty("insertNoticeBoardEnroll");
		int result = 0;
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


	
	public List<InquiyBoard> selectInquiyBoardList(Connection conn, String userId) {
		String sql = prop.getProperty("selectInquiyBoardList");
		List<InquiyBoard> inquiyBoardList = new ArrayList<>();
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, userId); 
			try (ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					InquiyBoard inquiyBoard = handInquiyBoardResultSet(rs);
					inquiyBoardList.add(inquiyBoard);
				}
			}
		} catch (Exception e) {
			throw new BoardException("문의글 목록 조회 오류", e);
		}
		return inquiyBoardList;
	}


	private InquiyBoard handInquiyBoardResultSet(ResultSet rs) throws SQLException {
		InquiyBoard inquiyBoard = new InquiyBoard();
		inquiyBoard.setInquiyNo(rs.getInt("inquiy_no"));
		inquiyBoard.setProductType(rs.getString("product_type"));
		inquiyBoard.setInquiyType(rs.getString("inquiy_type"));
		inquiyBoard.setPhone(rs.getString("phone"));
		inquiyBoard.setEmail(rs.getString("email"));
		inquiyBoard.setContent(rs.getString("content"));
		inquiyBoard.setRegDate(rs.getDate("reg_date"));
		inquiyBoard.setWriter(rs.getString("writer"));
		return inquiyBoard;
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


	public int deleteInquiyBoard(Connection conn, int inquiyNo) {
		String sql = prop.getProperty("deleteInquiyBoard");
		// delete from tb_inquiy_board where inquiy_no = ?
		int result = 0;
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, inquiyNo);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			throw new BoardException("문의사항 삭제 오류", e);
		}
		return result;
	}


	public int updateNoticeBoard(Connection conn, NoticeBoard noticeBoard) {
		String sql = prop.getProperty("updateNoticeBoard");
		int result = 0;
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, noticeBoard.getTitle());
			pstmt.setString(2, noticeBoard.getContent());
			pstmt.setString(3, noticeBoard.getWriter());
			pstmt.setInt(4, noticeBoard.getNoticeNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			throw new BoardException("공지사항 수정 오류", e);
		}
		return result;
	}


	public NoticeBoard selectOneNoticeBoard(Connection conn, int noticeNo) {
		String sql = prop.getProperty("selectOneNoticeBoard");
		NoticeBoard noticeBoard = null;
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, noticeNo);
			
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					noticeBoard = handNoticeBoardResultSet(rs);
					
				}
			}
		} catch (Exception e) {
			throw new BoardException("공지사항 조회 오류", e);
		}
		return noticeBoard;
	}


	public InquiyBoard selectOneInquiyBoard(Connection conn, int inquiyNo) {
		String sql = prop.getProperty("selectOneInquiyBoard");
		InquiyBoard inquiyBoard = null;
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, inquiyNo);
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					inquiyBoard = handInquiyBoardResultSet(rs);
				}
			}
		} catch (Exception e) {
			throw new BoardException("문의글 조회 오류", e);
		}
		return inquiyBoard;
	}


	public int updateInquiyBoard(Connection conn, InquiyBoard inquiyBoard) {
		String sql = prop.getProperty("updateInquiyBoard");
		int result = 0;
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, inquiyBoard.getProductType());
			pstmt.setString(2, inquiyBoard.getInquiyType());
			pstmt.setString(3, inquiyBoard.getPhone());
			pstmt.setString(4, inquiyBoard.getEmail());
			pstmt.setString(5, inquiyBoard.getContent());
			pstmt.setString(6, inquiyBoard.getWriter());
			pstmt.setInt(7, inquiyBoard.getInquiyNo());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			throw new BoardException("문의글 수정 오류", e);
		}
		return result;
	}


	public int insertInquiyComment(Connection conn, InquiyBoardComment inquiyBoardComment) {
		String sql = prop.getProperty("insertInquiyComment");
		// insert into tb_inquiy_board_comment (inquiy_comment_no, content, reg_date, inquiy_comment_level, inquiy_no, writer) 
		// 								values (seq_inquiy_comment.nextval,?,default,?,?,?)
	
		int result = 0;
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, inquiyBoardComment.getContent());
			pstmt.setInt(2, inquiyBoardComment.getInquiyCommentLevel());
			pstmt.setInt(3, inquiyBoardComment.getInquiyNo());
			pstmt.setString(4, inquiyBoardComment.getWriter());
			
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			throw new BoardException("문의답변 오류", e);
		}
		
		return result;
	}


	public List<FaqBoard> selectFaqBoardList(Connection conn) {
		String sql = prop.getProperty("selectFaqBoardList");
		List<FaqBoard> faqBoardList = new ArrayList<>();
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					FaqBoard faqBoard = handFaqBoardResultSet(rs);
					faqBoardList.add(faqBoard);
				}
			}
		} catch (Exception e) {
			throw new BoardException("FAQ게시판 조회 오류", e);
		}
		return faqBoardList;
	}


	private FaqBoard handFaqBoardResultSet(ResultSet rs) throws SQLException {
		FaqBoard faqBoard = new FaqBoard();
		faqBoard.setFaqNo(rs.getInt("faq_no"));
		faqBoard.setCategory(rs.getString("category"));
		faqBoard.setTitle(rs.getString("title"));
		faqBoard.setContent(rs.getString("content"));
		faqBoard.setWriter(rs.getString("writer"));
		return faqBoard;
	}


	public int insertFaqBoard(Connection conn, FaqBoard faqBoard) {
		String sql = prop.getProperty("insertFaqBoard");
		// insert into tb_faq_board values (seq_faq_board.nextval, ?, ?, ?, ?)
		int result = 0;
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, faqBoard.getCategory());
			pstmt.setString(2, faqBoard.getTitle());
			pstmt.setString(3, faqBoard.getContent());
			pstmt.setString(4, faqBoard.getWriter());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new BoardException("FAQ게시판 등록 오류", e);
		}
		return result;
	}


	public int deleteFaqBoard(Connection conn, int faqNo) {
		// delete from tb_faq_board where faq_no = ?
		String sql = prop.getProperty("deleteFaqBoard");
		int result = 0;
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, faqNo);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			throw new BoardException("FAQ게시판 삭제 오류", e);
		} 
		return result;
	}


	public FaqBoard selectOneFaqBoard(Connection conn, int faqNo) {
		String sql = prop.getProperty("selectOneFaqBoard");
		FaqBoard faqBoard = null;
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, faqNo);
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					faqBoard = handFaqBoardResultSet(rs);
				}
			}
		} catch (Exception e) {
			throw new BoardException("FAQ게시판 조회 오류", e);
		}
		return faqBoard;
	}


	public int updateFaqBoard(Connection conn, FaqBoard faqBoard) {
		// update tb_faq_board set category = ?, title = ?, content = ?, writer = ? where faq_no = ?
		String sql = prop.getProperty("updateFaqBoard");
		int result = 0;
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, faqBoard.getCategory());
			pstmt.setString(2, faqBoard.getTitle());
			pstmt.setString(3, faqBoard.getContent());
			pstmt.setString(4, faqBoard.getWriter());
			pstmt.setInt(5, faqBoard.getFaqNo());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new BoardException("FAQ게시판 수정 오류", e);
		}
		return result;
	}


	public List<FaqBoard> selectFaqBoardMenu(Connection conn, String category) {
		String sql = prop.getProperty("selectFaqBoardMenu");
		List<FaqBoard> faqBoardMenu = new ArrayList<>();
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, category);
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					FaqBoard faqBoard = handFaqBoardResultSet(rs);
					faqBoardMenu.add(faqBoard);
				}
			}
		} catch (Exception e) {
			throw new BoardException("FAQ 목록조회 오류", e);
		}
		return faqBoardMenu;
	}


	public NoticeBoard selectNoticeBoard(Connection conn) {
		String sql = prop.getProperty("selectNoticeBoard");
		// select * from tb_notice_board order by notice_no desc
		NoticeBoard noticeBoard = null;
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					 noticeBoard = handNoticeBoardResultSet(rs);
				}
			}
		} catch (Exception e) {
			throw new BoardException("공지사항 목록 조회 오류", e); 
		}
		return noticeBoard;
	}


	public List<InquiyBoardComment> selectInquiyBoardCommentList(Connection conn) {
		String sql = prop.getProperty("selectInquiyBoardCommentList");
		//
		List<InquiyBoardComment> inquiyBoardCommentList = new ArrayList<>();
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					InquiyBoardComment inquiyBoardComment = new InquiyBoardComment();
					inquiyBoardComment.setInquiyCommentNo(rs.getInt("inquiy_comment_no"));
					inquiyBoardComment.setContent(rs.getString("content"));
					inquiyBoardComment.setRegDate(rs.getDate("reg_date"));
					inquiyBoardComment.setInquiyCommentLevel(rs.getInt("inquiy_comment_level"));
					inquiyBoardComment.setInquiyNo(rs.getInt("inquiy_no"));
					inquiyBoardComment.setWriter(rs.getString("writer"));
					inquiyBoardCommentList.add(inquiyBoardComment);
				}
			}
		} catch (Exception e) {
			throw new BoardException("문의답변 조회 오류", e);
		}
		return inquiyBoardCommentList;
	}


	public List<InquiyBoardComment> selectComment(int inquiyNo, Connection conn) {
		String sql = prop.getProperty("selectComment");
		// select * from tb_inquiy_board_comment where inquiy_no = ? 
		System.out.println("sql문확인 "+sql);
		List<InquiyBoardComment> inquiyBoardCommentList = new ArrayList<>();
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, inquiyNo);
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					InquiyBoardComment inquiyBoardComment = new InquiyBoardComment();
					inquiyBoardComment.setInquiyCommentNo(rs.getInt("inquiy_comment_no"));
					inquiyBoardComment.setContent(rs.getString("content"));
					inquiyBoardComment.setRegDate(rs.getDate("reg_date"));
					inquiyBoardComment.setInquiyCommentLevel(rs.getInt("inquiy_comment_level"));
					inquiyBoardComment.setWriter(rs.getString("writer"));
					inquiyBoardCommentList.add(inquiyBoardComment);
				}
			}
		} catch (Exception e) {
			throw new BoardException("문의답변 조회 오류", e);
		}
		return inquiyBoardCommentList;
	}


	


	


	


	

}
