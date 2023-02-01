<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
#content-main {width: 100%; height: 100%; margin: auto;}
.wrap {padding: 54px 0 50px 0;}
.board-menu {width: 210px; margin: 0; display: block; float: left;}
.board-menu-list {list-style: none; margin: 0;}
.board-menu-list li {margin-bottom: 24px;}
#content-main>nav>ul>li>a {color: rgba(0,0,0,0.60); text-decoration: none; font-size: 18px;}
.inquriy {width: 800px; height: 100%; margin:auto; padding-bottom: 50px}
.inquriy-board {width: 800px; height: 100%;}
.inquriy-head {font-size: 18px; border-bottom: rgba(0,0,0,0.3) solid 1px; height: 41px; margin: 0; padding: 0;}
.tab-btn {margin-right: 22px; color: rgba(0,0,0,0.6); height: 40px; line-height: normal; cursor: pointer;}
.form-top {padding: 40px 0 40px 0;}
.user-input {height:: 30px; padding: 0 10px 0 10px;}
.inquiy-enroll {margin-bottom: 20px;}
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
<div id="content-main" class="wrap">
        <content>
    		<div class="sidebar">
        		<nav class="userView-nav">
          			<ul>
			            <li><a href="<%= request.getContextPath() %>/board/noticeBoardList">공지사항</a></li>
			            <hr>
			            <li><a href="<%= request.getContextPath()%>/board/faqBoardList">자주 묻는 질문</a></li>
			            <hr>
			            <li class="active"><a href="<%= request.getContextPath()%>/board/inquiyBoardList">1:1 문의</a></li>
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
	<div class="inquriy">
            <div class="inquriy-board">
                <div class="inquriy-head">
                    <span class="tab-btn" onclick="location.href = '<%= request.getContextPath() %>/board/inquiyBoardList'">나의 문의 내역</span>
                    <% if(loginUser != null) {%>
                    <span class="tab-btn" onclick="location.href = '<%= request.getContextPath() %>/board/inquiyEnroll'" style="color: #f7323f; font-weight: bold;">새 문의 작성</span>
                    <% } %>
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
		                            <input type="submit" value="작성하기" class="enroll-btn" style="width: 100px; height: 50px; font-size: 18px;">
		                            <input type="button" value="취소하기" class="cancel-btn" onclick="history.go(-1);" style="width: 100px; height: 50px; font-size: 18px;"/>
                                 </div>
                            </table>
                        </div>
                    </form>
                </div>
                

            </div>

        </div>
 </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>