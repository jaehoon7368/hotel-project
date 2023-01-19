package com.sh.airbnb.user.controller;

import static com.sh.airbnb.common.JdbcTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sh.airbnb.common.HelloMvcUtils;
import com.sh.airbnb.user.model.dto.User;

public class PasswordUpdater {

	public static void main(String[] args) {
		new PasswordUpdater().start();
	}

	private void start() {
		// 1. 회원아이디 조회 및 신규비번 설정
		Connection conn = getConnection();
		String sql = "select * from tb_user";
		List<User> list = new ArrayList<>();
		try(
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rset = pstmt.executeQuery()){
			
			while(rset.next()) {
				String userId = rset.getString("user_id");
				String password = HelloMvcUtils.getEncryptedPassword("1234", userId); // 암호화
				
				User user = new User();
				user.setUserId(userId);
				user.setPassword(password);
				
				list.add(user);
			}
			
			for(User user : list)
				System.out.printf("userId : %s, password : %s%n", 
						user.getUserId(), user.getPassword());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 2. 일괄 업데이트
		sql = "update user set password = ? where user_id = ?";
		try(PreparedStatement pstmt = conn.prepareStatement(sql);){
			for(User user : list) {
				pstmt.setString(1, user.getPassword());
				pstmt.setString(2, user.getUserId());
				pstmt.executeUpdate();
				System.out.printf("%s 비밀번호 업데이트 성공!%n", user.getUserId());
			}
			
			commit(conn);
			
		} catch (SQLException e) {
			rollback(conn);
			e.printStackTrace();
		}
		
		close(conn);
		System.out.println("[비밀번호 일괄갱신이 끝났습니다.]");
			
	}
}
