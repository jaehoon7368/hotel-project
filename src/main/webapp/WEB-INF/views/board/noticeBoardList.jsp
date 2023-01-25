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
#main-content {
            width: 1024px;
            height: 100%;
            margin: auto;
        }
        .wrap {
            padding: 54px 0 50px 0;
        }
        .board-menu {
            width: 210px;
            margin: 0;
            display: block;
            float: left;
        }
        .board-menu-list {
            list-style: none;
            margin: 0;
        }
        .board-menu-list li {
            margin-bottom: 24px;
        }
        #main-content>nav>ul>li>a {
            color: rgba(0,0,0,0.60);
            text-decoration: none;
            font-size: 18px;
        }
        .notice {
            width: 770px; 
            height: 100%;
            float: right;
        }
        .notice-board {
            width: 770px;
            height: 100%;
        }
        .notice-head {
            font-size: 18px;
            border-bottom: rgba(0,0,0,0.3) solid 1px;
            height: 41px;
            margin: 0;
            padding: 0;
        }
        
        .notice-list {
            list-style: none;
            padding: 0 0 0 0;
            border-bottom: 1px solid rgba(0,0,0,0.4);
        }
        .notice-show {
                padding: 0 0 0 0;
                margin-bottom: 100px;
        }
        .btn-tab {
        margin-right: 22px;
        color: rgba(0,0,0,0.6);
        height: 40px;
        line-height: normal;
        }
        .notice-view {
            border-bottom: #f7323f solid 2px;
            color: #f7323f;
            font-weight: bold;
            height: 40px;
            position: relative; 
        }
        .notice-enroll {
            position: relative;
        }
        .notice-content {
            display: none;
            background: #fafafa;
            padding: 20px 30px;
            /* margin-bottom: 12px; */
        }
        .notice-title {
        	padding: 35px 0 35px 0; 
        	display: block;
        }
</style>

<div id="main-content" class="wrap">
        <nav class="board-menu">
            <ul class="board-menu-list" id="board-menu-list">
                <li><a href="<%= request.getContextPath() %>/board/noticeBoardList" style="font-weight: bold; color: #f7323f;">공지사항</a></li>
                <li><a href="">이벤트</a></li>
                <li><a href="">자주 묻는 질문</a></li>
                <li><a href="<%= request.getContextPath() %>/board/inquiyBoardList">1:1 문의</a></li>
                <li><a href="">약관 및 정책</a></li>
                <li><a href="">채용 약관</a></li>
            </ul>
        </nav>
       
        <div class="notice">
            <div class="notice-board">
                <div class="notice-head">
                    <span class="btn-tab notice-view"
                    onclick="location.href = '<%= request.getContextPath() %>/board/noticeBoardList'">서비스 공지사항</span>
                    <!-- 관리자만 볼수 있는 작성메뉴 -->
                    <span class="btn-tab notice-enroll" 
                    onclick="location.href = '<%= request.getContextPath() %>/board/noticeBoardEnroll';">공지사항 작성</span>
                </div>
                <div>
                    <ul class="notice-show">
                    <% for(NoticeBoard noticeBoards :  noticeBoardList) { %>
                         <li class="notice-list">
                            <div class="notice-title">
                                    <svg xmlns="http://www.w3.org/2000/svg" style="float: right; " width="20" height="20" fill="currentColor" class="bi bi-chevron-expand" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M3.646 9.146a.5.5 0 0 1 .708 0L8 12.793l3.646-3.647a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 0-.708zm0-2.292a.5.5 0 0 0 .708 0L8 3.207l3.646 3.647a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 0 0 0 .708z"/>
                                    </svg>
                                <p style="margin: 0;">[공지] <%= noticeBoards.getTitle() %>
                                </p>
                                <span><%= noticeBoards.getRegDate() %></span>
                            </div>
                            <div class="notice-content">
                            	<%= noticeBoards.getContent() %>
                            	<br />
                            	
                            	<input type="button" value="수정" onclick="updateNotice()" />
                            	<input type="button" id="" value="삭제" onclick="deleteNotice(<%= noticeBoards.getNoticeNo() %>)" />
                            </div>
                         </li>
                    <% } %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <%-- <% if(loginUser != null) {%>
    <form name="noticeBoardUpdateFrm" action="<%=request.getContextPath() %>/board/noticeBoardUpdate" method="post">
          <table id="tbl-board-view">
              <tr>
                  <th>제 목</th>
                  <td><input type="text" name="title" value="<%= noticeBoard.getTitle() %>" required style="width: 99%;"></td>
              </tr>
              <tr hidden>
                  <th>작성자</th>
                  <td>
                      <input type="text" name="writer" value="<%= loginUser.getUserId() %>" readonly/>
                  </td>
              </tr>
              <tr>
                  <th>내 용</th>
                  <td><textarea rows="30" cols="100" value="<%= noticeBoard.getContent() %>" name="content" style="resize: none;"></textarea></td>
              </tr>
              <tr>
                  <th colspan="2">
                      <input type="submit" value="수정">
                      <input type="submit" value="취소" />
                  </th>
              </tr>
           </table>
      </form>
      <% } %> --%>

<form action="<%= request.getContextPath() %>/board/noticeBoardDelete" name="noticeBoardDeleteFrm" method="POST">
	<input type="hidden"  name="noticeNo" value="" />
</form>
<script>

// 수정
const updateNotice = () => { 
document.noticeBoardUpdateFrm.submit();

}; 

// 삭제
const deleteNotice = (noticeNo) => {
	
	document.noticeBoardDeleteFrm.noticeNo.value = noticeNo;
	document.noticeBoardDeleteFrm.submit();
	
};

</script>


<script>


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