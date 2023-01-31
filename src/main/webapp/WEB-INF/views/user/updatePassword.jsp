<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/user/updatePassword.css" />

<body>
	<aside>
		<div class="sidebar">
        <nav class="userView-nav">
          <ul>
            <li class="active"><a href="<%= request.getContextPath() %>/user/userView">개인정보수정</a></li>
            <hr>
            <li><a href="<%= request.getContextPath()%>/user/userCheckRev?user_id=<%=loginUser.getUserId()%>">예약내역확인</a></li>
            <hr>
            <% if((loginUser != null && (loginUser.getUserRole() == UserRole.S || loginUser.getUserRole() == UserRole.A))) { %>
            <li><a href="<%=request.getContextPath()%>/admin/adminhotelenroll">숙소등록하기</a></li>
            <hr/>
            <li><a href="<%=request.getContextPath()%>/admin/adminenrolledhotelview?user_id=<%=loginUser.getUserId() %>">등록숙소확인</a></li>
            <hr>
            <% } %>
            <% if((loginUser != null && loginUser.getUserRole() == UserRole.A)) { %>
            <li><a href="<%= request.getContextPath()%>/user/userList">회원관리</a></li>
            <hr>
            <% } %>
          </ul>
        </nav>
     </div>
	</aside>
	
	

  <div class="enroll-container">
	<h2>비밀번호 변경</h2>
	<form 
		name="passwordUpdateFrm" 
		method="post" >
		<div class=userinfo>
        	<div>
        		<h4>현재 비밀번호</h4>
        		 <td><input type="password" class="input" name="oldPassword" id="oldPassword" required>
        	</div>
        	<div>
        		<h4>새 비밀번호</h4>
        		<input type="password" class="input"  name="newPassword" id="newPassword" required>
        	</div>
			<div>
				<h4>비밀번호 확인</h4>
				<input type="password" class="input"  id="newPasswordCheck" required>
			</div>
		</div>
		<div id="button">
		    <input type="submit" class="button" value="변경하기"/>
		</div>
	</form>
</div> <!-- enroll-container end -->
		
</body>
<script>
const oldPassword = document.querySelector("#oldPassword");
const newPassword = document.querySelector("#newPassword");
const newPasswordCheck = document.querySelector("#newPasswordCheck");
/**
 * 폼제출 유효성검사
 */ 
document.passwordUpdateFrm.onsubmit = function(){
	
	if(!passwordValidate()){
		return false;
	}
	
	if(oldPassword.value == newPassword.value){
		alert("기존비밀번호와 신규비밀번호는 같을 수 없습니다.");
		oldPassword.select();
		return false;
	}
};

document.querySelector("#newPasswordCheck").onblur(passwordValidate);

/**
 * 신규비밀번호 일치 검사 
 */ 
function passwordValidate(){
	if(newPassword.value !== newPasswordCheck.value){
		alert("입력한 비밀번호가 일치하지 않습니다.");
		newPassword.select();
		return false;
	}
	return true;	
}
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>