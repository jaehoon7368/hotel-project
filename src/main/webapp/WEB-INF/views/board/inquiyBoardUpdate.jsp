<%@page import="com.sh.airbnb.board.model.dto.InquiyBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	InquiyBoard inquiyBoard = (InquiyBoard) request.getAttribute("inquiyBoard");
%>
<style>
#contentt {width: 1100px; height: 100%; margin: auto;}
.wrap {padding: 54px 0 50px 0;}
.board-menu {width: 210px; margin: 0; display: block; float: left;}
.board-menu-list {list-style: none; margin: 0;}
.board-menu-list li {margin-bottom: 24px;}
#contentt>nav>ul>li>a {color: rgba(0,0,0,0.60); text-decoration: none; font-size: 18px;}
.inquriy {width: 770px; height: 100%; float: right; padding-bottom: 50px}
.inquriy-board {width: 770px; height: 100%;}
.inquriy-head {font-size: 18px; border-bottom: rgba(0,0,0,0.3) solid 1px; height: 41px; margin: 0; padding: 0;}
.tab-btn {margin-right: 22px; color: rgba(0,0,0,0.6); height: 40px; line-height: normal;}
.form-top {padding: 40px 0 40px 0;}
.user-input {width: 100%; padding: 0 10px 0 10px;}
td {font-size: 18px; padding: 10px;}
tr {margin-bottom: 20px;}
</style>
<div id="contentt" class="wrap">
        <nav class="board-menu">
            <ul class="board-menu-list">
                <li><a href="<%= request.getContextPath() %>/board/noticeBoardList">공지사항</a></li>
                <li><a href="">이벤트</a></li>
                <li><a href="<%= request.getContextPath() %>/board/faqBoardList">자주 묻는 질문</a></li>
                <li><a href="<%= request.getContextPath() %>/board/inquiyBoardList">1:1 문의</a></li>
            </ul>
        </nav>
	<div class="inquriy">
            <div class="inquriy-board">
                <div class="inquriy-head">
                    <span class="tab-btn">나의 문의 내역</span>
                    <span class="tab-btn">새 문의 작성</span>
                    <span class="tab-btn">문의 수정</span>
                </div>
                <!-- 문의리스트 -->
                <div class="inquriy-list">
                    <div class="non-inquriy-list">
                       

                    </div>
                </div>
                <!-- 문의 작성 -->
                <div>
                    <form action="<%= request.getContextPath() %>/board/inquiyBoardUpdate" method="post" name="inquiyBoardUpdateFrm">
                        <div>
                            <div class="form-top">서비스 이용중 불편사항을 문의주시면 최대한 빠른시일내에 답변 드리겠습니다.</div>
                            <table>
	                            <tr hidden>
	                           	 <td>작성자</td>
	                             <td><input type="text" name="writer" value="<%= inquiyBoard.getWriter()%>" /></td>
	                            </tr>
                                <tr><td>카테고리 유형</td></tr>
                                <tr>
                                    <td>
                                        <select name="productType" id="" class="user-input">
                                            <option value="">카테고리 유형을 선택하세요</option>
                                            <option value="호텔">호텔</option>
                                            <option value="모텔">모텔</option>
                                            <option value="펜션">펜션</option>
                                            <option value="리조트">리조트</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr><td>문의유형</td></tr>
                                <tr>
                                    <td>
                                        <select name="inquiyType" id="" class="user-input">
                                            <option value="">문의유형을 선택하세요.</option>
                                            <option value="예약/결제">예약/결제</option>
                                            <option value="취소/환불">취소/환불</option>
                                            <option value="이용문의">이용문의</option>
                                            <option value="이용문의">회원정보</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr><td>휴대폰 번호</td></tr>
                                <tr><td><input type="tel" name="phone" class="user-input" value="<%= inquiyBoard.getPhone() %>" placeholder="선택사항 입니다."></td></tr>
                                <tr><td>이메일</td></tr>
                                <tr><td><input type="email" name="email" class="user-input" value="<%= inquiyBoard.getEmail() %>" placeholder="선택사항 입니다."></td></tr>
                                <tr><td>문의내용</td></tr>
                                <tr><td><textarea name="content" id="" cols="110" rows="10" style="resize: none;" class="user-input"  placeholder="문의하실 내용을 10자 이상 입력해주세요"><%= inquiyBoard.getContent() %></textarea></td></tr>
                                
                            </table>
                            <button type="submit">작성하기</button>
                        </div>
                        <input type="hidden" name="inquiyNo" value="<%= inquiyBoard.getInquiyNo() %>" />
                    </form>
                </div>
                

            </div>

        </div>
 </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>