<%@page import="com.sh.airbnb.board.model.dto.NoticeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/notice/noticeUpdate.css" />
<%
	NoticeBoard noticeBoard = (NoticeBoard) request.getAttribute("noticeBoard");
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
                    <!-- 관리자만 볼수 있는 작성메뉴 -->
                    <% if(canAdmin) { %>
                    <a class="btn-tab notice-enroll" href="<%= request.getContextPath() %>/board/noticeBoardEnroll">공지사항 작성</a>
                    <a class="btn-tab notice-update" href="<%= request.getContextPath() %>/board/noticeBoardUpdate?noticeNo=<%= noticeBoard.getNoticeNo() %>">공지사항 수정</a>
                    <% } %>
                </div>
                <div class="notice-box">
                    <form name="noticeBoardUpdateFrm" action="<%=request.getContextPath() %>/board/noticeBoardUpdate" method="post">
                         <table id="tbl-board-view">
                         	<div class="notice-box">
                            	<input type="hidden" name="writer" value="<%= loginUser.getUserId() %>" />
                            	<div class="notice-form">제목</div>
                                <div class="notice-form"><input type="text" name="title" value="<%= noticeBoard.getTitle() %>" class="notice-title" required placeholder="제목을 입력해주세요."></div>
                                <div class="notice-form">내용</div>
								<div class="notice-form"><textarea rows="20" cols="80" name="content" class="notice-content" placeholder="내용을 입력해주세요"><%= noticeBoard.getContent() %></textarea></div>		                                
                            	<div class="notice-form">
                                    <input type="submit" value="수정하기" class="enroll-btn">
                                    <input type="button" value="취소하기" class="cancel-btn" onclick="history.go(-1);"/>
                            	</div>
                         	</div>
                         </table>
                         <input type="hidden" name="noticeNo" value="<%= noticeBoard.getNoticeNo() %>" />
                    </form>
                </div>
            </div>
        </div>
    </div>
<script>
document.noticeBoardUpdateFrm.onsubmit = (e) => {
	const title = e.target.title;
	const content = e.target.content;
	console.log(title, content);
	
	//제목을 작성하지 않은 경우 폼제출할 수 없음.
	if(!/^.+$/.test(title.value)){
		alert("제목을 작성해주세요.");
		title.select();
		return false;
	}
					   
	//내용을 작성하지 않은 경우 폼제출할 수 없음.
	if(!/^(.|\n)+$/.test(content.value)){
		alert("내용을 작성해주세요.");
		content.select();
		return false;
	}
}
</script>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>