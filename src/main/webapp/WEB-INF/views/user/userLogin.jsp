<%@page import="com.sh.airbnb.user.model.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    
<body>

 <!-- 로그인폼 시작 -->
 			<div class="login-container">
 			<% if(loginUser == null) { %>
				<form 
					id="loginFrm" 
					name="loginFrm"
					action="<%= request.getContextPath() %>/user/userLogin" 
					method="POST">
					<table>
						<tr>
							<td><input type="text" name="userId" id="userId" placeholder="아이디" tabindex="1" value="<%= saveId != null ? saveId : "" %>" required></td>
							<td><input type="submit" value="로그인" tabindex="3"></td>
						</tr>
						<tr>
							<td><input type="password" name="password" id="password" placeholder="비밀번호" tabindex="2" required></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="checkbox" name="saveId" id="saveId" <%= saveId != null ? "checked" : "" %>/>
								<label for="saveId">아이디저장</label>&nbsp;&nbsp;
							</td>
						</tr>
					</table>
				</form>
				
					<% } else { %>
				<table id="login">
					<tr>
						<td>
							<%= loginUser.getUserName() %>님, 안녕하세요😁
							<span id="notification"></span>
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" value="로그아웃" onclick="location.href = '<%= request.getContextPath() %>/user/logout';"/>
						</td>
					</tr>
				</table>
			
			<% } %>
			</div>
				<!-- 로그인폼 끝-->
</body>

				

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
