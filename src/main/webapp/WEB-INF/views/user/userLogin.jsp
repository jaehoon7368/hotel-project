<%@page import="com.sh.airbnb.user.model.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/user/login.css" />
    

<body>
 <!-- 로그인폼 시작 -->
				<div class="wrapper">
			      <div class="box">
				      <div class="center">
				          <h1>로그인</h1>
				          <br>
				          <form id="loginFrm" 
								name="loginFrm"
								action="<%= request.getContextPath() %>/user/userLogin" 
								method="POST">
				            <div class="txt_field">
				              <input type="text" name="userId" id="userId" tabindex="1" value="<%= saveId != null ? saveId : "" %>" required>
				              <span></span>
				              <label>ID</label>
				            </div>
				            <br>
				            <div class="txt_field">
				              <input type="password" name="password" id="password" tabindex="2" required>
				              <span></span>
				              <label>Password</label>
				            </div>
				            <br><br>
				            <tr>
							<td colspan="2">
								<input type="checkbox" name="saveId" id="saveId" <%= saveId != null ? "checked" : "" %>/>
								<label for="saveId">아이디저장</label>&nbsp;&nbsp;
							</td>
							</tr>
							<br><br>		
				            <input type="submit" value="Login" tabindex="3">
				         
			          </form>
			        </div>
			      </div>
			    </div>
				<!-- 로그인폼 끝-->
</body>

<script>
window.addEventListener('load', () => {
<% if (loginUser == null) { %>
document.loginFrm.addEventListener('submit', (e) => {
	const userId = document.querySelector("#userId");
	const password = document.querySelector("#password");
	
	if(!/^\w{4,}$/.test(userId.value)){
		alert("유효한 아이디를 입력하세요.");
		userId.select();
		e.preventDefault(); // 폼제출방지
		return; // 조기리턴
	}
	
	if(!/^\w{4,}$/.test(password.value)){
		alert("유효한 비밀번호를 입력하세요");
		password.select();
		e.preventDefault();
		return;
		}
	});
});
<% } %>

</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
