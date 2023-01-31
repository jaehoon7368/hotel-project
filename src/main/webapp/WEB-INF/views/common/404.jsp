<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%
	//error-code로 넘어온 경우는 exception객체 null이다.
	//isErrorpage true 설정을 통해 던져진 예외객체에 선언없이 접근이 가능함.
	//String msg = exception.getMessage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커스텀 예외 페이지</title>
</head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/404.css" />
<style>

</style>
<body>
 <div class="wrapper">
      <h2>404 에러 찾으시는 페이지가 존재하지 않습니다. <br /> <br />
      <a href="<%= request.getContextPath() %>">홈으로</a></h2>
      <div><span class="dot"></span></div>
      <div><span class="dot"></span></div>
      <div><span class="dot"></span></div>
      <div><span class="dot"></span></div>
      <div><span class="dot"></span></div>
      <div><span class="dot"></span></div>
      <div><span class="dot"></span></div>
      <div><span class="dot"></span></div>
      <div><span class="dot"></span></div>
      <div><span class="dot"></span></div>
      <div><span class="dot"></span></div>
      <div><span class="dot"></span></div>
      <div><span class="dot"></span></div>
      <div><span class="dot"></span></div>
      <div><span class="dot"></span></div>
    </div>
	<h1> 텅</h1>
	<p id="msg">404 에러 찾으시는 페이지가 존재하지 않습니다.</p>
	<p>
		<h2></h2><a href="<%= request.getContextPath() %>">홈으로</a>
	</p>



</body>
</html>