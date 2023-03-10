<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/user/userView.css" />
<body>
<div class=userView-container>
 	<div class="sidebar">
        <nav class="userView-nav">
          <ul>
            <li class="active"><a href="<%= request.getContextPath() %>/user/userView">개인정보수정</a></li>
            <hr>
            <%if (loginUser.getUserRole() == UserRole.S){ %>
            <li><a href="<%= request.getContextPath()%>/admin/adminCheckRev?user_id=<%=loginUser.getUserId()%>">예약내역확인</a></li>
            <% }else{ %>
            <li><a href="<%= request.getContextPath()%>/user/userCheckRev?user_id=<%=loginUser.getUserId()%>">예약내역확인</a></li>
            <%} %>
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

     <div class="enroll-container">
        <h2>개인 정보</h2>
        
        <form name="userUpdateFrm" method="post" action="<%= request.getContextPath() %>/user/userUpdate">
        <div class=userinfo>
        	<div>
        		<h4>실명</h4>
        		 <input type="text" class="input"  name="userName" id="userName" value="<%= loginUser.getUserName() %>" readonly>
        	</div>
            <div>
            	<h4>아이디</h4>
            	<input  type="text" class="input" name="userId" id="userId" value="<%= loginUser.getUserId() %>" readonly>
            </div>
            <div>
            	<h4>닉네임</h4>
            	 <input type="text" class="input"  name="nickName" id="nickName" value="<%= loginUser.getNickName() %>"  required>
            </div>
            <div>
            	<h4>이메일</h4>
            	<input type="email" class="input" placeholder="abc@xyz.com" name="email" id="email" value="<%= loginUser.getEmail() != null ? loginUser.getEmail() : "" %>">
            </div>
            <div>
            	<h4>휴대폰</h4>
            	<input type="tel" class="input" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" value="<%= loginUser.getPhone() %>" required>
            </div>
         </div> <!-- userinfo end -->
    </div> <!-- enrollcontainer end -->
    
    <div id="button">
    <input type="submit" class="button" value="정보수정"/>
    <input type="button" class="button" value="비밀번호변경" onclick="updatePassword();"/>
    <input type="button" class="button" onclick="deleteUser();" value="회원탈퇴"/>
    </div>
        </form>
  </div> <!-- userviewcontainer end -->
 </body>

<form action="<%= request.getContextPath() %>/user/userDelete" method="POST" name="userDeleteFrm"></form>
<script>
const deleteUser = () => {
	if(confirm('정말 회원탈퇴하시겠습니까?')){
		document.userDeleteFrm.submit();
	}
};

/**
 * 기존비밀번호입력
 * 새비밀번호/비밀번호 확인
 * 
 * 기존비밀번호가 일치하면, 새비밀번호 업데이트
 * 기존비밀번호가 일치하면, 새비밀번호 업데이트 취소
 * 
 * GET /mvc/member/updatePassword 비밀번호 변경폼 요청
 * POST /mvc/member/updatePassword db비밀번호 변경 요청
 * 
 */
const updatePassword = () => {
	location.href = "<%= request.getContextPath() %>/user/updatePassword";
};

document.userUpdateFrm.onsubmit = (e) => {
	const userName = document.querySelector("#userName");
	const phone = document.querySelector("#phone");

	// 이름 - 한글 2글자이상
	if(!/^[가-힣]{2,}$/.test(userName.value)){
		alert("이름은 한글 2글자 이상이어야 합니다.");
		userName.select();
		return false;
	}
	
	// 전화번호는 숫자 01012345678 형식
	if(!/^010[0-9]{8}$/.test(phone.value)){
		alert("전화번호가 유효하지 않습니다.");
		phone.select();
		return false;
	}
	
};

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
