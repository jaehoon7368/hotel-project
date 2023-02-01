<%@page import="com.sh.airbnb.board.model.dto.FaqBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="<%= request.getContextPath()%>/js/jquery-3.6.1.js"></script>
<%
	FaqBoard faqBoard = (FaqBoard)request.getAttribute("faqBoard");
%>
<style>
#FAQ-board {width: 100%; min-height: 850px; margin: auto;}
.wrap {padding: 54px 0 50px 0;}
.faq-menu {width: 210px; margin: 0; display: block; float: left;}
.faq-menu-list {list-style: none; margin: 0;}
.faq-menu-list li {margin-bottom: 24px;}
#FAQ-board>nav>ul>li>a {color: rgba(0,0,0,0.60); text-decoration: none; font-size: 18px;}
.faq {width: 770px; height: 300px; margin: auto;}
.faq-board {width: 770px; height: 500px;}
.faq-head {font-size: 18px; border-bottom: rgba(0,0,0,0.3) solid 1px; height: 41px; margin: 0; padding: 0;}
.btn-tab {margin-right: 22px; color: rgba(0,0,0,0.6); height: 40px; line-height: normal;}
.faq-head>div>li {list-style: none; margin-right: 20px; float: left;}
.faq-head>div>li>a {text-decoration: none; color: rgba(0,0,0,0.90); cursor: pointer;}
.faq-enroll{margin-bottom: 20px;}
.font {font-size: 18px;}
.category-select {width: 735px; height: 30px; font-size: 18px; color: rgba(0,0,0,0.50);}
.faq-title {width: 729px; height: 30px; font-size: 18px;}
.faq-content {resize: vertical; font-size: 18px; padding: 3px}
/* 사이드바 */
.sidebar li:hover {background-color: rgb(233, 227, 227); border-radius: 10px;}
.sidebar {position:absolute; width: 15%; height: 100%; font-size: 15px; border-right: solid rgb(236, 231, 231) 1px;}
.userView-nav {position: relative; margin: 0 15%; text-align: right; top: 18%; transform: translateY(-50%); font-weight: bold;}
.userView-nav ul {list-style: none;}
.userView-nav li {position: relative; margin: 2.2em 0;}   
.userView-nav a {line-height: 20px; text-transform: uppercase; text-decoration: none; letter-spacing: 0.4em; display: block; transition: all ease-out 300ms; color: black;}
/* 버튼 */
.update-btn {
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
</style>

	<div id="FAQ-board" class="wrap">
        <content>
    		<div class="sidebar">
        		<nav class="userView-nav">
          			<ul>
			            <li><a href="<%= request.getContextPath() %>/board/noticeBoardList">공지사항</a></li>
			            <hr>
			            <li class="active"><a href="<%= request.getContextPath()%>/board/faqBoardList">자주 묻는 질문</a></li>
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
        <!-- 메인 -->
        <div class="faq">
            <div class="faq-board">
                <div class="faq-head">
                    <div>
                        <li><a onclick="faqBoardTOP()">공통</a></li>
                        <li><a onclick="faqBoardUseInquiry()">이용문의</a></li>
                        <li><a onclick="faqBoardPayment()">예약/결제</a></li>
                        <li><a onclick="faqBoardCancel()">취소/환불</a></li>
                        <li><a onclick="faqBoardLodging()">숙소</a></li>
                        <li><a onclick="faqBoardUserInfo()">회원정보</a></li>
                        <% if(canAdmin) { %>
                        <li><a href="<%= request.getContextPath() %>/board/faqBoardEnroll">FAQ작성</a></li>
                        <li><a href="<%= request.getContextPath() %>/board/faqBoardUpdate?faqNo=<%= faqBoard.getFaqNo() %>" style="color: #f7323f; font-weight: bold;">FAQ수정</a></li>
                        <% } %>
                    </div>
                </div>
                <form action="<%= request.getContextPath() %>/board/faqBoardUpdate" method="POST" name="faqBoardUpdateFrm">
                    <div style="margin-top: 50px;">
                        
                           <table>
                        	<input type="hidden" name="writer" value="<%= loginUser.getUserId()%>" />
                            <div class="faq-enroll font">카테고리</div>
                            <div class="faq-enroll">
                                <select name="category" class="category-select" >
                                	<option value="<%= faqBoard.getCategory() %>"><%= faqBoard.getCategory() %></option>
                                    <option value="공통">공통</option>
                                    <option value="이용문의">이용문의</option>
                                    <option value="예약/결제">예약/결제</option>
                                    <option value="취소/환불">취소/환불</option>
                               		<option value="숙소">숙소</option>
                                	<option value="회원정보">회원정보</option>
                            	</select>
                            </div>
                            <div class="faq-enroll font">제목</div>
                            <div class="faq-enroll"><input type="text" name="title" class="faq-title" value="<%= faqBoard.getTitle()%>" placeholder="제목을 입력해주세요"></div>
                            <div class="faq-enroll font">내용</div>
                            <div class="faq-enroll"><textarea name="content" class="faq-content" cols="70" rows="20" placeholder="내용을 입력해주세요"><%= faqBoard.getContent() %></textarea></div>
 							<div class="faq-enroll">
                                <input type="submit" value="수정하기" class="update-btn">
                                <input type="button" value="취소하기" class="cancel-btn" onclick="history.go(-1);"/>
 							</div>
                        </table>
                        
                    </div>
                    <input type="hidden" name="faqNo" value="<%= faqBoard.getFaqNo() %>" />
                </form>
            </div>
        </div>
    </div>
<form action="<%= request.getContextPath() %>/board/faqBoardMenu" name="menuListFrm" method="GET">
	<input type="hidden" name="category" value="" />
</form>
<script>
const faqBoardTOP = () => {
	console.log();
	document.menuListFrm.category.value = '공통';
	document.menuListFrm.submit();
};
const faqBoardUseInquiry = () => {
	console.log();
	document.menuListFrm.category.value = '이용문의';
	document.menuListFrm.submit();
};
const faqBoardPayment = () => {
	console.log();
	document.menuListFrm.category.value = '예약/결제';
	document.menuListFrm.submit();
};
const faqBoardCancel = () => {
	console.log();
	document.menuListFrm.category.value = '취소/환불';
	document.menuListFrm.submit();
};
const faqBoardLodging = () => {
	console.log();
	document.menuListFrm.category.value = '숙소';
	document.menuListFrm.submit();
};
const faqBoardUserInfo = () => {
	console.log();
	document.menuListFrm.category.value = '회원정보';
	document.menuListFrm.submit();
};


</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>