<%@page import="com.sh.airbnb.user.model.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User loginUser = (User) session.getAttribute("loginUser");
	String msg = (String) session.getAttribute("msg");
	if(msg != null) session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alpha</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css" />
<script src="<%= request.getContextPath()%>/js/jquery-3.6.1.js"></script>
</head>
<body>
	<div id="container">
        <header>
            <div class=>
                <h2><a href="<%=request.getContextPath()%>" id="mainTitle">Alpha</a></h2>
            </div>
            <div>
            <div id="profile">
        			<a><i class="fa-regular fa-user" id="fa-user"></i></a>
        			<a><i class="fa-solid fa-bars" id="fa-bar"></i></a>
            <!--  </div> -->
               <!--  <button id="signup" onclick="location.href = '<%= request.getContextPath() %>/user/userEnroll';">회원가입</button>
                <button id="btn1">관리자로그인</button> -->
            </div>
        </header> 
        <!-- header 종료 -->

        <div id="content" class="">
        
<script>
	document.querySelector("#btn1").addEventListener('click',()=>{
	location.href ="<%=request.getContextPath()%>/admin/adminhotelenroll"
	
});
	
window.addEventListener('load', () => {
	
	<% if(msg != null) { %>
		alert("<%= msg %>");
	<% } %>
	
});




</script>