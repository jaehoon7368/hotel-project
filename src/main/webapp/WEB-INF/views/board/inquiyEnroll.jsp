<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

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
.tab-btn {margin-right: 22px; color: rgba(0,0,0,0.6); height: 40px; line-height: normal; cursor: pointer;}
.form-top {padding: 40px 0 40px 0;}
.user-input {height:: 30px; padding: 0 10px 0 10px;}
.inquiy-enroll {margin-bottom: 20px;}

</style>
<div id="contentt" class="wrap">
        <nav class="board-menu">
            <ul class="board-menu-list">
                <li><a href="<%= request.getContextPath() %>/board/noticeBoardList">공지사항</a></li>
                <li><a href="<%= request.getContextPath() %>/board/faqBoardList">자주 묻는 질문</a></li>
                <li><a href="<%= request.getContextPath() %>/board/inquiyBoardList">1:1 문의</a></li>
            </ul>
        </nav>
	<div class="inquriy">
            <div class="inquriy-board">
                <div class="inquriy-head">
                    <span class="tab-btn" onclick="location.href = '<%= request.getContextPath() %>/board/inquiyBoardList'">나의 문의 내역</span>
                    <span class="tab-btn" onclick="location.href = '<%= request.getContextPath() %>/board/inquiyEnroll'" style="color: #f7323f; font-weight: bold;">새 문의 작성</span>
                </div>
                <!-- 문의리스트 -->
                <div class="inquriy-list">
                    <div class="non-inquriy-list">
                       

                    </div>
                </div>
                <!-- 문의 작성 -->
                <div>
                    <form action="<%= request.getContextPath() %>/board/inquiyEnroll" method="post" name="inquiyEnrollFrm">
                        <div>
                            <div class="form-top">서비스 이용중 불편사항을 문의주시면 최대한 빠른시일내에 답변 드리겠습니다.</div>
                            <table>
	                             <input type="hidden" name="writer" value="<%= loginUser.getUserId() %>" />
	                             <div class="inquiy-enroll">카테고리</div>
                                 <div class="inquiy-enroll">
                                     <select name="productType" id="" class="user-input" style="height: 30px; width: 725px; font-size: 16px; color: rgba(0,0,0,0.60);">
                                         <option value="">카테고리 유형을 선택하세요</option>
                                         <option value="호텔">호텔</option>
                                         <option value="모텔">모텔</option>
                                         <option value="펜션">펜션</option>
                                     </select>
                                 </div>	
                                 <div class="inquiy-enroll">문의유형</div>
								 <div class="inquiy-enroll">
                                     <select name="inquiyType" id="" class="user-input" style="height: 30px; width: 725px; font-size: 16px; color: rgba(0,0,0,0.60);">
                                         <option value="">문의유형을 선택하세요.</option>
                                         <option value="예약/결제">예약/결제</option>
                                         <option value="취소/환불">취소/환불</option>
                                         <option value="이용문의">이용문의</option>
                                         <option value="이용문의">회원정보</option>
                                     </select>
								 </div>
								 <div class="inquiy-enroll">휴대폰 번호</div>             
								 <div class="inquiy-enroll"><input type="tel" name="phone" class="user-input" placeholder="선택사항 입니다." style="height: 30px; width: 700px; font-size: 16px;"></div>                   
                                 <div class="inquiy-enroll">이메일</div>
                                 <div class="inquiy-enroll"><input type="email" name="email" class="user-input" placeholder="선택사항 입니다." style="height: 30px; width: 700px; font-size: 16px;"></div>
                                 <div class="inquiy-enroll">문의내용</div>
                                 <div class="inquiy-enroll"><textarea name="content" id="" cols="110" rows="10" style="resize: vertical; width: 700px; font-size: 16px;" class="user-input"  placeholder="문의하실 내용을 10자 이상 입력해주세요"></textarea></div>
                                 <div class="inquiy-enroll">
		                            <input type="submit" value="작성하기" style="width: 100px; height: 50px; font-size: 18px;">
		                            <input type="button" value="취소하기" onclick="history.go(-1);" style="width: 100px; height: 50px; font-size: 18px;"/>
                                 </div>
                            </table>
                        </div>
                    </form>
                </div>
                

            </div>

        </div>
 </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>