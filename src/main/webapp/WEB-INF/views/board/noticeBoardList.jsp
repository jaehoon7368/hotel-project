<%@page import="com.sh.airbnb.board.model.dto.InquiyBoardComment"%>
<%@page import="com.sh.airbnb.board.model.dto.NoticeBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="<%= request.getContextPath()%>/js/jquery-3.6.1.js"></script>
<%
	List<NoticeBoard> noticeBoardList = (List<NoticeBoard>) request.getAttribute("noticeBoardList");
	NoticeBoard noticeBoard = (NoticeBoard)request.getAttribute("noticeBoard");
%>
<style>
#main-content { width: 1024px; height: 100%; margin: auto;}
.wrap {padding: 54px 0 50px 0;}
.board-menu {width: 210px; margin: 0; display: block; float: left;}
.board-menu-list {list-style: none; margin: 0;}
.board-menu-list li {margin-bottom: 24px;}
#main-content>nav>ul>li>a { color: rgba(0,0,0,0.60); text-decoration: none; font-size: 18px;}
.notice {width: 770px; height: 100%; float: right;}
.notice-board {width: 770px; height: 100%;}
.notice-head {font-size: 18px; border-bottom: rgba(0,0,0,0.3) solid 1px; height: 41px; margin: 0; padding: 0;}
.notice-list {list-style: none; padding: 0 0 0 0; border-bottom: 1px solid rgba(0,0,0,0.4);}
.notice-show {padding: 0 0 0 0; margin-bottom: 50px;}
.btn-tab {margin-right: 22px; color: rgba(0,0,0,0.6); height: 35px; line-height: normal;}
.notice-view {border-bottom: #f7323f solid 2px; color: #f7323f; font-weight: bold; height: 37px; position: relative; display: inline-block;}
.notice-enroll {position: relative; display: inline-block;}
.notice-content {display: none; background: #fafafa; padding: 20px 30px;}
.notice-title {padding: 35px 0 35px 0; display: block;}
.bi-chevron-expand {float: right; width: 20px; height:20px; }
div#pagebar{margin:0px 0 50px 0; text-align:center; }
div#pagebar span.cPage{color: #0066ff; margin-right: 5px;}
div#pagebar a{margin-right: 5px;}
</style>

<div id="main-content" class="wrap">
        <nav class="board-menu">
            <ul class="board-menu-list" id="board-menu-list">
                <li><a href="<%= request.getContextPath() %>/board/noticeBoardList" style="font-weight: bold; color: #f7323f;">공지사항</a></li>
                <li><a href="">이벤트</a></li>
                <li><a href="<%= request.getContextPath() %>/board/faqBoardList">자주 묻는 질문</a></li>
                <li><a href="<%= request.getContextPath() %>/board/inquiyBoardList">1:1 문의</a></li>
            </ul>
        </nav>
       
        <div class="notice">
            <div class="notice-board">
                <div class="notice-head">
                    <a class="btn-tab notice-view" href="<%= request.getContextPath() %>/board/noticeBoardList">서비스 공지사항</a>
                    <!-- 관리자만 볼수 있는 작성메뉴 -->
                    <% if(loginUser != null && (loginUser.getUserRole() == UserRole.A)) { %>
                    <a class="btn-tab notice-enroll" href="<%= request.getContextPath() %>/board/noticeBoardEnroll">공지사항 작성</a>
                    <% } %>
                </div>
                <div>
                    <ul class="notice-show">
                    <% for(NoticeBoard noticeBoards :  noticeBoardList) { %>
                         <li class="notice-list">
                         <input type="hidden" name="noticeNo" value="<%= noticeBoards.getNoticeNo() %>" />
                            <div class="notice-title">
                            		<!-- 아이콘 <> -->
                                    <svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor" class="bi bi-chevron-expand" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M3.646 9.146a.5.5 0 0 1 .708 0L8 12.793l3.646-3.647a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 0-.708zm0-2.292a.5.5 0 0 0 .708 0L8 3.207l3.646 3.647a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 0 0 0 .708z"/>
                                    </svg>
                                <p style="margin: 0;">[공지] <%= noticeBoards.getTitle() %></p>
                                <span><%= noticeBoards.getRegDate() %></span>
                            </div>
                            <div class="notice-content">
                            	<%= noticeBoards.getContent() %>
                            	<br />
                            	<br />
                            	<% if(loginUser != null && (loginUser.getUserRole() == UserRole.A)) { %>
                            	<hr />
                            	<br />
                            	<!-- 관리자 글수정 삭제 -->
                            	<input type="button" value="수정" onclick="updateNotice(<%= noticeBoards.getNoticeNo() %>)" />
                            	<input type="button" value="삭제" onclick="deleteNotice(<%= noticeBoards.getNoticeNo() %>)" />
                            	<% } %>
                            </div>
                         </li>
                    <% } %>
                    </ul>
                </div>
            </div>
            <!-- 페이지바 -->
            <div id='pagebar'>
				<%= request.getAttribute("pagebar") %>
			</div>
        </div>
    </div>
   
<!-- 글삭제 -->
<form action="<%= request.getContextPath() %>/board/noticeBoardDelete" name="noticeBoardDeleteFrm" method="POST">
	<input type="hidden"  name="noticeNo" value="" />
</form>

<!-- 업데이트 폼으로 보내는 보조폼 get방식 글번호를 값으로 보냄 -->
<form action="<%= request.getContextPath() %>/board/noticeBoardUpdate" name="updateNoticeFrm" method="get">
	<input type="hidden" name="noticeNo" value="" />
</form>
<script>
// 수정
const updateNotice = (noticeNo) => {
	console.log(noticeNo)
	document.updateNoticeFrm.noticeNo.value = noticeNo;
	document.updateNoticeFrm.submit();
} 
// 삭제
const deleteNotice = (noticeNo) => {
	if(confirm("삭제하시겠습니까 ?"))
	document.noticeBoardDeleteFrm.noticeNo.value = noticeNo;
	document.noticeBoardDeleteFrm.submit();
};

// 공지글 클릭
$(".notice-title").click((e) => {
    console.log(e.target);
    console.log(e.target.tagName);
        
    let div = e.target;
    if(e.target.tagName == 'P' || e.target.tagName == 'svg') {
        div = e.target.parentElement;
    }
    $(div).next("div").slideToggle();
});


</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>