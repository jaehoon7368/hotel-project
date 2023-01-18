package com.sh.airbnb.user.model.service;

import static com.sh.airbnb.common.JdbcTemplate.close;
import static com.sh.airbnb.common.JdbcTemplate.commit;
import static com.sh.airbnb.common.JdbcTemplate.getConnection;
import static com.sh.airbnb.common.JdbcTemplate.rollback;


import java.sql.Connection;

import com.sh.airbnb.user.model.dao.UserDao;
import com.sh.airbnb.user.model.dto.User;



public class UserService {
	
	private UserDao userDao = new UserDao();

	public int insertUser(User user) {
		
			int result = 0;
			// 1. Connection 생성
			Connection conn = getConnection();
			// 2. dao 요청
			try {
				result = userDao.insertUser(conn, user);
				// 3. 트랜잭션 처리
				commit(conn);
			} catch (Exception e) {
				rollback(conn);
				throw e;
			} finally {
				// 4. 자원반납
				close(conn);
			}		
			return result;
		}

	public User selectOneUser(String userId) {
		
	
		// 1. Connection 생성
				Connection conn = getConnection();
				// 2. dao요청 (Connection 전달)
				User member = userDao.selectOneUser(conn, userId);
				// 3. 반환
				close(conn);
				return member;

	}
}
