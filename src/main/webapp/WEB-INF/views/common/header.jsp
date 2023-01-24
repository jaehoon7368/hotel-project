<%@page import="com.sh.airbnb.user.model.dto.UserRole"%>
<%@page import="com.sh.airbnb.user.model.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User loginUser = (User) session.getAttribute("loginUser");
	String msg = (String) session.getAttribute("msg");
	if(msg != null) session.removeAttribute("msg");
	
	Cookie[] cookies = request.getCookies();
	String saveId = null;
	if(cookies != null){
		for(Cookie cookie : cookies){
			String name = cookie.getName();
			String value = cookie.getValue();
			System.out.println(name + "=" + value);
			if("saveId".equals(name))
				saveId = value;
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alpha</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css" />
<script src="<%= request.getContextPath()%>/js/jquery-3.6.1.js"></script>
<!-- 캘린더 jquery start -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
        integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"
        integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
 <link rel="stylesheet" href="<%=request.getContextPath() %>/css/checkInOut/jquery-ui.css">
<script src="<%= request.getContextPath()%>/js/jquery-ui.min.js"></script>
<!-- 캘린더 jquery end -->


</head>

<body>
	<div id="container">
        <header>
            <div class=>
                <h2><a href="<%=request.getContextPath()%>" id="mainTitle">Alpha</a></h2>
            </div>
            
            <div>
            <div id="profile-img" onclick="profileMenu();">
        			<i class="fa-regular fa-user" id="fa-user" ><span> <i class="fa-solid fa-bars" id="fa-bar"></i></span></i>
            </div>
            
            <% 
			boolean canEdit = loginUser != null ;
            //로그인 안했을때 나오는 메뉴
            if(!canEdit){ %>
            <div id="profile-menu" onclick="profileMenu();">
		        <div id="wrapper">
		            <div id="sign">
		                <ul>
		                    <li><button id="signin" onclick="location.href = '<%= request.getContextPath() %>/user/userLogin';">로그인</button></li>
		                    <li><button id="signup" onclick="location.href = '<%= request.getContextPath() %>/user/userEnroll';">회원가입</button></li>
		                </ul>
		            </div>
		            <hr id="rine">
		            <div id="board">
		                <ul>
		                    <li><a href=""></a>공지사항</li>
		                    <li><a href=""></a>자주 묻는 질문</li>
		                    <li><a href=""></a>1:1 문의</li>
		                </ul>
		        </div>
		     </div>
		     <% }else {  //로그인했을시 나오는 메뉴 바 %>
		      <div id="profile-menu" onclick="profileMenu();">
		        <div id="wrapper">
		            <div id="sign">
		                <ul>
		                	
		                   	<li><button id="btn1" onclick="location.href = '<%= request.getContextPath() %>/user/userLogout';">로그아웃</button></li>
		                   	<li><button id="btn2" onclick="location.href ='<%=request.getContextPath()%>/admin/adminhotelenroll';">마이페이지</button></li>
		                   	<li><button id="btn3" onclick="location.href ='<%=request.getContextPath()%>/admin/adminhotelenroll';">판매자로그인</button></li>
		                   	<li><button id="btn4">서버관리자로그인</button></li>
		                </ul>
		            </div>
		            <hr id="rine">
		            <div id="board">
		                <ul>
		                    <li><a href=""></a>공지사항</li>
		                    <li><a href=""></a>자주 묻는 질문</li>
		                    <li><a href=""></a>1:1 문의</li>
		                </ul>
		        </div>
		        
		     </div>
		    
		     
		     
		   <%} %> 
        </header> 
        <!-- header 종료 -->
        <div id="content" class=""></div>
<script>



function profileMenu() {
	const Img = document.querySelector("#profile-img");
	const Menu = document.querySelector("#profile-menu");
	
	Img.classList.toggle("active");
	Menu.classList.toggle("active");
} 

window.addEventListener('load', () => {
	
	<% if(msg != null) { %>
		alert("<%= msg %>");
	<% } %>
});

</script>
