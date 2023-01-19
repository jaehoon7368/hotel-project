<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<section id=enroll-container>
	<h2>회원 가입 정보 입력</h2>
	<form 
		name="userEnrollFrm" 
		method="POST" 
		action="<%= request.getContextPath() %>/user/userEnroll">
		<table>
			<tr>
				<th>아이디<sup>*</sup></th>
				<td>
					<input type="text" placeholder="4글자이상" name="userId" id="_userId" value="" required>
					<input type="button" value="아이디 중복검사" onclick="checkIdDuplicate();"/>
					<input type="hidden" id="idValid" name="idValid" value="0"/>
					<%-- 사용가능한 아이디인 경우 1, 이미 사용중인 아이디인 경우 0 --%>
				</td>
			</tr>
				<th>패스워드<sup>*</sup></th>
				<td>
					<input type="password" name="password" id="_password" value="" required><br>
				</td>
			</tr>
			<tr>
				<th>패스워드확인<sup>*</sup></th>
				<td>	
					<input type="password" id="passwordCheck" value="" required><br>
				</td>
			</tr>  
			<tr>
				<th>이름<sup>*</sup></th>
				<td>	
				<input type="text"  name="userName" id="userName" value="" required><br>
				</td>
			</tr>
			<tr>
				<th>닉네임<sup>*</sup></th>
				<td>
					<input type="text" name="nickName" id="nickName" value="" required><br>
				</td>
			<tr>
			<tr>
				<th>이메일</th>
				<td>	
					<input type="email" placeholder="abc@xyz.com" name="email" id="email" value=""><br>
				</td>
			</tr>
			<tr>
				<th>휴대폰<sup>*</sup></th>
				<td>	
					<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" value="" required><br>
				</td>
			</tr>
			
		</table>
		<input type="submit" value="가입" >
		<input type="reset" value="취소">
	</form>
</section>
<form action="<%= request.getContextPath() %>/user/checkIdDuplicate" name="checkIdDuplicateFrm">
	<input type="hidden" name="userId" />
</form>
<script>
/**
 * 중복검사이후 다시 아이디를 수정한 경우.
 */
document.querySelector("#_userId").onfocus = (e) => {
	document.querySelector("#idValid").value = "0";
};

const checkIdDuplicate = () => {
	const userId = document.querySelector("#_userId");
	if(!/^[A-Za-z0-9]{4,}$/.test(userId.value)){
		alert("아이디는 영문자/숫자 4글자이상이어야합니다.");
		userId.select();
		return;
	};
	
	// frm의 action주소를 사용하기 때문에 open의 url은 비워둔다.
	const title = "checkIdDuplicatePopup"; 
	open("", title, "width=300px, height=200px, left=100px, top=100px");
	
	const frm = document.checkIdDuplicateFrm 
	frm.target = title; // 폼을 팝업에 제출
	frm.userId.value = userId.value;
	frm.submit();
	
};

document.userEnrollFrm.onsubmit = (e) => {
	const userId = document.querySelector("#_userId");
	const idValid = document.querySelector("#idValid");
	const password = document.querySelector("#_password");
	const passwordCheck = document.querySelector("#passwordCheck");
	const userName = document.querySelector("#userName");
	const phone = document.querySelector("#phone");

	// 아이디 - 영문자/숫자 4글자이상
	if(!/^[A-Za-z0-9]{4,}$/.test(userId.value)){
		alert("아이디는 영문자/숫자 4글자이상이어야합니다.");
		userId.select();
		return false;
	}
	
	// 아이디중복검사 통과여부
	if(idValid.value !== '1'){
		alert("아이디 중복검사 해주세요.");
		userId.nextElementSibling.focus(); // 중복검사 버튼
		return false;
	}
	
	// 비밀번호 - 영문자/숫자/특수문자 !@#$% 4글자이상
	if(!/^[A-Za-z0-9!@#$%]{4,}$/.test(password.value)){
		alert("비밀번호는 영문자/숫자/특수문자!@#$% 구성된 4글자이상이어야합니다.");
		password.select();
		return false;
	}
	
	// 비밀번호/비밀번호확인 동일
	if(password.value !== passwordCheck.value){
		alert("두 비밀번호가 일치하지 않습니다.");
		password.select();
		return false;
	}
	
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
