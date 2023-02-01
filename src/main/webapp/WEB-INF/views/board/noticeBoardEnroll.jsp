<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
#main-content {width: 100%; height: 500px; min-height: 800px; margin: auto;}
.wrap {padding: 54px 0 50px 0;}
.board-menu {width: 210px; margin: 0; display: block; float: left;}
.board-menu-list {list-style: none; margin: 0;}
.board-menu-list li {margin-bottom: 24px;}
#main-content>nav>ul>li>a {color: rgba(0,0,0,0.60); text-decoration: none; font-size: 18px;}
.notice {width: 800px; height: 300px; margin: auto; /* float: right; */}
.notice-board {width: 800px; height: 500px;}
.notice-head {font-size: 18px; border-bottom: rgba(0,0,0,0.3) solid 1px; height: 41px; margin: 0; padding: 0;}
.notice-list {list-style: none; padding: 0 0 0 0;}
.notice-show {padding: 0 0 0 0;}
.btn-tab {margin-right: 22px; color: rgba(0,0,0,0.6); height: 40px; line-height: normal;}
.notice-enroll {border-bottom: #f7323f solid 2px; color: #f7323f; font-weight: bold; height: 40px; position: absolute; padding: 0;}
.notice-content-box {padding-top:35px;}
.enroll-btn {
	background-color: #ef303d;
    text-align: center;
    color: white;
    border-radius: 15px;
    font-size : 18px;
    border-style: none;
    cursor: pointer;
    width: 100px; height: 50px;
}
.cancel-btn {
	background-color: #ef303d;
    text-align: center;
    color: white;
    border-radius: 15px;
    font-size : 18px;
    border-style: none;
    cursor: pointer;
    width: 100px; height: 50px;
}
.notice-form {margin-bottom: 20px; font-size: 18px;}
.notice-title {width: 745px; height:30px; font-size: 18px;}
.notice-content {resize: vertical; font-size: 18px; padding: 5px;}
/* 사이드바 */
.sidebar li:hover {background-color: rgb(233, 227, 227); border-radius: 10px;}
.sidebar {position:absolute; width: 15%; height: 100%; font-size: 15px; border-right: solid rgb(236, 231, 231) 1px;}
.userView-nav {position: relative; margin: 0 15%; text-align: right; top: 18%; transform: translateY(-50%); font-weight: bold;}
.userView-nav ul {list-style: none;}
.userView-nav li {position: relative; margin: 2.2em 0;}   
.userView-nav a {line-height: 20px; text-transform: uppercase; text-decoration: none; letter-spacing: 0.4em; display: block; transition: all ease-out 300ms; color: black;}
</style>
	<div id="main-content" class="wrap">
        <content>
    		<div class="sidebar">
        		<nav class="userView-nav">
          			<ul>
			            <li class="active"><a href="<%= request.getContextPath() %>/board/noticeBoardList">공지사항</a></li>
			            <hr>
			            <li><a href="<%=request.getContextPath()%>/board/faqBoardList">자주 묻는 질문</a></li>
			            <hr>
			            <li><a href="<%= request.getContextPath()%>/board/inquiyBoardList">1:1 문의</a></li>
			            <hr>
			            <!-- 관리자만 -->
			            <% boolean canAdmin = loginUser != null && (loginUser.getUserRole() == UserRole.A); 
							if(canAdmin) {
						%>
			            <li><a href="<%= request.getContextPath() %>/board/admininquiyList">1:1 답변</a></li>
			            <hr />
			            <% } %>
		           </ul>
        		</nav>
    	   </div>
		</content>
        <div class="notice">
            <div class="notice-board">
                <div class="notice-head">
                    <a class="btn-tab notice-view" href="<%= request.getContextPath() %>/board/noticeBoardList">서비스 공지사항</a>
                    <!-- 관리자 -->
                    <% if(canAdmin) { %>
                    <a class="btn-tab notice-enroll" href="<%= request.getContextPath() %>/board/noticeBoardEnroll">공지사항 작성</a>
                    <% } %>
                </div>
                <div class="notice-content-box">
                    <form name="noticeboardEnrollFrm"  method="post"
                    	  action="<%= request.getContextPath() %>/board/noticeBoardEnroll">
                   	  <div>
                        <table id="tbl-board-view">
                            	<input type="hidden" name="writer" value="<%= loginUser.getUserId() %>" />
                            	<div class="notice-form">제목</div>
                                <div class="notice-form"><input type="text" name="title" class="notice-title" required placeholder="제목을 입력해주세요."></div>
                                <div class="notice-form">내용</div>
								<div class="notice-form"><textarea rows="20" cols="80" name="content" class="notice-content" placeholder="내용을 입력해주세요"></textarea></div>		                                
                            	<div class="notice-form">
                                    <input type="submit" value="작성하기" class="enroll-btn">
                                    <input type="button" value="취소하기" class="cancel-btn" onclick="history.go(-1);"/>
                            	</div>
                         </table>
                   	  </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<script>

</script>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>