<%@page import="com.sh.airbnb.common.HelloMvcUtils"%>
<%@page import="com.sh.airbnb.board.model.dto.InquiyBoardComment"%>
<%@page import="com.sh.airbnb.board.model.dto.NoticeBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/notice/noticeList.css" />
<script src="<%= request.getContextPath()%>/js/jquery-3.6.1.js"></script>
<%
	List<NoticeBoard> noticeBoardList = (List<NoticeBoard>) request.getAttribute("noticeBoardList");
	NoticeBoard noticeBoard = (NoticeBoard)request.getAttribute("noticeBoard");
%>

		
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
            <% boolean canAdmin = loginUser != null && 
								(loginUser.getUserRole() == UserRole.A); 
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
                    <!-- 관리자만 볼수 있는 작성메뉴 -->
                    <% if(canAdmin) { %>
                    <a class="btn-tab notice-enroll" href="<%= request.getContextPath() %>/board/noticeBoardEnroll">공지사항 작성</a>
                    <% } %>
                </div>
                <div>
                    <ul class="notice-show">
                    <% for(NoticeBoard noticeBoards : noticeBoardList) { %>
                         <li class="notice-list">
                         <input type="hidden" name="noticeNo" value="<%= noticeBoards.getNoticeNo() %>" />
                            <div class="notice-title">
                            		<!-- 아이콘 <> -->
                                    <svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor" class="bi bi-chevron-expand" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M3.646 9.146a.5.5 0 0 1 .708 0L8 12.793l3.646-3.647a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 0-.708zm0-2.292a.5.5 0 0 0 .708 0L8 3.207l3.646 3.647a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 0 0 0 .708z"/>
                                    </svg>
                                    <!-- 개행 xss공격방어 -->
                                    <% noticeBoards.setTitle(HelloMvcUtils.convertLineFeedToBr(HelloMvcUtils.escapeHtml(noticeBoards.getTitle()))); %>
                                <p style="margin: 0;">[공지] <%= noticeBoards.getTitle() %></p>
                                <span><%= noticeBoards.getRegDate() %></span>
                            </div>
                            <div class="notice-content">
                            	<!-- 개행 xss공격방어 -->
                            	<% noticeBoards.setContent(HelloMvcUtils.convertLineFeedToBr(HelloMvcUtils.escapeHtml(noticeBoards.getContent()))); %>
                            	<!-- 공지사항 내용 -->
                            	<%= noticeBoards.getContent() %>
                            	<br />
                            	<br />
                            	<!-- 관리자 글수정 삭제버튼 -->
                            	<% if(canAdmin) { %>
                            	<hr />
                            	<br />
                            	<input type="button" value="수정하기" onclick="updateNotice(<%= noticeBoards.getNoticeNo() %>)" />
                            	<input type="button" value="삭제하기" onclick="deleteNotice(<%= noticeBoards.getNoticeNo() %>)" />
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