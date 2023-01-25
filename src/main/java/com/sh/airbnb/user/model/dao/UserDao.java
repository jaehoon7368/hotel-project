package com.sh.airbnb.user.model.dao;

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

import com.sh.airbnb.user.model.dto.User;
import com.sh.airbnb.user.model.dto.UserRole;
import com.sh.airbnb.user.model.dto.UserStatus;
import com.sh.airbnb.user.model.exception.UserException;









public class UserDao {
	
	private Properties prop = new Properties();
	
	public UserDao() {
		String path = UserDao.class.getResource("/sql/user/user-query.properties").getPath();
		
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("[query load 완료!] " + prop);
	}
	
	
	

	public int insertUser(Connection conn, User user) {
		String sql = prop.getProperty("insertUser");
		int result = 0;
		
		// 1. PreparedStatement 생성 및 미완성sql 값대입
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getPhone());
			pstmt.setString(5, user.getEmail());
			pstmt.setString(6, user.getNickName());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new UserException("회원가입오류", e);
		}
		return result;
	}




	public User selectOneUser(Connection conn, String userId) {
		String sql = prop.getProperty("selectOneUser");
		User user = null;
		
		// 1. PreparedStatement 객체 생성 및 미완성쿼리 값대입
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, userId);
			
			// 2. pstmt 실행 및 결과반환
			try(ResultSet rset = pstmt.executeQuery()){
				
				// 3. ResultSet -> dto객체 
				while(rset.next()) {
					user = handleUserResultSet(rset);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return user;
	}

	private User handleUserResultSet(ResultSet rset) throws SQLException {
		
		User user = new User();
		
		user.setUserNo(rset.getInt("user_no"));
		user.setUserId(rset.getString("user_id"));
		user.setPassword(rset.getString("password"));
		user.setUserName(rset.getString("user_name"));
		user.setPhone(rset.getString("phone"));
		user.setUserRole(UserRole.valueOf(rset.getString("user_role")));
		user.setEmail(rset.getString("email"));
		user.setNickName(rset.getString("nick_name"));
		user.setUserStatus(UserStatus.valueOf(rset.getString("user_status")));
		user.setEnrollDate(rset.getTimestamp("enroll_date"));
		
		return user;
	}




	public int updateUser(Connection conn, User user) {
		String sql = prop.getProperty("updateUser");
		int result = 0;
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getNickName());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getPhone());
			pstmt.setString(5,  user.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new UserException("회원정보 수정 오류", e);
		}
		return result;
	}




	public int deleteUser(Connection conn, String userId) {
		int result = 0;
		String sql = prop.getProperty("deleteUser");

		try(PreparedStatement pstmt = conn.prepareStatement(sql);){
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new UserException("회원탈퇴 오류", e);
		}

		return result;
	}




	public int updatePassword(Connection conn, User user) {
		int result = 0;
		String sql = prop.getProperty("updatePassword");

		try (PreparedStatement pstmt = conn.prepareStatement(sql);){
			pstmt.setString(1, user.getPassword());
			pstmt.setString(2, user.getUserId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new UserException("비밀번호 수정 오류!", e);
		}

		return result;
	}




	public List<User> searchUser(Connection conn, Map<String, String> param) {
		List<User> users = new ArrayList<>();
		String searchType = param.get("searchType"); // member_id | member_name | gender
		String searchKeyword = param.get("searchKeyword");
		String sql = prop.getProperty("searchUser"); // select * from member where # like ?
		sql = sql.replace("#", searchType);
		System.out.println(sql);
		
		// 1. PreaparedStatement 객체 생성 & 미완성쿼리 값대입
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, "%" + searchKeyword + "%"); 
			// 2. 실행 & ResultSet 반환
			try(ResultSet rset = pstmt.executeQuery()){				
				// 3. ResultSet -> List<Member>
				while(rset.next())
					users.add(handleUserResultSet(rset));
			}
		} catch (SQLException e) {
			throw new UserException("관리자 회원검색 오류", e);
		}
	
		
		
		return users;
	}




	public int updateUserRole(Connection conn, String userId, String userRole) {
		String sql = prop.getProperty("updateUserRole");
		int result = 0;
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, userRole);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new UserException("관리자 회원권한수정 오류", e);
		}
		
		return result;
	}




	public List<User> selectAllUser(Connection conn, Map<String, Object> param) {
		String sql = prop.getProperty("selectAllUser"); // select * from (select row_number() over(order by enroll_date desc) rnum, m.* from member m) where rnum between ? and ?
		List<User> users = new ArrayList<>();
		int page = (int) param.get("page");
		int limit = (int) param.get("limit");
		int start = (page - 1) * limit + 1; 
		int end = page * limit;
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql);){
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			try(ResultSet rset = pstmt.executeQuery();){
				
				while(rset.next()) {
					User user = handleUserResultSet(rset);
					users.add(user);
				}
			}
			
			
		} catch (SQLException e) {
			throw new UserException("관리자 회원목록조회 오류!", e);
		}
				
		return users;
	}




	public int selectTotalCount(Connection conn) {
		String sql = prop.getProperty("selectTotalCount"); // select count(*) from member
		int totalCount = 0;
		
		try(
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rset = pstmt.executeQuery();	
		){
			while(rset.next())
				totalCount = rset.getInt(1); // 컬럼인덱스
	
		} catch (SQLException e) {
			throw new UserException("전체 사용자수 조회 오류", e);
		}	
		
		return totalCount;
	}
}












