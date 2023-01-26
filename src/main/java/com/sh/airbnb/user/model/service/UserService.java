package com.sh.airbnb.user.model.service;

import static com.sh.airbnb.common.JdbcTemplate.close;
import static com.sh.airbnb.common.JdbcTemplate.commit;
import static com.sh.airbnb.common.JdbcTemplate.getConnection;
import static com.sh.airbnb.common.JdbcTemplate.rollback;


import java.sql.Connection;
import java.util.List;
import java.util.Map;

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
				User user = userDao.selectOneUser(conn, userId);
				// 3. 반환
				close(conn);
				return user;

	}

	public int updateUser(User user) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = userDao.updateUser(conn, user);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int deleteUser(String userId) {
		int result = 0;
		// 1. Connection객체 생성
		Connection conn = getConnection();
		try {
			// 2. dao 요청
			result = userDao.deleteUser(conn, userId);
			// 3. 트랜잭션 처리
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e; // controller 통보용
		} finally {
			// 4. Connection객체 반환
			close(conn);
		}
		return result;
	}

	public int updatePassword(User user) {
		Connection conn = getConnection();
		int result = 0;;
		try {
			result = userDao.updatePassword(conn, user);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public List<User> searchUser(Map<String, String> param) {
		Connection conn = getConnection();
		List<User> users = userDao.searchUser(conn, param);
		close(conn);
		return users;
	}

	public int updateUserRole(String userId, String userRole) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = userDao.updateUserRole(conn, userId, userRole);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
	}

	public List<User> selectAllUser(Map<String, Object> param) {
		Connection conn = getConnection();
		List<User> members = userDao.selectAllUser(conn, param);
		close(conn);
		return members;
	}

	public int selectTotalCount() {
		Connection conn = getConnection();
		int totalCount = userDao.selectTotalCount(conn);
		close(conn);
		return totalCount;
	}
}
