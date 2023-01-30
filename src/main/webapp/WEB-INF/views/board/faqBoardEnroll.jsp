<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="<%= request.getContextPath()%>/js/jquery-3.6.1.js"></script>
<style>
#FAQ-board {width: 1024px; height: 500px; margin: auto;}
.wrap {padding: 54px 0 50px 0;}
.board-menu {width: 210px; margin: 0; display: block; float: left;}
.board-menu-list {list-style: none; margin: 0;}
.board-menu-list li {margin-bottom: 24px;}
#FAQ-board>nav>ul>li>a {color: rgba(0,0,0,0.60); text-decoration: none; font-size: 18px;}
.FAQ {width: 770px; height: 300px; float: right;}
.notice-board {width: 770px; height: 500px;}
.notice-head {font-size: 18px; border-bottom: rgba(0,0,0,0.3) solid 1px; height: 41px; margin: 0; padding: 0;}
.btn-tab {margin-right: 22px; color: rgba(0,0,0,0.6); height: 40px; line-height: normal;}
.notice-view {border-bottom: #f7323f solid 2px; color: #f7323f; font-weight: bold; height: 40px; position: relative;}
.notice-enroll {position: relative;}
.notice-head>div>li {list-style: none; margin-right: 20px; float: left;}
.notice-head>div>li>a {text-decoration: none; color: rgba(0,0,0,0.90);}
div>table>tr td {margin: 10px; padding: 10px;}
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
            <div class="notice-board">
                <div class="notice-head">
                    <div>
                        <li><a href="">TOP</a></li>
                        <li><a href="">이용문의</a></li>
                        <li><a href="">예약/결제</a></li>
                        <li><a href="">취소/환불</a></li>
                        <li><a href="">숙소</a></li>
                        <li><a href="">회원정보</a></li>
                        <li><a href="<%= request.getContextPath() %>/board/faqBoardEnroll">작성하기</a></li>
                    </div>
                </div>
                <form action="<%= request.getContextPath() %>/board/faqBoardEnroll" method="POST" name="faqBoardEnrollFrm">
                    <div style="margin-top: 50px;">
                        <table>
                        	<tr><td><input type="hidden" name="writer" value="<%= loginUser.getUserId()%>" /></td></tr>
                            <tr>
                                <select name="category" id="">
                                    <option value="TOP">TOP</option>
                                    <option value="이용문의">이용문의</option>
                                    <option value="예약/결제">예약/결제</option>
                                    <option value="취소/환불">취소/환불</option>
                               		<option value="숙소">숙소</option>
                                	<option value="회원정보">회원정보</option>
                            	</select>
                            <td>제목 : <input type="text" name="title"></td>
                            </tr>
                            <tr>
                                <td>
                                    내용<textarea name="content" id="" cols="80" rows="30"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="submit" value="작성하기">
                                    <input type="button" value="취소" onclick="history.go(-1);"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    </div>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>