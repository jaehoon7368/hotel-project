package com.sh.airbnb.user.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
		
		return user;
	}
}
