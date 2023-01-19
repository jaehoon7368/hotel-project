package com.sh.airbnb.review.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.sh.airbnb.review.model.dto.Review;
import com.sh.airbnb.review.model.exception.ReviewException;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao(){
		String path = ReviewDao.class.getResource("/sql/review/review-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("ReviewDao 쿼리 로드 완료! - " + prop);
	}

	public int insertHotelReviewComment(Connection conn, Review review) {
		String sql = prop.getProperty("insertHotelReviewComment");
		int result = 0;
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, review.getCommentLevel());
			pstmt.setString(2, review.getContent());
			pstmt.setObject(3, review.getCommentRef() == 0 ? null : review.getCommentRef()); // 0
			pstmt.setString(4, review.getHotelNo());
			pstmt.setString(5, review.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new ReviewException("호텔 리뷰 등록 오류!",e);
		}
		
		return result;
	}

	public List<Review> selectAllReview(Connection conn, String hotelNo) {
		String sql = prop.getProperty("selectAllReview");
		List<Review> reviewList = new ArrayList<>();
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, hotelNo);
			
			try(ResultSet rset = pstmt.executeQuery()){
				while(rset.next()) {
					Review review = new Review();
					review.setCommentNo(rset.getInt("comment_no"));
					review.setCommentLevel(rset.getInt("comment_level"));
					review.setContent(rset.getString("content"));
					review.setRegDate(rset.getDate("reg_date"));
					review.setHotelNo(rset.getString("hotel_no"));
					review.setUserId(rset.getString("user_id"));
					review.setCommentRef(rset.getInt("comment_ref"));
					reviewList.add(review);
				}
			}
		} catch (SQLException e) {
			throw new ReviewException("호텔 리뷰 가져오기 오류!",e);
		}
		
		return reviewList;
	}

}
