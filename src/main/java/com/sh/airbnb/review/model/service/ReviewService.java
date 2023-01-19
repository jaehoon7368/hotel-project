package com.sh.airbnb.review.model.service;

import static com.sh.airbnb.common.JdbcTemplate.*;
import java.sql.Connection;
import java.util.List;

import com.sh.airbnb.review.model.dao.ReviewDao;
import com.sh.airbnb.review.model.dto.Review;

public class ReviewService {
	
	private ReviewDao reviewDao = new ReviewDao();

	public int insertHotelReviewComment(Review review) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = reviewDao.insertHotelReviewComment(conn,review);
			commit(conn);
		}catch(Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}
		return result;
	}

	public List<Review> selectAllReview(String hotelNo) {
		Connection conn = getConnection();
		List<Review> reviewList = reviewDao.selectAllReview(conn,hotelNo);
		close(conn);
		return reviewList;
	}

}
