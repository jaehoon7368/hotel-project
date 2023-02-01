<%@page import="java.util.spi.CalendarNameProvider"%>
<%@page import="com.sh.airbnb.common.HelloMvcUtils"%>
<%@page import="com.sh.airbnb.board.model.dto.FaqBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="<%= request.getContextPath()%>/js/jquery-3.6.1.js"></script>
<%
	List<FaqBoard> faqBoardList = (List<FaqBoard>)request.getAttribute("faqBoardList");
%>
<style>
#FAQ-board {width: 100%; min-height: 800px; margin: auto;}
.wrap {padding: 54px 0 50px 0;}
.faq-menu {width: 210px; margin: 0; display: block; float: left;}
.board-menu-list {list-style: none; margin: 0;}
.board-menu-list li {margin-bottom: 24px;}
#FAQ-board>nav>ul>li>a {color: rgba(0,0,0,0.60); text-decoration: none; font-size: 18px;}
.faq {width: 800px; height: 100%; margin: auto;}
.faq-board {width: 800px; height: 100%;}
.faq-head {font-size: 18px; border-bottom: rgba(0,0,0,0.3) solid 1px; height: 41px; margin: 0; padding: 0;}
.faq-list {list-style: none; padding: 0 0 0 0; border-bottom: 1px solid rgba(0,0,0,0.4);}
.faq-show {padding: 0 0 0 0;}
.btn-tab {margin-right: 22px; color: rgba(0,0,0,0.6); height: 40px; line-height: normal;}
.notice-view {border-bottom: #f7323f solid 2px; color: #f7323f; font-weight: bold; height: 40px; position: relative;}
.notice-enroll {position: relative;}
.faq-head>div>li {list-style: none; margin-right: 20px; float: left;}
.faq-head>div>li>a {text-decoration: none; color: rgba(0,0,0,0.90); cursor: pointer;}
.faq-content {display: none; background: #fafafa; padding: 30px 30px;}
.faq-title {padding: 35px 0 35px 0; display: block;}
/* 사이드바 */
.sidebar li:hover {background-color: rgb(233, 227, 227); border-radius: 10px;}
.sidebar {position:absolute; width: 15%; height: 100%; font-size: 15px; border-right: solid rgb(236, 231, 231) 1px;}
.userView-nav {position: relative; margin: 0 15%; text-align: right; top: 18%; transform: translateY(-50%); font-weight: bold;}
.userView-nav ul {list-style: none;}
.userView-nav li {position: relative; margin: 2.2em 0;}   
.userView-nav a {line-height: 20px; text-transform: uppercase; text-decoration: none; letter-spacing: 0.4em; display: block; transition: all ease-out 300ms; color: black;}
/* 버튼 */
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
			            <% if(loginUser != null) { %>
			            <li><a href="<%= request.getContextPath()%>/board/inquiyBoardList">1:1 문의</a></li>
			            <hr>
			            <% } %>
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
                        <!-- 관리자만 작성가능 -->
                        <% if(canAdmin) { %>
                        <li><a href="<%= request.getContextPath() %>/board/faqBoardEnroll" class="faq-enroll">FAQ작성</a></li>
                        <% } %> 
                    </div>
                </div>
                <div>
                    <ul class="faq-show">
                    <% for(FaqBoard faqBoard : faqBoardList) { %>
                        <li class="faq-list">
                            <div class="faq-title">
                            	<!-- 개행처리 및 XSS공격 방지 -->
                            	<% faqBoard.setTitle(HelloMvcUtils.convertLineFeedToBr(HelloMvcUtils.escapeHtml(faqBoard.getTitle()))); %>
                                <p style="margin: 0;">[<%= faqBoard.getCategory() %>] <%= faqBoard.getTitle() %>
                                	<!-- 아이콘 -->
                                    <svg xmlns="http://www.w3.org/2000/svg" style="float: right; vertical-align: middle;" width="20" height="20" fill="currentColor" class="bi bi-chevron-expand" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M3.646 9.146a.5.5 0 0 1 .708 0L8 12.793l3.646-3.647a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 0-.708zm0-2.292a.5.5 0 0 0 .708 0L8 3.207l3.646 3.647a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 0 0 0 .708z"/>
                                    </svg>
                                </p>
                            </div>
                            <div class="faq-content">
                            		<% faqBoard.setContent(HelloMvcUtils.convertLineFeedToBr(HelloMvcUtils.escapeHtml(faqBoard.getContent()))); %>
                                    <%= faqBoard.getContent() %>
                                <!-- 수정 삭제 관리자만 가능. -->
                                <% if(canAdmin) { %>
                            	<div>
                            		<input type="button" class="box-update-btn" value="수정하기" onclick="updateFaq(<%= faqBoard.getFaqNo() %>)" />
                            		<input type="button" class="box-cancel-btn" value="삭제하기" onclick="deleteFaq(<%= faqBoard.getFaqNo() %>)" />
                            	</div>
                            	<% } %>
                            </div>
                         </li>
                        <% } %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
<!-- 글번호를 전달하는 폼. -->
<form action="<%= request.getContextPath() %>/board/faqBoardUpdate" name="faqUpdateFrm" method="GET" >
	<input type="hidden" name="faqNo" value="" />
</form>
    
<form action="<%= request.getContextPath() %>/board/faqBoardDelete" name="faqBoardDeleteFrm" method="POST">
	<input type="hidden"  name="faqNo" value="" />
</form>

<form action="<%= request.getContextPath() %>/board/faqBoardMenu" name="menuListFrm" method="GET">
	<input type="hidden" name="category" value="" />
</form>

<script>
$(".faq-title").click((e) => {
	console.log(e.target);
    console.log(e.target.tagName);
        
    let div = e.target;
    if(e.target.tagName == 'P' || e.target.tagName == 'svg') {
        div = e.target.parentElement;
    }
    $(div).next("div").slideToggle();
});

// 수정
const updateFaq = (faqNo) => {
	console.log(faqNo);
	document.faqUpdateFrm.faqNo.value = faqNo;
	document.faqUpdateFrm.submit();
}
// 삭제
const deleteFaq = (faqNo) => {
	document.faqBoardDeleteFrm.faqNo.value = faqNo;
	document.faqBoardDeleteFrm.submit();
}

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