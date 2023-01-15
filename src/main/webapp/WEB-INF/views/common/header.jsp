<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel Project</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css" />
<script src="<%= request.getContextPath()%>/js/jquery-3.6.1.js"></script>
</head>
<body>
	<div id="container">
        <header>
            <div class=>
                <h2><a href="" id="mainTitle">airbnb</a></h2>
            </div>
            <div>
                <button id="mainLog">로그인</button>
                <button id="btn1">관리자로그인</button>
                
            </div>
        </header> 
        <!-- header 종료 -->

        <div id="content" class="">
        
<script>
	document.querySelector("#btn1").addEventListener('click',()=>{
	location.href ="<%=request.getContextPath()%>/admin/adminhotelenroll"
	
})
</script>
