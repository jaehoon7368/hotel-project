<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/faq/faqEnroll.css" />
<script src="<%= request.getContextPath()%>/js/jquery-3.6.1.js"></script>

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
        <div class="FAQ">
            <div class="faq-board">
                <div class="faq-head">
                    <div>
                        <li><a onclick="faqBoardTOP()">공통</a></li>
                        <li><a onclick="faqBoardUseInquiry()">이용문의</a></li>
                        <li><a onclick="faqBoardPayment()">예약/결제</a></li>
                        <li><a onclick="faqBoardCancel()">취소/환불</a></li>
                        <li><a onclick="faqBoardLodging()">숙소</a></li>
                        <li><a onclick="faqBoardUserInfo()">회원정보</a></li>
                        <!-- 관리자만 -->
			            <%  
							if(canAdmin) {
						%>
                        <li><a href="<%= request.getContextPath() %>/board/faqBoardEnroll" style="color: #f7323f; font-weight: bold;">FAQ작성하기</a></li>
                        <% } %>
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
                                    <option value="공통">공통</option>
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
                            <div class="faq-enroll"><textarea name="content" class="faq-content" cols="70" rows="20" placeholder="내용을 입력해주세요"></textarea></div>
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

document.faqBoardEnrollFrm.onsubmit = (e) => {
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