<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String userId = request.getParameter("userId");
	boolean available = (boolean) request.getAttribute("available");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디중복검사</title>
<style>
div#checkId-container{text-align:center; padding-top:50px;}
span#available {color:green; font-weight:bold;}
span#duplicated {color:red; font-weight:bold;}
</style>
</head>
<body>
	<div id="checkId-container">
	<% if(available) { %>
		<p>
			[<span id="available"><%= userId %></span>]는 사용가능합니다.
		</p>
		<p>
			<input type="button" value="닫기" onclick="closePopup();" />
		</p>
	<% } else { %>
		<p>
			[<span id="duplicated"><%= userId %></span>]는 이미 사용중입니다.
		</p>
		<form action="<%= request.getContextPath() %>/user/checkIdDuplicate" name="checkIdDuplicateFrm">
			<input type="text" name="userId" id="userId" placeholder="새로운 아이디를 입력하세요."/>
			<input type="submit" value="제출" />
		</form>
	<% } %>
	</div>
	<script>
	<% if(!available) {%>
	document.checkIdDuplicateFrm.onsubmit = (e) => {
		const userId = document.querySelector("#userId");
		if(!/^[A-Za-z0-9]{4,}$/.test(userId.value)){
			alert("아이디는 영문자/숫자 4글자이상이어야합니다.");
			userId.select();
			return;
		};
	};
	<% } %>
	
	const closePopup = () => {
		// 부모창의 window객체에 대한 참조
		const parentFrm = opener.document.userEnrollFrm;
		parentFrm.userId.value = "<%= userId %>";
		parentFrm.idValid.value = "1";
		
		// this.close(); // window
		self.close(); // window
	};
	</script>
</body>
</html>
