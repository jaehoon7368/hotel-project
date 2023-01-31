<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="<%= request.getContextPath()%>/js/jquery-3.6.1.js"></script>
<style>
#FAQ-board {width: 1024px; min-height: 800px; margin: auto;}
.wrap {padding: 54px 0 50px 0;}
.board-menu {width: 210px; margin: 0; display: block; float: left;}
.board-menu-list {list-style: none; margin: 0;}
.board-menu-list li {margin-bottom: 24px;}
#FAQ-board>nav>ul>li>a {color: rgba(0,0,0,0.60); text-decoration: none; font-size: 18px;}
.FAQ {width: 770px; height: 300px; float: right;}
.faq-board {width: 770px; height: 500px;}
.faq-head {font-size: 18px; border-bottom: rgba(0,0,0,0.3) solid 1px; height: 41px; margin: 0; padding: 0;}
.btn-tab {margin-right: 22px; color: rgba(0,0,0,0.6); height: 40px; line-height: normal;}
.faq-head>div>li {list-style: none; margin-right: 20px; float: left;}
.faq-head>div>li>a {text-decoration: none; color: rgba(0,0,0,0.90); cursor: pointer;}
div>table>tr td {margin: 10px; padding: 10px;}
.faq-enroll{margin-bottom: 20px;}
.font {font-size: 18px;}
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
.category-select {width: 765px; height: 30px; font-size: 18px; color:rgba(0,0,0,0.50);}
.faq-title {width: 760px; height: 30px; font-size: 18px;}
.faq-content {resize: vertical; font-size: 18px; padding: 5px}
</style>
	<div id="FAQ-board" class="wrap">
        <nav class="board-menu">
            <ul class="board-menu-list" id="board-menu-list">
                <li><a href="<%= request.getContextPath() %>/board/noticeBoardList">공지사항</a></li>
                <li><a href="<%= request.getContextPath() %>/board/faqBoardList">자주 묻는 질문</a></li>
                <li><a href="<%= request.getContextPath() %>/board/inquiyBoardList">1:1 문의</a></li>
            </ul>
        </nav>
        <!-- 메인 -->
        <div class="FAQ">
            <div class="faq-board">
                <div class="faq-head">
                    <div>
                        <li><a onclick="faqBoardTOP()">TOP</a></li>
                        <li><a onclick="faqBoardUseInquiry()">이용문의</a></li>
                        <li><a onclick="faqBoardPayment()">예약/결제</a></li>
                        <li><a onclick="faqBoardCancel()">취소/환불</a></li>
                        <li><a onclick="faqBoardLodging()">숙소</a></li>
                        <li><a onclick="faqBoardUserInfo()">회원정보</a></li>
                        <li><a href="<%= request.getContextPath() %>/board/faqBoardEnroll">FAQ작성하기</a></li>
                    </div>
                </div>
                <form action="<%= request.getContextPath() %>/board/faqBoardEnroll" method="POST" name="faqBoardEnrollFrm">
                    <div style="margin-top: 50px;">
                        <table>
                        	<input type="hidden" name="writer" value="<%= loginUser.getUserId()%>" />
                            <div class="faq-enroll font">카테고리</div>
                            <div class="faq-enroll">
                                <select name="category" class="category-select">
                                	<option value="">카테고리를 선택해주세요.</option>
                                    <option value="TOP">TOP</option>
                                    <option value="이용문의">이용문의</option>
                                    <option value="예약/결제">예약/결제</option>
                                    <option value="취소/환불">취소/환불</option>
                               		<option value="숙소">숙소</option>
                                	<option value="회원정보">회원정보</option>
                            	</select>
                            </div>
                            <div class="faq-enroll font">제목</div>
                            <div class="faq-enroll"><input type="text" name="title" class="faq-title" placeholder="제목을 입력해주세요"></div>
                            <div class="faq-enroll font">내용</div>
                            <div class="faq-enroll"><textarea name="content" class="faq-content" cols="80" rows="20" placeholder="내용을 입력해주세요"></textarea></div>
 							<div class="faq-enroll">
                                <input type="submit" value="작성하기" class="enroll-btn" >
                                <input type="button" value="취소하기" class="cancel-btn" onclick="history.go(-1);" />
 							</div>
                        </table>
                    </div>
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
	document.menuListFrm.category.value = 'TOP';
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